#!/usr/bin/env python3
"""Differential fuzzer for the checks coil.safety inserts.

Python's integers do not overflow, so they are the oracle. One Coil program is
generated and built once with `--use coil.safety`; it runs a single operation
named on its command line and prints the result, so every case is one process:

    safety-fuzz-prog OP TYPE ARG [ARG]      # an integer operation
    safety-fuzz-prog to-TO FROM ARG         # an integer conversion
    safety-fuzz-prog fcast64|fcast32 TO MANT EXP   # a float-to-integer conversion
    safety-fuzz-prog index x LEN IDX        # get on a slice of LEN elements
    safety-fuzz-prog range x LEN LO HI      # subslice

For each case the oracle says either "this value" or "this check must fire". A
check that does not fire on bad input, fires on good input, reports the wrong
check, or returns the wrong value is a failure. Arguments are passed as decimal
text through i64, so a u64 above 2**63 travels as its two's complement.

Local only (not in CI), like the other fuzz targets.

Usage: scripts/tests/safety-fuzz.py COMPILER [--seed N] [--random N] [--keep]
"""
import argparse
import concurrent.futures
import math
import random
import struct
import subprocess
import sys
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]

TYPES = [("i8", 8, True), ("i16", 16, True), ("i32", 32, True), ("i64", 64, True),
         ("u8", 8, False), ("u16", 16, False), ("u32", 32, False), ("u64", 64, False)]
INFO = {name: (bits, signed) for name, bits, signed in TYPES}


def lo(t):
    bits, signed = INFO[t]
    return -(1 << (bits - 1)) if signed else 0


def hi(t):
    bits, signed = INFO[t]
    return (1 << (bits - 1)) - 1 if signed else (1 << bits) - 1


def wrap(t, v):
    bits, signed = INFO[t]
    v &= (1 << bits) - 1
    if signed and v >= 1 << (bits - 1):
        v -= 1 << bits
    return v


def as_i64(v):
    """How an in-range value of any standard type prints through i64."""
    return v - (1 << 64) if v >= 1 << 63 else v


def fits(t, v):
    return lo(t) <= v <= hi(t)


# ---- the generated program ---------------------------------------------------

BINARY = {"add": "+", "sub": "-", "mul": "*", "div": "/", "rem": "%", "shl": "<<", "shr": ">>"}


def program() -> str:
    out = ['(module safety-fuzz-prog)',
           '(import "coil.args" :as args)',
           '(import "coil.slice" :use [slice-get subslice])',
           '(import "coil.primitive" :as primitive)',
           '',
           ';; Decimal text to i64, with the raw operations so that parsing is never a check.',
           '(defn parse [(s (slice u8))] (-> i64)',
           '  (let [(mut acc) 0',
           '        (mut neg) false',
           '        (mut i) 0]',
           '    (when (and (> (len s) 0) (= (get s 0) (primitive/cast u8 45)))',
           '      (set! neg true)',
           '      (set! i 1))',
           '    (while (< i (len s))',
           '      (set! acc (primitive/iadd (primitive/imul acc 10)',
           '                                (primitive/cast i64 (primitive/isub (get s i) (primitive/cast u8 48)))))',
           '      (set! i (primitive/iadd i 1)))',
           '    (if neg (primitive/isub 0 acc) acc)))',
           '',
           ';; M * 2**E, exact for the values the driver passes.',
           '(defn scaled [(m i64) (e i64)] (-> f64)',
           '  (let [(mut v) (cast f64 m)',
           '        (mut k) e]',
           '    (while (> k 0) (set! v (* v 2.0)) (set! k (primitive/isub k 1)))',
           '    (while (< k 0) (set! v (* v 0.5)) (set! k (primitive/iadd k 1)))',
           '    v))',
           '']
    for t, _, _ in TYPES:
        for op, sym in BINARY.items():
            out.append(f'(defn {op}-{t} [(a i64) (b i64)] (-> i64) '
                       f'(primitive/cast i64 ({sym} (primitive/cast {t} a) (primitive/cast {t} b))))')
        out.append(f'(defn neg-{t} [(a i64)] (-> i64) '
                   f'(primitive/cast i64 (- (primitive/cast {t} a))))' if INFO[t][1] else '')
        for d, _, _ in TYPES:
            out.append(f'(defn cast-{t}-{d} [(a i64)] (-> i64) '
                       f'(primitive/cast i64 (cast {d} (primitive/cast {t} a))))')
        out.append(f'(defn fcast64-{t} [(m i64) (e i64)] (-> i64) '
                   f'(primitive/cast i64 (cast {t} (scaled m e))))')
        out.append(f'(defn fcast32-{t} [(m i64) (e i64)] (-> i64) '
                   f'(primitive/cast i64 (cast {t} (cast f32 (scaled m e)))))')
    out += ['',
            '(defn get-at [(n i64) (i i64)] (-> i64)',
            '  (let [arr [10 20 30 40 50 60 70 80]',
            '        s (subslice arr 0 n)]',
            '    (get s i)))',
            '',
            '(defn sub-at [(n i64) (a i64) (b i64)] (-> i64)',
            '  (let [arr [10 20 30 40 50 60 70 80]',
            '        s (subslice arr 0 n)]',
            '    (len (subslice s a b))))',
            '',
            '(defn run [(op (slice u8)) (ty (slice u8)) (a i64) (b i64) (c i64)] (-> i64)',
            '  (cond']
    for t, _, _ in TYPES:
        for op in BINARY:
            out.append(f'    (and (= op "{op}") (= ty "{t}")) ({op}-{t} a b)')
        if INFO[t][1]:
            out.append(f'    (and (= op "neg") (= ty "{t}")) (neg-{t} a)')
        out.append(f'    (and (= op "fcast64") (= ty "{t}")) (fcast64-{t} a b)')
        out.append(f'    (and (= op "fcast32") (= ty "{t}")) (fcast32-{t} a b)')
    out.append('    (= op "index") (get-at a b)')
    out.append('    (= op "range") (sub-at a b c)')
    out.append('    :else (dispatch-cast op ty a b)))')
    out.append('')
    out.append('(defn dispatch-cast [(op (slice u8)) (ty (slice u8)) (a i64) (b i64)] (-> i64)')
    out.append('  (cond')
    for t, _, _ in TYPES:
        for d, _, _ in TYPES:
            out.append(f'    (and (= ty "{t}") (= op "to-{d}")) (cast-{t}-{d} a)')
    out.append('    :else (do (println "bad case") 2)))')
    out.append('')
    out += ['(defn main [(argc i32) (argv (ptr (ptr i8)))] (-> i64)',
            '  (args/args-set! argc argv)',
            '  (let [op (args/args-nth 1)',
            '        ty (args/args-nth 2)',
            '        a (parse (args/args-nth 3))',
            '        b (if (> (args/args-count) 4) (parse (args/args-nth 4)) 0)',
            '        c (if (> (args/args-count) 5) (parse (args/args-nth 5)) 0)]',
            '    (println "{}" (run op ty a b c))',
            '    0))']
    return "\n".join(l for l in out if l != "") + "\n"


# ---- the oracle --------------------------------------------------------------

PANIC = {
    "overflow": "panic: integer overflow",
    "zero": "panic: division by zero",
    "shift": "panic: shift amount is greater than the type size",
    "trunc": "panic: integer cast truncated bits",
    "negative": "panic: attempt to cast negative value to unsigned integer",
    "float": "panic: integer part of floating point value out of bounds",
    "index": "panic: index out of bounds: index",
    "range-index": "panic: index out of bounds: range",
    "range-order": "panic: start index",
}


def oracle_binary(op, t, a, b):
    """The value, or the name of the check that must fire."""
    bits, signed = INFO[t]
    if op in ("add", "sub", "mul"):
        r = {"add": a + b, "sub": a - b, "mul": a * b}[op]
        return r if fits(t, r) else "overflow"
    if op in ("div", "rem"):
        if b == 0:
            return "zero"
        if signed and b == -1 and a == lo(t):
            return "overflow"
        q = abs(a) // abs(b)
        if (a < 0) != (b < 0):
            q = -q
        return q if op == "div" else a - q * b
    if b < 0 or b >= bits:
        return "shift"
    return wrap(t, a << b) if op == "shl" else a >> b


def oracle_cast(src, dst, v):
    if fits(dst, v):
        return v
    if v < 0 and not INFO[dst][1]:
        return "negative"
    return "trunc"


def oracle_float(dst, x):
    if math.isnan(x) or math.isinf(x):
        return "float"
    t = math.trunc(x)
    return t if fits(dst, t) else "float"


def edges(t):
    bits, signed = INFO[t]
    pts = {0, 1, 2, 3, 7, 8, 9, 15, 16, 31, 32, 33, 63, 64, 65, 100, 127, 128, 129, 255, 256, 257,
           65535, 65536, 1 << 31, (1 << 31) - 1, 1 << 32, (1 << 63) - 1, 1 << 63, (1 << 64) - 1,
           lo(t), hi(t), lo(t) + 1, hi(t) - 1, lo(t) // 2, hi(t) // 2}
    pts |= {-p for p in list(pts)}
    return sorted(p for p in pts if fits(t, p))


def random_value(rng, t):
    bits, signed = INFO[t]
    if rng.random() < 0.5:
        return rng.randint(lo(t), hi(t))
    # a small magnitude, which is where shifts and divisors live
    return max(lo(t), min(hi(t), rng.randint(-70, 70)))


def float_samples(rng):
    fs = [0.0, -0.0, 0.5, -0.5, 1.0, -1.0, 127.5, 127.999, 128.0, -128.0, -128.5, -129.0,
          255.5, 255.999, 256.0, 32767.5, 32768.0, -32768.9, -32769.0, 65535.9, 65536.0,
          2.0**31 - 1, 2.0**31, -2.0**31, -2.0**31 - 0.5, -2.0**31 - 1, 2.0**32 - 1, 2.0**32,
          2.0**53, 2.0**62, 2.0**63, -2.0**63, 2.0**63 + 2048, -2.0**63 - 2048,
          2.0**64, 2.0**64 - 2048, 1e30, -1e30, 1e300, float("nan"), float("inf"), float("-inf")]
    fs += [rng.uniform(-3e9, 3e9) for _ in range(20)]
    return fs


def encode_float(x):
    """MANT and EXP such that MANT * 2**EXP == x, or None for NaN and infinity."""
    if math.isnan(x) or math.isinf(x):
        return None
    m, e = math.frexp(x)
    return int(m * (1 << 53)), e - 53


# ---- running -----------------------------------------------------------------

def run_case(exe, args):
    try:
        p = subprocess.run([str(exe), *map(str, args)], capture_output=True, timeout=30,
                           stdin=subprocess.DEVNULL)
    except subprocess.TimeoutExpired:
        return "timeout", ""
    return p.returncode, p.stdout.decode(errors="replace") + "\n" + p.stderr.decode(errors="replace")


def judge(want, rc, text):
    if isinstance(want, str):
        if rc == 0:
            return f"want a {want!r} panic, ran and printed {text.splitlines()[0]!r}"
        if PANIC[want] not in text:
            return f"want {PANIC[want]!r}, got rc={rc}: {text.strip()[:160]!r}"
        return None
    if rc != 0:
        return f"want {want}, panicked rc={rc}: {text.strip()[:160]!r}"
    got = text.splitlines()[0].strip() if text.strip() else ""
    return None if got == str(want) else f"want {want}, got {got!r}"


def cases(rng, extra):
    for t, bits, signed in TYPES:
        pts = edges(t)
        for op in BINARY:
            pairs = [(a, b) for a in pts for b in pts]
            pairs += [(random_value(rng, t), random_value(rng, t)) for _ in range(extra)]
            for a, b in pairs:
                want = oracle_binary(op, t, a, b)
                yield (op, t, as_i64(a), as_i64(b)), (want if isinstance(want, str) else as_i64(want)), \
                    f"{a} {op} {b} : {t}"
        if signed:
            for a in pts:
                want = "overflow" if a == lo(t) else -a
                yield ("neg", t, a), want, f"neg {a} : {t}"
        for d, _, _ in TYPES:
            for v in pts + [random_value(rng, t) for _ in range(extra // 4)]:
                want = oracle_cast(t, d, v)
                yield (f"to-{d}", t, as_i64(v)), (want if isinstance(want, str) else as_i64(want)), \
                    f"cast {t} {v} -> {d}"
        for x in float_samples(rng):
            enc = encode_float(x)
            if enc is None:
                continue
            for width, rounded in (("64", x), ("32", None)):
                if width == "32":
                    try:
                        rounded = struct.unpack("f", struct.pack("f", x))[0]
                    except OverflowError:
                        continue
                want = oracle_float(t, rounded)
                yield (f"fcast{width}", t, enc[0], enc[1]), (want if isinstance(want, str) else as_i64(want)), \
                    f"f{width} {x!r} -> {t}"
    for n in range(0, 9):
        for i in list(range(-2, 11)):
            yield ("index", "x", n, i), (("index" if not 0 <= i < n else 10 * (i + 1))), f"index len {n} [{i}]"
        for a in range(-1, 10):
            for b in range(-1, 10):
                if a > b:
                    want = "range-order"
                elif a < 0 or b > n:
                    want = "range-index"
                else:
                    want = b - a
                yield ("range", "x", n, a, b), want, f"subslice len {n} [{a}..{b}]"


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("compiler")
    ap.add_argument("--seed", type=int, default=0)
    ap.add_argument("--random", type=int, default=12, help="random operand pairs per op and type")
    ap.add_argument("--jobs", type=int, default=4)
    ap.add_argument("--keep", action="store_true", help="keep the generated program")
    ns = ap.parse_args()
    rng = random.Random(ns.seed)
    with tempfile.TemporaryDirectory(prefix="coil-safety-fuzz-") as d:
        src = Path(d) / "safety_fuzz_prog.coil"
        src.write_text(program())
        exe = Path(d) / "prog"
        built = subprocess.run([ns.compiler, "build", str(src), "-o", str(exe), "--use", "coil.safety"],
                               cwd=ROOT, capture_output=True)
        if built.returncode:
            sys.stdout.write(built.stdout.decode(errors="replace"))
            sys.stderr.write(built.stderr.decode(errors="replace"))
            print("safety fuzz: the generated program does not build")
            if ns.keep:
                print(f"program kept at {src}")
                Path(ROOT / "safety_fuzz_prog.coil").write_text(src.read_text())
            return 1
        work = list(cases(rng, ns.random))
        with concurrent.futures.ThreadPoolExecutor(max_workers=ns.jobs) as pool:
            results = list(pool.map(lambda w: run_case(exe, w[0]), work))
    failures = []
    for (args, want, label), (rc, text) in zip(work, results):
        problem = judge(want, rc, text)
        if problem:
            failures.append(f"FAIL {label}: {problem}")
    # Group by kind of case and by what went wrong, so one defect is one line of output.
    groups = {}
    for line in failures:
        head, _, rest = line.partition(": ")
        kind = (head.split()[1] if head.startswith("FAIL") and len(head.split()) > 1 else "?")
        what = rest.split(", got")[0].split(", ran")[0].split(", panicked")[0][:70]
        groups.setdefault((kind, what), []).append(line)
    for (kind, what), lines in sorted(groups.items(), key=lambda kv: -len(kv[1])):
        print(f"{len(lines):5d}  {kind}: {what}")
        for line in lines[:2]:
            print("       e.g.", line[:230])
    print(f"safety fuzz: {len(work) - len(failures)} passed, {len(failures)} failed (seed {ns.seed})")
    return 1 if failures else 0


if __name__ == "__main__":
    raise SystemExit(main())

#!/usr/bin/env python3
"""coil.simd: semantics, a scalar-oracle differential, codegen, and diagnostics.

    simd.py fast    one differential program (a few lane types and widths) on the
                    native backend and LLVM, and the vectorized-codegen check
    simd.py full    every lane type and width; tests/simd/semantics.coil (every
                    operation, one module per area) on LLVM at -O0 and -O3 and on
                    the native backend; the codegen check; tests/simd/diagnostics.coil

The differential program is generated: for each lane type and width it fills two
vectors from a noinline PRNG and compares every lane of every operation with the
scalar computation, 128 rounds each. The native backend is arm64 on Apple
silicon and x64 on x86-64; elsewhere only LLVM runs.

Usage: simd.py fast|full [--compiler COIL]
"""
from __future__ import annotations

import argparse
import os
import platform
import re
import shutil
import subprocess
import sys
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
SIMD = ROOT / "tests" / "simd"
ALL_SHAPES = [(lane, width) for lane in ("u8", "i8", "u16", "i16", "u32", "i32", "u64", "i64")
              for width in (3, 8, 16, 32, 64)]
FAST_SHAPES = [("u8", 16), ("i16", 8), ("i32", 3), ("u64", 4), ("i8", 64)]
# tests/simd/diagnostics.coil's one-pass errors must each say this.
BATCHED = ("expects a constant of type i64, got type f32", "expects a type, got constant 16",
           "requires integer, float, or boolean lanes", "conflicting types for parameter 'N' (4 vs 8)",
           "preserves lane count", "conflicting types for parameter 'T' (u16 vs u8)",
           "conflicting types for parameter 'T' (u8 vs u16)")
# Misuses whose error stops the compile: one program each, and a phrase it must say.
SOLO = {
    "width-zero": ("(p/vector-zero [(vec u8 0)])", "positive"),
    "width-negative": ("(p/vector-zero [(vec u8 -1)])", "positive"),
    "mask-arithmetic": ("(v/vadd (v/vsplat [bool 4] true) (v/vsplat [bool 4] false))", "lane type"),
    "bitmap-wide": ("(v/mask->bits (v/mask-low [65] 3))", "at most 64"),
    "float-bits": ("(v/vand (v/vsplat [f32 4] 1.0) (v/vsplat [f32 4] 2.0))", "lane type"),
    "integer-divide": ("(v/vdiv (v/vsplat [i32 4] 1) (v/vsplat [i32 4] 2))", "lane type"),
    "bitcast-size": ("(v/vbitcast [u64 4 u8 4] (v/vzero [u8 4]))", "equal total bit sizes"),
    "widen-shape": ("(v/vwiden-low [u16 3 u8 8] (v/vzero [u8 8]))", "halve/double lane count"),
    "narrow-float-sat": ("(v/vnarrow-saturating [f32 8 f64 4] (v/vzero [f64 4]) (v/vzero [f64 4]))",
                         "requires integer"),
    "mask-memory": ("(v/vloadu [bool 4] (cast (ptr bool) 0))", "numeric lanes"),
    "float-index": ("(v/vtable (v/vzero [u8 16]) (v/vzero [f32 4]))", "indices must be integer"),
}


class Failed(Exception):
    pass


def native_backend() -> str | None:
    machine = platform.machine()
    if machine == "arm64" and sys.platform == "darwin":
        return "arm64"
    if machine in ("x86_64", "AMD64"):
        return "x64"
    return None


def run(command: list, label: str) -> subprocess.CompletedProcess:
    result = subprocess.run([str(c) for c in command], cwd=ROOT, capture_output=True, text=True,
                            timeout=180, stdin=subprocess.DEVNULL)
    if result.returncode != 0:
        raise Failed(f"{label}: exit {result.returncode}\n$ {' '.join(map(str, command))}\n"
                     f"{result.stdout[-3000:]}{result.stderr[-3000:]}")
    return result


def differential_check(lane: str, width: int) -> str:
    bits = int(lane[1:])
    unsigned, signed = f"u{bits}", f"i{bits}"
    pairs = {
        "vadd": f"(cast {lane} (p/iadd (cast u64 x) (cast u64 y)))",
        "vsub": f"(cast {lane} (p/isub (cast u64 x) (cast u64 y)))",
        "vmul": f"(cast {lane} (p/imul (cast u64 x) (cast u64 y)))",
        "vand": "(p/iand x y)", "vor": "(p/ior x y)", "vxor": "(p/ixor x y)",
        "vmin": "(if (< x y) x y)", "vmax": "(if (> x y) x y)",
        "vshl": f"(cast {lane} (p/ishl (cast u64 x) count))",
        "vshr-logical": f"(cast {lane} (p/ishr (cast u64 (cast {unsigned} x)) count))",
        "vshr-arithmetic": f"(cast {lane} (p/ishr (cast i64 (cast {signed} x)) (cast i64 count)))",
    }
    checks = "\n".join(
        f"      (let [got (v/{op} a b)]\n"
        f"        (for [i 0 {width}]\n"
        f"          (let [x (load (p/index ap i)) y (load (p/index bp i))\n"
        f"                count (p/iand (cast u64 y) (cast u64 {bits - 1}))]\n"
        f"            (assert-eq (v/vextract got i) {expected}))))"
        for op, expected in pairs.items())
    return f'''
(defn check-{lane}-x{width} [(state (ptr u64))] (-> i64)
  (let [expected-mask (p/alloc-stack u64)
        aa (p/alloc-stack (array {lane} {width})) bb (p/alloc-stack (array {lane} {width}))
        ap (cast (ptr {lane}) aa) bp (cast (ptr {lane}) bb)]
    (for [round 0 128]
      (for [i 0 {width}]
        (store! (p/index ap i) (cast {lane} (next state)))
        (store! (p/index bp i) (cast {lane} (next state))))
      (let [a (v/vloadu [{lane} {width}] ap) b (v/vloadu [{lane} {width}] bp)]
{checks}
        (store! expected-mask (cast u64 0))
        (for [i 0 {width}]
          (when (< (load (p/index ap i)) (load (p/index bp i)))
            (store! expected-mask (p/ior (load expected-mask) (p/ishl (cast u64 1) (cast u64 i))))))
        (assert-eq (v/mask->bits (v/v< a b)) (load expected-mask))
        (let [selected (v/vselect (v/v< a b) a b)]
          (assert (v/mask-all? (v/v= selected (v/vmin a b)))))
        (assert (v/mask-all? (v/v= a (v/vreverse (v/vreverse a)))))
        (assert (v/mask-all? (v/v= a (v/vrotate-right (v/vrotate-left a b) b))))))
    0))
'''


def differential_source(shapes: list[tuple[str, int]]) -> str:
    calls = "\n".join(f"    (check-{lane}-x{width} state)" for lane, width in shapes)
    return ('''(module test.simd.differential)
(import "coil.simd" :as v)
(import "coil.primitive" :as p)

; Stateful noinline input generation keeps the vector operands nonconstant.
(defn next :inline (Never) [(state (ptr u64))] (-> u64)
  (let [x (p/iadd (p/imul (load state) (cast u64 6364136223846793005)) (cast u64 1442695040888963407))]
    (store! state x)
    (p/ixor x (p/ishr x (cast u64 32)))))
''' + "".join(differential_check(lane, width) for lane, width in shapes) + f'''
(defn main [] (-> i64)
  (let [state (p/alloc-stack u64)]
    (store! state (cast u64 0x6a09e667f3bcc909))
{calls}
    (println "differential: {len(shapes)} shapes x 128 rounds")
    0))
''')


def build_and_run(coil: str, source: Path, flags: list[str], work: Path, label: str) -> None:
    executable = work / re.sub(r"\W+", "-", label)
    run([coil, "build", source, *flags, "-o", executable, "--quiet"], f"build {label}")
    run([executable], f"run {label}")
    print(f"ok   {label}", flush=True)


def differential(coil: str, shapes: list[tuple[str, int]], backends: list[list[str]], work: Path) -> None:
    source = work / "differential.coil"
    source.write_text(differential_source(shapes))
    for flags in backends:
        build_and_run(coil, source, flags, work, f"differential {len(shapes)} shapes {' '.join(flags)}")


def codegen(coil: str, work: Path) -> None:
    """Exported kernels keep their vector instructions: table lookups, a movemask
    or horizontal add, and a fixed-width scan with no loop or call."""
    config = os.environ.get("LLVM_CONFIG", "llvm-config")
    bindir = Path(run([config, "--bindir"], "llvm-config --bindir").stdout.strip())
    library = work / ("probe.dylib" if platform.system() == "Darwin" else "probe.so")
    run([coil, "build", SIMD / "codegen.coil", "--shared", "-O3", "-o", library, "--quiet"], "build codegen.coil")
    assembly = run([bindir / "llvm-objdump", "--disassemble", library], "disassemble").stdout
    functions = dict(re.findall(r"^[0-9a-f]+ <_?(simd_\w+)>:\n(.*?)(?=\n\n|\Z)", assembly, re.M | re.S))
    for name in ("simd_lookup16", "simd_lookup32", "simd_lookup64", "simd_classify16", "simd_scan16"):
        if not functions.get(name):
            raise Failed(f"codegen: no disassembly for {name}")
    if re.search(r"\t(?:j[a-z]+|b(?:\.[a-z]+)?|bl|cbn?z|tbn?z|callq?)\s", functions["simd_scan16"]):
        raise Failed(f"codegen: the fixed scan must not contain a loop or call\n{functions['simd_scan16']}")
    if platform.machine() in ("arm64", "aarch64"):
        for width in (16, 32, 64):
            body = functions[f"simd_lookup{width}"]
            tables = re.findall(r"\btbl(?:\.\w+)?\s+[^\n{]+\{([^}]+)\}", body)
            if not any(len(re.findall(r"\bv\d+", registers)) == width // 16 for registers in tables):
                raise Failed(f"codegen: expected a NEON {width}-byte table lookup\n{body}")
        # mask->bits sums the weighted lanes: one addv, or (LLVM 23) a chain of addp.
        expected = [("simd_classify16", r"\b(?:addv(?:\.|\s)|addp(?:\.16b|\s+v\d+\.16b))"),
                    ("simd_scan16", r"\badd(?:\.16b|\s+v\d+\.16b)")]
    else:
        expected = [("simd_classify16", r"\bpmovmskb\b"), ("simd_scan16", r"\bpaddb\b")]
    for name, pattern in expected:
        if not re.search(pattern, functions[name]):
            raise Failed(f"codegen: no vector operation in {name}\n{functions[name]}")
    print("ok   codegen: exported kernels keep their vector instructions", flush=True)


def diagnostics(coil: str, work: Path) -> None:
    source = SIMD / "diagnostics.coil"
    result = subprocess.run([coil, "check", str(source)], cwd=ROOT, capture_output=True, text=True, timeout=120)
    output = result.stdout + result.stderr
    errors = len(re.findall(r"^error:", output, re.M))
    expected_errors = source.read_text().count("(defn reject-")
    if result.returncode != 1 or errors != expected_errors:
        raise Failed(f"diagnostics.coil: want exit 1 with {expected_errors} errors in one pass, "
                     f"got exit {result.returncode} with {errors}:\n{output[-4000:]}")
    missing = [needle for needle in BATCHED if needle not in output]
    for name, (expression, needle) in SOLO.items():
        program = work / f"reject-{name}.coil"
        program.write_text(f'(module test.simd.reject-{name})\n(import "coil.simd" :as v)\n'
                           f'(import "coil.primitive" :as p)\n(defn main [] (-> i64) (do {expression} 0))\n')
        solo = subprocess.run([coil, "check", str(program)], cwd=ROOT, capture_output=True, text=True, timeout=120)
        if solo.returncode != 1 or needle not in solo.stdout + solo.stderr:
            missing.append(f"{name}: want exit 1 saying {needle!r}, got exit {solo.returncode}: "
                           f"{(solo.stdout + solo.stderr)[-600:]}")
    if missing:
        raise Failed("diagnostics: " + "\n  ".join(missing) + f"\n{output[-3000:]}")
    print(f"ok   diagnostics: {errors} misuses in one pass, {len(SOLO)} more one by one", flush=True)


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("mode", choices=("fast", "full"))
    parser.add_argument("--compiler", default=os.environ.get("COIL") or shutil.which("coil") or "coil")
    args = parser.parse_args()
    coil = args.compiler
    native = native_backend()
    backends = [[]] + ([["--backend", native]] if native else [])
    if args.mode == "fast":
        steps = [lambda work: differential(coil, FAST_SHAPES, backends, work),
                 lambda work: codegen(coil, work)]
    else:
        semantic_builds = [["-O0"], ["-O3"]] + ([["--backend", native]] if native else [])
        steps = [lambda work: differential(coil, ALL_SHAPES, backends, work),
                 *[(lambda work, flags=flags: build_and_run(coil, SIMD / "semantics.coil", flags, work,
                                                            f"semantics {' '.join(flags)}"))
                   for flags in semantic_builds],
                 lambda work: codegen(coil, work),
                 lambda work: diagnostics(coil, work)]
    failures = 0
    with tempfile.TemporaryDirectory(prefix="coil-simd-", dir=os.environ.get("COIL_TEST_SCRATCH")) as raw:
        for step in steps:
            try:
                step(Path(raw))
            except (Failed, subprocess.TimeoutExpired) as error:
                failures += 1
                print(f"FAIL {error}", flush=True)
    print(f"simd {args.mode}: {'FAILED' if failures else 'PASS'}")
    return 1 if failures else 0


if __name__ == "__main__":
    raise SystemExit(main())

#!/usr/bin/env python3
"""No emitted LLVM IR moves a large aggregate as a first-class value.

The LLVM backend keeps structs, sums, `dyn` pairs and fixed arrays in memory and
moves them with memcpy (codegen.coil, cg-mem-ty?). A first-class aggregate --
a `load`, `store`, `ret`, `phi`, call result, `insertvalue`, `extractvalue` or
`select` of a struct or array type -- is what SROA and instruction selection
expand element by element: a 3 KB struct copied that way cost seconds of a
build, and an array of 32 structs returned by value cost 7 s. Values up to two
words, and a homogeneous float aggregate of at most four elements, are the C
ABI's own register values; nothing larger may appear.

Default: src/examples, the arm64 runtime tests and the aggregate fixtures,
compiled in parallel (under a minute). --all adds every test and the compiler
itself (about twenty minutes); anything that compiles the whole compiler runs
alone, since each needs ~5 GB.

Usage: aggregate-ir-scan.py COMPILER [--all]
"""
from concurrent.futures import ThreadPoolExecutor
from pathlib import Path
import os
import re
import subprocess
import sys

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(Path(__file__).resolve().parent))
import cleanup_on_signal  # noqa: E402
cleanup_on_signal.install()
COMPILER = Path(sys.argv[1]).resolve()
FULL = "--all" in sys.argv[2:]
LIMIT = 64

PRIM = {"i1": 1, "i8": 1, "i16": 2, "i32": 4, "i64": 8, "i128": 16, "ptr": 8,
        "half": 2, "float": 4, "double": 8}
TYPE = r'(\{[^=]*?\}|<\{[^=]*?\}>|\[[^=]*?\]|%[\w.$"\-]+)'
PATTERNS = [
    ("load", re.compile(r"= load " + TYPE + r", ptr")),
    ("store", re.compile(r"^\s*store " + TYPE + r" ")),
    ("ret", re.compile(r"^\s*ret " + TYPE + r" ")),
    ("phi", re.compile(r"= phi " + TYPE + r" ")),
    ("call", re.compile(r"= (?:tail |musttail )?call (?:\w+ )*" + TYPE + r" ")),
    ("insertvalue", re.compile(r"= insertvalue " + TYPE + r" ")),
    ("extractvalue", re.compile(r"= extractvalue " + TYPE + r" ")),
    ("select", re.compile(r"= select i1 [^,]+, " + TYPE + r" ")),
]


def split_top(text):
    parts, depth, cur = [], 0, ""
    for ch in text:
        depth += ch in "{[<("
        depth -= ch in "}]>)"
        if ch == "," and depth == 0:
            parts.append(cur.strip())
            cur = ""
        else:
            cur += ch
    return parts + ([cur.strip()] if cur.strip() else [])


def type_size(t, defs, seen=()):
    t = t.strip()
    if t in PRIM:
        return PRIM[t]
    if t.startswith("ptr"):
        return 8
    if t.startswith("<{"):
        t = t[1:-1]
    if t.startswith("{"):
        inner = t[1:-1].strip()
        return sum(type_size(x, defs, seen) for x in split_top(inner)) if inner else 0
    m = re.match(r"[\[<](\d+) x (.*)[\]>]$", t)
    if m:
        return int(m.group(1)) * type_size(m.group(2), defs, seen)
    if t.startswith("%"):
        if t in seen or defs.get(t, "opaque") == "opaque":
            return 0
        return type_size(defs[t], defs, seen + (t,))
    m = re.match(r"i(\d+)$", t)
    return (int(m.group(1)) + 7) // 8 if m else 0


def is_aggregate(t, defs):
    t = t.strip()
    if t[:1] in "{[" or t.startswith("<{"):
        return True
    body = defs.get(t, "")
    return t.startswith("%") and body[:1] in "{[" or body.startswith("<{")


def scan(ir):
    defs = {m.group(1): m.group(2).strip()
            for m in re.finditer(r"^(%[^\s=]+) = type (.*)$", ir, re.M)}
    hits, func = [], "?"
    for line in ir.split("\n"):
        if line.startswith("define"):
            m = re.search(r'@("?[^"(]+"?)\(', line)
            func = m.group(1) if m else "?"
            continue
        if not line.startswith(" "):
            continue
        for kind, pattern in PATTERNS:
            m = pattern.search(line)
            if m and is_aggregate(m.group(1), defs):
                size = type_size(m.group(1), defs)
                if size > LIMIT:
                    hits.append(f"{func}: {kind} of {m.group(1)[:60]} ({size} bytes)")
    return hits


def emit(source):
    try:
        result = subprocess.run([str(COMPILER), "emit-ir", str(source)], cwd=ROOT,
                                capture_output=True, text=True, timeout=600)
    except subprocess.TimeoutExpired:
        return source, None
    ir = result.stdout
    # emit-ir writes its diagnostics to stdout: no datalayout, no module
    if result.returncode != 0 or "target datalayout" not in ir:
        return source, None
    return source, scan(ir)


def check(sources, jobs):
    emitted, failures = 0, []
    with ThreadPoolExecutor(max_workers=jobs) as pool:
        for source, hits in pool.map(emit, sources):
            if hits is None:
                continue
            emitted += 1
            failures += [f"{source.relative_to(ROOT)}: {h}" for h in hits]
    return emitted, failures


sources = sorted((ROOT / "src/examples").glob("*.coil"))
sources += sorted((ROOT / "tests/compiler/oracle/arm64/tests").glob("*.coil"))
sources += sorted((ROOT / "tests/compiler/features").glob("aggregate_*.coil"))
sources += sorted((ROOT / "tests/compiler/features").glob("sum_return_abi*.coil"))
if FULL:
    sources += sorted((ROOT / "tests").glob("*.coil"))
    sources += sorted(p for p in (ROOT / "tests/compiler/features").glob("*.coil")
                      if p not in sources)
sources = list(dict.fromkeys(sources))

# A jit_* fixture links the whole compiler as a unit and needs ~5 GB to
# compile, as does the compiler itself: those go one at a time.
heavy = [p for p in sources if p.name.startswith("jit_")]
light = [p for p in sources if p not in heavy]
emitted, failures = check(light, max(1, min(4, (os.cpu_count() or 2) // 2)))
more, found = check(heavy, 1)
emitted += more
failures += found
if FULL:
    more, found = check([ROOT / "src/compiler/main.coil"], 1)
    assert more == 1, "the compiler's own IR did not emit"
    emitted += more
    failures += found
# A file that does not build (a negative fixture, a library with no entry) is
# skipped, but most must emit or the scan proves nothing.
assert emitted * 10 >= len(sources) * 8, f"only {emitted} of {len(sources)} sources emitted IR"
assert not failures, "first-class aggregates over %d bytes:\n  %s" % (LIMIT, "\n  ".join(failures))
print(f"PASS: no first-class aggregate over {LIMIT} bytes in the IR of {emitted} programs")

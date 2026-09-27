#!/usr/bin/env python3
"""A tolerant resolve must not copy every declaration once per form.

Each macro-expansion round resolves the whole program tolerantly, and that pass
checked every form for shadowed structs, sums and consts by rebuilding those
lists (and the const index) from scratch -- once per form, even for the
overwhelmingly common form that declares none of them. The work was quadratic
in the program: ~440 MB per round for the compiler, retained by the compilation
arena, over a dozen rounds (12.4 GB peak self-build).

The bound is a scaling ratio, not a size: the qualify pass of the first
expansion round (read from COIL_TRACE) is measured for programs of N and 2N
struct+function pairs. Linear work doubles; the old quadratic rebuild roughly
quadrupled.
"""
from pathlib import Path
import os
import re
import subprocess
import sys
import tempfile

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(Path(__file__).resolve().parent))
import cleanup_on_signal  # noqa: E402
cleanup_on_signal.install()
COMPILER = Path(sys.argv[1]).resolve()


def program(n):
    lines = ["(module shadow.scale)"]
    for i in range(n):
        lines.append(f"(defstruct S{i} [(x i64)])")
        lines.append(f"(const K{i} {i})")
        lines.append(f"(defn f{i} [(s S{i})] (-> i64) (when (> (.x s) 0) (println \"x\")) (+ (.x s) K{i}))")
    lines.append("(defn main [] (-> i64) (f0 (S0 :x 1)))")
    return "\n".join(lines) + "\n"


def round_qualify_bytes(n, work):
    source = work / f"scale{n}.coil"
    source.write_text(program(n))
    result = subprocess.run([str(COMPILER), "check", str(source)], cwd=work, text=True,
                            capture_output=True, env={**os.environ, "COIL_TRACE": "1"})
    assert result.returncode == 0, (n, result.stdout, result.stderr)
    # The qualify pass inside the first expansion round's tolerant resolve.
    inside = False
    for line in result.stderr.splitlines():
        if line.startswith("coil-trace begin frontend.expand.round.resolve"):
            inside = True
        match = re.match(r"coil-profile\tallocated\tfrontend\.resolve\.qualify\t(\d+)", line)
        if inside and match:
            return int(match[1])
    raise AssertionError(("no expansion-round qualify profile", n, result.stderr[-2000:]))


with tempfile.TemporaryDirectory(prefix="coil-shadow-scale-") as directory:
    work = Path(directory)
    small, large = 400, 800
    a = round_qualify_bytes(small, work)
    b = round_qualify_bytes(large, work)
    ratio = b / max(a, 1)
    print(f"round qualify allocation: {small} pairs {a} B, {large} pairs {b} B, ratio {ratio:.2f}")
    assert ratio < 3.0, ("tolerant resolve grew quadratically in the declarations", a, b)
    print("resolve shadow scaling: passed")

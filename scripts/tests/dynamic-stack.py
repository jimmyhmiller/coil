#!/usr/bin/env python3
"""Caller-frame byte allocation: lifetime, alignment, loops and diagnostics."""
from pathlib import Path
import platform
import re
import subprocess
import sys
import tempfile

ROOT = Path(__file__).resolve().parents[2]
COMPILER = Path(sys.argv[1]).resolve()
SOURCE = ROOT / "tests/compiler/features/dynamic_stack.coil"


def run(args, expected=0, env=None):
    result = subprocess.run(list(map(str, args)), cwd=ROOT, text=True,
                            capture_output=True, timeout=90, env=env)
    assert result.returncode == expected, (args, result.returncode, result.stdout, result.stderr)
    return result


with tempfile.TemporaryDirectory(prefix=".coil-dynamic-stack-", dir=ROOT) as raw:
    work = Path(raw)
    for optimization in ["-O0", "-O2"]:
        binary = work / optimization
        run([COMPILER, "build", SOURCE, "--backend", "llvm", optimization, "-o", binary])
        run([binary])
    for sanitizer in ["address", "undefined"]:
        binary = work / sanitizer
        run([COMPILER, "build", SOURCE, "--backend", "llvm", "-O0",
             "--sanitize=" + sanitizer, "-o", binary])
        run([binary])
    ir = run([COMPILER, "emit-ir", SOURCE, "-O0"]).stdout
    assert "target datalayout" in ir
    assert re.search(r"alloca i8, i64 .*align 16", ir), ir[-4000:]
    assert "llvm.stackrestore" not in ir and "llvm.stacksave" not in ir

    backend = "arm64" if platform.machine() == "arm64" else "x64"
    for selected in [backend, "wasm"]:
        bad = run([COMPILER, "build", SOURCE, "--backend", selected, "-o", work / selected], 1)
        assert "alloc-stack-bytes is not supported" in bad.stdout + bad.stderr
        assert not (work / selected).exists()
    bad = run([COMPILER, "emit-ir", ROOT / "tests/compiler/oracle/ir/fixtures/stack_bytes.coil",
               "--backend", "llvm", "--target", "wasm32-unknown-unknown"], 1)
    assert "alloc-stack-bytes currently requires" in bad.stdout + bad.stderr, bad.stdout + bad.stderr

    negative = work / "bad.coil"
    for argument in ['"wrong"', "(cast i64 8)", "true", ""]:
        negative.write_text('(module dynamic.bad) (import "coil.primitive" :as p) '
                            f'(defn main [] (-> i64) (p/alloc-stack-bytes {argument}) 0)')
        bad = run([COMPILER, "check", negative], 1)
        assert "alloc-stack-bytes" in bad.stdout + bad.stderr
    bad = run([COMPILER, "interp", ROOT / "tests/compiler/oracle/ir/fixtures/stack_bytes.coil"], 1)
    assert "alloc-stack-bytes is not supported by the interpreter" in bad.stdout + bad.stderr, bad.stdout + bad.stderr
    negative.write_text('''(module dynamic.escape)
(import "coil.primitive" :as primitive)
(defn dangling [(n u64)] (-> (ptr u8)) (primitive/alloc-stack-bytes n))
(defn main [] (-> i64) 0)
''')
    checked = run([COMPILER, "build", negative, "--backend", "llvm", "--debug-checks", "-o", work / "dangling"])
    assert "returns a pointer to a stack local" in checked.stdout + checked.stderr, checked.stdout + checked.stderr

print("dynamic stack: LLVM O0/O2 lifetime/alignment/loop/branch tests and unsupported/type diagnostics passed")

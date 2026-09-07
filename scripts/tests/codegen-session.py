#!/usr/bin/env python3
"""Ordinary/incremental LLVM parity and function-arena ownership."""
from pathlib import Path
import os
import shlex
import subprocess
import sys
import tempfile

ROOT = Path(__file__).resolve().parents[2]
COMPILER = Path(sys.argv[1]).resolve()


def run(args, expected=0):
    result = subprocess.run(list(map(str, args)), cwd=ROOT, capture_output=True, text=True, timeout=180)
    assert result.returncode == expected, (args, result.returncode, result.stdout, result.stderr)
    return result


with tempfile.TemporaryDirectory(prefix=".coil-codegen-session-", dir=ROOT) as raw:
    work = Path(raw)
    llvm_config = os.environ.get("LLVM_CONFIG", "llvm-config")
    flags = shlex.split(run([llvm_config, "--ldflags", "--libs", "--system-libs"]).stdout)
    ir_clang = Path(run([llvm_config, "--bindir"]).stdout.strip()) / "clang"
    binary = work / "session"
    command = [COMPILER, "build", ROOT / "tests/compiler/features/codegen_session.coil", "--backend", "llvm", "-O2", "-o", binary]
    for flag in flags:
        command += ["--link-flag", flag]
    run(command)
    ir = run([binary]).stdout
    assert "target datalayout" in ir and "define i64 @main" in ir, ir
    source = work / "result.ll"
    source.write_text(ir)
    executable = work / "result"
    run([ir_clang, source, "-o", executable])
    run([executable], 42)
    print("PASS: identical ordinary/incremental LLVM IR; per-function arena release; static lifetime; forward calls; duplicate/closed rejection; idempotent abort; native execution")

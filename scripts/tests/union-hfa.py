#!/usr/bin/env python3
"""Ordinary-source LLVM/native C union and nested HFA boundary regression."""
from pathlib import Path
import subprocess
import sys
import tempfile

ROOT = Path(__file__).resolve().parents[2]
COMPILER = Path(sys.argv[1]).resolve()


def run(command, expected=0):
    result = subprocess.run(list(map(str, command)), cwd=ROOT, capture_output=True,
                            text=True, timeout=180)
    assert result.returncode == expected, (command, result.returncode, result.stdout, result.stderr)
    return result


with tempfile.TemporaryDirectory(prefix=".coil-union-hfa-", dir=ROOT) as raw:
    work = Path(raw)
    helper, executable = work / "helper.o", work / "union"
    run(["cc", "-O0", "-c", ROOT / "tests/compiler/features/union_hfa_native.c", "-o", helper])
    run([COMPILER, "build", ROOT / "tests/compiler/features/union_hfa.coil", "--backend", "llvm",
         "-o", executable, "--link-flag", helper])
    run([executable], 42)
    print("PASS: ordinary-source union alternatives and nested HFA arguments/results interoperate with native C")

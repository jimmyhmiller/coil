#!/usr/bin/env python3
"""C aggregate argument coercion must not read beyond the source object."""
from pathlib import Path
import subprocess
import sys
import tempfile

ROOT = Path(__file__).resolve().parents[2]
COMPILER = Path(sys.argv[1]).resolve()


def run(command):
    result = subprocess.run(list(map(str, command)), cwd=ROOT, capture_output=True,
                            text=True, timeout=180)
    assert result.returncode == 0, (command, result.returncode, result.stdout, result.stderr)
    return result


with tempfile.TemporaryDirectory(prefix=".coil-c-aggregate-bounds-", dir=ROOT / "build") as raw:
    work = Path(raw)
    helper = work / "helper.o"
    run(["cc", "-O0", "-c", ROOT / "tests/compiler/features/c_aggregate_bounded_read.c",
         "-o", helper])
    for opt in ("-O0", "-O3"):
        executable = work / opt[1:]
        run([COMPILER, "build", ROOT / "tests/compiler/features/c_aggregate_bounded_read.coil",
             opt, "--sanitize=address", "-o", executable, "--link-flag", helper])
        run([executable])
        print(f"PASS: {opt} bounded C aggregate reads: 1/3/4/9/12/16/24-byte objects, local relay and indirect call")

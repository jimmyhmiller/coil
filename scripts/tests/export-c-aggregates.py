#!/usr/bin/env python3
"""export-c with by-value struct parameters, and stack-passed arguments in both
directions, work from C on every backend.

The direct arm64 and x86-64 backends pass a struct parameter to a Coil function
by reference, so each such export gets a thunk that receives the C arguments
by value. Both used to reject the export (the arm64 backend aborted).
"""
from pathlib import Path
import platform
import subprocess
import sys
import tempfile

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(Path(__file__).resolve().parent))
import cleanup_on_signal  # noqa: E402
cleanup_on_signal.install()
COMPILER = Path(sys.argv[1]).resolve()
SOURCE = ROOT / "tests/compiler/features/export_c_aggregates.coil"
DRIVER = ROOT / "tests/compiler/features/export_c_aggregates.c"
EXPECTED = "13 7 110 9.0 11 8765 7321 4321 304 56"


def run(command):
    result = subprocess.run(list(map(str, command)), cwd=ROOT, capture_output=True,
                            text=True, timeout=180)
    assert result.returncode == 0, (command, result.returncode, result.stdout, result.stderr)
    return result


host = {"arm64": "arm64", "aarch64": "arm64", "x86_64": "x64"}[platform.machine()]
with tempfile.TemporaryDirectory(prefix=".coil-export-c-aggregates-", dir=ROOT / "build") as raw:
    work = Path(raw)
    for backend in ("llvm", host):
        obj = work / f"{backend}.o"
        run([COMPILER, "emit-obj", SOURCE, "--backend", backend, "-o", obj])
        exe = work / backend
        run(["cc", DRIVER, obj, "-o", exe, "-lm"])
        out = run([exe]).stdout.strip()
        assert out == EXPECTED, (backend, out)
        print(f"PASS {backend}: by-value struct exports called from C")
    other = "x64" if host == "arm64" else "arm64"
    run([COMPILER, "emit-obj", SOURCE, "--backend", other, "-o", work / f"{other}.o"])
    print(f"PASS {other}: by-value struct exports compile")

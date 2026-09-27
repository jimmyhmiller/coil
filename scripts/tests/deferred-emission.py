#!/usr/bin/env python3
"""LLVM optimization and emission run after the frontend's unit is released.

A build lowers the checked program to an LLVM module inside its compilation
unit, then hands the module to the facade (unit-defer!), which optimizes and
emits it after compilation-unit-leave! has released the unit's arena. Emitting
inside the unit kept the whole frontend arena live underneath LLVM's own peak:
the compiler's self-build peaked at 6.6 GB instead of 4.3 GB.

The check reads the trace rather than a memory size, so it does not track the
compiler's working set: lowering must happen inside the facade, and
optimization and object emission after it ends. The built program must also
still run, including when emission fails (an unwritable output path).
"""
from pathlib import Path
import os
import subprocess
import sys
import tempfile

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(Path(__file__).resolve().parent))
import cleanup_on_signal  # noqa: E402
cleanup_on_signal.install()
COMPILER = Path(sys.argv[1]).resolve()

with tempfile.TemporaryDirectory(prefix="coil-deferred-emission-") as directory:
    work = Path(directory)
    source = work / "calc.coil"
    source.write_text((ROOT / "src/examples/calc.coil").read_text())
    binary = work / "calc"
    result = subprocess.run([str(COMPILER), "build", str(source), "-o", str(binary)], cwd=work,
                            text=True, capture_output=True, env={**os.environ, "COIL_TRACE": "1"})
    assert result.returncode == 0, (result.stdout, result.stderr[-3000:])
    lines = result.stderr.splitlines()

    def first(prefix):
        for index, line in enumerate(lines):
            if line.startswith(prefix):
                return index
        raise AssertionError(("missing trace line", prefix))

    begin = first("coil-profile\tfacade.begin")
    lower = first("coil-trace begin backend.llvm-lower")
    end = first("coil-profile\tfacade.end")
    optimize = first("coil-trace begin backend.llvm-optimize")
    assert begin < lower < end, ("LLVM lowering left the facade's unit", begin, lower, end)
    assert end < optimize, ("LLVM optimization ran inside the frontend's unit", end, optimize)
    assert subprocess.run([str(binary)], cwd=work, capture_output=True).returncode == 0

    # Emission failures still fail the build after the unit is gone.
    unwritable = work / "missing" / "dir" / "calc"
    failed = subprocess.run([str(COMPILER), "build", str(source), "-o", str(unwritable)], cwd=work,
                            text=True, capture_output=True)
    assert failed.returncode != 0, ("a failed emission reported success", failed.stdout, failed.stderr)
    print("deferred emission: passed")

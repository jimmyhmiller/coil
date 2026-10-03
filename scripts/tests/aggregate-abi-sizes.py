#!/usr/bin/env python3
"""By-value aggregates of every awkward size survive Coil-to-Coil calls.

A 12-byte struct is coerced to [2 x i64]. A callee that stored those 16 bytes
into a 12-byte slot wrote past it; LLVM treated that as UB and at -O2 read the
last field back as 0 (cfia3fumjgg). Run the sweep at each optimization level,
under ASan (which traps the overflowing store directly), and on the host's
native backend: arm64 emits Mach-O and runs on Apple silicon; x64 runs on any
x86-64 host. A host with neither (aarch64 Linux) has no native backend to run.
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
SOURCE = ROOT / "tests/compiler/features/aggregate_abi_sizes.coil"


def run(command):
    result = subprocess.run(list(map(str, command)), cwd=ROOT, capture_output=True,
                            text=True, timeout=180)
    assert result.returncode == 0, (command, result.returncode, result.stdout, result.stderr)
    return result


with tempfile.TemporaryDirectory(prefix=".coil-aggregate-abi-", dir=ROOT / "build") as raw:
    work = Path(raw)
    machine = platform.machine()
    native = ("arm64" if machine == "arm64" and sys.platform == "darwin"
              else "x64" if machine in ("x86_64", "AMD64") else None)
    variants = [["-O0"], ["-O1"], ["-O2"], ["-O3"], ["-O2", "--sanitize=address"]]
    if native:
        variants.append(["--backend", native])
    for i, flags in enumerate(variants):
        executable = work / f"v{i}"
        run([COMPILER, "build", SOURCE, *flags, "-o", executable])
        out = run([executable]).stdout
        assert out.strip().endswith("failures: 0"), (flags, out)
        print(f"PASS: {' '.join(flags)}: 3/6/7/10/12/20-byte aggregates by value, generic, fnptr, return, ArrayList")

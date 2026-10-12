#!/usr/bin/env python3
"""COMPREHENSIVE: the language guide's demo programs build and run on arm64.

tests/demos.txt lists each src/examples program with the exit status it must end
with (its argv after `--`), or `test` for a file of deftests run by `coil test`.
The demos are documentation; this keeps every one of them working.
"""

from __future__ import annotations

import os
import shlex
import shutil
import subprocess
import sys
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]


def main() -> int:
    coil = os.environ.get("COIL") or (sys.argv[1] if len(sys.argv) > 1 else shutil.which("coil"))
    failures = 0
    entries = []
    for raw in (ROOT / "tests/demos.txt").read_text().splitlines():
        line = raw.strip()
        if line and not line.startswith("#"):
            words = shlex.split(line)
            args = words[words.index("--") + 1:] if "--" in words else []
            entries.append((words[0], words[1], args))
    with tempfile.TemporaryDirectory(prefix="guide-demos-", dir=os.environ.get("COIL_TEST_SCRATCH")) as raw:
        for source, want, args in entries:
            if want == "test":
                result = subprocess.run([coil, "test", source], cwd=ROOT, capture_output=True, timeout=120)
                problem = None if result.returncode == 0 else f"coil test exited {result.returncode}"
            else:
                exe = Path(raw) / Path(source).stem
                result = subprocess.run([coil, "build", source, "--backend", "arm64", "-o", str(exe)],
                                        cwd=ROOT, capture_output=True, timeout=120)
                if result.returncode:
                    problem = "build failed"
                else:
                    result = subprocess.run([str(exe), *args], cwd=ROOT, capture_output=True,
                                            stdin=subprocess.DEVNULL, timeout=30)
                    problem = None if result.returncode == int(want) else \
                        f"exited {result.returncode}, want {want}"
            if problem:
                failures += 1
                print(f"FAIL {source}: {problem}")
                out = (result.stdout + result.stderr).decode(errors="replace")
                print("\n".join("     " + l for l in out.splitlines()[-20:]))
            else:
                print(f"ok   {source}")
    print(f"guide demos: {len(entries) - failures} passed, {failures} failed")
    return 1 if failures else 0


if __name__ == "__main__":
    raise SystemExit(main())

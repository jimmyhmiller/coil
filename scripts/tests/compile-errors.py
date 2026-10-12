#!/usr/bin/env python3
"""COMPREHENSIVE: compile-error tests (coil.test.compile, TESTING.md).

A compile-error test compiles code while it runs, so it links the in-process
compiler. Against an installed toolchain that is its warmed coil.jit unit;
without one it would be a whole-compiler build, which is why FAST leaves these
out. Runs tests/comprehensive/compile_error_test.coil and the examples that have such tests.
"""

from __future__ import annotations

import os
import shutil
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
COIL = os.environ.get("COIL") or shutil.which("coil") or "coil"
# Diagnostics the tests provoke on purpose; a passing run must not print them.
PROVOKED = ("argument 2 to", "undefined function")


def main() -> int:
    failures = 0
    for argv, cwd in (([COIL, "test", "tests/comprehensive/compile_error_test.coil"], ROOT),
                      ([COIL, "test"], ROOT / "examples" / "statemachine")):
        result = subprocess.run(argv, cwd=cwd, capture_output=True, text=True, timeout=300,
                                stdin=subprocess.DEVNULL)
        output = result.stdout + result.stderr
        name = f"{' '.join(argv[1:])} in {cwd.relative_to(ROOT) if cwd != ROOT else '.'}"
        if result.returncode != 0:
            failures += 1
            print(f"FAIL {name}: exit {result.returncode}\n{output[-3000:]}")
        elif any(text in output for text in PROVOKED):
            failures += 1
            print(f"FAIL {name}: a passing run echoed the diagnostics its tests check\n{output[-3000:]}")
        else:
            print(f"ok   {name}")
    return 1 if failures else 0


if __name__ == "__main__":
    raise SystemExit(main())

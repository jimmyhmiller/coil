#!/usr/bin/env python3
"""Exercise the portable compiler's native host bridge without a seed rebuild."""
import os
from pathlib import Path
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[2]
with tempfile.TemporaryDirectory(prefix="coil-bootstrap-runtime-") as directory:
    binary = Path(directory) / "runtime-test"
    subprocess.run([os.environ.get("CC", "cc"), "-O1", "-g",
                    "-fsanitize=address,undefined", "-fno-omit-frame-pointer",
                    str(ROOT / "tests/bootstrap/runtime_test.c"), "-lm", "-o", str(binary)], check=True)
    subprocess.run([str(binary)], check=True, env=os.environ | {"ASAN_OPTIONS": "detect_leaks=0"})

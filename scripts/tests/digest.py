#!/usr/bin/env python3
"""Artifact digest: published vectors and streaming/block boundaries vs hashlib."""
from pathlib import Path
import hashlib
import platform
import subprocess
import sys
import tempfile

ROOT = Path(__file__).resolve().parents[2]
COMPILER = Path(sys.argv[1]).resolve()


def run(args):
    got = subprocess.run(list(map(str, args)), cwd=ROOT, capture_output=True, text=True)
    assert got.returncode == 0, (args, got.returncode, got.stdout, got.stderr)
    return got.stdout.splitlines()


with tempfile.TemporaryDirectory(prefix=".coil-digest-", dir=ROOT) as directory:
    work = Path(directory)
    backends = ["llvm"] + (["arm64"] if platform.machine() == "arm64" else [])
    for backend in backends:
        binary = work / backend
        run([COMPILER, "build", ROOT / "tests/compiler/features/digest.coil", "--backend", backend, "-O2", "-o", binary])
        assert run([binary]) == [hashlib.sha256(x).hexdigest() for x in [b"", b"abc", b"abc", b"abcdef"]]
        for n in [0, 1, 55, 56, 63, 64, 65, 119, 120, 127, 128, 129, 4097, 1_000_000]:
            expected = hashlib.sha256(bytes(((i * 131) ^ (i >> 3)) & 255 for i in range(n))).hexdigest()
            for step in [1, 7, 64, 1009]:
                assert run([binary, n, step]) == [expected], (backend, n, step)
        print(f"PASS {backend}: SHA-256 vectors, stream boundaries, prefix snapshots, input-limit rejection")

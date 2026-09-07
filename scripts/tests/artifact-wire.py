#!/usr/bin/env python3
"""Provider metadata framing, content identity, bounded malformed-input rejection."""
from pathlib import Path
import hashlib
import os
import platform
import random
import struct
import subprocess
import sys
import tempfile

ROOT = Path(__file__).resolve().parents[2]
COMPILER = Path(sys.argv[1]).resolve()


def run(args, expected=0):
    result = subprocess.run(list(map(str, args)), cwd=ROOT, capture_output=True, timeout=30)
    assert result.returncode == expected, (args, result.returncode, result.stdout, result.stderr)
    return result.stdout


with tempfile.TemporaryDirectory(prefix=".coil-artifact-wire-", dir=ROOT) as raw:
    work = Path(raw)
    data = work / "metadata"
    bad = work / "malformed"
    source = work / "dependency"
    rng = random.Random(1804)
    for backend in ["llvm"] + (["arm64"] if platform.machine() == "arm64" else []):
        binary = work / backend
        run([COMPILER, "build", "tests/compiler/features/artifact_wire.coil", "--backend", backend, "-O2", "-o", binary])
        run([binary, "write", data])
        encoded = data.read_bytes()
        assert len(encoded) > 500
        run([binary, "roundtrip", data])
        fields = [b"coil-provider-artifact-v1", b"reader.example", b"reader.example.read-source",
                  b"sdk", b"host", b"target", b"options", b"a", b"first", b"z", b"last"]
        digest = hashlib.sha256(b"".join(struct.pack("<Q", len(x)) + x for x in fields)).hexdigest()
        assert run([binary, "keys"]).decode().splitlines() == [digest, digest]
        for n in [0, 1, 65535, 65536, 65537, 1_000_000]:
            contents = rng.randbytes(n)
            source.write_bytes(contents)
            expected = hashlib.sha256(contents).hexdigest()
            assert run([binary, "hash", source]).decode().strip() == expected
            run([binary, "validate", source, expected])
            before = source.stat()
            source.write_bytes(contents + b"changed")
            os.utime(source, ns=(before.st_atime_ns, before.st_mtime_ns))
            run([binary, "validate", source, expected], 1)
        run([binary, "hash", work / "missing"], 1)
        # Every truncated prefix must fail; data is small enough to be exhaustive.
        for n in range(len(encoded)):
            bad.write_bytes(encoded[:n])
            run([binary, "roundtrip", bad], 1)
        bad.write_bytes(encoded + b"trailing")
        run([binary, "roundtrip", bad], 1)
        for n in [0x7FFFFFFFFFFFFFFF, 0xFFFFFFFFFFFFFFFF, 1_000_001]:
            bad.write_bytes(struct.pack("<Q", n) + encoded[8:])
            run([binary, "roundtrip", bad], 1)
        print(f"PASS {backend}: full syntax/hygiene/import metadata roundtrip, {len(encoded)} truncations, SHA file streaming and preserved-mtime invalidation")

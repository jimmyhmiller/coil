#!/usr/bin/env python3
"""Namespace discovery must not retain source text from unimported files."""

import os
from pathlib import Path
import subprocess
import sys
import tempfile


ROOT = Path(__file__).resolve().parents[2]
COMPILER = Path(sys.argv[1]).resolve()


def load_arena_bytes(root: Path, source: Path, output: Path) -> int:
    env = os.environ.copy()
    env["COIL_NAMESPACE_ROOTS"] = str(root)
    env["COIL_TRACE"] = "1"
    result = subprocess.run(
        [str(COMPILER), "emit-obj", str(source), "-O0", "-o", str(output)],
        cwd=ROOT,
        env=env,
        text=True,
        capture_output=True,
    )
    assert result.returncode == 0, (result.stdout, result.stderr)
    prefix = "coil-profile\tarena.live\tfrontend.load\t"
    measurements = [
        int(line[len(prefix):])
        for line in result.stderr.splitlines()
        if line.startswith(prefix)
    ]
    assert len(measurements) == 1, result.stderr
    return measurements[0]


with tempfile.TemporaryDirectory(prefix=".coil-namespace-memory-", dir=ROOT) as temp:
    root = Path(temp)
    entry = root / "entry.coil"
    entry.write_text("(module index.fixture.entry)\n(defn main [] (-> i64) 0)\n")
    baseline = load_arena_bytes(root, entry, root / "baseline.o")

    # The module declaration follows an arbitrarily long comment. The indexer
    # must read through it, yet retain only the module name and path. One late
    # module is imported to check that discovery still resolves its header.
    comment = ";" + "x" * (256 * 1024 - 2) + "\n"
    for i in range(128):
        (root / f"mod{i}.coil").write_text(
            comment + f"(module index.fixture.mod{i})\n"
            + ("(defn answer [] (-> i64) 42)\n" if i == 127 else "")
        )
    entry.write_text(
        "(module index.fixture.entry)\n"
        '(import "index.fixture.mod127" :as late)\n'
        "(defn main [] (-> i64) (late/answer))\n"
    )
    indexed = load_arena_bytes(root, entry, root / "indexed.o")
    increase = indexed - baseline
    assert increase < 12 * 1024 * 1024, (baseline, indexed, increase)
    print(f"namespace index: 32 MiB of unimported source retained {increase} B")

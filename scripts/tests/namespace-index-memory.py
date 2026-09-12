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
    env.pop("COIL_READERS", None)
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

    # Irrelevant directory entries must not allocate lasting joined paths.
    # Long names make this observable without creating a huge file payload.
    for i in range(16000):
        (root / f"noise-{i:05d}-{'q' * 100}.txt").touch()
    with_noise = load_arena_bytes(root, entry, root / "with-noise.o")
    path_increase = with_noise - indexed
    assert path_increase < 2 * 1024 * 1024, (indexed, with_noise, path_increase)

    # Directory traversal paths are temporary even when no module lives below.
    for i in range(8000):
        (root / f"empty-{i:05d}-{'d' * 180}").mkdir()
    with_directories = load_arena_bytes(root, entry, root / "with-directories.o")
    directory_increase = with_directories - with_noise
    assert directory_increase < 2 * 1024 * 1024, (
        with_noise, with_directories, directory_increase
    )
    print(
        "namespace index: 32 MiB of unimported source retained "
        f"{increase} B; 16,000 irrelevant paths retained {path_increase} B; "
        f"8,000 empty directories retained {directory_increase} B"
    )

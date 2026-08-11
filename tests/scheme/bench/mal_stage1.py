#!/usr/bin/env python3
"""Benchmark the same attributed Mal stage-1 port under Coil and Chez."""

from __future__ import annotations

import argparse
import subprocess
import tempfile
import time
from pathlib import Path


ROOT = Path(__file__).resolve().parents[3]
APPS = ROOT / "tests/scheme/apps"
MAL = APPS / "mal_stage1.coil"
BENCH = APPS / "mal_stage1_bench.coil"
CLI = APPS / "mal_stage1_bench_cli.coil"


def portable_body(path: Path) -> str:
    lines = path.read_text().splitlines()
    return "\n".join(
        line for line in lines
        if not line.startswith("(module ")
        and not line.startswith("(import ")
        and not line.startswith("(export ")
    ) + "\n"


def timed(argv: list[str], repeat: int) -> tuple[float, str]:
    best: float | None = None
    answer = ""
    for _ in range(repeat):
        start = time.perf_counter()
        proc = subprocess.run(argv, cwd=ROOT, capture_output=True, text=True,
                              timeout=300, check=True)
        elapsed = time.perf_counter() - start
        best = elapsed if best is None else min(best, elapsed)
        answer = proc.stdout
    return best or 0.0, answer


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--compiler", default=str(ROOT / "build/bin/coil"))
    parser.add_argument("--chez", default="scheme")
    parser.add_argument("--repeat", type=int, default=5)
    args = parser.parse_args()
    with tempfile.TemporaryDirectory(prefix="coil-mal-stage1-bench-") as tmp:
        tmpdir = Path(tmp)
        coil_binary = tmpdir / "mal-stage1-coil"
        chez_source = tmpdir / "mal-stage1-chez.scm"
        chez_source.write_text(
            portable_body(MAL) + portable_body(BENCH)
            + "(display (mal-stage1-benchmark))\n(newline)\n"
        )
        subprocess.run(
            [args.compiler, "build", str(CLI), "-o", str(coil_binary), "--quiet"],
            cwd=ROOT, check=True, timeout=600,
        )
        coil = timed([str(coil_binary)], args.repeat)
        chez = timed([args.chez, "--script", str(chez_source)], args.repeat)
    if coil[1] != chez[1]:
        raise RuntimeError("Coil and Chez produced different Mal output")
    print("Mal stage 1 (1000 heterogeneous read/print iterations)")
    print(f"Coil: {coil[0] * 1000:.1f} ms")
    print(f"Chez: {chez[0] * 1000:.1f} ms")
    print(f"Coil/Chez: {coil[0] / chez[0]:.2f}x")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

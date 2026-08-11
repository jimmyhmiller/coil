#!/usr/bin/env python3
"""Benchmark the same portable Scheme Lox interpreter on Coil and Chez."""

from __future__ import annotations

import argparse
import subprocess
import sys
import tempfile
import time
from pathlib import Path


ROOT = Path(__file__).resolve().parents[3]
BENCH = Path(__file__).resolve().parent / "lox"
LOX = ROOT / "tests/scheme/apps/lox.coil"
CLI = ROOT / "tests/scheme/apps/lox_cli.coil"
DEFAULT_COIL = ROOT / "build/bin/coil"


def run_timed(argv: list[str], repeat: int) -> tuple[float, str] | None:
    best: float | None = None
    output = ""
    for _ in range(repeat):
        start = time.perf_counter()
        try:
            proc = subprocess.run(argv, cwd=ROOT, capture_output=True, text=True,
                                  timeout=300, check=False)
        except (FileNotFoundError, subprocess.TimeoutExpired):
            return None
        elapsed = time.perf_counter() - start
        if proc.returncode != 0 or proc.stderr:
            return None
        best = elapsed if best is None else min(best, elapsed)
        output = proc.stdout.strip()
    return (best or 0.0, output)


def chez_source() -> str:
    # lox.coil is deliberately portable Scheme apart from its Coil module/import
    # envelope. Keep one source of interpreter truth and remove only that host
    # envelope for Chez.
    lines = LOX.read_text().splitlines()
    body = [line for line in lines
            if not line.startswith("(module ") and not line.startswith("(import ")]
    body.append("(lox-run-file (cadr (command-line)))")
    return "\n".join(body) + "\n"


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--compiler", default=str(DEFAULT_COIL))
    parser.add_argument("--repeat", type=int, default=5)
    parser.add_argument("--filter", default="")
    parser.add_argument("--chez", default="scheme")
    args = parser.parse_args()

    cases = sorted(path for path in BENCH.glob("*.lox")
                   if args.filter in path.name)
    if not cases:
        print("no matching Lox benchmark cases", file=sys.stderr)
        return 1

    with tempfile.TemporaryDirectory(prefix="coil-scheme-lox-bench-") as tmp:
        tmpdir = Path(tmp)
        coil_binary = tmpdir / "lox-coil"
        chez_driver = tmpdir / "lox-chez.scm"
        chez_driver.write_text(chez_source())
        build = subprocess.run(
            [args.compiler, "build", str(CLI), "-o", str(coil_binary),
             "--link-flag", "-lm", "--quiet"],
            cwd=ROOT, capture_output=True, text=True, timeout=600, check=False,
        )
        if build.returncode != 0:
            print(build.stdout + build.stderr, file=sys.stderr)
            return 1

        print(f"{'case':<16}{'coil':>11}{'chez':>11}   {'coil/chez':>10}  answer")
        print("-" * 67)
        failures = 0
        for case in cases:
            coil = run_timed([str(coil_binary), str(case)], args.repeat)
            chez = run_timed([args.chez, "--script", str(chez_driver), str(case)],
                             args.repeat)
            agree = bool(coil and chez and coil[1] == chez[1])
            if not agree:
                failures += 1
            coil_cell = f"{coil[0] * 1000:10.1f}ms" if coil else "          —"
            chez_cell = f"{chez[0] * 1000:10.1f}ms" if chez else "          —"
            ratio = (f"{coil[0] / chez[0]:9.2f}x"
                     if coil and chez and chez[0] else "         —")
            answer = coil[1] if agree and coil else "MISMATCH/FAILED"
            print(f"{case.stem:<16}{coil_cell}{chez_cell}   {ratio}  {answer}")

    if failures:
        print(f"\n{failures} case(s) failed or disagreed; timings are not valid")
        return 1
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

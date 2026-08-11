#!/usr/bin/env python3
"""Benchmark the Coil Scheme dialect against Chez and Petite.

The comparison that matters is compute, not startup. A native binary starts in
~1 ms and Chez's `--script` floor is ~35 ms, so a one-shot run of a small program
measures process setup and nothing else — which flatters us for the wrong reason.
Each case therefore runs its core enough times to dominate, and every
implementation is given the identical source.

    python3 tests/scheme/bench/run.py                 # all cases
    python3 tests/scheme/bench/run.py --filter fib
    python3 tests/scheme/bench/run.py --repeat 7      # min-of-N, default 5

Reports min-of-N wall clock. Minimum rather than mean: the machine is noisy and
the floor is the honest estimate of how fast the code can go.
"""

from __future__ import annotations

import argparse
import subprocess
import sys
import time
from pathlib import Path

ROOT = Path(__file__).resolve().parents[3]
BENCH = Path(__file__).resolve().parent
DEFAULT_COIL = ROOT / "build/bin/coil"

# Reference implementations. Chez is the target; Petite is Chez's *interpreter*,
# included because beating an interpreter proves nothing — the meaningful line is
# Chez's optimizing native compiler.
ORACLES = [
    ("chez", ["scheme", "--script"]),
    ("petite", ["petite", "--script"]),
]


def time_run(argv: list[str], repeat: int, cwd: Path | None = None) -> tuple[float, str] | None:
    """Min-of-N wall clock, plus stdout, or None if it does not run."""
    best, out = None, ""
    for _ in range(repeat):
        start = time.perf_counter()
        try:
            proc = subprocess.run(argv, capture_output=True, text=True,
                                  timeout=300, cwd=cwd)
        except (subprocess.TimeoutExpired, FileNotFoundError):
            return None
        elapsed = time.perf_counter() - start
        if proc.returncode != 0:
            return None
        out = proc.stdout.strip()
        best = elapsed if best is None else min(best, elapsed)
    return (best or 0.0, out)


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__,
                                 formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--filter", default="", help="substring match on case name")
    ap.add_argument("--repeat", type=int, default=5, help="min-of-N (default 5)")
    ap.add_argument("--compiler", default=str(DEFAULT_COIL),
                    help="Coil compiler candidate (default: build/bin/coil)")
    args = ap.parse_args()
    coil = Path(args.compiler).expanduser().resolve()

    cases = sorted(p for p in BENCH.glob("*.scm") if args.filter in p.name)
    if not cases:
        print("no cases under tests/scheme/bench/", file=sys.stderr)
        return 1
    if not coil.is_file():
        print(f"compiler not built: {coil}", file=sys.stderr)
        return 1

    print(f"{'case':<18}{'coil':>10}{'chez':>10}{'petite':>10}   {'vs chez':>9}  answer")
    print("-" * 78)

    failures = 0
    for case in cases:
        # The .coil driver beside each .scm is the same program in the dialect.
        driver = case.with_suffix(".coil")
        results: dict[str, tuple[float, str] | None] = {}

        if driver.is_file():
            exe = BENCH / f".{case.stem}.bin"
            # -lm: the Linux link line (scripts/compiler/llvm-link-flags.sh) does
            # not include libm, so anything reaching `floor` fails to link. Inert
            # on macOS, where libm is part of libSystem.
            build = subprocess.run([str(coil), "build", str(driver), "-o", str(exe),
                                    "--link-flag", "-lm"],
                                   capture_output=True, text=True, timeout=600)
            results["coil"] = time_run([str(exe)], args.repeat) if build.returncode == 0 else None
        else:
            results["coil"] = None

        for name, prefix in ORACLES:
            results[name] = time_run(prefix + [str(case)], args.repeat, cwd=BENCH)

        def cell(key: str) -> str:
            r = results.get(key)
            return f"{r[0] * 1000:9.1f}ms" if r else "        —"

        coil_result, chez_result = results.get("coil"), results.get("chez")
        ratio = (f"{coil_result[0] / chez_result[0]:8.2f}x"
                 if coil_result and chez_result and chez_result[0] > 0 else "        —")

        # A speed comparison between programs computing different things is
        # meaningless, so disagreement is reported instead of timed.
        answers = {k: v[1] for k, v in results.items() if v}
        agree = len(set(answers.values())) <= 1
        answer = next(iter(answers.values()), "—") if agree else "MISMATCH " + repr(answers)
        if not agree:
            failures += 1

        print(f"{case.stem:<18}{cell('coil')}{cell('chez')}{cell('petite')}   {ratio}  {answer[:28]}")

    print()
    if failures:
        print(f"{failures} case(s) disagreed on the answer — timings there are meaningless")
        return 1
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

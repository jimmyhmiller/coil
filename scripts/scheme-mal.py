#!/usr/bin/env python3
"""Run the pinned Mal compatibility, self-host, and matched benchmark gates."""

from __future__ import annotations

import argparse
import subprocess
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]


def run(argv: list[str]) -> None:
    print("+", " ".join(argv), flush=True)
    subprocess.run(argv, cwd=ROOT, check=True)


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--compiler", default=str(ROOT / "build/bin/coil"))
    parser.add_argument("--quick", action="store_true",
                        help="run one benchmark sample at 100 iterations")
    parser.add_argument("--sanitize", action="store_true",
                        help="also run each corpus under AddressSanitizer")
    args = parser.parse_args()

    corpus = str(ROOT / "scripts/scheme-mal-corpus.py")
    for stage in range(2, 11):
        command = ["python3", corpus, str(stage), "--compiler", args.compiler]
        if args.sanitize:
            command.append("--sanitize")
        run(command)

    run(["python3", str(ROOT / "scripts/scheme-mal-errors.py"),
         "--compiler", args.compiler])

    run(["python3", str(ROOT / "scripts/scheme-mal-selfhost.py"),
         "--compiler", args.compiler])

    iterations = "100" if args.quick else "1000"
    repeat = "1" if args.quick else "5"
    run(["python3", str(ROOT / "tests/scheme/bench/mal_full.py"),
         "--compiler", args.compiler, "--iterations", iterations,
         "--repeat", repeat])
    print("PASS complete pinned Mal workflow", flush=True)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

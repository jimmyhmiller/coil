#!/usr/bin/env python3
"""Run a fuzzing campaign over every target in tests/fuzz/*_fuzz.coil.

A target is an ordinary file of `defprop`s aimed at one part of the standard
library. Here each is fuzzed under AddressSanitizer for `--time` seconds per
property, and every campaign must end with no finding. A finding prints the
campaign's report (the minimized counterexample, the sanitizer report) and fails
the run; the counterexample is also saved in the property database of the
directory the campaign ran in, so `coil test tests/fuzz/<target>` replays it.

Campaign state — the corpora above all, and each property's coverage.txt — is
kept in `.coil/fuzz-targets/` in this checkout (or `--fuzz-dir`), so every run
resumes from everything earlier runs found.

A local tool: campaigns cost real machine time and are not part of CI.

    python3 scripts/tests/fuzz_targets.py --compiler build/bin/coil --time 15
    python3 scripts/tests/fuzz_targets.py --compiler build/bin/coil --time 600 \\
        --jobs 4 --fuzz-dir ~/.cache/coil-fuzz
"""

from __future__ import annotations

import argparse
import sys
import tempfile
from pathlib import Path
import subprocess

ROOT = Path(__file__).resolve().parents[2]
TARGETS = ROOT / "tests" / "fuzz"


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--compiler", default="build/bin/coil")
    parser.add_argument("--time", type=int, default=15, help="seconds per property")
    parser.add_argument("--jobs", type=int, default=1, help="workers per property")
    parser.add_argument("--fuzz-dir", default=str(ROOT / ".coil" / "fuzz-targets"),
                        help="campaign state (corpora, coverage reports); kept across runs")
    parser.add_argument("--no-asan", action="store_true", help="fuzz without AddressSanitizer")
    parser.add_argument("targets", nargs="*", help="target files (default: tests/fuzz/*_fuzz.coil)")
    args = parser.parse_args()
    compiler = str(Path(args.compiler).resolve())

    # `*_upstream_fuzz.coil` links an oracle archive that needs the network to
    # build (see tests/fuzz/README.md); it has its own runner script.
    targets = [Path(t).resolve() for t in args.targets] or sorted(
        t for t in TARGETS.glob("*_fuzz.coil") if not t.name.endswith("_upstream_fuzz.coil"))
    if not targets:
        print("fuzz targets: none found in tests/fuzz/")
        return 1

    with tempfile.TemporaryDirectory(prefix="coil-fuzz-targets-") as scratch:
        fuzz_dir = str(Path(args.fuzz_dir).resolve())
        failed: list[str] = []
        for target in targets:
            # Each campaign runs in its own directory: the build directory and the
            # property database are per-directory, and a finding must not be
            # replayed into the next target's run.
            work = Path(scratch) / target.stem
            work.mkdir()
            cmd = [
                compiler, "fuzz", str(target),
                "--time", str(args.time),
                "--jobs", str(args.jobs),
                "--fuzz-dir", fuzz_dir,
                "--status-every", "0",
            ]
            if not args.no_asan:
                cmd.append("--sanitize=address")
            print(f"== {target.relative_to(ROOT) if target.is_relative_to(ROOT) else target}", flush=True)
            p = subprocess.run(cmd, cwd=work, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True)
            summary = [line for line in p.stdout.splitlines()
                       if line.startswith("  done ") or line.startswith("  functions entered")
                       or line.startswith("test ")]
            print("\n".join(summary))
            if p.returncode != 0:
                print(p.stdout)
                failed.append(target.name)

    print()
    if failed:
        print(f"fuzz targets: {len(failed)} target(s) found a failure: {', '.join(failed)}")
        return 1
    print(f"fuzz targets: {len(targets)} target(s) clean")
    return 0


if __name__ == "__main__":
    sys.exit(main())

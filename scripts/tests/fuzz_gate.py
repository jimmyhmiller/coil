#!/usr/bin/env python3
"""Does `coil fuzz` find what it must find, and report it truthfully?

Every fixture in tests/fuzz/regress/ plants one bug that a blind property run
cannot reach and a working campaign reaches in seconds. For each, the gate checks
the whole user-visible outcome, not just "something failed":

  * the exact minimized counterexample (so a regression in attribution — reporting
    some other input than the one that failed — is caught, as it once went
    unnoticed for crashes found by mutation);
  * the kind of failure (false, CRASHED, TIMED OUT, an AddressSanitizer report);
  * that the finding is saved, so a plain `coil test` replays it first.

It also checks what a passing campaign leaves behind — a corpus the next campaign
resumes from, a coverage report, `--minimize-corpus` keeping every edge — and that
the command rejects an option it does not know instead of silently running the
default campaign.

Budgets are ITERATION counts with fixed seeds, not wall-clock time, so a result
does not depend on how loaded the machine is.

    python3 scripts/tests/fuzz_gate.py --compiler build/bin/coil
"""

from __future__ import annotations

import argparse
import os
import re
import shutil
import subprocess
import sys
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
REGRESS = ROOT / "tests" / "fuzz" / "regress"

failures: list[str] = []


def run(compiler: str, cwd: Path, *args: str, timeout: int = 600) -> subprocess.CompletedProcess[str]:
    return subprocess.run(
        [compiler, *args],
        cwd=cwd,
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
        text=True,
        timeout=timeout,
    )


def check(name: str, ok: bool, detail: str, output: str) -> None:
    if ok:
        print(f"  ok    {name}")
    else:
        print(f"  FAIL  {name}: {detail}")
        tail = "\n".join(output.splitlines()[-40:])
        print("        --- last lines of output ---")
        print("\n".join("        " + line for line in tail.splitlines()))
        failures.append(name)


def fixture_dir(tmp: Path, fixture: str, run_name: str | None = None) -> Path:
    """A fresh directory holding one copy of `fixture`, so each run has its own
    .coil/ state."""
    d = tmp / (run_name or fixture.removesuffix(".coil"))
    d.mkdir()
    shutil.copy(REGRESS / fixture, d / fixture)
    return d


def expect_finding(
    compiler: str,
    tmp: Path,
    fixture: str,
    counterexample: str,
    kind: str,
    *extra: str,
    also: str | None = None,
) -> Path:
    """Run a campaign that must fail, and check what it reports."""
    d = fixture_dir(tmp, fixture)
    p = run(compiler, d, "fuzz", fixture, "--seed", "7", "-n", "400000", "--status-every", "0", *extra)
    out = p.stdout
    name = f"{fixture} {' '.join(extra)}".strip()
    check(f"{name}: fails", p.returncode != 0, f"exit {p.returncode}", out)
    check(
        f"{name}: counterexample is {counterexample}",
        f"    {counterexample}\n" in out,
        "wrong or missing counterexample",
        out,
    )
    check(f"{name}: reported as {kind}", kind in out, f"no '{kind}' in output", out)
    if also is not None:
        check(f"{name}: output mentions {also}", also in out, f"no '{also}'", out)
    return d


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--compiler", default="build/bin/coil")
    args = parser.parse_args()
    compiler = str(Path(args.compiler).resolve())

    tmp = Path(tempfile.mkdtemp(prefix="coil-fuzz-gate-"))
    try:
        print("fuzz gate: planted bugs")
        d = expect_finding(compiler, tmp, "magic_ladder_regress.coil", 's = "FUZZ"', "FAILED while fuzzing")
        # the finding is a regression test from now on
        p = run(compiler, d, "test", "magic_ladder_regress.coil")
        check(
            "magic ladder: plain `coil test` replays the saved finding",
            p.returncode != 0
            and "(replaying the saved counterexample)" in p.stdout
            and '    s = "FUZZ"\n' in p.stdout,
            "saved counterexample not replayed",
            p.stdout,
        )

        expect_finding(compiler, tmp, "nesting_depth_regress.coil", 's = "[[[[["', "FAILED while fuzzing")
        expect_finding(
            compiler,
            tmp,
            "crash_regress.coil",
            's = "BOOM"',
            "CRASHED",
            also="the minimized input, run once more",
        )
        expect_finding(
            compiler,
            tmp,
            "hang_regress.coil",
            's = "LOP"',
            "TIMED OUT",
            "--input-timeout",
            "2",
            also="NEVER FINISHED on this input (watchdog fired after 2s)",
        )

        # several workers sharing one corpus find it too
        d = fixture_dir(tmp, "magic_ladder_regress.coil", "magic-jobs")
        p = run(compiler, d, "fuzz", "magic_ladder_regress.coil", "--jobs", "3", "--time", "120", "--status-every", "0")
        check(
            "magic ladder with --jobs 3",
            p.returncode != 0 and '    s = "FUZZ"\n' in p.stdout and "with 3 workers" in p.stdout,
            "not found by a 3-worker campaign",
            p.stdout,
        )

        print("fuzz gate: AddressSanitizer")
        d = fixture_dir(tmp, "asan_regress.coil", "asan-off")
        p = run(compiler, d, "fuzz", "asan_regress.coil", "--seed", "7", "-n", "200000", "--status-every", "0")
        check(
            "asan fixture passes WITHOUT the sanitizer (the read is harmless there)",
            p.returncode == 0,
            f"exit {p.returncode}",
            p.stdout,
        )
        expect_finding(
            compiler,
            tmp,
            "asan_regress.coil",
            's = "\\\\x"',
            "CRASHED",
            "--sanitize=address",
            also="heap-buffer-overflow",
        )

        print("fuzz gate: corpus lifecycle")
        d = fixture_dir(tmp, "corpus_regress.coil")
        prop_dir = d / ".coil" / "fuzz" / "jsonish-parses-or-errors"
        p = run(compiler, d, "fuzz", "corpus_regress.coil", "--seed", "3", "-n", "100000", "--status-every", "0")
        corpus = sorted((prop_dir / "corpus").glob("[0-9a-f]*"))
        check("passing campaign exits 0", p.returncode == 0, f"exit {p.returncode}", p.stdout)
        check("corpus is saved", len(corpus) > 10, f"{len(corpus)} entries", p.stdout)
        report = (prop_dir / "coverage.txt").read_text() if (prop_dir / "coverage.txt").exists() else ""
        check(
            "coverage report names the code under test",
            "coil.json.parse-value" in report and "functions entered:" in p.stdout,
            "coverage.txt missing or without coil.json",
            p.stdout + report,
        )
        edges1 = re.search(r"done .*?, (\d+) of \d+ edges", p.stdout)

        p = run(compiler, d, "fuzz", "corpus_regress.coil", "--seed", "4", "-n", "1", "--cases", "0", "--status-every", "0")
        edges2 = re.search(r"done .*?, (\d+) of \d+ edges", p.stdout)
        check(
            "a second campaign resumes from the corpus",
            edges1 is not None and edges2 is not None and int(edges2.group(1)) >= int(edges1.group(1)),
            f"edges {edges1 and edges1.group(1)} then {edges2 and edges2.group(1)}",
            p.stdout,
        )

        p = run(compiler, d, "fuzz", "corpus_regress.coil", "--minimize-corpus")
        m = re.search(r"minimized corpus: kept (\d+) of (\d+) entries \((\d+) edges\)", p.stdout)
        kept_all_edges = m is not None and edges2 is not None and int(m.group(3)) == int(edges2.group(1))
        check(
            "--minimize-corpus keeps every edge with no more entries",
            m is not None and 0 < int(m.group(1)) <= int(m.group(2)) and kept_all_edges,
            "unexpected minimization result",
            p.stdout,
        )
        left = len(list((prop_dir / "corpus").glob("[0-9a-f]*")))
        check(
            "minimization deletes what it did not keep",
            m is not None and left == int(m.group(1)),
            f"{left} files left",
            p.stdout,
        )

        print("fuzz gate: command line")
        p = run(compiler, d, "fuzz", "corpus_regress.coil", "--itrations", "5")
        check(
            "an unknown option is an error, not the default campaign",
            p.returncode == 2 and "unknown option --itrations" in p.stdout,
            f"exit {p.returncode}",
            p.stdout,
        )
    finally:
        shutil.rmtree(tmp, ignore_errors=True)

    print()
    if failures:
        print(f"fuzz gate: {len(failures)} check(s) failed")
        return 1
    print("fuzz gate: all checks passed")
    return 0


if __name__ == "__main__":
    sys.exit(main())

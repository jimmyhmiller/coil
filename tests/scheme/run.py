#!/usr/bin/env python3
"""Differential conformance harness for the Coil R5RS Scheme.

One `.scm` case is run under our implementation and under reference Schemes; the
stdout is normalized and compared. The point is not "does it crash" but "does it
agree with Chez, Guile and Chibi" — and, when those three disagree with each
other, to say so instead of blaming us.

    python3 tests/scheme/run.py --list
    python3 tests/scheme/run.py                       # oracles only (no compiler needed)
    python3 tests/scheme/run.py --impl build/examples/scheme
    python3 tests/scheme/run.py --bless               # freeze oracle output as expected/

Why freeze: CI should not need five Scheme implementations installed. The blessed
files are the agreed three-way answer; `--bless` re-derives them so drift stays
visible.
"""

from __future__ import annotations

import argparse
import re
import subprocess
import sys
from dataclasses import dataclass
from pathlib import Path

ROOT = Path(__file__).resolve().parent
CASES = ROOT / "cases"
EXPECTED = ROOT / "expected"

# Each oracle is (name, argv-prefix). The exact invocations matter and are not
# guessable: bare `chibi-scheme` and `chibi-scheme -r` both fail on a toplevel
# `define` assigned from inside a lambda ("undefined variable"), so the module
# form is the only one that behaves. Guile's auto-compiler chatters on stderr.
ORACLES: list[tuple[str, list[str]]] = [
    ("chez", ["scheme", "--script"]),
    ("guile", ["guile", "--no-auto-compile", "-s"]),
    # scheme.r5rs, not scheme.base: base is R7RS and lacks exact->inexact and
    # friends. Bare `chibi-scheme` and `-r` both mis-handle a toplevel define
    # assigned from inside a lambda, so the module form is the only correct one.
    ("chibi", ["chibi-scheme", "-mscheme.r5rs"]),
]

# Generous: the tail-call cases legitimately run 1e6 iterations under an
# interpreter, and a timeout here is indistinguishable from "no proper tail
# calls", so a too-tight bound reads as a conformance failure.
TIMEOUT = 120


@dataclass
class Run:
    ok: bool
    out: str
    note: str = ""


def normalize(text: str) -> str:
    """Erase the differences R5RS explicitly leaves to the implementation.

    Anything normalized here is a place where two conforming Schemes may legally
    disagree, so comparing it would generate false failures forever. See the
    divergence table in the scoping notes.
    """
    # The unspecified value has no mandated external representation.
    text = re.sub(r"#<unspecified>|#!unspecific|#<void>|#!default", "", text)
    # No mandated float printer: 1.0 / 1. / 1.000000 are all conforming.
    def fixup_float(m: re.Match[str]) -> str:
        return m.group(0).rstrip("0").rstrip(".") or "0"

    text = re.sub(r"\d+\.\d*", fixup_float, text)
    # #true/#false are R7RS spellings of #t/#f.
    text = text.replace("#true", "#t").replace("#false", "#f")
    # Procedures print with implementation-specific names/addresses.
    text = re.sub(r"#<[^>]*procedure[^>]*>", "#<procedure>", text)
    lines = [ln.rstrip() for ln in text.strip().splitlines()]
    return "\n".join(ln for ln in lines if ln)


def run_argv(argv: list[str]) -> Run:
    try:
        proc = subprocess.run(
            argv, capture_output=True, text=True, timeout=TIMEOUT
        )
    except subprocess.TimeoutExpired:
        # A timeout is a real signal here: the tail-call and call/cc cases hang
        # forever on an implementation that lacks them.
        return Run(False, "", f"timeout after {TIMEOUT}s")
    except FileNotFoundError:
        return Run(False, "", f"not installed: {argv[0]}")
    if proc.returncode != 0:
        # Error *messages* are never compared — only whether an error happened.
        return Run(False, normalize(proc.stdout), f"exit {proc.returncode}")
    return Run(True, normalize(proc.stdout))


def run_impl(impl: str, case: Path) -> Run:
    """Our implementation reads the program on stdin (see src/apps/mini-scheme)."""
    try:
        proc = subprocess.run(
            [impl], stdin=case.open("rb"), capture_output=True, text=True,
            timeout=TIMEOUT,
        )
    except subprocess.TimeoutExpired:
        return Run(False, "", f"timeout after {TIMEOUT}s")
    except FileNotFoundError:
        return Run(False, "", f"not built: {impl}")
    if proc.returncode != 0:
        return Run(False, normalize(proc.stdout), f"exit {proc.returncode}")
    return Run(True, normalize(proc.stdout))


def oracle_consensus(case: Path) -> tuple[str | None, dict[str, Run]]:
    """The answer all available oracles agree on, or None if they disagree.

    Disagreement is information, not an error: it means the case lands on a
    genuinely ambiguous corner of R5RS and should not gate our implementation.
    """
    results = {name: run_argv(argv + [str(case)]) for name, argv in ORACLES}
    good = {n: r for n, r in results.items() if r.ok}
    if not good:
        return None, results
    answers = {r.out for r in good.values()}
    return (good[next(iter(good))].out if len(answers) == 1 else None), results


def cases() -> list[Path]:
    return sorted(CASES.glob("*.scm"))


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__,
                                 formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--impl", help="path to our compiled scheme binary")
    ap.add_argument("--bless", action="store_true",
                    help="write the oracle consensus into expected/")
    ap.add_argument("--list", action="store_true", help="list cases and exit")
    ap.add_argument("--filter", default="", help="substring match on case name")
    ap.add_argument("--why", action="store_true",
                    help="for ambiguous cases, print where the oracles disagree")
    args = ap.parse_args()

    selected = [c for c in cases() if args.filter in c.name]
    if args.list:
        for c in selected:
            print(c.name)
        return 0
    if not selected:
        print("no cases found under tests/scheme/cases/", file=sys.stderr)
        return 1

    failures, ambiguous, blessed = [], [], 0
    for case in selected:
        consensus, results = oracle_consensus(case)
        if consensus is None:
            detail = " ".join(
                f"{n}={'ERR:' + r.note if not r.ok else 'ok'}" for n, r in results.items()
            )
            ambiguous.append((case.name, detail))
            print(f"AMBIG {case.name}  ({detail})")
            if args.why:
                # Show WHERE the oracles part company. An "all ok" ambiguity means
                # they ran fine but printed different things — usually a genuine
                # spec-ambiguous corner, occasionally a bug in the case itself.
                ok = {n: r.out for n, r in results.items() if r.ok}
                if len(ok) > 1:
                    base_name, base = next(iter(ok.items()))
                    for other, out in list(ok.items())[1:]:
                        bl, ol = base.split("\n"), out.split("\n")
                        for i in range(max(len(bl), len(ol))):
                            x = bl[i] if i < len(bl) else "<missing>"
                            y = ol[i] if i < len(ol) else "<missing>"
                            if x != y:
                                print(f"      line {i+1}: {base_name}={x!r}  {other}={y!r}")
            continue

        if args.bless:
            EXPECTED.mkdir(exist_ok=True)
            (EXPECTED / (case.stem + ".txt")).write_text(consensus + "\n")
            blessed += 1
            print(f"BLESS {case.name}")
            continue

        if not args.impl:
            print(f"ORACLE-OK {case.name}")
            continue

        got = run_impl(args.impl, case)
        if got.ok and got.out == consensus:
            print(f"PASS  {case.name}")
        else:
            failures.append((case.name, consensus, got))
            print(f"FAIL  {case.name}  {got.note}")

    print()
    if args.bless:
        print(f"blessed {blessed} case(s); {len(ambiguous)} ambiguous (not blessed)")
        return 0
    for name, want, got in failures:
        print(f"--- {name}\nexpected:\n{want}\ngot:\n{got.out}\n")
    print(f"{len(selected) - len(failures) - len(ambiguous)} passed, "
          f"{len(failures)} failed, {len(ambiguous)} ambiguous")
    return 1 if failures else 0


if __name__ == "__main__":
    raise SystemExit(main())

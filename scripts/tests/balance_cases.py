#!/usr/bin/env python3
"""Fixture gate for `coil balance`.

The fuzz harness (`balance_fuzz.py`) measures aggregate behaviour over random damage.
This pins the specific decisions — above all the REFUSALS, which have no natural
regression signal: a refusal quietly turning into a repair looks like an improvement
in every summary statistic while being exactly the failure the design rejects.

Each case declares its outcome. `repair` cases are checked against a `.expected` file
holding the exact bytes; `clean` and `refuse` cases are checked on exit code, and
`refuse` additionally on a phrase from the diagnostic, so a refusal that stops
explaining itself fails too.

    scripts/tests/balance_cases.py                       # uses `coil balance`
    scripts/tests/balance_cases.py --balance ./balance   # or a standalone build
    scripts/tests/balance_cases.py --bless               # rewrite the .expected files
"""

from __future__ import annotations

import argparse
import pathlib
import shutil
import subprocess
import sys
import tempfile
import time

REPO = pathlib.Path(__file__).resolve().parents[2]
CASES = REPO / "tests/balance/cases"
REPRO = REPO / "tests/repro/paredit-balance-coil"

# case name -> (outcome, phrase the diagnostic must contain, extra flags)
#
# Balance is deliberately structural. A damaged program's unrelated resolver or type
# errors never veto a plausible delimiter repair.
EXPECTED = {
    # Parens inside strings, comments and character literals are text. Miscounting
    # any of them would put every other case's depth arithmetic on sand.
    "lexical-noise": ("clean", None, []),
    # The only surplus closer with a single reading from indentation alone.
    "stray-close-column0": ("repair", None, []),
    # A surplus closer with more than one reading. Indentation must decline it...
    "stray-close-inline": ("refuse", "indistinguishable", []),
    # Neither can help here: both readings would be well-typed if they compiled, and
    # the typo could be the opener or the closer.
    "mismatched-bracket": ("refuse", "does not match", []),
    # Two damaged forms; the balanced form between them must survive untouched.
    "two-damaged-forms": ("repair", None, []),
    # Indentation identifies a plausible boundary; semantic validity is not part of
    # delimiter repair and is handled by `coil check` afterwards.
    "typed-inline": ("repair", None, []),
    "typed-inline-ambiguous": ("repair", None, []),
}


def check_remaining_type_error_is_separate(cmd: list[str]) -> bool:
    """A semantic error is irrelevant to a structural repair."""
    src = CASES / "repair-with-type-error.coil"
    expected = CASES / "repair-with-type-error.expected"
    with tempfile.NamedTemporaryFile(prefix="coil-balance-type-error-", suffix=".coil", dir="/tmp") as f:
        target = pathlib.Path(f.name)
        shutil.copyfile(src, target)
        p = subprocess.run(cmd + ["--write", str(target)], capture_output=True, timeout=120)
        if p.returncode != 0:
            print(f"FAIL repair-with-type-error: expected repair exit 0, got {p.returncode}")
            return False
        if target.read_bytes() != expected.read_bytes():
            print("FAIL repair-with-type-error: semantic error vetoed or changed the structural repair")
            return False
    return True


def check_large_layout_is_linear(cmd: list[str]) -> bool:
    """A large mismatch must be handled by layout, never whole-file edit search."""
    original = (REPO / "src/compiler/driver.coil").read_bytes()
    damaged = original.replace(b"]", b")", 1)
    with tempfile.NamedTemporaryFile(prefix="coil-balance-large-", suffix=".coil", dir="/tmp") as f:
        f.write(damaged)
        f.flush()
        started = time.monotonic()
        try:
            subprocess.run(cmd + ["--write", f.name], capture_output=True, timeout=3)
        except subprocess.TimeoutExpired:
            print("FAIL large-layout: balance searched a large file instead of resolving/refusing from indentation")
            return False
        elapsed = time.monotonic() - started
        if elapsed >= 2.5:
            print(f"FAIL large-layout: took {elapsed:.1f}s; expected a single linear layout pass")
            return False
    return True


def balance_cmd(binary: str) -> list[str]:
    """A compiler needs the `balance` subcommand; the standalone CLI is the command.

    Keyed off the name so `--balance build/bin/coil-candidate` works — passing a path
    used to silently run the compiler with a source file and read its usage text as
    the repair, which fails in a way that blames the fixtures.
    """
    return [binary, "balance"] if pathlib.Path(binary).name.startswith("coil") else [binary]


def run(cmd: list[str], path: pathlib.Path) -> tuple[int, bytes, bytes]:
    p = subprocess.run(cmd + [str(path)], capture_output=True, timeout=120)
    return p.returncode, p.stdout, p.stderr


def check(cmd: list[str], name: str, outcome: str, phrase: str | None, bless: bool) -> bool:
    # `foo+check` reuses foo.coil under different flags; its expectation file is
    # separate so the two modes can differ.
    stem = name.split("+")[0]
    src = CASES / f"{stem}.coil"
    code, out, err = run(cmd, src)

    if outcome == "refuse":
        if code != 2:
            print(f"FAIL {name}: expected a refusal (exit 2), got exit {code}")
            return False
        if phrase and phrase.encode() not in err:
            print(f"FAIL {name}: refusal no longer explains itself; want {phrase!r}, got:\n{err.decode()}")
            return False
        return True

    if code != 0:
        print(f"FAIL {name}: exit {code}\n{err.decode()}")
        return False

    if outcome == "clean":
        if out != src.read_bytes():
            print(f"FAIL {name}: a balanced file was modified")
            return False
        return True

    want_path = CASES / f"{name}.expected"  # keyed by CASE name, so +check has its own
    if bless:
        want_path.write_bytes(out)
        print(f"blessed {name}")
        return True
    if not want_path.exists():
        print(f"FAIL {name}: no {want_path.name}; run with --bless once the output is reviewed")
        return False
    want = want_path.read_bytes()
    if out != want:
        print(f"FAIL {name}: repair differs from {want_path.name}")
        import difflib

        sys.stdout.writelines(
            difflib.unified_diff(
                want.decode().splitlines(True), out.decode().splitlines(True), "expected", "actual", n=2
            )
        )
        return False

    # A repair must only ADD closers or REMOVE a stray one — never move a byte. With
    # the delimiters stripped out, the file has to be untouched.
    if strip_delims(out) != strip_delims(src.read_bytes()):
        print(f"FAIL {name}: repair changed something other than delimiters")
        return False
    return True


def strip_delims(b: bytes) -> bytes:
    return bytes(c for c in b if c not in b"()[]")


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--balance", default="coil")
    ap.add_argument("--bless", action="store_true")
    args = ap.parse_args()
    cmd = balance_cmd(args.balance)

    ok = True
    for name, (outcome, phrase, flags) in sorted(EXPECTED.items()):
        if not check(cmd + flags, name, outcome, phrase, args.bless):
            ok = False
        else:
            print(f"  ok   — {name} ({outcome})")

    if check_remaining_type_error_is_separate(cmd):
        print("  ok   — structural repair ignores an unrelated type error")
    else:
        ok = False

    if check_large_layout_is_linear(cmd):
        print("  ok   — large-file layout repair/refusal is linear")
    else:
        ok = False

    # The regression that started all this: repairing one form must not move a single
    # delimiter in the balanced form that follows it.
    code, out, _ = run(cmd, REPRO / "input.coil")
    if code != 0 or out != (REPRO / "expected.coil").read_bytes():
        print("FAIL paredit-balance-coil repro: output is not expected.coil")
        ok = False
    else:
        print("  ok   — paredit-balance-coil repro (the following form is untouched)")

    print("gate-balance: " + ("PASS" if ok else "FAIL"))
    return 0 if ok else 1


if __name__ == "__main__":
    sys.exit(main())

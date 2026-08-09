#!/usr/bin/env python3
"""Behaviour gate for `coil edit`.

`edit_roundtrip.py` proves addressing and splicing are exact over thousands of real
forms. This pins the DECISIONS around them — the refusals and the listings — which
have no natural regression signal: a rejection quietly becoming an edit, or a helpful
listing degrading to a bare "not found", passes every other check while removing the
reason to use a form-addressed tool at all.

    scripts/tests/edit_cases.py --edit ./cedit
"""

from __future__ import annotations

import argparse
import pathlib
import shutil
import subprocess
import sys
import tempfile

REPO = pathlib.Path(__file__).resolve().parents[2]

FIXTURE = b"""(module edit-fixture)

(defn alpha [] (-> i64) 1)

(defn beta [(x i64)] (-> i64)
  (+ x 1))

(impl Show Point
  (show [(p Point)] (-> i64) 7))
"""


def edit_cmd(binary: str) -> list[str]:
    return [binary, "edit"] if pathlib.Path(binary).name.startswith("coil") else [binary]


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--edit", default="coil")
    args = ap.parse_args()
    base = edit_cmd(args.edit)
    ok = True

    with tempfile.TemporaryDirectory() as td:
        f = pathlib.Path(td) / "edit_fixture.coil"

        def run(argv: list[str], stdin: bytes = b"") -> tuple[int, str, str]:
            f.write_bytes(FIXTURE)
            p = subprocess.run(base + [str(f)] + argv, input=stdin, capture_output=True, timeout=60)
            return p.returncode, p.stdout.decode(), p.stderr.decode()

        def case(name: str, argv: list[str], stdin: bytes, want_code: int, want_in: str, stream: str = "err"):
            nonlocal ok
            code, out, err = run(argv, stdin)
            got = err if stream == "err" else out
            if code != want_code or want_in not in got:
                print(f"FAIL {name}: exit {code} (want {want_code}); looked for {want_in!r} in {stream}:\n{got[:400]}")
                ok = False
            else:
                print(f"  ok   — {name}")

        # An unbalanced replacement is the whole reason this command exists: it must be
        # refused BEFORE anything is written, so a bad edit cannot create a broken file.
        case(
            "unbalanced replacement is rejected",
            ["--form", "defn alpha", "--replace", "--write"],
            b"(defn alpha [] (-> i64) 2",
            2,
            "do not balance",
        )
        # ...and the file must be untouched afterwards.
        f.write_bytes(FIXTURE)
        subprocess.run(
            base + [str(f), "--form", "defn alpha", "--replace", "--write"],
            input=b"(defn alpha [] (-> i64) 2",
            capture_output=True,
        )
        if f.read_bytes() != FIXTURE:
            print("FAIL rejected replacement still wrote to the file")
            ok = False
        else:
            print("  ok   — a rejected replacement writes nothing")

        case("empty replacement is rejected", ["--form", "defn alpha", "--replace"], b"   \n", 2, "empty")
        case("a miss lists what exists", ["--form", "defn nope", "--show"], b"", 1, "defn beta")
        case("a prefix address reports every match", ["--form", "defn", "--show"], b"", 1, "matches 2")
        case(
            "a nested insert is refused with the alternative",
            ["--in", "impl Show Point", "--form", "show", "--insert-after"],
            b"(other [] (-> i64) 1)",
            2,
            "top-level",
        )
        case("--list needs no address", ["--list"], b"", 0, "impl Show", stream="out")
        case("--show reaches a nested member", ["--in", "impl Show Point", "--form", "show", "--show"], b"", 0, "(show ", stream="out")

        # Deleting takes the form's line with it rather than leaving a blank gap.
        code, out, err = run(["--form", "defn alpha", "--delete"])
        if code != 0 or "alpha" in out or "\n\n\n" in out:
            print(f"FAIL delete left a gap or failed (exit {code}):\n{out}")
            ok = False
        else:
            print("  ok   — delete removes the form and its line")

        # A valid replacement lands at the form's own indentation.
        code, out, err = run(["--form", "defn beta", "--replace"], b"(defn beta [(x i64)] (-> i64)\n  (+ x 2))")
        if code != 0 or "(+ x 2)" not in out or "(defn alpha [] (-> i64) 1)" not in out:
            print(f"FAIL replace (exit {code}):\n{out}")
            ok = False
        else:
            print("  ok   — replace swaps one form and leaves its neighbours alone")

    print("gate-edit: " + ("PASS" if ok else "FAIL"))
    return 0 if ok else 1


if __name__ == "__main__":
    sys.exit(main())

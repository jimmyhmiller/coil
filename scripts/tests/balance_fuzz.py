#!/usr/bin/env python3
"""Mutation harness for `coil balance`.

Fixtures prove a repair tool handles the cases someone thought of. This proves it
handles the ones nobody did, by taking source that is known-good — every `.coil`
file in the tree already reads — damaging exactly one delimiter, and asking whether
the tool puts it back.

Because the pre-damage source is the ground truth, "correct" is not a judgement
call: the repaired bytes either equal the original or they do not. Each mutant lands
in one of four buckets, and only the last two matter:

    restored   output is the original, byte for byte
    refused    the tool declined; the file is untouched and a human is told where
    diverged   output is balanced but is NOT the original — the tool silently chose
               a different structure, which is the failure that costs hours
    broken     output does not even balance — the tool made things worse

`diverged` is not automatically a bug: a delimiter can genuinely be missing from two
places that both read. But it is where the interesting disagreements live, so every
one is dumped with `--show`.

The oracle for "is this balanced" is a second, independent tokenizer written here in
Python. That is deliberate — if it and the Coil scanner ever disagree about where a
delimiter is, `--self-check` fails loudly rather than both being quietly wrong
together.

    scripts/tests/balance_fuzz.py --balance ./balance
    scripts/tests/balance_fuzz.py --balance ./balance --compare paredit-like
    scripts/tests/balance_fuzz.py --balance ./balance --show diverged
"""

from __future__ import annotations

import argparse
import pathlib
import random
import subprocess
import sys
import tempfile

REPO = pathlib.Path(__file__).resolve().parents[2]

OPEN = b"(["
CLOSE = b")]"
DELIMS = OPEN + CLOSE
# Bytes that end an atom run. Must agree with `atom-end?` in balance.coil and with
# `is-atom-delim` in cst.coil; the whole point of a second implementation is that a
# disagreement shows up as a --self-check failure instead of a silent miscount.
ATOM_END = set(b" \t\n\r\v\f()[];\"'`~")


def scan_delims(src: bytes) -> list[int]:
    """Byte offsets of every ()[] that is real structure.

    Skips string literals (including c"..."), line comments, and character literals,
    since a paren inside any of those is text rather than nesting.
    """
    out: list[int] = []
    i, n = 0, len(src)
    while i < n:
        c = src[i : i + 1]
        if c in b" \t\n\r\v\f":
            i += 1
        elif c == b";":
            while i < n and src[i : i + 1] != b"\n":
                i += 1
        elif c == b'"':
            i += 1
            while i < n:
                if src[i : i + 1] == b"\\":
                    i += 2
                elif src[i : i + 1] == b'"':
                    i += 1
                    break
                else:
                    i += 1
        elif c == b"\\":
            # a character literal: backslash, one char, plus a name run when that
            # char is a letter (\newline, \space, ...). Keeps `\(` out of the count.
            i += 1
            if i < n:
                first = src[i : i + 1]
                i += 1
                if first.isalpha():
                    while i < n and src[i : i + 1].isalnum():
                        i += 1
        elif c in DELIMS:
            out.append(i)
            i += 1
        elif c in b"'`~":
            i += 1
        else:
            start = i
            while i < n and src[i] not in ATOM_END:
                i += 1
            if i - start == 1 and src[start : start + 1] == b"c" and src[i : i + 1] == b'"':
                i += 1  # c"..." — fall into the string body
                while i < n:
                    if src[i : i + 1] == b"\\":
                        i += 2
                    elif src[i : i + 1] == b'"':
                        i += 1
                        break
                    else:
                        i += 1
    return out


def balanced(src: bytes) -> bool:
    """True when every code delimiter pairs up, with matching kinds."""
    stack: list[int] = []
    for off in scan_delims(src):
        c = src[off]
        if c in OPEN:
            stack.append(c)
        else:
            if not stack:
                return False
            want = ord(")") if stack[-1] == ord("(") else ord("]")
            if c != want:
                return False
            stack.pop()
    return not stack


def mutants(src: bytes, offsets: list[int], per_file: int, rng: random.Random, only: str | None = None):
    """One-delimiter damage: drop a delimiter, or duplicate a closing one.

    Dropping an opener leaves a stray closer; dropping a closer leaves a form short.
    Duplicating a closer is the other half of the stray case, and is the shape an LLM
    string-patch most often produces.
    """
    cands = [("delete-open" if src[off] in OPEN else "delete-close", off) for off in offsets]
    cands += [("dup", off) for off in offsets if src[off] in CLOSE]
    if only:
        cands = [c for c in cands if c[0] == only]
    if len(cands) > per_file:
        cands = rng.sample(cands, per_file)
    for kind, off in sorted(cands, key=lambda p: p[1]):
        if kind == "dup":
            yield kind, off, src[: off + 1] + src[off : off + 1] + src[off + 1 :]
        else:
            yield kind, off, src[:off] + src[off + 1 :]


def run_tool(cmd: list[str], path: pathlib.Path) -> tuple[int, bytes, bytes]:
    proc = subprocess.run(cmd + [str(path)], capture_output=True, timeout=60)
    return proc.returncode, proc.stdout, proc.stderr


def classify(original: bytes, code: int, out: bytes) -> str:
    if code != 0 or not out:
        return "refused"
    if out == original:
        return "restored"
    return "diverged" if balanced(out) else "broken"


def corpus(paths: list[str]) -> list[pathlib.Path]:
    if paths:
        return [pathlib.Path(p) for p in paths]
    picks: list[pathlib.Path] = []
    for sub in ("src/stdlib", "src/examples", "src/compiler", "src/apps", "tests"):
        picks += sorted((REPO / sub).rglob("*.coil"))
    return picks


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--balance", default="coil", help="balance binary (or `coil`, which uses `coil balance`)")
    ap.add_argument("--compare", help="a second tool to score the same mutants, e.g. paredit-like")
    ap.add_argument(
        "--flag",
        action="append",
        default=[],
        help="extra flag for the balance tool (repeatable), e.g. --flag --no-typecheck",
    )
    ap.add_argument("--per-file", type=int, default=40, help="max mutants per file (default 40)")
    ap.add_argument("--files", type=int, default=60, help="max source files (default 60)")
    ap.add_argument("--seed", type=int, default=1, help="sampling seed")
    ap.add_argument("--show", choices=("diverged", "broken", "refused"), help="dump every mutant in this bucket")
    ap.add_argument(
        "--kind",
        choices=("delete-open", "delete-close", "dup"),
        help="only this damage shape; the three have very different repair signals",
    )
    ap.add_argument("--self-check", action="store_true", help="only verify the two tokenizers agree")
    ap.add_argument("paths", nargs="*")
    args = ap.parse_args()

    rng = random.Random(args.seed)
    files = [p for p in corpus(args.paths) if p.is_file()]
    rng.shuffle(files)
    files = sorted(files[: args.files])

    # A compiler needs the `balance` subcommand; the standalone CLI is the command.
    balance_cmd = (
        [args.balance, "balance"]
        if pathlib.Path(args.balance).name.startswith("coil")
        else [args.balance]
    )

    # The Coil scanner and the Python one must agree about every delimiter in the
    # corpus before any mutation result means anything.
    # `--dump-delims` is a debug flag on the standalone CLI, not a `coil` subcommand
    # flag: a compiler answers this with a usage message, and every file would then
    # "disagree" for a reason that has nothing to do with the scanners.
    if args.self_check and len(balance_cmd) > 1:
        print("--self-check needs the standalone balance CLI (it uses --dump-delims), not `coil balance`")
        return 2

    if args.self_check:
        bad = 0
        for path in files:
            src = path.read_bytes()
            proc = subprocess.run(
                balance_cmd + ["--dump-delims", str(path)], capture_output=True, timeout=60
            )
            theirs = [int(x) for x in proc.stdout.split()]
            ours = scan_delims(src)
            if theirs != ours:
                bad += 1
                only_theirs = sorted(set(theirs) - set(ours))[:5]
                only_ours = sorted(set(ours) - set(theirs))[:5]
                print(f"MISMATCH {path.relative_to(REPO)}: coil-only={only_theirs} python-only={only_ours}")
        print(f"\nself-check: {len(files) - bad}/{len(files)} files agree")
        return 1 if bad else 0

    tools = {"balance": balance_cmd + args.flag}
    if args.compare:
        tools[args.compare] = [args.compare, "balance"]

    tally = {name: {"restored": 0, "refused": 0, "diverged": 0, "broken": 0} for name in tools}
    noted = {"diverged": {True: 0, False: 0}, "restored": {True: 0, False: 0}}
    shown = 0
    total = 0

    with tempfile.TemporaryDirectory() as td:
        scratch = pathlib.Path(td) / "mutant.coil"
        for path in files:
            src = path.read_bytes()
            if not balanced(src):
                continue  # a file that is already unbalanced has no ground truth
            offsets = scan_delims(src)
            if not offsets:
                continue
            for kind, off, mutated in mutants(src, offsets, args.per_file, rng, args.kind):
                scratch.write_bytes(mutated)
                total += 1
                for name, cmd in tools.items():
                    try:
                        code, out, err = run_tool(cmd, scratch)
                    except subprocess.TimeoutExpired:
                        code, out, err = 1, b"", b""
                    verdict = classify(src, code, out)
                    tally[name][verdict] += 1
                    # Does the tool's own "I guessed here" note actually cover the
                    # repairs that came out wrong? A warning nobody can rely on is
                    # worse than none, so this is measured rather than assumed.
                    if name == "balance" and verdict in ("diverged", "restored"):
                        noted[verdict][b"note:" in err] += 1
                    if name == "balance" and verdict == args.show and shown < 20:
                        shown += 1
                        line = src[:off].count(b"\n") + 1
                        print(f"--- {verdict}: {path.relative_to(REPO)} {kind}@{off} (line {line})")
                        if verdict != "refused":
                            print(_diff(src, out))

    print(f"\n{total} mutants over {len(files)} files\n")
    width = max(len(n) for n in tally)
    print(f"{'tool':<{width}}  {'restored':>9} {'refused':>8} {'diverged':>9} {'broken':>7}")
    for name, t in tally.items():
        print(
            f"{name:<{width}}  {t['restored']:>9} {t['refused']:>8} {t['diverged']:>9} {t['broken']:>7}"
        )
    print("\nrestored+refused is the safe fraction; broken must be 0.")
    for name, t in tally.items():
        safe = t["restored"] + t["refused"]
        print(f"  {name}: safe {safe}/{total} ({100.0 * safe / max(total, 1):.1f}%)")

    # A repair that came out wrong without a note is one the user has no reason to
    # doubt — that count is the one that decides whether the note is worth printing.
    d, r = noted["diverged"], noted["restored"]
    covered = 100.0 * d[True] / max(d[True] + d[False], 1)
    print(
        f"\nguess-note coverage: {d[True]}/{d[True] + d[False]} diverged repairs carried a note ({covered:.0f}%);"
        f" {r[True]}/{r[True] + r[False]} correct repairs also carried one (false alarms)"
    )

    return 1 if tally["balance"]["broken"] else 0


def _diff(want: bytes, got: bytes) -> str:
    import difflib

    return "".join(
        difflib.unified_diff(
            want.decode("utf-8", "replace").splitlines(True),
            got.decode("utf-8", "replace").splitlines(True),
            "original",
            "balanced",
            n=1,
        )
    )


if __name__ == "__main__":
    sys.exit(main())

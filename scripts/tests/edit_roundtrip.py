#!/usr/bin/env python3
"""Identity round-trip for `coil edit`.

For every addressable form in every file: `--show` it, then `--replace` it with the
bytes that came back. The file must be identical afterwards.

That single property exercises the parts that would otherwise need trusting — that an
address resolves to the form the caller meant, that the form's byte span starts and
ends exactly where the form does, and that the splice puts it back without disturbing
a neighbour. A span off by one byte, a prefix glyph left outside the node, a comment
swallowed at either end: all of them show up here as a diff, on real source rather
than on fixtures written by the same person who wrote the bug.

    scripts/tests/edit_roundtrip.py --edit ./cedit
    scripts/tests/edit_roundtrip.py --edit ./cedit --files 200
"""

from __future__ import annotations

import argparse
import pathlib
import shutil
import subprocess
import sys
import tempfile

REPO = pathlib.Path(__file__).resolve().parents[2]


def edit_cmd(binary: str) -> list[str]:
    return [binary, "edit"] if pathlib.Path(binary).name.startswith("coil") else [binary]


def run(cmd: list[str], stdin: bytes = b"") -> tuple[int, bytes, bytes]:
    p = subprocess.run(cmd, input=stdin, capture_output=True, timeout=120)
    return p.returncode, p.stdout, p.stderr


def corpus(paths: list[str], limit: int) -> list[pathlib.Path]:
    if paths:
        return [pathlib.Path(p) for p in paths]
    found: list[pathlib.Path] = []
    for sub in ("src/stdlib", "src/examples", "src/compiler", "tests"):
        found += sorted((REPO / sub).rglob("*.coil"))
    return found[:limit]


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--edit", default="coil")
    ap.add_argument("--files", type=int, default=80)
    ap.add_argument("--verbose", action="store_true")
    ap.add_argument("paths", nargs="*")
    args = ap.parse_args()
    cmd = edit_cmd(args.edit)

    files = [p for p in corpus(args.paths, args.files) if p.is_file()]
    forms = failures = skipped = 0

    with tempfile.TemporaryDirectory() as td:
        work = pathlib.Path(td) / "work.coil"
        for path in files:
            original = path.read_bytes()
            shutil.copy(path, work)

            code, listing, err = run(cmd + [str(work), "--list"])
            if code != 0:
                skipped += 1
                if args.verbose:
                    print(f"skip {path.relative_to(REPO)}: {err.decode().strip()[:100]}")
                continue

            for line in listing.decode("utf-8", "replace").splitlines():
                addr = line.strip()
                if not addr:
                    continue
                code, shown, err = run(cmd + [str(work), "--form", addr, "--show"])
                if code != 0:
                    # An ambiguous address is a legitimate answer, not a failure: two
                    # forms can share a `kind name` prefix (several `impl`s on a type).
                    if b"matches" in err:
                        continue
                    failures += 1
                    print(f"FAIL show {path.relative_to(REPO)} :: {addr}\n  {err.decode().strip()[:200]}")
                    continue

                forms += 1
                code, _, err = run(cmd + [str(work), "--form", addr, "--replace", "--write"], stdin=shown)
                if code != 0:
                    failures += 1
                    print(f"FAIL replace {path.relative_to(REPO)} :: {addr}\n  {err.decode().strip()[:200]}")
                    continue

                after = work.read_bytes()
                if after != original:
                    failures += 1
                    print(f"FAIL roundtrip {path.relative_to(REPO)} :: {addr}")
                    import difflib

                    sys.stdout.writelines(
                        list(
                            difflib.unified_diff(
                                original.decode("utf-8", "replace").splitlines(True),
                                after.decode("utf-8", "replace").splitlines(True),
                                "before",
                                "after",
                                n=1,
                            )
                        )[:20]
                    )
                    work.write_bytes(original)  # keep going from a known state

    print(f"\n{forms} forms round-tripped over {len(files) - skipped} files ({skipped} skipped)")
    print("gate-edit-roundtrip: " + ("PASS" if not failures else f"FAIL ({failures})"))
    return 1 if failures else 0


if __name__ == "__main__":
    sys.exit(main())

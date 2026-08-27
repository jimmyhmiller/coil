#!/usr/bin/env python3
"""Reject ownership ceremony in transparent-ARC source fixtures."""

from pathlib import Path
import re


ROOT = Path(__file__).resolve().parents[3]
FIXTURES = sorted((ROOT / "tests/compiler/features").glob("transparent_arc_*.coil"))
FORBIDDEN = re.compile(
    r"\b(?:Arc|Rc|Clone|Drop|defmanaged|managed-new|managed-scope|AllocatorLease)\b"
    r"|\((?:clone|forget|manually-drop)\b"
)


def main() -> int:
    failed = False
    for fixture in FIXTURES:
        for line_no, line in enumerate(fixture.read_text().splitlines(), 1):
            if line.lstrip().startswith(";"):
                continue
            match = FORBIDDEN.search(line)
            if match:
                print(f"{fixture.relative_to(ROOT)}:{line_no}: forbidden transparent-ARC spelling: {match.group(0)}")
                failed = True
    if not FIXTURES:
        print("no transparent ARC fixtures found")
        return 1
    if failed:
        return 1
    print(f"transparent ARC source guard: {len(FIXTURES)} fixtures clean")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

#!/usr/bin/env python3
"""Keep expansion-only gensym spellings out of maintained compiler source."""

from __future__ import annotations

import pathlib
import re


ROOT = pathlib.Path(__file__).resolve().parents[3]
COMPILER = ROOT / "src/compiler"
GENSYM = re.compile(r"\$g[0-9]")


def main() -> int:
    failures: list[str] = []
    checked = 0
    for path in sorted(COMPILER.glob("*.coil")):
        checked += 1
        for line_no, line in enumerate(path.read_text().splitlines(), 1):
            if GENSYM.search(line):
                failures.append(f"{path.relative_to(ROOT)}:{line_no}: {line.strip()}")
    if failures:
        print("authored compiler source contains hygienic gensym spellings:")
        print("\n".join(failures))
        return 1
    print(f"authored gensym source guard: {checked} compiler files clean")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

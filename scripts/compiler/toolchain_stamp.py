#!/usr/bin/env python3
"""The identity of the library sources a compiler was built from.

A compiler and its library are one toolchain: the binary reads <prefix>/lib/coil
at run time, and a library newer or older than the binary it sits beside fails in
ways that look like compiler bugs. A build records the digest of the sources it
started from in `<binary>.toolchain`; `dev.py install` refuses to pair the binary
with any other sources.

    toolchain_stamp.py digest          # print the digest of this checkout
    toolchain_stamp.py write STAMP     # write it to STAMP
"""
import hashlib
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
TREES = ("src/stdlib", "src/compiler")


def digest(root: Path = ROOT) -> str:
    h = hashlib.sha256()
    for tree in TREES:
        base = root / tree
        for path in sorted(p for p in base.rglob("*") if p.is_file()):
            rel = path.relative_to(root).as_posix()
            h.update(rel.encode() + b"\0")
            h.update(hashlib.sha256(path.read_bytes()).digest())
    return h.hexdigest()


def stamp_path(binary: Path) -> Path:
    return binary.with_name(binary.name + ".toolchain")


def main() -> int:
    if len(sys.argv) == 2 and sys.argv[1] == "digest":
        print(digest())
        return 0
    if len(sys.argv) == 3 and sys.argv[1] == "write":
        Path(sys.argv[2]).write_text(digest() + "\n")
        return 0
    print(__doc__, file=sys.stderr)
    return 2


if __name__ == "__main__":
    sys.exit(main())

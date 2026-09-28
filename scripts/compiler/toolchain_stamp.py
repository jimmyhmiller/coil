#!/usr/bin/env python3
"""The identity of the library sources a compiler was built from.

A compiler and its library are one toolchain: the binary reads <prefix>/lib/coil
at run time, and a library newer or older than the binary it sits beside fails in
ways that look like compiler bugs. A build records the digest of the sources it
started from in `<binary>.toolchain`; `dev.py install` refuses to pair the binary
with any other sources.

The stamp's first line is that digest. The lines after it record provenance for
`coil --version` and the install downgrade check: `commit <sha>`, `date <ISO-8601
committer date>`, and `dirty` when the stamped trees had uncommitted changes.

    toolchain_stamp.py digest          # print the digest of this checkout
    toolchain_stamp.py stamp           # print the whole stamp (digest + provenance)
    toolchain_stamp.py write STAMP     # write the whole stamp to STAMP
"""
import hashlib
import subprocess
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


def _git(root: Path, *args: str) -> str | None:
    try:
        return subprocess.run(["git", "-C", str(root), *args], capture_output=True,
                              text=True, check=True).stdout.strip()
    except (OSError, subprocess.CalledProcessError):
        return None


def stamp_text(root: Path = ROOT) -> str:
    lines = [digest(root)]
    commit = _git(root, "rev-parse", "HEAD")
    if commit:
        lines.append(f"commit {commit}")
        date = _git(root, "show", "-s", "--format=%cI", "HEAD")
        if date:
            lines.append(f"date {date}")
        if _git(root, "status", "--porcelain", "--", *TREES):
            lines.append("dirty")
    return "\n".join(lines) + "\n"


def stamp_digest(text: str) -> str:
    """The library digest a stamp records: its first line."""
    return text.splitlines()[0].strip() if text.strip() else ""


def stamp_commit(text: str) -> str | None:
    for line in text.splitlines()[1:]:
        if line.startswith("commit "):
            return line.split(" ", 1)[1].strip()
    return None


def stamp_path(binary: Path) -> Path:
    return binary.with_name(binary.name + ".toolchain")


def main() -> int:
    if len(sys.argv) == 2 and sys.argv[1] == "digest":
        print(digest())
        return 0
    if len(sys.argv) == 2 and sys.argv[1] == "stamp":
        sys.stdout.write(stamp_text())
        return 0
    if len(sys.argv) == 3 and sys.argv[1] == "write":
        Path(sys.argv[2]).write_text(stamp_text())
        return 0
    print(__doc__, file=sys.stderr)
    return 2


if __name__ == "__main__":
    sys.exit(main())

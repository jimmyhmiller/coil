#!/usr/bin/env python3
"""Promote `;;` doc comments to `;;;` across every Coil project.

WHY THIS IS SAFE TO DO INCREMENTALLY
------------------------------------
The shipping recognizer (`ct-doc-line-body`, src/compiler/comptime.coil) requires
two semicolons and then SKIPS the rest of the run, so `;;;` is already a valid doc
comment today.  Migrating a tree therefore changes nothing about how the current
compiler reads it.  Only the final recognizer flip -- requiring three semicolons --
makes `;;` stop being documentation.

    ;;  corpus + old binary  ->  docs        ;;; corpus + old binary  ->  docs
    ;;  corpus + NEW binary  ->  DOCS LOST   ;;; corpus + NEW binary  ->  docs

So: migrate every tree first, in any order, over any timespan; flip the recognizer
last.  There is no coordination window and no half-broken state.

WHAT COUNTS AS A DOC
--------------------
This mirrors `ct-doc-at` exactly: the contiguous run of lines whose first non-blank
characters are `;;` ending on the line directly above a definition.  Nothing else is
touched -- a `;;` section banner that is not above a definition stays a `;;`.
"""

from __future__ import annotations

import argparse
import re
import subprocess
import sys
from dataclasses import dataclass, field
from pathlib import Path

DEFAULT_ROOT = Path("/Users/jimmyhmiller/Documents/Code/projects")

# The documentable heads, per the "Doc comments" section of the guide, plus the
# other `def…` forms a checker can call `primitive/code-doc` on.
DEF_HEADS = (
    "defn", "defstruct", "defsum", "deftrait", "defcc", "const", "extern",
    "defprimitive", "defmacro", "defalias", "defcheck", "deftransform",
)
DEF_RE = re.compile(r"^\((" + "|".join(DEF_HEADS) + r")[\s\[]")
# A `;;` line, but not `;;;` -- those are already migrated.
DOC_RE = re.compile(r"^([ \t]*);;(?!;)")
TRI_RE = re.compile(r"^[ \t]*;;;")


def promote(text: str) -> tuple[str, int]:
    """Rewrite `;;` doc runs to `;;;`. Returns (new text, lines changed)."""
    lines = text.split("\n")
    targets: list[int] = []
    for i, line in enumerate(lines):
        if not DEF_RE.match(line):
            continue
        j = i - 1
        while j >= 0 and DOC_RE.match(lines[j]):
            targets.append(j)
            j -= 1
    for j in targets:
        lines[j] = DOC_RE.sub(lambda m: m.group(1) + ";;;", lines[j], count=1)
    return "\n".join(lines), len(targets)


def git(unit_path: Path, *args: str) -> str | None:
    try:
        out = subprocess.run(
            ["git", "-C", str(unit_path), *args],
            capture_output=True, text=True, check=True,
        )
    except (subprocess.CalledProcessError, FileNotFoundError):
        return None
    return out.stdout.strip()


@dataclass
class Unit:
    """A project or one of its worktrees -- an independently committable tree."""
    name: str
    path: Path
    parent: str | None = None          # set when this is a worktree
    files: list[Path] = field(default_factory=list)
    pending: int = 0                   # `;;` doc lines still to migrate
    already: int = 0                   # `;;;` lines already present
    branch: str | None = None
    dirty: int = 0
    is_git: bool = False
    detached: bool = False

    @property
    def label(self) -> str:
        return f"{self.parent}/{self.name}" if self.parent else self.name

    def blockers(self) -> list[str]:
        out = []
        if not self.is_git:
            out.append("not a git repo (no undo)")
        else:
            if self.dirty:
                out.append(f"{self.dirty} uncommitted change(s)")
            if self.detached:
                out.append("detached HEAD (commits would be unreachable)")
        return out


def discover(root: Path) -> list[Unit]:
    """Every tree under `root` holding .coil files, worktrees listed separately."""
    units: list[Unit] = []
    for project in sorted(p for p in root.iterdir() if p.is_dir()):
        trees = [(project.name, project, None)]
        wt_dir = project / ".worktrees"
        if wt_dir.is_dir():
            trees += [(w.name, w, project.name)
                      for w in sorted(x for x in wt_dir.iterdir() if x.is_dir())]

        for name, path, parent in trees:
            unit = Unit(name=name, path=path, parent=parent)
            for f in sorted(path.rglob("*.coil")):
                s = str(f)
                if "/.git/" in s:
                    continue
                # A project's own scan must not swallow its worktrees; they are
                # separate units with their own branch and their own dirty state.
                if parent is None and "/.worktrees/" in s:
                    continue
                unit.files.append(f)
            if not unit.files:
                continue

            for f in unit.files:
                try:
                    text = f.read_text()
                except (UnicodeDecodeError, OSError):
                    continue
                _, n = promote(text)
                unit.pending += n
                unit.already += sum(1 for l in text.split("\n") if TRI_RE.match(l))

            top = git(path, "rev-parse", "--show-toplevel")
            unit.is_git = top is not None
            if unit.is_git:
                unit.branch = git(path, "rev-parse", "--abbrev-ref", "HEAD")
                unit.detached = unit.branch == "HEAD"
                status = git(path, "status", "--porcelain") or ""
                unit.dirty = len([l for l in status.split("\n") if l.strip()])
            units.append(unit)
    return units


def print_status(units: list[Unit]) -> None:
    w = max(len(u.label) for u in units)
    print(f"{'tree':{w}}  {'branch':30} {'dirty':>5} {'files':>6} "
          f"{'pending':>8} {';;;':>6}  notes")
    print("-" * (w + 78))
    for u in units:
        branch = u.branch or "-"
        if u.detached:
            branch = "(detached HEAD)"
        notes = "; ".join(u.blockers())
        print(f"{u.label:{w}}  {branch[:30]:30} {u.dirty:5} {len(u.files):6} "
              f"{u.pending:8} {u.already:6}  {notes}")
    print("-" * (w + 78))
    ok = [u for u in units if not u.blockers()]
    blocked = [u for u in units if u.blockers()]
    print(f"{'TOTAL':{w}}  {'':30} "
          f"{sum(u.dirty for u in units):5} {sum(len(u.files) for u in units):6} "
          f"{sum(u.pending for u in units):8} {sum(u.already for u in units):6}")
    print(f"\n  ready to migrate : {len(ok)} tree(s), "
          f"{sum(u.pending for u in ok)} doc lines")
    print(f"  blocked          : {len(blocked)} tree(s), "
          f"{sum(u.pending for u in blocked)} doc lines")


def main() -> int:
    ap = argparse.ArgumentParser(
        description="Promote `;;` doc comments to `;;;` across Coil projects.")
    ap.add_argument("--root", type=Path, default=DEFAULT_ROOT)
    ap.add_argument("--only", action="append", default=[],
                    help="substring match on the tree label; repeatable")
    ap.add_argument("--status", action="store_true",
                    help="show every tree and its blockers (default)")
    ap.add_argument("--check", action="store_true",
                    help="exit 1 if any selected tree still has `;;` docs")
    ap.add_argument("--apply", action="store_true",
                    help="rewrite files; refuses if any selected tree is blocked")
    ap.add_argument("--allow-dirty", action="store_true",
                    help="apply even to trees with uncommitted changes")
    ap.add_argument("--allow-non-git", action="store_true",
                    help="apply even to trees with no version control")
    ap.add_argument("--allow-detached", action="store_true",
                    help="apply even to trees on a detached HEAD")
    args = ap.parse_args()

    units = discover(args.root)
    if args.only:
        units = [u for u in units
                 if any(s.lower() in u.label.lower() for s in args.only)]
    if not units:
        print("no trees with .coil files matched", file=sys.stderr)
        return 2

    if not (args.check or args.apply):
        print_status(units)
        return 0

    if args.check:
        stale = [u for u in units if u.pending]
        for u in stale:
            print(f"{u.label}: {u.pending} `;;` doc line(s) not yet promoted")
        if stale:
            print(f"\n{len(stale)} tree(s) still on `;;` docs", file=sys.stderr)
            return 1
        print(f"all {len(units)} tree(s) migrated")
        return 0

    # --apply: refuse the whole run if anything is blocked, so a migration is
    # never left spread across some trees and not others.
    blocked = []
    for u in units:
        reasons = [r for r in u.blockers()
                   if not (args.allow_dirty and "uncommitted" in r)
                   and not (args.allow_non_git and "not a git repo" in r)
                   and not (args.allow_detached and "detached" in r)]
        if reasons:
            blocked.append((u, reasons))
    if blocked:
        print("refusing to apply -- these trees are not in a clean state:\n",
              file=sys.stderr)
        for u, reasons in blocked:
            print(f"  {u.label:40} {'; '.join(reasons)}", file=sys.stderr)
        print("\nCommit or stash, then re-run. Overrides: --allow-dirty, "
              "--allow-non-git, --allow-detached.", file=sys.stderr)
        return 2

    total_lines = total_files = 0
    for u in units:
        for f in u.files:
            try:
                text = f.read_text()
            except (UnicodeDecodeError, OSError):
                continue
            out, n = promote(text)
            if n:
                f.write_text(out)
                total_lines += n
                total_files += 1
        if u.pending:
            print(f"  {u.label:40} {u.pending:6} lines")
    print(f"\npromoted {total_lines} doc lines across {total_files} files")
    return 0


if __name__ == "__main__":
    sys.exit(main())

#!/usr/bin/env python3
"""Compare two compilers' checked and monomorphized programs over a fixed corpus.

A change to expansion, resolution or checking that is meant to preserve meaning
(a cache, a lifetime change, an incremental path) must leave `dump-checked` and
`dump-mono` byte-identical. Run it against a reference compiler built from the
commit before the change:

    python3 scripts/tests/pipeline-differential.py REFERENCE CANDIDATE [--jobs N]

The corpus is deterministic: the compiler itself, then every file in
src/examples, the runtime corpus (tests/corpus), the diagnostic inputs
(tests/diag) and the stdlib suites (tests/stdlib), in sorted order. Both dumps
must match, including their error output when a file does not check. A
mismatch prints the file, the dump, and the first differing line.

Hygiene numbers its syntax contexts and generated `$scopeN@` names in the order
it allocates them, and a meaning-preserving change (a cache) can allocate in
another order. Two dumps that are equal once each is renumbered in order of first
appearance (zero, the authored context, stays zero) name the same contexts, and
count as equal; they are reported as such, not as differences.
"""
from pathlib import Path
import argparse
import concurrent.futures
import os
import re
import shutil
import subprocess
import sys
import tempfile

ROOT = Path(__file__).resolve().parents[2]
DUMPS = ("dump-checked", "dump-mono")
COMPILER = ROOT / "src/compiler/main.coil"


def corpus():
    files = [COMPILER]
    for pattern in ("src/examples/*.coil", "tests/corpus/*.coil", "tests/diag/*/*.coil",
                    "tests/stdlib/*.coil"):
        files.extend(sorted(ROOT.glob(pattern)))
    return files


def namespace_roots():
    # The roots scripts/compiler/stage0.py builds the compiler with: its own
    # sources (the vendored tpde package included), so a reference compiler whose
    # bundled manifest predates a new compiler module still finds it.
    return ":".join(["src", "tests", "scripts", "src/compiler", "src/stdlib"])


def failure_report(result):
    """What a rejected dump said: all of stderr, then the dump's own `(error …)`
    nodes, which a stage dump writes in place of the program on stdout. The rest
    of stdout (a program dump runs to tens of megabytes) only its first lines."""
    stderr = result.stderr.decode(errors="replace")
    stdout = result.stdout.decode(errors="replace")
    errors = re.findall(r'\(error@[^"]*"(?:[^"\\]|\\.)*"\)', stdout)
    parts = [f"stderr ({len(result.stderr)} bytes):\n{stderr[-4000:] if stderr else '(empty)'}"]
    if errors:
        parts.append("stdout error nodes:\n" + "\n".join(errors[:20]))
    parts.append(f"stdout ({len(result.stdout)} bytes) begins:\n{stdout[:600]}")
    return "\n".join(parts)


def dump(compiler, command, path):
    env = {**os.environ, "COIL_NAMESPACE_ROOTS": namespace_roots(), "COIL_STRICT_BUNDLE": "0"}
    result = subprocess.run([str(compiler), command, str(path)], cwd=ROOT, env=env,
                            capture_output=True, timeout=900)
    if result.returncode not in (0, 1):
        raise RuntimeError(
            f"{compiler} {command} {path}: abnormal exit {result.returncode}\n"
            + failure_report(result))
    # Two compilers that both fail to load the compiler agree on nothing but the
    # failure; the comparison the corpus leads with would never run. A dump that
    # exits 0 while reporting an error is no program either.
    if path == COMPILER and (result.returncode != 0 or re.search(rb"(^|\n)error: ", result.stderr)):
        raise RuntimeError(
            f"{compiler} {command} {path}: the compiler does not check\n"
            + failure_report(result))
    return (f"--status--{result.returncode}\n".encode()
            + result.stdout + b"\n--stderr--\n" + result.stderr)


NODE_CONTEXT = re.compile(rb"(@-?\d+:-?\d+:-?\d+:)(-?\d+)")
SCOPE_NAME = re.compile(rb"\$scope(\d+)@")


def renumber_hygiene(text):
    """TEXT with its syntax contexts and `$scopeN@` names renumbered by first
    appearance: a bijection, so two dumps equal after it name the same contexts."""
    contexts, scopes = {b"0": b"0"}, {}

    def context(m):
        key = m.group(2)
        if key not in contexts:
            contexts[key] = str(len(contexts)).encode()
        return m.group(1) + contexts[key]

    def scope(m):
        key = m.group(1)
        if key not in scopes:
            scopes[key] = str(len(scopes)).encode()
        return b"$scope" + scopes[key] + b"@"

    return SCOPE_NAME.sub(scope, NODE_CONTEXT.sub(context, text))


def compare(reference, candidate, path, output_dir=None):
    problems, renumbered = [], []
    for command in DUMPS:
        old = dump(reference, command, path)
        new = dump(candidate, command, path)
        if old != new and renumber_hygiene(old) == renumber_hygiene(new):
            renumbered.append(f"{path.relative_to(ROOT)} {command}")
        elif old != new:
            old_lines = old.split(b"\n")
            new_lines = new.split(b"\n")
            line = next((i for i, (x, y) in enumerate(zip(old_lines, new_lines)) if x != y),
                        min(len(old_lines), len(new_lines)))
            old_line = old_lines[line] if line < len(old_lines) else b""
            new_line = new_lines[line] if line < len(new_lines) else b""
            column = next((i for i, (x, y) in enumerate(zip(old_line, new_line)) if x != y),
                          min(len(old_line), len(new_line)))
            show = lambda lines: (lines[line][max(0, column - 80):column + 120].decode(errors="replace")
                                  if line < len(lines) else "<end>")
            if output_dir is not None:
                base = output_dir / path.relative_to(ROOT)
                base.parent.mkdir(parents=True, exist_ok=True)
                Path(str(base) + f".{command}.reference.txt").write_bytes(old)
                Path(str(base) + f".{command}.candidate.txt").write_bytes(new)
            problems.append(f"{path.relative_to(ROOT)} {command} line {line + 1}, byte {column + 1}\n"
                            f"  reference: {show(old_lines)}\n  candidate: {show(new_lines)}")
    return problems, renumbered


def pair_with_checkout(prefix, compiler):
    """COMPILER installed into PREFIX against this checkout's source tree.

    A compiler in another worktree otherwise discovers that worktree's stdlib
    beside its own binary, and the comparison would measure two libraries as
    well as two compilers. Each compiler gets a prefix of its own all the same:
    the compile-time units a compiler builds and caches under its prefix belong
    to that binary, and a second compiler loading them fails their digest check.
    """
    bindir = prefix / "bin"
    library = prefix / "lib/coil"
    bindir.mkdir(parents=True)
    library.mkdir(parents=True)
    (library / "stdlib").symlink_to(ROOT / "src/stdlib", target_is_directory=True)
    (library / "compiler").symlink_to(ROOT / "src/compiler", target_is_directory=True)
    (library / "prelude.coil").symlink_to(ROOT / "src/compiler/prelude.coil")
    native = ROOT / "build/bin/native"
    if native.is_dir():
        (bindir / "native").symlink_to(native, target_is_directory=True)
    paired = bindir / "coil"
    shutil.copy2(compiler, paired)
    return paired


def main():
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("reference")
    parser.add_argument("candidate")
    parser.add_argument("--jobs", type=int, default=max(1, (os.cpu_count() or 4) // 2))
    parser.add_argument("--output-dir", type=Path, help="preserve both raw dumps for every mismatch")
    args = parser.parse_args()
    reference = Path(args.reference).resolve()
    candidate = Path(args.candidate).resolve()
    files = corpus()
    failures, renumbered = [], []
    build_root = ROOT / "build"
    build_root.mkdir(exist_ok=True)
    with tempfile.TemporaryDirectory(prefix="pipeline-diff-", dir=build_root) as directory:
        paired_reference = pair_with_checkout(Path(directory) / "reference", reference)
        paired_candidate = pair_with_checkout(Path(directory) / "candidate", candidate)
        with concurrent.futures.ThreadPoolExecutor(max_workers=args.jobs) as pool:
            for problems, renumbers in pool.map(
                    lambda path: compare(paired_reference, paired_candidate, path, args.output_dir), files):
                failures.extend(problems)
                renumbered.extend(renumbers)
    for problem in failures:
        print(f"DIFF {problem}")
    for same in renumbered:
        print(f"RENUMBERED {same}: equal once hygiene contexts are renumbered")
    print(f"{len(files)} files, {len(files) * len(DUMPS)} dumps, {len(failures)} differ"
          + (f", {len(renumbered)} equal up to hygiene numbering" if renumbered else ""))
    return 1 if failures else 0


if __name__ == "__main__":
    sys.exit(main())

#!/usr/bin/env python3
"""Compare two compilers' checked and monomorphized programs over a fixed corpus.

A change to expansion, resolution or checking that is meant to preserve meaning
(a cache, a lifetime change, an incremental path) must leave `dump-checked` and
`dump-mono` byte-identical. Run it against a reference compiler built from the
commit before the change:

    python3 scripts/tests/pipeline-differential.py REFERENCE CANDIDATE [--jobs N]

The corpus is deterministic: the compiler itself, then every file in
src/examples, tests/compiler/features and tests/, in sorted order. Both dumps
must match, including their error output when a file does not check. A
mismatch prints the file, the dump, and the first differing line.
"""
from pathlib import Path
import argparse
import concurrent.futures
import os
import subprocess
import sys

ROOT = Path(__file__).resolve().parents[2]
DUMPS = ("dump-checked", "dump-mono")


def corpus():
    files = [ROOT / "src/compiler/main.coil"]
    for pattern in ("src/examples/*.coil", "tests/compiler/features/*.coil", "tests/*.coil"):
        files.extend(sorted(ROOT.glob(pattern)))
    return files


def dump(compiler, command, path):
    env = {**os.environ, "COIL_NAMESPACE_ROOTS": "src:tests:scripts", "COIL_STRICT_BUNDLE": "0"}
    result = subprocess.run([str(compiler), command, str(path)], cwd=ROOT, env=env,
                            capture_output=True, timeout=900)
    return result.stdout + b"\n--stderr--\n" + result.stderr


def compare(reference, candidate, path):
    problems = []
    for command in DUMPS:
        old = dump(reference, command, path)
        new = dump(candidate, command, path)
        if old != new:
            old_lines = old.split(b"\n")
            new_lines = new.split(b"\n")
            line = next((i for i, (x, y) in enumerate(zip(old_lines, new_lines)) if x != y),
                        min(len(old_lines), len(new_lines)))
            show = lambda lines: lines[line][:200].decode(errors="replace") if line < len(lines) else "<end>"
            problems.append(f"{path.relative_to(ROOT)} {command} line {line + 1}\n"
                            f"  reference: {show(old_lines)}\n  candidate: {show(new_lines)}")
    return problems


def main():
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("reference")
    parser.add_argument("candidate")
    parser.add_argument("--jobs", type=int, default=max(1, (os.cpu_count() or 4) // 2))
    args = parser.parse_args()
    reference = Path(args.reference).resolve()
    candidate = Path(args.candidate).resolve()
    files = corpus()
    failures = []
    with concurrent.futures.ThreadPoolExecutor(max_workers=args.jobs) as pool:
        for problems in pool.map(lambda path: compare(reference, candidate, path), files):
            failures.extend(problems)
    for problem in failures:
        print(f"DIFF {problem}")
    print(f"{len(files)} files, {len(files) * len(DUMPS)} dumps, {len(failures)} differ")
    return 1 if failures else 0


if __name__ == "__main__":
    sys.exit(main())

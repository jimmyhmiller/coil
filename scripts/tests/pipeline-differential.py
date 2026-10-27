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
"""
from pathlib import Path
import argparse
import concurrent.futures
import os
import shutil
import subprocess
import sys
import tempfile

ROOT = Path(__file__).resolve().parents[2]
DUMPS = ("dump-checked", "dump-mono")


def corpus():
    files = [ROOT / "src/compiler/main.coil"]
    for pattern in ("src/examples/*.coil", "tests/corpus/*.coil", "tests/diag/*/*.coil",
                    "tests/stdlib/*.coil"):
        files.extend(sorted(ROOT.glob(pattern)))
    return files


def dump(compiler, command, path):
    env = {**os.environ, "COIL_NAMESPACE_ROOTS": "src:tests:scripts", "COIL_STRICT_BUNDLE": "0"}
    result = subprocess.run([str(compiler), command, str(path)], cwd=ROOT, env=env,
                            capture_output=True, timeout=900)
    required = (ROOT / "src/compiler/main.coil", ROOT / "src/examples/jit_sdk.coil")
    if path in required and (result.returncode != 0 or not result.stdout.startswith(b"(conventions")):
        raise RuntimeError(
            f"{compiler} {command} {path}: required input did not produce a checked program "
            f"(exit {result.returncode})\n" + (result.stdout + result.stderr).decode(errors="replace")[:2000])
    if result.returncode not in (0, 1):
        raise RuntimeError(
            f"{compiler} {command} {path}: abnormal exit {result.returncode}\n"
            + result.stderr.decode(errors="replace")[:2000])
    return (f"--status--{result.returncode}\n".encode()
            + result.stdout + b"\n--stderr--\n" + result.stderr)


def compare(reference, candidate, path, output_dir=None):
    problems = []
    for command in DUMPS:
        old = dump(reference, command, path)
        new = dump(candidate, command, path)
        if old != new:
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
    return problems


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
    failures = []
    # A compiler in another worktree otherwise discovers that worktree's stdlib
    # beside its own binary. The comparison would then measure two libraries as
    # well as two compilers, and report hundreds of unrelated differences after
    # a prelude edit. Pair both binaries with this checkout's same source tree.
    build_root = ROOT / "build"
    build_root.mkdir(exist_ok=True)
    with tempfile.TemporaryDirectory(prefix="pipeline-diff-", dir=build_root) as directory:
        prefix = Path(directory)
        # Match the installed SDK layout, including the separate TPDE package.
        # Use one source snapshot for both binaries and private unit caches: CT
        # artifacts are compiler-specific, so a shared cache makes them rebuild
        # each other's units on every alternating invocation.
        sdk = prefix / "sdk"
        shutil.copytree(ROOT / "src/compiler", sdk)
        tpde = (ROOT / "../coil-tpde/src/tpde").resolve()
        if not (sdk / "tpde").exists():
            if not tpde.is_dir():
                raise RuntimeError(f"compiler SDK dependency not found: {tpde}")
            shutil.copytree(tpde, sdk / "tpde")

        def pair(binary, name):
            bindir = prefix / name / "bin"
            library = prefix / name / "lib/coil"
            bindir.mkdir(parents=True)
            library.mkdir(parents=True)
            (library / "stdlib").symlink_to(ROOT / "src/stdlib", target_is_directory=True)
            (library / "compiler").symlink_to(sdk, target_is_directory=True)
            (library / "prelude.coil").symlink_to(ROOT / "src/compiler/prelude.coil")
            native = ROOT / "build/bin/native"
            if native.is_dir():
                (bindir / "native").symlink_to(native, target_is_directory=True)
            executable = bindir / "coil"
            shutil.copy2(binary, executable)
            return executable

        paired_reference = pair(reference, "reference")
        paired_candidate = pair(candidate, "candidate")
        required = {ROOT / "src/compiler/main.coil", ROOT / "src/examples/jit_sdk.coil"}
        # Fail before queuing the remaining corpus if the paired installation
        # cannot check either required input.
        for path in files:
            if path in required:
                failures.extend(compare(paired_reference, paired_candidate, path, args.output_dir))
        remaining = [path for path in files if path not in required]
        with concurrent.futures.ThreadPoolExecutor(max_workers=args.jobs) as pool:
            for problems in pool.map(
                    lambda path: compare(paired_reference, paired_candidate, path, args.output_dir), remaining):
                failures.extend(problems)
    for problem in failures:
        print(f"DIFF {problem}")
    print(f"{len(files)} files, {len(files) * len(DUMPS)} dumps, {len(failures)} differ")
    return 1 if failures else 0


if __name__ == "__main__":
    sys.exit(main())

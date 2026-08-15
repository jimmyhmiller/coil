#!/usr/bin/env python3
"""Run gate-cli.sh's self-contained sections concurrently and report in order."""

from __future__ import annotations

import concurrent.futures
import os
import subprocess
import sys
from pathlib import Path


def jobs() -> int:
    override = os.environ.get("COIL_JOBS")
    if override:
        return max(1, int(override))
    return max(1, os.cpu_count() or 1)


def split_sections(source: str) -> tuple[str, list[str]]:
    lines = source.splitlines(keepends=True)
    starts = [i for i, line in enumerate(lines) if line.startswith('echo "== ')]
    if not starts:
        raise SystemExit("gate-cli: no test sections found")
    # The common preamble defines helpers and creates the basic fixture files.
    preamble = "".join(lines[: starts[0]])
    sections = ["".join(lines[start:end]) for start, end in zip(starts, starts[1:] + [len(lines)])]
    # The original final summary belongs to the last section; workers use the
    # same FAIL contract, so leaving it there would only add duplicate output.
    marker = '\necho\n[ "$FAIL" = 0 ] && echo "gate-cli: PASS" || echo "gate-cli: FAIL"\nexit $FAIL\n'
    sections[-1] = sections[-1].replace(marker, "\n")
    return preamble, sections


def run_one(index: int, preamble: str, section: str, compiler: str, root: Path) -> tuple[int, int, bytes]:
    env = os.environ.copy()
    env["COIL_GATE_CLI_SERIAL"] = "1"
    # The generated worker is read on stdin, so the preamble's source-relative
    # cd cannot work. Workers already start at the repository root.
    worker_preamble = preamble.replace('cd "$(dirname "$0")/../../.."\n', "")
    worker = worker_preamble + section + '\nexit $FAIL\n'
    result = subprocess.run(
        ["bash", "-s", "--", compiler], input=worker.encode(), cwd=root, env=env,
        stdout=subprocess.PIPE, stderr=subprocess.STDOUT,
    )
    return index, result.returncode, result.stdout


def main() -> int:
    if len(sys.argv) != 3:
        raise SystemExit("usage: gate-cli-parallel.py GATE_SCRIPT COMPILER")
    script = Path(sys.argv[1]).resolve()
    root = script.parents[3]
    compiler_path = Path(sys.argv[2]).expanduser()
    if not compiler_path.is_absolute():
        compiler_path = root / compiler_path
    compiler = str(compiler_path.resolve())
    if not os.access(compiler, os.X_OK):
        raise SystemExit(f"no coil at {compiler}")
    preamble, sections = split_sections(script.read_text())
    # The coil.jit contract compiles the entire source-linked compiler SDK into a
    # user application. Running that memory-heavy proof beside every other CLI
    # worker can make unrelated project builds fail under host memory pressure.
    # It remains a normal gate section, but runs after the parallel lightweight set.
    heavy = [s for s in sections if s.startswith('echo "== coil.jit:')]
    parallel = [s for s in sections if not s.startswith('echo "== coil.jit:')]
    with concurrent.futures.ThreadPoolExecutor(max_workers=jobs()) as pool:
        results = list(pool.map(
            lambda item: run_one(item[0], preamble, item[1], compiler, root),
            enumerate(parallel),
        ))
    base = len(results)
    results.extend(run_one(base + i, preamble, section, compiler, root)
                   for i, section in enumerate(heavy))
    failed = False
    for _, returncode, output in sorted(results):
        sys.stdout.buffer.write(output)
        if returncode:
            failed = True
    print(f"gate-cli: {'FAIL' if failed else 'PASS'}")
    return 1 if failed else 0


if __name__ == "__main__":
    raise SystemExit(main())

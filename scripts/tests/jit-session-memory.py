#!/usr/bin/env python3
"""Bound frontend memory across repeated retained JIT replacements."""

import argparse
from pathlib import Path
import re
import subprocess
import sys
import tempfile


ROOT = Path(__file__).resolve().parents[2]


def run(*command: str) -> subprocess.CompletedProcess[str]:
    result = subprocess.run(command, cwd=ROOT, text=True, capture_output=True)
    if result.returncode:
        raise AssertionError(
            f"{' '.join(command)} exited {result.returncode}\n"
            f"{result.stdout}{result.stderr}"
        )
    return result


def source_for_replacements(count: int) -> str:
    lines = [
        "(module compiler.tests.jit-session-memory)",
        '(import "coil.alloc" :use [malloc-allocator])',
        '(import "coil.jit" :as jit)',
        '(defn main [] (-> i64)',
        '  (let [(mut session) (jit/jit-session-new (malloc-allocator))',
        '        (mut status) 0]',
        '    (if (!= (jit/jit-session-set-legacy-reload! (mut session) false) 0)',
        '        1',
        '        (do',
    ]
    for index in range(count):
        lines.extend(
            [
                '          (when (!= (jit/jit-replace-source! (mut session) '
                f'"(defn value{index} [] (-> i64) {index})") 0)',
                '            (set! status 2))',
                '          (when (< (jit/jit-reclaim-retired! (mut session)) 0)',
                '            (set! status 3))',
            ]
        )
    lines.append('          (load status)))))')
    return '\n'.join(lines) + '\n'


def peak_rss(stderr: str) -> int:
    if sys.platform == 'darwin':
        match = re.search(r'(\d+)\s+maximum resident set size', stderr)
        multiplier = 1
    else:
        match = re.search(r'Maximum resident set size \(kbytes\):\s*(\d+)', stderr)
        multiplier = 1024
    assert match, f'time did not report peak RSS:\n{stderr}'
    return int(match.group(1)) * multiplier


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument('compiler')
    parser.add_argument('--replacements', type=int, default=24)
    args = parser.parse_args()
    compiler_path = Path(args.compiler).resolve()
    compiler = str(compiler_path)
    with tempfile.TemporaryDirectory(prefix='.coil-jit-session-memory-', dir=ROOT) as raw:
        directory = Path(raw)
        installed_sdk = compiler_path.parent.parent / 'lib/coil/compiler'
        sources = ('jit_api.coil', 'driver.coil')
        installed_matches = all(
            (installed_sdk / name).is_file()
            and (installed_sdk / name).read_bytes() == (ROOT / 'src/compiler' / name).read_bytes()
            for name in sources
        )
        # A verified installed toolchain already ships the matching JIT unit;
        # adding another copy would duplicate every symbol. A candidate uses
        # an explicit unit built from this checkout, so its test cannot silently
        # link the previously installed SDK instead.
        unit_flags: list[str] = []
        if not installed_matches:
            if installed_sdk.is_dir():
                raise AssertionError('installed compiler SDK does not match this checkout')
            unit = directory / 'jit-unit'
            run(compiler, 'build-unit', str(ROOT / 'src/compiler/jit_api.coil'),
                '-o', str(unit), '--backend', 'llvm', '-O3', '--quiet')
            unit_flags = ['--unit', str(unit)]
        source = directory / 'replacements.coil'
        executable = directory / 'replacements'
        source.write_text(source_for_replacements(args.replacements))
        run(compiler, 'build', str(source), '-o', str(executable), *unit_flags)
        timed = run('/usr/bin/time', '-l' if sys.platform == 'darwin' else '-v',
                    str(executable))
        peak = peak_rss(timed.stderr)
        print(f'{args.replacements} retained JIT replacements: peak RSS {peak} B', flush=True)
        assert peak < 768 * 1024 * 1024, 'frontend generations accumulated'


if __name__ == '__main__':
    main()

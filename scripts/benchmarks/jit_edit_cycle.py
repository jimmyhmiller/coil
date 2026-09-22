#!/usr/bin/env python3
"""Measure complete retained-JIT edits after seeding a large definition set."""

import argparse
import json
import os
from pathlib import Path
import re
import statistics
import subprocess
import tempfile


ROOT = Path(__file__).resolve().parents[2]


def run(*command: str, env: dict[str, str] | None = None) -> subprocess.CompletedProcess[str]:
    result = subprocess.run(command, cwd=ROOT, text=True, errors='replace',
                            capture_output=True, env=env)
    if result.returncode:
        raise RuntimeError(
            f"{' '.join(command)} exited {result.returncode}\n{result.stdout}{result.stderr}"
        )
    return result


def harness(definitions: int, edits: int) -> str:
    seed = ['(import "coil.repl")']
    seed.extend(
        f'(defn value{i:06d} [] (-> i64) {i})' for i in range(definitions)
    )
    lines = [
        '(module compiler.benchmarks.jit-edit-cycle)',
        '(import "coil.alloc" :use [malloc-allocator])',
        '(import "coil.io" :use *)',
        '(import "coil.fmt" :use [print-i print-nl])',
        '(import "coil.time" :as time)',
        '(import "coil.jit" :as jit)',
        '(defn now [] (-> i64)',
        '  (match (time/monotonic-now-ms) (Ok [value] value) (Err [error] 0)))',
        '(defn main [] (-> i64) (block :done',
        '  (let [(mut session) (jit/jit-session-new (malloc-allocator)) w (stdout)]',
        '    (when (!= (jit/jit-compile-with-entry! (mut session) '
        f'               {json.dumps(" ".join(seed))} "(coil.repl/publish)") 0)'
        '      (return-from :done 1))',
    ]
    for edit in range(edits):
        source = f'(defn value000000 [] (-> i64) {definitions + edit})'
        lines.extend([
            '    (let [started (now)]',
            '      (when (!= (jit/jit-compile-with-entry! (mut session) '
            f'                 {json.dumps(source)} "(coil.repl/publish)") 0)'
            '        (return-from :done 2))',
            '      (print-i w (- (now) started))',
            '      (print-nl w))',
        ])
    lines.extend([
        '    (when (!= (jit/jit-reset! (mut session)) 0) (return-from :done 3))',
        '    0)))',
    ])
    return '\n'.join(lines) + '\n'


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument('compiler')
    parser.add_argument('--definitions', type=int, default=2000)
    parser.add_argument('--edits', type=int, default=30)
    parser.add_argument('--warmup-edits', type=int, default=3)
    parser.add_argument('--require-ms', type=float)
    parser.add_argument('--trace', action='store_true',
                        help='enable compiler spans and report steady medians')
    args = parser.parse_args()
    compiler_path = Path(args.compiler).resolve()
    with tempfile.TemporaryDirectory(prefix='.coil-jit-edit-cycle-', dir=ROOT) as raw:
        directory = Path(raw)
        source = directory / 'probe.coil'
        executable = directory / 'probe'
        source.write_text(harness(args.definitions, args.edits))
        installed_unit = (compiler_path.parent.parent / 'lib/coil/units/llvm'
                          / 'coil.compiler.jit_api' / 'unit.o')
        unit_flags: list[str] = []
        if not installed_unit.is_file():
            unit = directory / 'jit-unit'
            run(str(compiler_path), 'build-unit', str(ROOT / 'src/compiler/jit_api.coil'),
                '-o', str(unit), '--backend', 'llvm', '-O3', '--quiet')
            unit_flags = ['--unit', str(unit)]
        run(str(compiler_path), 'build', str(source), '-o', str(executable),
            *unit_flags, '--quiet')
        toolbin = directory / 'bin'
        toolbin.mkdir()
        (toolbin / 'coil').symlink_to(compiler_path)
        environment = dict(os.environ)
        environment['PATH'] = str(toolbin) + os.pathsep + environment['PATH']
        if args.trace:
            environment['COIL_TRACE'] = '1'
        measured = run(str(executable), env=environment)
        values = [int(line) for line in measured.stdout.splitlines() if line.strip()]
        if len(values) != args.edits:
            raise RuntimeError(f'expected {args.edits} timings, got {values!r}')
        steady = values[args.warmup_edits:]
        median = statistics.median(steady)
        p95 = sorted(steady)[max(0, int(len(steady) * .95) - 1)]
        report = {
            'definitions': args.definitions,
            'edits': args.edits,
            'warmup_edits': args.warmup_edits,
            'median_ms': median,
            'p95_ms': p95,
            'min_ms': min(steady),
            'max_ms': max(steady),
            'samples_ms': steady,
        }
        if args.trace:
            spans: dict[str, list[int]] = {}
            for name, elapsed in re.findall(
                    r'^coil-trace end ([^ ]+) (\d+)ms$', measured.stderr, re.MULTILINE):
                spans.setdefault(name, []).append(int(elapsed))
            wanted = ('jit.prepare', 'jit.publish.native', 'jit.publish.retain',
                      'jit.publish.snapshot')
            report['span_medians_ms'] = {
                name: statistics.median(spans[name][1 + args.warmup_edits:])
                for name in wanted if len(spans.get(name, [])) >= args.edits + 1
            }
        print(json.dumps(report))
        if args.require_ms is not None and median >= args.require_ms:
            raise SystemExit(
                f'median edit cycle {median} ms is not below {args.require_ms:g} ms'
            )


if __name__ == '__main__':
    main()

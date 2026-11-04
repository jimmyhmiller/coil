#!/usr/bin/env python3
"""Compare checked compiler kernels using an identical opaque caller.

Compilers must be candidates in their checkout's build/bin directory, so the
source identity check can verify that all kernels see the same standard library.
"""
from pathlib import Path
import argparse
import hashlib
import json
import os
import resource
import statistics
import subprocess
import time

parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('--compiler', type=Path, required=True)
parser.add_argument('--library', type=Path, required=True, help='coil-stogir checkout')
parser.add_argument('--never', action='store_true')
parser.add_argument('--legacy', action='store_true')
parser.add_argument('--workload', choices=['iterator', 'verify', 'loops', 'verify-transaction', 'tag-extract'], default='iterator')
parser.add_argument('--before', type=Path, help='previous compiler candidate')
parser.add_argument('--output', type=Path, required=True)
parser.add_argument('--objdump', default='llvm-objdump')
parser.add_argument('--samples', type=int, default=6)
parser.add_argument('--compile-samples', type=int, default=4)
args = parser.parse_args()
if args.workload != 'iterator' and args.never:
    parser.error('--never applies only to the iterator workload')
if args.workload not in ('loops', 'verify-transaction') and args.legacy:
    parser.error('--legacy applies only to loops or verify-transaction')
if args.samples < 2 or args.compile_samples < 2:
    parser.error('--samples and --compile-samples must be at least 2')
C = args.compiler.resolve()
R = C.parents[2]
S = args.library.resolve()
D = args.output.resolve()
D.mkdir(parents=True, exist_ok=True)
E = {k: v for k, v in os.environ.items() if not k.startswith('COIL_')}
E.update(COIL_LIBRARY_STATE='0', COIL_TPDE_SERIAL='1', COIL_CODEGEN_TIMINGS='1')
cases = [('current-stogir', C, 'stogir'), ('llvm', C, 'llvm'), ('tpde', C, 'tpde')]
if args.before:
    cases.insert(0, ('before-stogir', args.before.resolve(), 'stogir'))

def run(args):
    p = subprocess.run([str(x) for x in args], cwd=S, env=E, capture_output=True, text=True)
    assert p.returncode == 0, (args, p.returncode, p.stdout[-1000:], p.stderr[-2000:])
    return p
prefix = {'iterator': 'iterator-return', 'verify': 'verify-graph', 'loops': 'loop-depths', 'verify-transaction': 'verify-transaction', 'tag-extract': 'tag-extract'}[args.workload]
fixture = S / ('benchmarks/compiler-gaps/' + prefix + '.coil')
runner = S / ('benchmarks/compiler-gaps/' + prefix + '-runner.coil')
fixture_bytes = fixture.read_bytes()
runner_bytes = runner.read_bytes()
for _, c, _ in cases:
    for source in (R / 'src/stdlib').rglob('*.coil'):
        relative = source.relative_to(R)
        assert (c.parents[2] / relative).read_bytes() == source.read_bytes(), relative
run([C, 'emit-obj', runner, '--backend', 'llvm', '-O3', '--no-debug', '-o', D / 'runner.o'])
rows = []
for n, c, b in cases:
    p = run([c, 'emit-obj', fixture, '--backend', b, '-O3', '--no-debug', '-o', D / (n + '.o')])
    (D / (n + '-compile.log')).write_text(p.stdout + p.stderr)
    rec = [l.split('\t') for l in p.stderr.splitlines() if l.startswith('coil-codegen\t')]
    assert rec
    run(['cc', D / 'runner.o', D / (n + '.o'), '-o', D / n])
    run([D / n, *(['--never'] if args.never else ['--legacy'] if args.legacy else [])])
    asm = run([args.objdump, '-d', '--no-show-raw-insn', D / (n + '.o')]).stdout
    (D / (n + '.asm')).write_text(asm)
    rows.append({'name': n, 'codegen_diagnostic_s': sum((int(x[3]) for x in rec)) / 1000000000.0, 'object_bytes': (D / (n + '.o')).stat().st_size, 'wall_samples_s': [], 'cpu_samples_s': [], 'codegen_samples_s': [], 'object_sha256': hashlib.sha256((D / (n + '.o')).read_bytes()).hexdigest()})
# Initial compilation/link/check above warms each backend. Measure repeated
# generation separately and require identical object bytes before timing runs.
for turn in range(args.compile_samples):
    for row in rows if turn % 2 == 0 else list(reversed(rows)):
        name = row['name']
        _, compiler, backend = next(case for case in cases if case[0] == name)
        result = run([compiler, 'emit-obj', fixture, '--backend', backend, '-O3',
                      '--no-debug', '-o', D / (name + '.o')])
        (D / (name + '-compile-' + str(turn) + '.log')).write_text(result.stdout + result.stderr)
        records = [line.split('\t') for line in result.stderr.splitlines()
                   if line.startswith('coil-codegen\t')]
        assert records and all(record[1] == backend for record in records)
        row['codegen_samples_s'].append(sum(int(record[3]) for record in records) / 1e9)
        assert hashlib.sha256((D / (name + '.o')).read_bytes()).hexdigest() == row['object_sha256']
for row in rows:
    row['codegen_warmup_s'] = row['codegen_diagnostic_s']
    row['codegen_diagnostic_s'] = statistics.median(row['codegen_samples_s'])
for turn in range(args.samples + 1):
    for row in rows if turn % 2 == 0 else list(reversed(rows)):
        r0 = resource.getrusage(resource.RUSAGE_CHILDREN)
        t = time.monotonic()
        run([D / row['name'], *(['--never'] if args.never else ['--legacy'] if args.legacy else [])])
        dt = time.monotonic() - t
        r1 = resource.getrusage(resource.RUSAGE_CHILDREN)
        if turn:
            row['wall_samples_s'].append(dt)
            row['cpu_samples_s'].append(r1.ru_utime + r1.ru_stime - r0.ru_utime - r0.ru_stime)
for row in rows:
    row['wall_median_s'] = statistics.median(row['wall_samples_s'])
    row['cpu_median_s'] = statistics.median(row['cpu_samples_s'])
assert fixture.read_bytes() == fixture_bytes
assert runner.read_bytes() == runner_bytes
report = {'runner_source_sha256': hashlib.sha256(runner_bytes).hexdigest(), 'compilers': {n: str(c) for n, c, _ in cases}, 'samples': args.samples, 'compile_samples': args.compile_samples, 'workload': args.workload, 'work': ({'walks': 312500, 'walk_bytes': 64} if args.workload == 'iterator' else {'primitive_nodes': 2048, 'repetitions': 128, 'invalid_cases': 4 if args.workload == 'verify-transaction' else 3} if args.workload in ('verify', 'verify-transaction') else {'headers': 256, 'repetitions': 250000, 'tags_per_call_sum': 32640} if args.workload == 'tag-extract' else {'blocks': 64, 'reference_stride': 16, 'repetitions': 1024, 'depth_sum_per_call': 124}), 'mode': 'never' if args.never else 'legacy' if args.legacy else 'default', 'checksum': ('independent indexed reference and full-run accumulated hash' if args.workload == 'iterator' else 'graph-size sum and rejected layout/reference/type/Phi graphs' if args.workload == 'verify-transaction' else 'graph-size sum and three rejected invalid graphs' if args.workload == 'verify' else 'independent division/remainder reference for every prefix and accumulated tag sum' if args.workload == 'tag-extract' else 'known depth sum for outer and nested multi-latch loops; both algorithms checked before timing'), 'runner_sha256': hashlib.sha256((D / 'runner.o').read_bytes()).hexdigest(), 'fixture_sha256': hashlib.sha256(fixture.read_bytes()).hexdigest(), 'rows': rows, 'qualification': 'One identical LLVM-built opaque runner; exact result checked by runner exit. Rotating samples after excluded warmup; caches disabled, serial codegen. Generation and runtime use separate rotating repetitions with excluded warmups; not compiler bootstrap acceptance.'}
(D / 'results.json').write_text(json.dumps(report, indent=2) + '\n')
print(json.dumps(rows), flush=True)

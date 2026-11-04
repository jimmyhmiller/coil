#!/usr/bin/env python3
"""Compare checked compiler-vector access using an identical opaque caller.

Compilers must be candidates in their checkout's build/bin directory, so the
stdlib identity check can verify that all kernels see the same AVec source.
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
parser.add_argument('--before', type=Path, help='previous compiler candidate')
parser.add_argument('--output', type=Path, required=True)
parser.add_argument('--objdump', default='llvm-objdump')
parser.add_argument('--samples', type=int, default=6)
args = parser.parse_args()
if args.samples < 2:
    parser.error('--samples must be at least 2')
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
fixture = S / 'benchmarks/compiler-gaps/avec-get.coil'
runner = S / 'benchmarks/compiler-gaps/avec-get-runner.coil'
fixture_bytes = fixture.read_bytes()
runner_bytes = runner.read_bytes()
for _, c, _ in cases:
    assert (c.parents[2] / 'src/stdlib/avec.coil').read_bytes() == (R / 'src/stdlib/avec.coil').read_bytes()
run([C, 'emit-obj', runner, '--backend', 'llvm', '-O3', '--no-debug', '-o', D / 'runner.o'])
rows = []
for n, c, b in cases:
    p = run([c, 'emit-obj', fixture, '--backend', b, '-O3', '--no-debug', '-o', D / (n + '.o')])
    (D / (n + '-compile.log')).write_text(p.stdout + p.stderr)
    rec = [l.split('\t') for l in p.stderr.splitlines() if l.startswith('coil-codegen\t')]
    assert rec
    run(['cc', D / 'runner.o', D / (n + '.o'), '-o', D / n])
    run([D / n])
    asm = run([args.objdump, '-d', '--no-show-raw-insn', D / (n + '.o')]).stdout
    (D / (n + '.asm')).write_text(asm)
    rows.append({'name': n, 'codegen_diagnostic_s': sum((int(x[3]) for x in rec)) / 1000000000.0, 'object_bytes': (D / (n + '.o')).stat().st_size, 'wall_samples_s': [], 'cpu_samples_s': []})
for turn in range(args.samples + 1):
    for row in rows if turn % 2 == 0 else list(reversed(rows)):
        r0 = resource.getrusage(resource.RUSAGE_CHILDREN)
        t = time.monotonic()
        run([D / row['name']])
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
report = {'runner_source_sha256': hashlib.sha256(runner_bytes).hexdigest(), 'compilers': {n: str(c) for n, c, _ in cases}, 'samples': args.samples, 'rounds': 20000000, 'checksum': 859763163008, 'runner_sha256': hashlib.sha256((D / 'runner.o').read_bytes()).hexdigest(), 'fixture_sha256': hashlib.sha256(fixture.read_bytes()).hexdigest(), 'rows': rows, 'qualification': 'One identical LLVM-built opaque runner; exact checksum checked by runner exit. Rotating samples after excluded warmup; caches disabled, serial codegen. Single generation diagnostic, not compiler bootstrap acceptance.'}
(D / 'results.json').write_text(json.dumps(report, indent=2) + '\n')
print(json.dumps(rows), flush=True)

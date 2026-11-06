#!/usr/bin/env python3
"""Paired real-emitter component diagnostic, with an unchanged opaque caller.

Run only after builds/tests stop. This is not whole-bootstrap acceptance.
"""
import argparse
import hashlib
import json
import os
from pathlib import Path
import resource
import statistics
import subprocess
import time

p = argparse.ArgumentParser(description=__doc__)
p.add_argument('--baseline', type=Path, required=True)
p.add_argument('--candidate', type=Path, required=True)
p.add_argument('--caller-object', type=Path, required=True)
p.add_argument('--output', type=Path, required=True)
a = p.parse_args()
root = Path(__file__).resolve().parents[3]
fixture = root / 'docs/benchmarks/class-register-choice/emitter/kernel.coil'
output = a.output.resolve()
output.mkdir(parents=True, exist_ok=True)
env = {k: v for k, v in os.environ.items() if not k.startswith('COIL_')}
env.update(COIL_LIBRARY_STATE='0', COIL_TPDE_SERIAL='1', COIL_CODEGEN_TIMINGS='1')


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def run(cmd):
    before = resource.getrusage(resource.RUSAGE_CHILDREN)
    start = time.monotonic()
    result = subprocess.run(list(map(str, cmd)), cwd=root, env=env,
                            capture_output=True, text=True, timeout=180)
    wall = time.monotonic() - start
    after = resource.getrusage(resource.RUSAGE_CHILDREN)
    if result.returncode:
        raise RuntimeError(f'{cmd}: {result.returncode}\n{result.stdout}{result.stderr}')
    return result, wall, (after.ru_utime + after.ru_stime - before.ru_utime - before.ru_stime)


rows = []
answers = None
for backend in ['stogir', 'llvm']:
    for label, compiler in [('before', a.baseline.resolve()), ('after', a.candidate.resolve())]:
        name = f'{backend}-{label}'
        obj = output / (name + '.o')
        result, wall, cpu = run([compiler, 'emit-obj', fixture, '--backend', backend,
                                 '-O3', '--no-debug', '-o', obj])
        (output / (name + '-generation.txt')).write_text(result.stdout + result.stderr)
        records = [line.split('\t') for line in result.stderr.splitlines()
                   if line.startswith('coil-codegen\t')]
        if not records:
            raise RuntimeError('missing code generation phase timings')
        exe = output / name
        run(['cc', obj, a.caller_object.resolve(), '-lm', '-o', exe])
        result, _, _ = run([exe])  # warmup and correctness
        if answers is None:
            answers = result.stdout
        assert result.stdout == answers, (name, result.stdout, answers)
        (output / (name + '-answers.txt')).write_text(result.stdout)
        rows.append(dict(name=name, compiler=str(compiler), compiler_sha256=sha(compiler),
                         backend=backend, object_sha256=sha(obj), object_bytes=obj.stat().st_size,
                         generation_s=sum(int(r[3]) for r in records) / 1e9,
                         whole_emit_wall_s=wall, whole_emit_cpu_s=cpu, cpu=[], wall=[]))
        print(name, 'compiled and execution answers verified', flush=True)

for turn in range(8):
    for row in (rows if turn % 2 == 0 else list(reversed(rows))):
        result, wall, cpu = run([output / row['name']])
        assert result.stdout == answers
        row['cpu'].append(cpu)
        row['wall'].append(wall)
    print('runtime round', turn + 1, flush=True)
for row in rows:
    row['median_cpu_s'] = statistics.median(row['cpu'])
    row['median_wall_s'] = statistics.median(row['wall'])
report = dict(note='Real emitter component only. One generation sample, eight rotating runtime samples; no whole-bootstrap acceptance.',
              fixture_sha256=sha(fixture), caller_object_sha256=sha(a.caller_object.resolve()), rows=rows)
(output / 'results.json').write_text(json.dumps(report, indent=2) + '\n')
print(json.dumps([{k: row[k] for k in ['name', 'generation_s', 'median_cpu_s']} for row in rows], indent=2))

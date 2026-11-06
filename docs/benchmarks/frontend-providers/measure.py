#!/usr/bin/env python3
"""Actual provider closure, with one opaque clang O3 caller for all targets."""
import argparse
import hashlib
import json
import os
from pathlib import Path
import resource
import statistics
import subprocess
import time

ROOT = Path(__file__).resolve().parent
p = argparse.ArgumentParser(description=__doc__)
p.add_argument('--compiler', type=Path, default=ROOT / '../../../build/bin/coil-candidate')
p.add_argument('--baseline', type=Path)
p.add_argument('--output', type=Path, default=ROOT / '../../../build/frontend-providers')
a = p.parse_args()
output = a.output.resolve()
output.mkdir(parents=True, exist_ok=True)
versions = [('after', a.compiler.resolve())]
if a.baseline:
    versions.insert(0, ('before', a.baseline.resolve()))
env = {k: v for k, v in os.environ.items() if not k.startswith('COIL_')}
env.update(COIL_LIBRARY_STATE='0', COIL_TPDE_SERIAL='1', COIL_CODEGEN_TIMINGS='1')


def run(command):
    before = resource.getrusage(resource.RUSAGE_CHILDREN)
    start = time.monotonic()
    r = subprocess.run(list(map(str, command)), cwd=ROOT, env=env,
                       capture_output=True, text=True, timeout=180)
    wall = time.monotonic() - start
    after = resource.getrusage(resource.RUSAGE_CHILDREN)
    if r.returncode:
        raise RuntimeError(f'{command}: exit{r.returncode}\n{r.stdout}{r.stderr}')
    return r, wall, after.ru_utime + after.ru_stime - before.ru_utime - before.ru_stime


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def answer(stdout):
    fields = stdout.split()
    assert fields[0] == 'answers' and int(fields[1]) == 100000 and fields[2] == 'kernel_cpu_ns'
    return int(fields[3]) / 1e9


caller = output / 'runner.o'
clang = Path(subprocess.check_output(['llvm-config', '--bindir'], text=True).strip()) / 'clang'
r, _, _ = run([clang, '-O3', '-c', 'runner.c', '-o', caller])
(output / 'caller-generation.txt').write_text(r.stdout + r.stderr)
rows = []
for backend in ['stogir', 'llvm']:
    for label, compiler in versions:
        name = backend + '-' + label
        obj, exe = output / (name + '.o'), output / name
        r, wall, cpu = run([compiler, 'emit-obj', 'kernel.coil', '--backend', backend,
                           '-O3', '--no-debug', '-o', obj])
        (output / (name + '-generation.txt')).write_text(r.stdout + r.stderr)
        phases = [line.split('\t') for line in r.stderr.splitlines() if line.startswith('coil-codegen\t')]
        assert phases
        run(['cc', obj, caller, '-lm', '-o', exe])
        r, _, _ = run([exe])  # excluded warmup and independent expected count
        answer(r.stdout)
        (output / (name + '-answers.txt')).write_text(r.stdout)
        rows.append(dict(name=name, backend=backend, label=label, compiler=str(compiler),
                         compiler_sha256=sha(compiler), object_sha256=sha(obj), object_bytes=obj.stat().st_size,
                         generation_s=sum(int(x[3]) for x in phases)/1e9, whole_emit_wall_s=wall,
                         whole_emit_cpu_s=cpu, wall=[], cpu=[], process_cpu=[], raw_answers=[]))
        print(name, 'built, independent expected closure count verified', flush=True)
for turn in range(8):
    for row in (rows if turn % 2 == 0 else list(reversed(rows))):
        r, wall, cpu = run([output / row['name']])
        row['cpu'].append(answer(r.stdout))
        row['raw_answers'].append(r.stdout)
        row['wall'].append(wall)
        row['process_cpu'].append(cpu)
    print('runtime round', turn + 1, flush=True)
for row in rows:
    row['median_cpu_s'] = statistics.median(row['cpu'])
    row['median_wall_s'] = statistics.median(row['wall'])
report = dict(caller_sha256=sha(caller),
              inputs={path.name: sha(path) for path in [*ROOT.glob('*.coil'), ROOT/'runner.c', ROOT/'Coil.toml']},
              rows=rows, qualification='Diagnostic only: same current source, opaque C caller controls construction parameters; create/release excluded from kernel process-CPU timer; excluded warmup and eight alternating runtime samples. Not whole-bootstrap acceptance.')
(output / 'results.json').write_text(json.dumps(report, indent=2) + '\n')
print(json.dumps([{k: row[k] for k in ['name', 'generation_s', 'median_cpu_s']} for row in rows], indent=2))

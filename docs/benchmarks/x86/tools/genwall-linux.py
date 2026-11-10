#!/usr/bin/env python3
"""genwall-linux.py [options] ROOT ROUNDS name=COMPILER:BACKEND ...

The generation goal on x86-64 Linux. The named candidates alternate, each
compiling ROOT's src/compiler/main.coil at -O3 --no-debug with its backend.
Per round and candidate, two runs:

  build   `COMPILER build` with default threads, linked as the normal Linux build
          is. Records generation wall time (from --timings spans; see
          benchlib.generation_wall), the wall time of the whole command, peak RSS
          (GNU time -v) and the sha256 of the executable. `build` and not
          `emit-obj`, because only `build` runs LLVM's partitions in parallel:
          `emit-obj --backend llvm` optimizes one module on one thread.
  serial  `COMPILER emit-obj` under COIL_TPDE_SERIAL=1 COIL_CODEGEN_TIMINGS=1.
          Records serial generation CPU (the backend's coil-codegen records
          summed) and the sha256 of the object.

Prints minimum and median per candidate, ratios against the first candidate, and
whether each candidate's executables and objects were identical run to run.

  --out DIR        logs, outputs and results.json (default ./genwall-out)
  --emit-only      the default-thread run is `emit-obj` (no link) and its object
                   is hashed; an llvm candidate is then not partitioned
  --no-serial      skip the serial runs
  --env NAME=VALUE added to every run's environment (repeatable)
"""
import argparse
import json
import subprocess
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import benchlib

p = argparse.ArgumentParser(usage=__doc__)
p.add_argument('root', type=Path)
p.add_argument('rounds', type=int)
p.add_argument('candidates', nargs='+')
p.add_argument('--out', type=Path, default=Path('genwall-out'))
p.add_argument('--emit-only', action='store_true')
p.add_argument('--no-serial', action='store_true')
p.add_argument('--env', action='append', default=[])
a = p.parse_args()
root = a.root.resolve()
out = a.out.resolve()
out.mkdir(parents=True, exist_ok=True)
source = 'src/compiler/main.coil'
assert (root / source).is_file(), f'{root} is not a Coil checkout'
cands = []
for item in a.candidates:
    name, eq, rest = item.partition('=')
    compiler, colon, backend = rest.rpartition(':')
    if not (eq and colon and name and compiler and backend):
        raise SystemExit(f'not name=COMPILER:BACKEND: {item}')
    compiler = Path(compiler).resolve()
    assert compiler.is_file(), f'no compiler at {compiler}'
    cands.append((name, compiler, backend))
assert len({c[0] for c in cands}) == len(cands), 'candidate names must differ'
extra = benchlib.parse_settings(a.env, '--env')
libdir = subprocess.check_output(['llvm-config-21', '--libdir'], text=True).strip()
link_flags = [f for flag in ['-L' + libdir, '-Wl,-rpath,' + libdir, '-lLLVM', '-lm']
              for f in ('--link-flag', flag)]
env_default = benchlib.clean_env(COIL_LIBRARY_STATE='0', **extra)
env_serial = benchlib.clean_env(COIL_LIBRARY_STATE='0', COIL_TPDE_SERIAL='1',
                                COIL_CODEGEN_TIMINGS='1', **extra)
before = benchlib.host_state()
print('host:', benchlib.describe_host(before), flush=True)
rows = {name: [] for name, _, _ in cands}
for i in range(a.rounds):
    for name, compiler, backend in (cands if i % 2 == 0 else cands[::-1]):
        common = [source, '--backend', backend, '-O3', '--no-debug', '--timings']
        prefix = out / f'{name}.{i}.default'
        if a.emit_only:
            artifact = out / f'{name}.default.o'
            command = [str(compiler), 'emit-obj'] + common + ['-o', str(artifact)]
        else:
            artifact = out / f'{name}.bin'
            command = [str(compiler), 'build'] + common + ['-o', str(artifact)] + link_flags
        row = benchlib.timed_run(command, root, env_default, prefix)
        text = benchlib.output_text(prefix)
        row['generation_wall_s'], row['generation_spans'] = benchlib.generation_wall(backend, text)
        row['load_after'] = benchlib.host_state()['load'][0]
        row['artifact_sha256'] = benchlib.sha256(artifact)
        line = '%-10s %d  generation wall %7.3f s  command wall %7.2f s  rss %5.0f MB' % (
            name, i, row['generation_wall_s'], row['wall_s'], row['maxrss_kb'] / 1024)
        if not a.no_serial:
            prefix = out / f'{name}.{i}.serial'
            obj = out / f'{name}.serial.o'
            serial = benchlib.timed_run(
                [str(compiler), 'emit-obj'] + common + ['-o', str(obj)], root, env_serial, prefix)
            row['serial_generation_s'], row['serial_other_s'] = \
                benchlib.serial_generation(backend, benchlib.output_text(prefix))
            row['serial_wall_s'] = serial['wall_s']
            row['serial_object_sha256'] = benchlib.sha256(obj)
            line += '  serial generation %7.3f s' % row['serial_generation_s']
        rows[name].append(row)
        print(line + '  (load %.2f)' % row['load_after'], flush=True)
after = benchlib.host_state()
(out / 'results.json').write_text(json.dumps(dict(
    root=str(root), rounds=a.rounds, emit_only=a.emit_only, env=extra,
    candidates=[dict(name=n, compiler=str(c), compiler_sha256=benchlib.sha256(c), backend=b)
                for n, c, b in cands],
    host_before=before, host_after=after, rows=rows), indent=2) + '\n')

print()
print('host after:', benchlib.describe_host(after))
kind = 'emit-obj (no link)' if a.emit_only else 'build (with link)'
metrics = [('generation wall s', 'generation_wall_s'), (f'{kind} wall s', 'wall_s'),
           ('peak RSS MB', 'maxrss_kb')]
if not a.no_serial:
    metrics.insert(1, ('serial generation s', 'serial_generation_s'))
first = cands[0][0]
for label, key in metrics:
    scale = 1 / 1024 if key == 'maxrss_kb' else 1
    base = None
    print(f'{label}:')
    for name, _, backend in cands:
        low, median = benchlib.low_median([r[key] * scale for r in rows[name]])
        base = base or (low, median)
        print('  %-10s %-7s min %9.3f  median %9.3f   vs %s: min x%.3f median x%.3f (%s is %.2fx / %.2fx this)'
              % (name, backend, low, median, first, low / base[0], median / base[1],
                 first, base[0] / low, base[1] / median))
for name, _, backend in cands:
    spans = {' + '.join(r['generation_spans']) for r in rows[name]}
    print('%-10s generation wall = %s' % (name, '; '.join(sorted(spans))))
    if backend == 'llvm' and any('backend.parallel.workers' not in s for s in spans):
        print('%-10s NOTE: LLVM ran one module on one thread, not parallel partitions' % name)
    builds = {r['artifact_sha256'] for r in rows[name]}
    print('%-10s %s: %s' % (name, 'objects' if a.emit_only else 'executables',
                            'identical run to run' if len(builds) == 1 else 'DIFFER (%d distinct)' % len(builds)))
    if not a.no_serial:
        objects = {r['serial_object_sha256'] for r in rows[name]}
        print('%-10s serial objects: %s %s' % (
            name, 'identical run to run' if len(objects) == 1 else 'DIFFER (%d distinct)' % len(objects),
            sorted(objects)[0][:16]))
print('results:', out / 'results.json')

#!/usr/bin/env python3
"""runtime-ab-linux.py [options] ROOT ROUNDS OUTDIR name=HOSTCOMPILER ...

The runtime goal on x86-64 Linux. Each named host compiler (the same compiler
source built by different backends: see mkhost-linux.sh) does the same work:
`emit-obj` of ROOT's src/compiler/main.coil with one fixed backend and settings,
under COIL_LIBRARY_STATE=0 COIL_TPDE_SERIAL=1 (serial code generation, so thread
scheduling does not blur the counts; the macOS ab.py fixes the same two). Hosts
alternate each round. Per run: cycles and instructions (perf stat, user+kernel
and user only), user+system CPU time and peak RSS (GNU time -v), wall time.

Every host must write the identical object; the script fails if they do not.
Prints minimum and median cycles per host and ratios against the first host.
Without usable perf counters it says so and compares CPU time instead.

  --emit-args 'ARGS'  the fixed work (default: --backend tpde -O3 --no-debug)
  --env NAME=VALUE    added to every run's environment (repeatable)
  --cpu N             pin every run to CPU N with taskset
"""
import argparse
import json
import shlex
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import benchlib

p = argparse.ArgumentParser(usage=__doc__)
p.add_argument('root', type=Path)
p.add_argument('rounds', type=int)
p.add_argument('outdir', type=Path)
p.add_argument('hosts', nargs='+')
p.add_argument('--emit-args', default='--backend tpde -O3 --no-debug')
p.add_argument('--env', action='append', default=[])
p.add_argument('--cpu', type=int)
a = p.parse_args()
root = a.root.resolve()
out = a.outdir.resolve()
out.mkdir(parents=True, exist_ok=True)
source = 'src/compiler/main.coil'
assert (root / source).is_file(), f'{root} is not a Coil checkout'
hosts = []
for item in a.hosts:
    name, eq, host = item.partition('=')
    if not (eq and name and host):
        raise SystemExit(f'not name=HOSTCOMPILER: {item}')
    host = Path(host).resolve()
    assert host.is_file(), f'no compiler at {host}'
    hosts.append((name, host))
assert len({h[0] for h in hosts}) == len(hosts), 'host names must differ'
extra = benchlib.parse_settings(a.env, '--env')
env = benchlib.clean_env(COIL_LIBRARY_STATE='0', COIL_TPDE_SERIAL='1', **extra)
work = shlex.split(a.emit_args)
perf, why = benchlib.perf_usable()
if not perf:
    print('=' * 78)
    print('NO PERF COUNTERS:', why)
    print('CYCLES AND INSTRUCTIONS ARE NOT MEASURED. The ratios below are user+system')
    print('CPU TIME, which frequency scaling and load move; they do not settle the goal.')
    print('=' * 78, flush=True)
before = benchlib.host_state()
print('host:', benchlib.describe_host(before))
print('work: emit-obj', source, *work, '(COIL_TPDE_SERIAL=1%s)' % (
    '' if a.cpu is None else f', pinned to cpu {a.cpu}'), flush=True)
rows = {name: [] for name, _ in hosts}
for i in range(a.rounds):
    for name, host in (hosts if i % 2 == 0 else hosts[::-1]):
        obj = out / f'{name}.o'
        row = benchlib.timed_run([str(host), 'emit-obj', source] + work + ['-o', str(obj)],
                                 root, env, out / f'{name}.{i}', perf=perf, cpu=a.cpu)
        row['object_sha256'] = benchlib.sha256(obj)
        row['load_after'] = benchlib.host_state()['load'][0]
        rows[name].append(row)
        counts = 'cycles %7.2fB  ins %7.2fB  user cycles %7.2fB  ' % (
            row['cycles'] / 1e9, row['instructions'] / 1e9, row['cycles:u'] / 1e9) if perf else ''
        print('%-10s %d  %scpu %6.2f s  wall %6.2f s  rss %5.0f MB  (load %.2f)' % (
            name, i, counts, row['cpu_s'], row['wall_s'], row['maxrss_kb'] / 1024,
            row['load_after']), flush=True)
after = benchlib.host_state()
digests = {name: sorted({r['object_sha256'] for r in rows[name]}) for name, _ in hosts}
(out / 'results.json').write_text(json.dumps(dict(
    root=str(root), rounds=a.rounds, work=work, env=extra, cpu=a.cpu, perf=perf,
    hosts=[dict(name=n, compiler=str(h), compiler_sha256=benchlib.sha256(h)) for n, h in hosts],
    host_before=before, host_after=after, object_sha256=digests, rows=rows), indent=2) + '\n')

print()
print('host after:', benchlib.describe_host(after))
metrics = [('cpu s (user+sys)', 'cpu_s', 1), ('wall s', 'wall_s', 1), ('peak RSS MB', 'maxrss_kb', 1 / 1024)]
if perf:
    metrics = [('cycles B (user+kernel)', 'cycles', 1e-9), ('cycles B (user)', 'cycles:u', 1e-9),
               ('instructions B (user+kernel)', 'instructions', 1e-9)] + metrics
first = hosts[0][0]
for label, key, scale in metrics:
    base = None
    print(f'{label}:')
    for name, _ in hosts:
        low, median = benchlib.low_median([r[key] * scale for r in rows[name]])
        base = base or (low, median)
        print('  %-10s min %9.3f  median %9.3f   vs %s: min x%.4f  median x%.4f'
              % (name, low, median, first, low / base[0], median / base[1]))
if perf:
    scaled = [(n, r[e + ' running%']) for n, _ in hosts for r in rows[n]
              for e in benchlib.PERF_EVENTS if r[e + ' running%'] < 100]
    if scaled:
        print('WARNING: perf multiplexed counters in %d readings (lowest %.1f%% running); those counts are estimates'
              % (len(scaled), min(s[1] for s in scaled)))
else:
    print('NO PERF COUNTERS: the first table above is CPU time, not cycles.')
print('results:', out / 'results.json')
distinct = {d for ds in digests.values() for d in ds}
if len(distinct) != 1:
    for name, _ in hosts:
        print('%-10s wrote %s' % (name, ' '.join(d[:16] for d in digests[name])))
    sys.exit('FAIL: the hosts did not all write the same object; they did not do the same work')
print('objects identical across hosts and rounds:', next(iter(distinct)))

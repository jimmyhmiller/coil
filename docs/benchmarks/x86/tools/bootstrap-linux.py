#!/usr/bin/env python3
"""Same-source whole-bootstrap diagnostic on x86-64 Linux; serial whole-source
emits, not acceptance. The port of docs/benchmarks/private-call-module/bootstrap.py.

The candidate compiler emits ROOT's compiler with the native backend (the seed
object) and with LLVM. Each object is linked into a host (link-host-linux.sh).
Each host then emits the compiler with the native backend again and must
reproduce the seed object exactly. The seed rows give generation time; the
native-* rows are the same work done by differently built hosts, the runtime
comparison.

Different from the macOS original only in mechanics: GNU `time -v` for peak RSS,
the Linux link line, cycles and instructions from `perf stat` when it is
permitted, ROOT and the native backend as options, and a compiler without a
`.toolchain` stamp is refused unless --unstamped-compiler is given.
"""
from pathlib import Path
import argparse
import json
import os
import subprocess
import sys

TOOLS = Path(__file__).resolve().parent
sys.path.insert(0, str(TOOLS))
import benchlib

p = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
p.add_argument('--root', type=Path, required=True, help='the Coil checkout whose compiler is built')
p.add_argument('--compiler', type=Path, required=True)
p.add_argument('--output', type=Path, required=True)
p.add_argument('--native-backend', default='stogir', help='stogir (default), or tpde / x64')
p.add_argument('--baseline', type=Path, help='optional previous compiler, same current source')
p.add_argument('--native-only', action='store_true', help='no LLVM seed and host')
p.add_argument('--resume', action='store_true', help='reuse verified completed rows from results.json')
p.add_argument('--unstamped-compiler', action='store_true',
               help='accept a compiler with no .toolchain stamp (its sources are then unverified)')
a = p.parse_args()
ROOT = a.root.resolve()
assert (ROOT / 'src/compiler/main.coil').is_file(), f'{ROOT} is not a Coil checkout'
sys.path.insert(0, str(ROOT / 'scripts/compiler'))
import toolchain_stamp

native = a.native_backend
compiler = a.compiler.resolve()
output = a.output.resolve()
output.mkdir(parents=True, exist_ok=True)
identity = toolchain_stamp.digest(ROOT)
stamp = compiler.with_name(compiler.name + '.toolchain')
if stamp.exists():
    assert stamp.read_text().splitlines()[0] == identity, 'the compiler was built from other sources'
    stamped = True
elif a.unstamped_compiler:
    stamped = False
    print(f'WARNING: {compiler} has no .toolchain stamp; not verified to be built from {ROOT}', flush=True)
else:
    raise SystemExit(f'{stamp} is missing; pass --unstamped-compiler to measure it anyway')
ENV = benchlib.clean_env(COIL_LIBRARY_STATE='0', COIL_TPDE_SERIAL='1', COIL_CODEGEN_TIMINGS='1')
perf, why_no_perf = benchlib.perf_usable()
if not perf:
    print('NO PERF COUNTERS (%s): rows carry CPU time only, no cycles or instructions' % why_no_perf, flush=True)


def snapshot():
    result = subprocess.run(['ps', '-A', '-o', 'pid=,pcpu=,comm='], capture_output=True,
                            text=True, check=True)
    rows = []
    for line in result.stdout.splitlines():
        parts = line.strip().split(None, 2)
        if len(parts) == 3:
            rows.append(dict(pid=int(parts[0]), cpu_percent=float(parts[1]),
                             name=Path(parts[2]).name))
    return dict(load=os.getloadavg(), processes=sorted(rows, key=lambda r: r['cpu_percent'], reverse=True)[:12])


report = dict(source_head=subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=ROOT, text=True).strip(),
              sdk_sha256=identity, seed_sha256=benchlib.sha256(compiler), compiler_stamped=stamped,
              native_backend=native, perf_counters=perf, host=benchlib.host_state(), rows=[],
              qualification='Single diagnostic per backend/host, no warmup or repeated medians. Same frozen source/SDK; caches off, serial O3/no-debug. Not performance acceptance.')


if a.resume:
    previous = json.loads((output / 'results.json').read_text())
    assert previous['sdk_sha256'] == identity and previous['seed_sha256'] == benchlib.sha256(compiler)
    assert previous['native_backend'] == native
    report = previous
elif (output / 'results.json').exists():
    raise RuntimeError('completed results already exist; use --resume or a fresh output')


def emit(name, host, backend):
    assert toolchain_stamp.digest(ROOT) == identity, 'source changed'
    obj = output / (name + '.o')
    previous = next((r for r in report['rows'] if r['name'] == name), None)
    if previous:
        assert previous['compiler_sha256'] == benchlib.sha256(host) and previous['backend'] == backend
        completed_object = Path(previous['object'])
        assert completed_object.is_file() and benchlib.sha256(completed_object) == previous['object_sha256']
        print(name, 'reusing verified completed row', flush=True)
        return completed_object
    command = [str(host), 'emit-obj', str(ROOT / 'src/compiler/main.coil'),
               '--backend', backend, '-O3', '--no-debug', '-o', str(obj)]
    before = snapshot()
    run = benchlib.timed_run(command, ROOT, ENV, output / name, perf=perf, timeout=600)
    generation, other = benchlib.serial_generation(backend, Path(str(output / name) + '.stderr').read_text())
    row = dict(name=name, command=run['command'], object=str(obj), compiler=str(host),
               compiler_sha256=benchlib.sha256(host), backend=backend,
               generation_s=generation, metaprogram_jit_s=other, wall_s=run['wall_s'],
               cpu_s=run['cpu_s'], rss_bytes=run['maxrss_kb'] * 1024,
               cycles=run.get('cycles'), instructions=run.get('instructions'),
               object_sha256=benchlib.sha256(obj), object_bytes=obj.stat().st_size,
               host_before=before, host_after=snapshot())
    report['rows'].append(row)
    (output / 'progress.json').write_text(json.dumps(report, indent=2) + '\n')
    print(name, 'generation', row['generation_s'], 'wall', row['wall_s'], 'cpu', row['cpu_s'],
          'cycles', row['cycles'], flush=True)
    return obj


hosts = {}
seeds = [(native, native, compiler)] + ([] if a.native_only else [('llvm', 'llvm', compiler)])
if a.baseline:
    seeds.append(('baseline', native, a.baseline.resolve()))
for label, backend, seed in seeds:
    obj = emit('seed-' + label, seed, backend)
    prefix = output / ('host-' + label)
    binary = prefix / 'bin/coil'
    if not binary.exists():
        subprocess.run([str(TOOLS / 'link-host-linux.sh'), str(ROOT), str(obj), str(prefix)],
                       env=benchlib.clean_env(), check=True)
    hosts[label] = binary
for label, host in hosts.items():
    obj = emit('native-' + label, host, native)
    assert benchlib.sha256(obj) == report['rows'][0]['object_sha256'], 'generated host changed emitted machine code'
assert toolchain_stamp.digest(ROOT) == identity
(output / 'results.json').write_text(json.dumps(report, indent=2) + '\n')
print(f'all generated hosts reproduce the exact seed {native} object', flush=True)
print('%-16s %-7s %12s %8s %8s %10s %10s %8s' % (
    'row', 'backend', 'generation s', 'wall s', 'cpu s', 'cycles B', 'ins B', 'rss MB'))
for row in report['rows']:
    count = lambda v: '%10.2f' % (v / 1e9) if v is not None else '%10s' % 'no perf'
    print('%-16s %-7s %12.3f %8.2f %8.2f %s %s %8.0f' % (
        row['name'], row['backend'], row['generation_s'], row['wall_s'], row['cpu_s'],
        count(row['cycles']), count(row['instructions']), row['rss_bytes'] / 2**20))

#!/usr/bin/env python3
"""Same-source whole-bootstrap diagnostic; serial whole-source emits, not acceptance."""
from pathlib import Path
import argparse
import hashlib
import json
import os
import re
import resource
import shutil
import subprocess
import sys
import time

ROOT = Path(__file__).resolve().parents[3]
sys.path.insert(0, str(ROOT / 'scripts/compiler'))
import toolchain_stamp

p = argparse.ArgumentParser(description=__doc__)
p.add_argument('--compiler', type=Path, required=True)
p.add_argument('--output', type=Path, required=True)
p.add_argument('--baseline', type=Path, help='optional previous compiler, same current source')
p.add_argument('--stogir-only', action='store_true')
p.add_argument('--resume', action='store_true', help='reuse verified completed rows from results.json')
a = p.parse_args()
compiler = a.compiler.resolve()
output = a.output.resolve()
output.mkdir(parents=True, exist_ok=True)
identity = toolchain_stamp.digest(ROOT)
assert compiler.with_name(compiler.name + '.toolchain').read_text().splitlines()[0] == identity
ENV = {k: v for k, v in os.environ.items() if not k.startswith('COIL_')}
ENV.update(COIL_LIBRARY_STATE='0', COIL_TPDE_SERIAL='1', COIL_CODEGEN_TIMINGS='1')


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


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
              sdk_sha256=identity, seed_sha256=sha(compiler), rows=[],
              qualification='Single diagnostic per backend/host, no warmup or repeated medians. Same frozen source/SDK; caches off, serial O3/no-debug. Not performance acceptance.')


if a.resume:
    previous = json.loads((output / 'results.json').read_text())
    assert previous['sdk_sha256'] == identity and previous['seed_sha256'] == sha(compiler)
    report = previous
elif (output / 'results.json').exists():
    raise RuntimeError('completed results already exist; use --resume or a fresh output')


def emit(name, host, backend):
    assert toolchain_stamp.digest(ROOT) == identity, 'source changed'
    obj = output / (name + '.o')
    previous = next((r for r in report['rows'] if r['name'] == name), None)
    if previous:
        assert previous['compiler_sha256'] == sha(host) and previous['backend'] == backend
        completed_object = Path(previous['command'][-1])
        assert completed_object.is_file() and sha(completed_object) == previous['object_sha256']
        print(name, 'reusing verified completed row', flush=True)
        return completed_object
    command = ['/usr/bin/time', '-l', str(host), 'emit-obj', str(ROOT / 'src/compiler/main.coil'),
               '--backend', backend, '-O3', '--no-debug', '-o', str(obj)]
    before = snapshot()
    r0 = resource.getrusage(resource.RUSAGE_CHILDREN)
    started = time.monotonic()
    with (output / (name + '.stdout')).open('w') as stdout, (output / (name + '.stderr')).open('w') as stderr:
        result = subprocess.run(command, cwd=ROOT, env=ENV, stdout=stdout, stderr=stderr, timeout=600)
    elapsed = time.monotonic() - started
    r1 = resource.getrusage(resource.RUSAGE_CHILDREN)
    if result.returncode:
        raise RuntimeError(f'{name}: exit{result.returncode}; inspect {output / (name + ".stderr")}')
    text = (output / (name + '.stderr')).read_text()
    records = [line.split('\t') for line in text.splitlines() if line.startswith('coil-codegen\t')]
    assert records, 'no phase timings'
    rss = re.search(r'(\d+)\s+maximum resident set size', text)
    row = dict(name=name, command=command, compiler=str(host), compiler_sha256=sha(host), backend=backend,
               generation_s=sum(int(r[3]) for r in records)/1e9, wall_s=elapsed,
               cpu_s=r1.ru_utime+r1.ru_stime-r0.ru_utime-r0.ru_stime,
               rss_bytes=int(rss.group(1)) if rss else None,
               object_sha256=sha(obj), object_bytes=obj.stat().st_size,
               host_before=before, host_after=snapshot())
    report['rows'].append(row)
    (output / 'progress.json').write_text(json.dumps(report, indent=2) + '\n')
    print(name, 'generation', row['generation_s'], 'wall', elapsed, flush=True)
    return obj


hosts = {}
libdir = subprocess.check_output(['llvm-config', '--libdir'], text=True).strip()
archives = ROOT / 'build/bin/native/curl/arm64-macos'
seeds = [('stogir', 'stogir', compiler)] + ([] if a.stogir_only else [('llvm', 'llvm', compiler)])
if a.baseline:
    seeds.append(('baseline', 'stogir', a.baseline.resolve()))
for label, backend, seed in seeds:
    obj = emit('seed-' + label, seed, backend)
    prefix = output / ('host-' + label)
    binary = prefix / 'bin/coil'
    binary.parent.mkdir(parents=True, exist_ok=True)
    library = prefix / 'lib/coil'
    library.mkdir(parents=True, exist_ok=True)
    for library_label, source in [('stdlib', ROOT / 'src/stdlib'), ('compiler', ROOT / 'src/compiler'),
                          ('prelude.coil', ROOT / 'src/compiler/prelude.coil')]:
        target = library / library_label
        if not target.exists(): target.symlink_to(source)
    native = binary.parent / 'native'
    if not native.exists(): native.symlink_to(ROOT / 'build/bin/native')
    command = ['cc', str(obj), '-L'+libdir, '-lLLVM', '-lm']
    command += [str(archives / ('lib' + lib + '.a')) for lib in ['curl', 'mbedtls', 'mbedx509', 'mbedcrypto']]
    command += ['-framework', 'CoreFoundation', '-framework', 'SystemConfiguration', '-lz', '-Wl,-dead_strip', '-o', str(binary)]
    (output / (label + '-link-command.json')).write_text(json.dumps(command, indent=2) + '\n')
    if not binary.exists():
        subprocess.run(command, cwd=ROOT, env=ENV, check=True, capture_output=True)
    shutil.copyfile(compiler.with_name(compiler.name + '.toolchain'), binary.with_name('coil.toolchain'))
    hosts[label] = binary
for backend, host in hosts.items():
    obj = emit('native-' + backend, host, 'stogir')
    assert sha(obj) == report['rows'][0]['object_sha256'], 'generated host changed emitted machine code'
assert toolchain_stamp.digest(ROOT) == identity
(output / 'results.json').write_text(json.dumps(report, indent=2) + '\n')
print('all generated hosts reproduce the exact seed Stogir object', flush=True)

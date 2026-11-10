#!/usr/bin/env python3
"""Shared mechanics of the x86-64 Linux measurement scripts: a clean COIL_*
environment, the two definitions of generation time, and one timed run under GNU
time and (when permitted) perf stat.

As a command, for mkhost-linux.sh:
    benchlib.py wall   BACKEND FILE...   print the generation wall time of an emit
    benchlib.py serial BACKEND FILE...   print the summed coil-codegen records
"""
import hashlib
import os
import re
import shutil
import statistics
import subprocess
import sys
import time
from pathlib import Path

GNU_TIME = '/usr/bin/time'
PERF_EVENTS = ['cycles', 'instructions', 'cycles:u', 'instructions:u']
SPAN_LINE = re.compile(r'^\s*(\d+)\s+\d+%\s+(\d+)\s+(\S+)\s*$')


def clean_env(**settings):
    """The caller's environment without any COIL_* variable, plus `settings`."""
    env = {k: v for k, v in os.environ.items() if not k.startswith('COIL_')}
    env.update(settings)
    return env


def parse_settings(items, what):
    settings = {}
    for item in items:
        name, eq, value = item.partition('=')
        if not eq or not re.fullmatch(r'[A-Za-z_][A-Za-z0-9_]*', name):
            raise SystemExit(f'{what}: not NAME=VALUE: {item}')
        settings[name] = value
    return settings


def sha256(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()


def spans(text):
    """`--timings` table -> {span name: milliseconds}. A name printed on several
    lines (several places in the tree) is summed."""
    found = {}
    for line in text.splitlines():
        m = SPAN_LINE.match(line)
        if m:
            found[m.group(3)] = found.get(m.group(3), 0) + int(m.group(1))
    if not found:
        raise RuntimeError('no --timings table in the output')
    return found


def generation_wall(backend, text):
    """Wall-clock seconds of code generation in one emit, from `--timings` spans,
    and the spans used.

    llvm, partitioned (the default at -O3): backend.llvm-lower (lowering to LLVM
        IR and partitioning, on one thread) + backend.parallel.workers (the
        partitions optimized and emitted on their threads, as elapsed time).
    llvm, one module: backend.llvm-lower + backend.llvm-optimize +
        backend.object-emit.
    any native backend (tpde, x64, stogir): backend.tpde-object.

    The llvm spans also count the metaprograms the front end compiles through
    LLVM's JIT while it expands and checks the program (17 small modules in the
    compiler, about 0.1 s); the table does not separate them.
    """
    table = spans(text)
    if backend == 'llvm':
        names = ['backend.llvm-lower', 'backend.parallel.workers'] \
            if 'backend.parallel.workers' in table \
            else ['backend.llvm-lower', 'backend.llvm-optimize', 'backend.object-emit']
    else:
        names = ['backend.tpde-object']
    missing = [n for n in names if n not in table]
    if missing:
        raise RuntimeError(f'--timings has no {", ".join(missing)} span for backend {backend}')
    return sum(table[n] for n in names) / 1000.0, names


def codegen_records(text):
    """COIL_CODEGEN_TIMINGS records -> {backend field: seconds}. The front end's
    JIT-compiled metaprograms report as `llvm` whatever the build's backend is."""
    sums = {}
    for line in text.splitlines():
        if line.startswith('coil-codegen\t'):
            fields = line.split('\t')
            sums[fields[1]] = sums.get(fields[1], 0) + int(fields[3])
    return {k: v / 1e9 for k, v in sums.items()}


def record_backend(backend):
    """The name a backend's coil-codegen records carry."""
    return 'tpde' if backend in ('x64', 'x86_64') else backend


def serial_generation(backend, text):
    """Seconds of IR code generation summed over the BACKEND records of a serial
    emit (COIL_TPDE_SERIAL=1 COIL_CODEGEN_TIMINGS=1), and the seconds reported
    under other names (the metaprogram JIT)."""
    records = codegen_records(text)
    name = record_backend(backend)
    if name not in records:
        raise RuntimeError(f'no coil-codegen records for {name}; got {sorted(records)}')
    return records[name], sum(v for k, v in records.items() if k != name)


def perf_usable():
    """Can this user count cycles and instructions of a child with perf stat?"""
    perf = shutil.which('perf')
    if not perf:
        return False, 'perf is not installed'
    r = subprocess.run([perf, 'stat', '-x,', '-e', 'cycles,instructions', 'true'],
                       capture_output=True, text=True)
    counted = [l for l in r.stderr.splitlines() if re.match(r'^\d+,', l)]
    if r.returncode or len(counted) != 2:
        paranoid = Path('/proc/sys/kernel/perf_event_paranoid')
        level = paranoid.read_text().strip() if paranoid.exists() else 'unknown'
        return False, f'perf stat cannot count (perf_event_paranoid={level}): {r.stderr.strip()[:200]}'
    return True, ''


def parse_perf(text):
    counts = {}
    for line in text.splitlines():
        f = line.split(',')
        if len(f) >= 5 and f[2] in PERF_EVENTS:
            if not f[0].isdigit():
                raise RuntimeError(f'perf did not count {f[2]}: {f[0]}')
            counts[f[2]] = int(f[0])
            counts[f[2] + ' running%'] = float(f[4])
    missing = [e for e in PERF_EVENTS if e not in counts]
    if missing:
        raise RuntimeError(f'perf output lacks {missing}')
    return counts


def parse_time(text):
    def one(pattern):
        m = re.search(pattern, text)
        if not m:
            raise RuntimeError(f'GNU time output lacks {pattern!r}')
        return m.group(1)
    return dict(user_s=float(one(r'User time \(seconds\): ([\d.]+)')),
                sys_s=float(one(r'System time \(seconds\): ([\d.]+)')),
                maxrss_kb=int(one(r'Maximum resident set size \(kbytes\): (\d+)')),
                exit_status=int(one(r'Exit status: (\d+)')))


def timed_run(command, cwd, env, prefix, perf=False, cpu=None, timeout=1800):
    """Run `command` under GNU time (and perf stat, and taskset to one CPU, when
    asked). Logs go to PREFIX.{stdout,stderr,time,perf}. Returns wall seconds
    (this process's monotonic clock around the whole run), user and system CPU
    seconds and peak RSS of the command, and the perf counts."""
    prefix = str(prefix)
    full = [GNU_TIME, '-v', '-o', prefix + '.time', '--']
    if cpu is not None:
        full += ['taskset', '-c', str(cpu)]
    full += list(command)
    if perf:
        full = ['perf', 'stat', '-x,', '-o', prefix + '.perf', '-e', ','.join(PERF_EVENTS), '--'] + full
    started = time.monotonic()
    with open(prefix + '.stdout', 'w') as out, open(prefix + '.stderr', 'w') as err:
        result = subprocess.run(full, cwd=cwd, env=env, stdout=out, stderr=err, timeout=timeout)
    wall = time.monotonic() - started
    if result.returncode:
        tail = Path(prefix + '.stderr').read_text()[-2000:]
        raise RuntimeError(f'exit {result.returncode}: {" ".join(full)}\n{tail}')
    row = parse_time(Path(prefix + '.time').read_text())
    row.update(wall_s=wall, cpu_s=row['user_s'] + row['sys_s'], command=full)
    if perf:
        row.update(parse_perf(Path(prefix + '.perf').read_text()))
    return row


def output_text(prefix):
    return Path(str(prefix) + '.stdout').read_text() + Path(str(prefix) + '.stderr').read_text()


def read_first(*paths):
    for p in paths:
        if Path(p).exists():
            return Path(p).read_text().strip()
    return 'unavailable'


def host_state():
    """What decides how far to trust a number taken now."""
    cpu = '/sys/devices/system/cpu'
    return dict(load=os.getloadavg(), cpus=os.cpu_count(),
                governor=read_first(f'{cpu}/cpu0/cpufreq/scaling_governor'),
                driver=read_first(f'{cpu}/cpu0/cpufreq/scaling_driver'),
                epp=read_first(f'{cpu}/cpu0/cpufreq/energy_performance_preference'),
                boost=read_first(f'{cpu}/cpufreq/boost', f'{cpu}/intel_pstate/no_turbo'),
                smt=read_first(f'{cpu}/smt/active'))


def describe_host(state):
    return ('load %.2f %.2f %.2f, %d cpus, governor %s (%s, epp %s), boost %s, smt %s'
            % (*state['load'], state['cpus'], state['governor'], state['driver'],
               state['epp'], state['boost'], state['smt']))


def low_median(values):
    return min(values), statistics.median(values)


def main(argv):
    if len(argv) < 4 or argv[1] not in ('wall', 'serial'):
        raise SystemExit(__doc__)
    text = ''.join(Path(p).read_text() for p in argv[3:])
    if argv[1] == 'wall':
        seconds, names = generation_wall(argv[2], text)
        print('generation wall %.3f s (%s)' % (seconds, ' + '.join(names)))
    else:
        seconds, other = serial_generation(argv[2], text)
        print('generation serial %.3f s (%s coil-codegen records; %.3f s more in metaprogram JIT records)'
              % (seconds, record_backend(argv[2]), other))


if __name__ == '__main__':
    main(sys.argv)

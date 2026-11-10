#!/usr/bin/env python3
"""Stogir module generation on worker threads: the object is the same bytes
for every thread count, and the thread-count settings select the documented
path."""
from pathlib import Path
import os
import subprocess
import sys
import tempfile

ROOT = Path(__file__).resolve().parents[2]
COMPILER = Path(sys.argv[1] if len(sys.argv) > 1 else os.environ['COIL']).resolve()
BASE = {key: value for key, value in os.environ.items() if not key.startswith('COIL_')}
BASE['COIL_LIBRARY_STATE'] = '0'
FUNCTIONS = 400


def program():
    """A module with enough functions of different shapes (leaves, loops,
    callers of earlier functions, a recursive one) that every worker has work
    and inline templates, emission bodies and cached leaves all occur."""
    lines = ['(module parallel.emission)', '(import "coil.arraylist" :use [ArrayList])',
             '(import "coil.alloc" :use [malloc-allocator])']
    for i in range(FUNCTIONS):
        kind = i % 5
        if i < 3 or kind == 0:
            body = f'(+ (* x {i + 3}) (- (% x {i + 7}) {i}))'
        elif kind == 1:
            body = (f'(let [(mut total) (: {i} i64)]\n'
                    f'    (for [k 0 (% x {i % 13 + 5})] (set! total (+ total (f{i - 1} (+ k x)))))\n'
                    f'    total)')
        elif kind == 2:
            body = f'(if (> x {i}) (f{i - 2} (- x 1)) (+ (f{i // 2} x) (f{i - 1} (+ x 2))))'
        elif kind == 3:
            body = (f'(let [(mut values) (ArrayList::new [i64] (malloc-allocator))\n'
                    f'        (mut total) (: 0 i64)]\n'
                    f'    (for [k 0 (+ (% x 7) 3)] (push! (mut values) (f{i - 3} (+ x k))))\n'
                    f'    (for [k 0 (len values)] (set! total (+ total (* (get values k) {i % 9 + 1}))))\n'
                    f'    (free! (mut values))\n'
                    f'    total)')
        else:
            body = f'(if (<= x 0) {i} (+ (f{i} (- x 3)) (f{i - 4} x)))'
        lines.append(f'(defn f{i} [(x i64)] (-> i64)\n  {body})')
    lines.append('(defn main [] (-> i64)\n  (let [(mut total) (: 0 i64)]\n'
                 + ''.join(f'    (set! total (+ total (f{i} {i % 11})))\n'
                           for i in range(FUNCTIONS))
                 + '    (println "{}" total)\n    0))')
    return '\n'.join(lines) + '\n'


def emit(source, output, settings, expect=0):
    result = subprocess.run([str(COMPILER), 'emit-obj', str(source), '--backend', 'stogir',
                             '-O3', '--no-debug', '-o', str(output)],
                            cwd=ROOT, env=dict(BASE, **settings),
                            capture_output=True, text=True, timeout=600)
    if expect == 0:
        assert result.returncode == 0, f'{settings}: {result.stdout}{result.stderr}'
    else:
        assert result.returncode != 0, f'{settings}: accepted'
    return result.stderr


def records(stderr):
    return sum(1 for line in stderr.splitlines() if line.startswith('coil-codegen\tstogir\t'))


with tempfile.TemporaryDirectory(prefix='stogir-parallel-') as temporary:
    directory = Path(temporary)
    generated = directory / 'generated.coil'
    generated.write_text(program())
    for source in [generated, ROOT / 'tests/cli/stogir-live-emission.coil']:
        serial = directory / 'serial.o'
        emit(source, serial, {'COIL_TPDE_SERIAL': '1'})
        expected = serial.read_bytes()
        assert expected, 'empty object'
        settings = [{'COIL_STOGIR_THREADS': str(n)} for n in (1, 2, 3, 8, 16)]
        # The default thread count, and the serial switch winning over a count.
        settings += [{}, {'COIL_TPDE_SERIAL': '1', 'COIL_STOGIR_THREADS': '8'}]
        for setting in settings:
            # Repetitions give scheduling a chance to differ.
            for attempt in range(1 if setting.get('COIL_STOGIR_THREADS') == '1' else 4):
                output = directory / 'threads.o'
                emit(source, output, setting)
                assert output.read_bytes() == expected, \
                    f'{source.name}: object differs under {setting} (attempt {attempt})'
        # Timing records are per function on the serial path and one per
        # stage on the parallel one; that also shows which path each setting
        # takes. A record of zero elapsed time is not printed, so counts of
        # the same path differ by a few.
        timings = {'COIL_CODEGEN_TIMINGS': '1'}
        output = directory / 'timed.o'
        per_function = records(emit(source, output, dict(timings, COIL_TPDE_SERIAL='1')))
        assert output.read_bytes() == expected
        assert per_function > 20, per_function
        for label, setting in [
                ('timings without an explicit thread count', {}),
                ('one thread', {'COIL_STOGIR_THREADS': '1'}),
                ('COIL_TPDE_SERIAL with a thread count',
                 {'COIL_TPDE_SERIAL': '1', 'COIL_STOGIR_THREADS': '8'})]:
            count = records(emit(source, output, dict(timings, **setting)))
            assert count * 10 >= per_function * 9, \
                f'{source.name}: {label} left the serial path ({count} of {per_function} records)'
        staged = records(emit(source, output, dict(timings, COIL_STOGIR_THREADS='4')))
        assert output.read_bytes() == expected
        assert 0 < staged and staged * 10 <= per_function * 8, \
            f'{source.name}: {staged} records with four threads, {per_function} serially'
    for invalid in ['0', '65', '-2', 'many', '']:
        message = emit(generated, directory / 'invalid.o', {'COIL_STOGIR_THREADS': invalid},
                       expect=1)
        assert 'COIL_STOGIR_THREADS' in message, message
print('stogir parallel generation: identical objects at every thread count: PASS')

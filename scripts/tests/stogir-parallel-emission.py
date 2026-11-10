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
SPECIALIZED = 16
SPECIALIZERS = 100
CYCLE = 8
WIDE = 6


def program(specialized):
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
    extra = []
    if specialized:
        # Small callees called with many different literals spend the inline
        # registry's specialization attempts, after which finalization moves
        # to worker threads; a call cycle gives it definitions that are
        # finalized before some of their callees.
        for j in range(SPECIALIZED):
            lines.append(f'(defn g{j} [(x i64) (k i64)] (-> i64)\n'
                         f'  (if (= k {j}) (+ x {j + 1}) (if (> k {j + 40}) (* x k) (- x k))))')
        for i in range(SPECIALIZERS):
            lines.append(f'(defn h{i} [(x i64)] (-> i64)\n'
                         f'  (+ (g{i % SPECIALIZED} x {i}) (g{(i + 5) % SPECIALIZED} x {i + 1000})))')
            extra.append(f'(h{i} {i % 7})')
        for i in range(CYCLE):
            lines.append(f'(defn c{i} [(x i64)] (-> i64)\n'
                         f'  (if (<= x 0) {i}\n'
                         f'      (+ (c{(i + 1) % CYCLE} (- x 1)) (f{i * 7} x) (g{i} x 3) (h{i} x))))')
            extra.append(f'(c{i} {i + 9})')
        # Functions that are never templates and are the first to need a
        # runtime routine (wide division): a planning worker cannot create its
        # assembler symbol, so their bodies are prepared again at the commit.
        for i in range(WIDE):
            lines.append(f'(defn w{i} :inline (Never) [(x i64) (d i64)] (-> i64)\n'
                         f'  (let [n (+ (cast i128 x) {i + 2}) q (/ n (cast i128 (+ d {i + 3})))]\n'
                         f'    (+ (cast i64 q) (c{i % CYCLE} 2))))')
            extra.append(f'(w{i} {i + 100} {i})')
        # The same for template candidates, which workers adapt during
        # template preparation, with another routine (unsigned remainder).
        for i in range(WIDE):
            lines.append(f'(defn v{i} [(x i64) (d i64)] (-> i64)\n'
                         f'  (cast i64 (% (+ (cast u128 x) {i + 5}) (cast u128 (+ d {i + 7})))))')
            extra.append(f'(v{i} {i + 50} {i})')
    lines.append('(defn main [] (-> i64)\n  (let [(mut total) (: 0 i64)]\n'
                 + ''.join(f'    (set! total (+ total (f{i} {i % 11})))\n'
                           for i in range(FUNCTIONS))
                 + ''.join(f'    (set! total (+ total {call}))\n' for call in extra)
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
    generated.write_text(program(False))
    closing = directory / 'closing.coil'
    closing.write_text(program(True))
    for source in [generated, closing, ROOT / 'tests/cli/stogir-live-emission.coil',
                   ROOT / 'tests/backend/stogir-shim-calls.coil']:
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
    # The closing module is finalized by workers, and only with threads.
    for setting, expected_workers in [({'COIL_STOGIR_THREADS': '4'}, True),
                                      ({'COIL_TPDE_SERIAL': '1'}, False)]:
        trace = emit(closing, directory / 'traced.o', dict(setting, COIL_TRACE='1'))
        counts = [int(line.split()[-1]) for line in trace.splitlines()
                  if line.startswith('coil-trace count stogir.finalize.workers ')]
        assert (len(counts) == 1 and counts[0] > 100) if expected_workers else not counts, \
            f'{setting}: finalization worker counts {counts}'
        # ... and its emission bodies are planned in waves on workers.
        waves = [int(line.split()[-1]) for line in trace.splitlines()
                 if line.startswith('coil-trace count stogir.plan.wave ')]
        assert (len(waves) > 1 and sum(waves) > 100) if expected_workers else not waves, \
            f'{setting}: planning waves {waves}'
        for stage in ['plan', 'prepare']:
            repeated = sum(1 for line in trace.splitlines()
                           if line.startswith(f'coil-trace count stogir.{stage}.repeated '))
            assert repeated > 0 if expected_workers else repeated == 0, \
                f'{setting}: {stage} repeated {repeated} functions'
    for invalid in ['0', '65', '-2', 'many', '']:
        message = emit(generated, directory / 'invalid.o', {'COIL_STOGIR_THREADS': invalid},
                       expect=1)
        assert 'COIL_STOGIR_THREADS' in message, message
print('stogir parallel generation: identical objects at every thread count: PASS')

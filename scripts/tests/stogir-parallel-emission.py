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


def events_program():
    """Functions whose lowering makes module symbols and data: string
    literals (some shared between functions), static cells with and without
    an initializer, method tables of trait objects, function pointers,
    runtime imports (some under names lowering composes), and reads of a
    constant def. Their numbering and the
    data's layout follow lowering order, and which functions exist at all
    follows what earlier ones refer to (a method reached only through a
    method table, a function reached only through a pointer)."""
    lines = ['(module parallel.events)', '(import "coil.primitive" :as primitive)',
             '(import "coil.math" :as math)',
             '(deftrait Shape [Self] (area [(self (ptr Self))] (-> i64)))',
             '(def scale (: 7 i64))']
    for i in range(24):
        lines.append(f'(defstruct S{i} [(side i64)])')
        lines.append(f'(impl Shape S{i} (area [(self (ptr S{i}))] (-> i64)\n'
                     f'  (+ (* (.side self) {i + 2}) (len "area of shape {i % 5}"))))')
    lines.append('(defn measure [(shape (dyn Shape))] (-> i64) (area shape))')
    for i in range(240):
        kind = i % 8
        if i < 4 or kind == 0:
            body = f'(+ x (len "text {i % 17}") (len "only in g{i}") scale)'
        elif kind == 1:
            body = (f'(let [cell (primitive/alloc-static i64)]\n'
                    f'    (store! cell (+ (load cell) x {i}))\n'
                    f'    (+ (load cell) (g{i - 1} x)))')
        elif kind == 2:
            body = (f'(let [(mut shape) (S{i % 24} :side x)]\n'
                    f'    (+ (measure (mut shape)) (g{i - 2} (+ x 1))))')
        elif kind == 3:
            body = (f'(let [target (primitive/fnptr-of g{i - 3})]\n'
                    f'    (+ (call-ptr target x) (len "text {i % 17}")))')
        elif kind == 4:
            body = (f'(let [y (cast f64 (+ x {i}))]\n'
                    f'    (+ (cast i64 (primitive/frem y 7.5)) (cast i64 (math/log2 (math/log (+ y 3.0))))\n'
                    f'       (g{i // 2} x)))')
        elif kind == 5:
            body = (f'(let [cell (primitive/alloc-static i64 {i})]\n'
                    f'    (+ (load cell) (* scale (g{i - 5} x))))')
        elif kind == 6:
            body = (f'(let [(mut first) (S{(i * 7) % 24} :side (+ x 2))\n'
                    f'        (mut second) (S{(i * 5) % 24} :side x)]\n'
                    f'    (+ (measure (mut first)) (measure (mut second)) (len "two shapes")))')
        else:
            body = f'(if (<= x 0) (len "base {i}") (+ (g{i} (- x 2)) (g{i - 4} x)))'
        lines.append(f'(defn g{i} [(x i64)] (-> i64)\n  {body})')
    lines.append('(defn main [] (-> i64)\n  (let [(mut total) (: 0 i64)]\n'
                 + ''.join(f'    (set! total (+ total (g{i} {i % 9})))\n'
                           for i in range(239, -1, -7))
                 + '    (println "{}" total)\n    0))')
    return '\n'.join(lines) + '\n'


def failing_program():
    """Many functions that lower, and three whose inline IR the native
    backends do not lower. Lowering stops at the first of them in lowering
    order, whichever thread meets one first."""
    lines = ['(module parallel.failure)', '(import "coil.primitive" :as primitive)']
    for i in range(160):
        if i in (41, 97, 133):
            body = (f'(primitive/llvm-ir i64 [x] "%r = bogusop{i} $t0 $0, 1\n'
                    f'ret $ret %r")')
        elif i < 2:
            body = f'(+ x {i})'
        else:
            body = f'(+ (h{i - 1} x) (h{i // 2} (+ x {i})) (len "h{i}"))'
        lines.append(f'(defn h{i} [(x i64)] (-> i64)\n  {body})')
    lines.append('(defn main [] (-> i64) (println "{}" (h159 3)) 0)')
    return '\n'.join(lines) + '\n'


def failing_static_program():
    """A function (k90, lowered after k37) that names static storage an earlier
    one already defined
    and then meets inline IR that cannot be lowered. Lowered serially it stops
    at the duplicate definition, which it reaches first; a worker cannot see
    the duplicate (the module is not its to read) and stops at the inline IR,
    so the backend thread must still report the duplicate."""
    lines = ['(module parallel.failure-static)', '(import "coil.primitive" :as primitive)']
    for i in range(120):
        if i == 37:
            body = ('(let [cell (primitive/alloc-static i64 :as "parallel_failure_cell")]\n'
                    f'    (+ (load cell) (k{i - 1} x)))')
        elif i == 90:
            body = ('(let [cell (primitive/alloc-static i64 :as "parallel_failure_cell")]\n'
                    '    (+ (load cell)\n'
                    '       (primitive/llvm-ir i64 [x] "%r = bogusop $t0 $0, 1\nret $ret %r")))')
        elif i < 2:
            body = f'(+ x {i})'
        else:
            body = f'(+ (k{i - 1} x) (k{i // 2} (+ x {i})) (len "k{i}"))'
        lines.append(f'(defn k{i} [(x i64)] (-> i64)\n  {body})')
    lines.append('(defn main [] (-> i64) (println "{}" (k119 3)) 0)')
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
    events = directory / 'events.coil'
    events.write_text(events_program())
    for source in [generated, closing, events, ROOT / 'tests/cli/stogir-live-emission.coil',
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
    # A function that cannot be lowered: the failure reported is the first in
    # lowering order, on every path and in every run.
    for name, text, marker in [('failing', failing_program(), 'bogusop'),
                               ('failing-static', failing_static_program(),
                                'duplicate static storage symbol')]:
        failing = directory / f'{name}.coil'
        failing.write_text(text)
        expected_failure = emit(failing, directory / 'failing.o', {'COIL_TPDE_SERIAL': '1'},
                                expect=1)
        assert marker in expected_failure, expected_failure
        for setting in [{'COIL_STOGIR_THREADS': str(n)} for n in (2, 3, 8, 16)] + [{}]:
            for attempt in range(6):
                message = emit(failing, directory / 'failing.o', setting, expect=1)
                assert message == expected_failure, \
                    (f'{name}: failure differs under {setting} (attempt {attempt}):\n'
                     f'{message}\nserial:\n{expected_failure}')
    for invalid in ['0', '65', '-2', 'many', '']:
        message = emit(generated, directory / 'invalid.o', {'COIL_STOGIR_THREADS': invalid},
                       expect=1)
        assert 'COIL_STOGIR_THREADS' in message, message
print('stogir parallel generation: identical objects at every thread count: PASS')

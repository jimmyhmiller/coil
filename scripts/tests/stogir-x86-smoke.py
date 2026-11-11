#!/usr/bin/env python3
"""First end-to-end gate of the Stogir backend on x86-64 Linux.

Compiles a few tiny programs with `--backend stogir` at -O1, -O2 and -O3 and
reports, for each program and level, whether it compiled (emit-obj), linked
(build) and ran correctly (the output and exit status of the same program
built with the LLVM backend).

While the library's x86-64 code generator is a placeholder every compile
stops at its "x86-64 backend: NAME is not implemented yet" error. That is
reported as "backend not implemented" with the library's message, and the
script exits 3. Any other failure exits 1; all programs correct exits 0.

usage: stogir-x86-smoke.py COMPILER [--target TRIPLE] [--keep DIR]

Run it on the x86-64 Linux host with a compiler built for that host (the
Stogir backend generates code for the machine the compiler was built for).
With --target the programs are compiled for TRIPLE; they are run only when
this machine is x86-64 Linux.
"""
from pathlib import Path
import argparse
import os
import platform
import re
import subprocess
import sys
import tempfile

parser = argparse.ArgumentParser(description=__doc__,
                                 formatter_class=argparse.RawDescriptionHelpFormatter)
parser.add_argument('compiler', type=Path)
parser.add_argument('--target')
parser.add_argument('--keep', type=Path, help='keep sources, objects and logs in DIR')
options = parser.parse_args()
COMPILER = options.compiler.resolve()
TARGET = ['--target', options.target] if options.target else []
RUNS_HERE = platform.system() == 'Linux' and platform.machine() == 'x86_64'
ENV = {k: v for k, v in os.environ.items() if not k.startswith('COIL_')}
ENV['COIL_LIBRARY_STATE'] = '0'
LEVELS = ('-O1', '-O2', '-O3')
NOT_IMPLEMENTED = re.compile(r'x86-64 backend: .* is not implemented yet')

PROGRAMS = {
    'hello': '''
(defn main [] (-> i64)
  (println "hello from stogir")
  0)
''',
    'loop': '''
(import "coil.args" :as args)
(defn collatz [(start i64)] (-> i64)
  (let [(mut n) start (mut steps) 0]
    (while (!= n 1)
      (set! n (if (= (% n 2) 0) (/ n 2) (+ (* n 3) 1)))
      (set! steps (+ steps 1)))
    steps))
(defn main [(argc i32) (argv (ptr (ptr i8)))] (-> i64)
  (args/init! argc argv)
  (let [(mut total) 0]
    (for [i 1 (+ 1000 (args/count))] (set! total (+ total (collatz i))))
    (println "collatz steps {}" total)
    (% total 100)))
''',
    'calls': '''
(import "coil.cc" :as cc)
(extern strlen :cc (cc/C) [(ptr i8)] (-> u64))
(extern labs :cc (cc/C) [i64] (-> i64))
(defstruct Pair [(a i64) (b i64)])
(defstruct Big [(a i64) (b i64) (c i64) (d i64)])
(defn swap :inline (Never) [(p Pair)] (-> Pair) (Pair :a (.b p) :b (.a p)))
(defn widen :inline (Never) [(p Pair) (k i64)] (-> Big)
  (Big :a (.a p) :b (.b p) :c (* k (.a p)) :d (* k (.b p))))
(defn fib :inline (Never) [(n i64)] (-> i64)
  (if (< n 2) n (+ (fib (- n 1)) (fib (- n 2)))))
(defn main [] (-> i64)
  (let [p (swap (Pair :a 3 :b 4))
        big (widen p 10)]
    (println "pair {} {} big {} {} {} {}" (.a p) (.b p) (.a big) (.b big) (.c big) (.d big))
    (println "fib {} strlen {} labs {}" (fib 20) (strlen c"seven77") (labs -12))
    0))
''',
    'floats': '''
(defn mean :inline (Never) [(xs (slice f64))] (-> f64)
  (let [(mut sum) (: 0.0 f64)]
    (for x xs (set! sum (+ sum x)))
    (/ sum (cast f64 (len xs)))))
(defn scale :inline (Never) [(x f32) (k f32)] (-> f32) (* x k))
(defn main [] (-> i64)
  (let [xs [(: 1.5 f64) 2.5 4.0 8.0]]
    (println "mean {} scaled {} truncated {}" (mean xs) (scale 1.25 4.0) (cast i64 (mean xs)))
    0))
''',
}


def run(arguments, cwd):
    return subprocess.run(list(map(str, arguments)), cwd=cwd, env=ENV,
                          capture_output=True, text=True, timeout=600)


def diagnosis(result):
    """Why a compiler invocation failed: the library placeholder, or its last lines."""
    text = result.stdout + result.stderr
    placeholder = NOT_IMPLEMENTED.search(text)
    if placeholder:
        return 'backend not implemented', placeholder.group(0)
    lines = [line for line in text.strip().splitlines() if line.strip()]
    return 'FAILED', ' | '.join(lines[-3:]) if lines else f'exit {result.returncode}, no output'


def check(work, name, level):
    """(status, detail) of one program at one level."""
    source = work / f'{name}.coil'
    obj = work / f'{name}{level}.o'
    exe = work / f'{name}{level}'
    compiled = run([COMPILER, 'emit-obj', source, '--backend', 'stogir', level, '--no-debug',
                    *TARGET, '-o', obj], work)
    if compiled.returncode != 0 or not obj.exists():
        status, detail = diagnosis(compiled)
        return status, f'compile: {detail}'
    if not RUNS_HERE:
        return 'compiled', 'not linked or run: this machine is not x86-64 Linux'
    built = run([COMPILER, 'build', source, '--backend', 'stogir', level, '--no-debug',
                 *TARGET, '-o', exe], work)
    if built.returncode != 0 or not exe.exists():
        status, detail = diagnosis(built)
        return status, f'compiled; link: {detail}'
    reference = work / f'{name}-llvm'
    if not reference.exists():
        made = run([COMPILER, 'build', source, '--backend', 'llvm', '--no-debug', *TARGET,
                    '-o', reference], work)
        if made.returncode != 0:
            return 'FAILED', f'the LLVM reference did not build: {diagnosis(made)[1]}'
    want = run([reference], work)
    got = run([exe], work)
    if (got.returncode, got.stdout) != (want.returncode, want.stdout):
        return 'FAILED', (f'compiled, linked; ran wrong: exit {got.returncode} (want {want.returncode}), '
                          f'output {got.stdout!r} (want {want.stdout!r})')
    return 'ok', 'compiled, linked, ran correctly'


def main(work):
    statuses = []
    for name, text in PROGRAMS.items():
        (work / f'{name}.coil').write_text(text.lstrip())
        for level in LEVELS:
            try:
                status, detail = check(work, name, level)
            except subprocess.TimeoutExpired as expired:
                status, detail = 'FAILED', f'timed out: {expired.cmd[1]}'
            statuses.append(status)
            print(f'{name:8} {level}  {status:24} {detail}')
    total = len(statuses)
    if all(status == 'ok' for status in statuses):
        print(f'stogir x86 smoke: {total} of {total} correct: PASS')
        return 0
    missing = statuses.count('backend not implemented')
    failed = statuses.count('FAILED')
    print(f'stogir x86 smoke: {statuses.count("ok")} correct, {statuses.count("compiled")} compiled only, '
          f'{missing} backend not implemented, {failed} failed, of {total}')
    if failed == 0 and missing > 0:
        print('stogir x86 smoke: BACKEND NOT IMPLEMENTED (the library x86-64 code generator is a placeholder)')
        return 3
    return 1


if options.keep:
    options.keep.mkdir(parents=True, exist_ok=True)
    sys.exit(main(options.keep.resolve()))
with tempfile.TemporaryDirectory(prefix='stogir-x86-smoke-') as temporary:
    sys.exit(main(Path(temporary)))

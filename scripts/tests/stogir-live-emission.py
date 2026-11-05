#!/usr/bin/env python3
"""Post-inline target reachability: removed helpers and retained native roots."""
from pathlib import Path
import os
import subprocess
import sys
import tempfile

ROOT = Path(__file__).resolve().parents[2]
COMPILER = Path(sys.argv[1] if len(sys.argv) > 1 else os.environ['COIL']).resolve()
ENV = dict(os.environ, COIL_LIBRARY_STATE='0', COIL_TPDE_SERIAL='1')


def run(*args):
    result = subprocess.run(list(map(str, args)), cwd=ROOT, env=ENV,
                            capture_output=True, text=True, timeout=120)
    if result.returncode:
        raise RuntimeError(f'{args}: exit {result.returncode}\n{result.stdout}{result.stderr}')
    return result.stdout


with tempfile.TemporaryDirectory(prefix='stogir-emission-') as temporary:
    directory = Path(temporary)
    obj = directory / 'program.o'
    run(COMPILER, 'emit-obj', ROOT / 'tests/cli/stogir-live-emission.coil',
        '--backend', 'stogir', '-O3', '--no-debug', '-o', obj)
    traced = directory / 'traced.o'
    result = subprocess.run([str(COMPILER), 'emit-obj', str(ROOT / 'tests/cli/stogir-live-emission.coil'),
                             '--backend', 'stogir', '-O3', '--no-debug', '-o', str(traced)],
                            cwd=ROOT, env=dict(ENV, COIL_TPDE_STATS='1'),
                            capture_output=True, text=True, timeout=120)
    assert result.returncode == 0, result.stdout + result.stderr
    assert obj.read_bytes() == traced.read_bytes(), 'effect tracing changes object bytes'
    assert 'stogir nonwriting-body tests.cli.stogir-live-emission.readonly-leaf: true' in result.stderr
    assert 'stogir nonwriting-body tests.cli.stogir-live-emission.writing-leaf: false' in result.stderr
    assembly = run('llvm-objdump', '-dr', obj)
    assert any('ARM64_RELOC_BRANCH26' in line and
               '_tests.cli.stogir-live-emission.readonly-leaf' in line
               for line in assembly.splitlines()), 'no residual read-only call exercised'
    symbols = run('nm', obj)
    assert symbols.strip(), 'nm returned no symbol table'
    for helper in ['leaf', 'wrapper', 'make-callback']:
        assert f'_tests.cli.stogir-live-emission.{helper}' not in symbols, helper
    for retained in ['_tests.cli.stogir-live-emission.readonly-leaf',
                     '_stogir_retained_entry',
                     '_tests.cli.stogir-live-emission.address-only',
                     '_tests.cli.stogir-live-emission.returned-callback',
                     '_tests.cli.stogir-live-emission.recursive']:
        assert retained in symbols, retained
    driver = directory / 'alias.c'
    driver.write_text('''#include <stdint.h>
#include <stdlib.h>
extern int64_t stogir_retained_entry(int64_t);
__attribute__((constructor)) static void check_exported_alias(void) {
    for (int64_t x = -100; x < 100; ++x)
        if (stogir_retained_entry(x) != x + 17) abort();
}
''')
    executable = directory / 'program'
    run('cc', obj, driver, '-lm', '-o', executable)
    assert run(executable) == 'post-inline emission: 0 failures\n'
    library = directory / 'library.coil'
    library.write_text('(module emission.unit)\n'
                       '(defn first [(x i64)] (-> i64) (+ x 7))\n'
                       '(defn second [(x i64)] (-> i64) (* x 3))\n')
    unit = directory / 'unit'
    run(COMPILER, 'build-unit', library, '--backend', 'stogir', '-O3', '-o', unit)
    unit_symbols = run('nm', unit / 'unit.o')
    assert '_emission.unit.first' in unit_symbols
    assert '_emission.unit.second' in unit_symbols
    consumer = directory / 'consumer.coil'
    consumer.write_text('(module emission.consumer)\n'
                        '(import "emission.unit" :as lib)\n'
                        '(defn main [] (-> i64) '
                        '(if (= (+ (lib/first 5) (lib/second 9)) 39) 0 1))\n')
    run(COMPILER, 'run', consumer, '--unit', unit, '--backend', 'stogir', '-O3', '--no-debug')
print('post-inline symbols, native roots, recursion and prebuilt-unit retention: PASS')

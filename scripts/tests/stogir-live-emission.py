#!/usr/bin/env python3
"""Post-inline target reachability: removed helpers and retained native roots."""
from pathlib import Path
import os
import subprocess
import sys
import tempfile

import stogir_target

ROOT = Path(__file__).resolve().parents[2]
COMPILER = Path(sys.argv[1] if len(sys.argv) > 1 else os.environ['COIL']).resolve()
ENV = dict(os.environ, COIL_LIBRARY_STATE='0', COIL_TPDE_SERIAL='1')


def run(*args):
    result = subprocess.run(list(map(str, args)), cwd=ROOT, env=ENV,
                            capture_output=True, text=True, timeout=120)
    if result.returncode:
        raise RuntimeError(f'{args}: exit {result.returncode}\n{result.stdout}{result.stderr}')
    return result.stdout


SOURCE = ROOT / 'tests/cli/stogir-live-emission.coil'
MODULE_PREFIX = 'tests.cli.stogir-live-emission.'
PREFIX = stogir_target.symbol(MODULE_PREFIX)
# The policy that charges every clone to the caller's budget, so the fanout
# callers keep most of their calls whatever the default policy inlines.
CHARGED = {'COIL_STOGIR_INLINE': 'budget=512'}
DRIVER = """#include <stdint.h>
#include <stdlib.h>
struct NativePair { uint64_t first, second; };
extern struct NativePair stogir_register_pair(uint64_t, uint64_t);
extern int64_t stogir_retained_entry(int64_t);
__attribute__((constructor)) static void check_exported_alias(void) {
    for (int64_t x = -100; x < 100; ++x)
        if (stogir_retained_entry(x) != x + 17) abort();
    const uint64_t values[] = {0, 1, 17, UINT64_C(0x8000000000000000), UINT64_MAX};
    for (unsigned i = 0; i < 5; ++i) for (unsigned j = 0; j < 5; ++j) {
        struct NativePair result = stogir_register_pair(values[i], values[j]);
        if (result.first != values[i] || result.second != values[j]) abort();
    }
}
"""


def emit(directory, name, settings):
    """Emit, link and run the program under SETTINGS; return the direct call
    targets and the defined symbols of its object."""
    environment = dict(ENV, **settings)
    obj = directory / f'{name}.o'
    traced = directory / f'{name}-traced.o'
    command = [str(COMPILER), 'emit-obj', str(SOURCE),
               '--backend', 'stogir', '-O3', '--no-debug', '-o']
    plain = subprocess.run(command + [str(obj)], cwd=ROOT, env=environment,
                           capture_output=True, text=True, timeout=120)
    assert plain.returncode == 0, plain.stdout + plain.stderr
    result = subprocess.run(command + [str(traced)], cwd=ROOT,
                            env=dict(environment, COIL_TPDE_STATS='1'),
                            capture_output=True, text=True, timeout=120)
    assert result.returncode == 0, result.stdout + result.stderr
    assert obj.read_bytes() == traced.read_bytes(), 'effect tracing changes object bytes'
    # The effect proof comes from each body, under every inline policy.
    assert f'stogir nonwriting-body {MODULE_PREFIX}readonly-leaf: true' in result.stderr
    assert f'stogir nonwriting-body {MODULE_PREFIX}writing-leaf: false' in result.stderr
    assert f'stogir nonwriting-body {MODULE_PREFIX}readonly-pair-result: true' in result.stderr
    # The native prepass publishes once, and the ordinary job reuses each body.
    native_lines = [line for line in result.stderr.splitlines()
                    if line.startswith('stogir native-leaf ')]
    assert native_lines, 'private module prepass did not run'
    cached_names = [line.split(': certified', 1)[0].removeprefix('stogir native-leaf ')
                    for line in native_lines]
    assert len(cached_names) == len(set(cached_names)), 'native body compiled twice'
    reused_names = [line.removeprefix('stogir reuse-native ')
                    for line in result.stderr.splitlines()
                    if line.startswith('stogir reuse-native ')]
    assert sorted(cached_names) == sorted(reused_names), 'cache/job identity mismatch'
    assert any(': certifiedtrue ' in line for line in native_lines), 'no certified leaf exercised'
    targets = {stogir_target.call_target(line)
               for line in run('llvm-objdump', '-dr', obj).splitlines()} - {None}
    listing = run('nm', obj)
    assert listing.strip(), 'nm returned no symbol table'
    defined = {fields[-1] for fields in map(str.split, listing.splitlines())
               if len(fields) == 3 and fields[1] != 'U'}
    # An :inline (Never) callee is called under every policy.
    assert PREFIX + 'pair-result' in targets, 'no residual aggregate call exercised'
    # Helpers every policy inlines everywhere are not emitted.
    for helper in ['leaf', 'wrapper', 'make-callback']:
        assert PREFIX + helper not in defined, helper
    # Roots that no direct call reaches: native data, an address that arrives
    # through an inlined helper, an export alias, and a recursive function.
    for retained in [PREFIX + 'address-only', PREFIX + 'returned-callback',
                     stogir_target.symbol('stogir_retained_entry'), PREFIX + 'recursive']:
        assert retained in defined, retained
    # A helper with no other root is emitted exactly when a call to it
    # survived inlining, whichever calls the policy in force left.
    for helper in ['readonly-leaf', 'readonly-pair-result', 'writing-leaf']:
        assert (PREFIX + helper in defined) == (PREFIX + helper in targets), \
            f'{name}: {helper} emitted {PREFIX + helper in defined}, ' \
            f'called {PREFIX + helper in targets}'
    driver = directory / 'alias.c'
    driver.write_text(DRIVER)
    executable = directory / name
    run('cc', obj, driver, '-lm', '-o', executable)
    assert run(executable) == 'post-inline emission: 0 failures\n'
    return targets, defined


with tempfile.TemporaryDirectory(prefix='stogir-emission-') as temporary:
    directory = Path(temporary)
    # The default policy: whatever it inlines, emission follows the final graphs.
    emit(directory, 'default', {})
    # Charged clones exhaust the fanout callers' budgets, so calls to callees
    # proven read-only from their bodies remain and their targets are emitted.
    targets, defined = emit(directory, 'charged', CHARGED)
    assert PREFIX + 'readonly-leaf' in targets, 'no residual read-only call exercised'
    assert PREFIX + 'readonly-pair-result' in targets, \
        'no residual readonly aggregate call exercised'
    assert PREFIX + 'readonly-leaf' in defined
    assert PREFIX + 'readonly-pair-result' in defined
    library = directory / 'library.coil'
    library.write_text('(module emission.unit)\n'
                       '(defn first [(x i64)] (-> i64) (+ x 7))\n'
                       '(defn second [(x i64)] (-> i64) (* x 3))\n')
    unit = directory / 'unit'
    run(COMPILER, 'build-unit', library, '--backend', 'stogir', '-O3', '-o', unit)
    unit_symbols = run('nm', unit / 'unit.o')
    assert stogir_target.symbol('emission.unit.first') in unit_symbols
    assert stogir_target.symbol('emission.unit.second') in unit_symbols
    consumer = directory / 'consumer.coil'
    consumer.write_text('(module emission.consumer)\n'
                        '(import "emission.unit" :as lib)\n'
                        '(defn main [] (-> i64) '
                        '(if (= (+ (lib/first 5) (lib/second 9)) 39) 0 1))\n')
    run(COMPILER, 'run', consumer, '--unit', unit, '--backend', 'stogir', '-O3', '--no-debug')
print('post-inline symbols, native roots, recursion and prebuilt-unit retention: PASS')

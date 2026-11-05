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
    symbols = run('nm', obj)
    assert symbols.strip(), 'nm returned no symbol table'
    for helper in ['leaf', 'wrapper']:
        assert f'_tests.cli.stogir-live-emission.{helper}' not in symbols, helper
    for retained in ['_stogir_retained_entry',
                     '_tests.cli.stogir-live-emission.address-only',
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
print('post-inline symbols, data-only callback, exported C alias and recursion: PASS')

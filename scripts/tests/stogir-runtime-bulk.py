#!/usr/bin/env python3
"""Byte-exact constant aggregate snapshot and zero-fill boundaries."""
from pathlib import Path
import os
import re
import subprocess
import sys
import tempfile

ROOT = Path(__file__).resolve().parents[2]
COMPILER = Path(sys.argv[1] if len(sys.argv) > 1 else os.environ['COIL']).resolve()
SIZES = [0, 1, 7, 8, 15, 16, 17, 127, 128, 129, 135, 136, 255, 256, 257, 416, 1024]
ENV = dict(os.environ, COIL_LIBRARY_STATE='0', COIL_TPDE_SERIAL='1')


def run(*args):
    p = subprocess.run(list(map(str, args)), cwd=ROOT, env=ENV,
                       capture_output=True, text=True, timeout=180)
    if p.returncode:
        raise RuntimeError(f'{args}: exit {p.returncode}\n{p.stdout}{p.stderr}')
    return p.stdout


with tempfile.TemporaryDirectory(prefix='stogir-runtime-bulk-') as temporary:
    d = Path(temporary)
    source = ['(module tests.generated.runtime-bulk)', '(import "coil.cc" :as cc)']
    declarations = []
    rows = []
    for size in SIZES:
        source += [f'(defn copy-{size} :cc (cc/C) :inline (Never) '
                   f'[(dst (ptr (array u8 {size}))) (src (ptr (array u8 {size})))] '
                   '(-> void) (store! dst (load src)))',
                   f'(defn zero-{size} :cc (cc/C) :inline (Never) '
                   f'[(dst (ptr (array u8 {size})))] '
                   f'(-> void) (store! dst (zeroed (array u8 {size}))))',
                   f'(export-c [copy-{size} :as "copy_{size}"])',
                   f'(export-c [zero-{size} :as "zero_{size}"])']
        declarations += [f'extern void copy_{size}(void *, const void *);',
                         f'extern void zero_{size}(void *);']
        rows.append(f'{{{size}, copy_{size}, zero_{size}}}')
    fixture = d / 'matrix.coil'
    fixture.write_text('\n'.join(source) + '\n')
    driver = d / 'driver.c'
    driver.write_text('''#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
''' + '\n'.join(declarations) + '''
struct test { size_t size; void (*copy)(void *, const void *); void (*zero)(void *); };
static const struct test tests[] = {''' + ',\n'.join(rows) + '''};
int main(void) {
    unsigned char *actual = malloc(4096), *expected = malloc(4096);
    if (!actual || !expected) return 2;
    for (size_t t = 0; t < sizeof(tests)/sizeof(tests[0]); ++t) {
        const struct test test = tests[t];
        for (size_t src = 0; src < 64; ++src) for (size_t dst = 0; dst < 64; ++dst) {
            for (size_t i = 0; i < 4096; ++i)
                actual[i] = expected[i] = (unsigned char)(i * 37 + src * 13 + dst);
            memmove(expected + dst, expected + src, test.size);
            test.copy(actual + dst, actual + src);
            if (memcmp(actual, expected, 4096)) {
                fprintf(stderr, "copy size=%zu src=%zu dst=%zu\\n", test.size, src, dst);
                return 3;
            }
        }
        for (size_t dst = 0; dst < 64; ++dst) {
            memset(actual, 0xa5, 4096); memset(expected, 0xa5, 4096);
            memset(expected + dst, 0, test.size); test.zero(actual + dst);
            if (memcmp(actual, expected, 4096)) return 4;
        }
    }
    free(actual); free(expected); return 0;
}
''')
    obj = d / 'matrix.o'
    run(COMPILER, 'emit-obj', fixture, '--backend', 'stogir', '-O3', '--no-debug', '-o', obj)
    assembly = run('llvm-objdump', '-dr', obj)
    bodies = re.split(r'^[0-9a-f]+ <([^>]+)>:\s*$', assembly, flags=re.M)
    functions = dict(zip(bodies[1::2], bodies[2::2]))
    for size in SIZES:
        if size <= 128:
            body = functions[f'_zero_{size}']
            if re.search(r'ARM64_RELOC_BRANCH26\s+_(memset|memmove)', body):
                raise AssertionError(f'small zero-fill {size} became a runtime call')
    executable = d / 'matrix' 
    run('cc', '-O2', '-fsanitize=address', driver, obj, '-o', executable)
    run(executable)
print(f'{len(SIZES)} widths, {len(SIZES)*4096} overlapping snapshots and '
      f'{len(SIZES)*64} zero-fill canaries: PASS')

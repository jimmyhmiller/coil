#!/usr/bin/env python3
"""Calls under :shim conventions through the Stogir backend.

The Stogir library knows the C register assignment only, so the adapter
reaches a :shim convention through a thunk, one per distinct (argument
registers, result register, clobber set, inline bytes). This compiles
tests/backend/stogir-shim-calls.coil and checks that
  - the Stogir program prints what the LLVM program prints and both report no
    failed check;
  - the object defines one thunk per convention and form (twelve: six
    conventions, each called and inlined), however many calls share it;
  - tests/corpus/machine_code.coil, the corpus program for machine code,
    builds with Stogir and matches LLVM too.
"""
from pathlib import Path
import os
import re
import subprocess
import sys
import tempfile

import stogir_target

ROOT = Path(__file__).resolve().parents[2]
COMPILER = Path(sys.argv[1] if len(sys.argv) > 1 else os.environ['COIL']).resolve()
ENV = dict(os.environ, COIL_LIBRARY_STATE='0', COIL_TPDE_SERIAL='1')


def compile_to(command, source, output, flags):
    result = subprocess.run([str(COMPILER), command, str(source), *flags, '-O3', '--no-debug',
                             '-o', str(output)],
                            cwd=ROOT, env=ENV, capture_output=True, text=True, timeout=300)
    assert result.returncode == 0, result.stdout + result.stderr


def run(program):
    return subprocess.run([str(program)], capture_output=True, text=True, timeout=60)


with tempfile.TemporaryDirectory(prefix='stogir-shims-') as temporary:
    work = Path(temporary)
    for name in ('tests/backend/stogir-shim-calls.coil', 'tests/corpus/machine_code.coil'):
        source = ROOT / name
        compile_to('build', source, work / 'llvm', [])
        compile_to('build', source, work / 'stogir', ['--backend', 'stogir'])
        expected = run(work / 'llvm')
        actual = run(work / 'stogir')
        assert expected.returncode == 0, f'{name}: LLVM program failed\n{expected.stdout}'
        assert actual.returncode == 0, f'{name}: Stogir program failed\n{actual.stdout}{actual.stderr}'
        assert actual.stdout == expected.stdout, \
            f'{name}: outputs differ\n--- llvm\n{expected.stdout}--- stogir\n{actual.stdout}'
    obj = work / 'program.o'
    compile_to('emit-obj', ROOT / 'tests/backend/stogir-shim-calls.coil', obj, ['--backend', 'stogir'])
    listing = subprocess.run([stogir_target.OBJDUMP, '-d', '--no-show-raw-insn', str(obj)],
                             capture_output=True, text=True, check=True).stdout
    thunks = re.findall(r'^[0-9a-f]+ <_coil\.stogir\.shim\.\d+>:$', listing, re.M)
    assert len(thunks) == 12, f'expected 12 thunks, found {len(thunks)}'
print('shim calls: output, thunk sharing and machine-code corpus checks pass')

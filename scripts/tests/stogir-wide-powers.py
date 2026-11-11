#!/usr/bin/env python3
"""128-bit arithmetic by literal powers of two needs no runtime division.

The Stogir adapter computes 128-bit division, remainder and multiplication by
a literal power of two, and shifts by a literal count, inline from the two
halves. This compiles tests/backend/stogir-wide-powers.coil, whose every
division has such a divisor, and checks that
  - the object references none of the runtime's 128-bit division helpers
    (__divti3, __modti3, __udivti3, __umodti3);
  - the program runs and reports no failure, at -O3 and at -O1.
"""
from pathlib import Path
import os
import subprocess
import sys
import tempfile

import stogir_target

ROOT = Path(__file__).resolve().parents[2]
COMPILER = Path(sys.argv[1] if len(sys.argv) > 1 else os.environ['COIL']).resolve()
SOURCE = ROOT / 'tests/backend/stogir-wide-powers.coil'
ENV = dict(os.environ, COIL_LIBRARY_STATE='0', COIL_TPDE_SERIAL='1')
HELPERS = tuple(stogir_target.symbol(name)
                for name in ('__divti3', '__modti3', '__udivti3', '__umodti3'))

with tempfile.TemporaryDirectory(prefix='stogir-wide-powers-') as temporary:
    for level in ('-O3', '-O1'):
        obj = Path(temporary) / f'program{level}.o'
        exe = Path(temporary) / f'program{level}'
        for command, output in ((['emit-obj'], obj), (['build'], exe)):
            result = subprocess.run([str(COMPILER), *command, str(SOURCE), '--backend', 'stogir',
                                     level, '--no-debug', '-o', str(output)],
                                    cwd=ROOT, env=ENV, capture_output=True, text=True, timeout=300)
            assert result.returncode == 0, result.stdout + result.stderr
        undefined = subprocess.run(['nm', '-u', str(obj)],
                                   capture_output=True, text=True, check=True).stdout.split()
        called = [name for name in HELPERS if name in undefined]
        assert not called, f'{level}: the object still calls {called}'
        run = subprocess.run([str(exe)], capture_output=True, text=True, timeout=120)
        assert run.returncode == 0, \
            f'{level}: program reported failures: {run.returncode}\n{run.stdout}{run.stderr}'
print('wide powers of two: no runtime division, results correct')

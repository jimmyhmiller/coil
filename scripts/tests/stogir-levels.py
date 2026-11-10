#!/usr/bin/env python3
"""Stogir optimization levels: -O1, -O2 and -O3 build and agree; -O0 is refused.

-O1 schedules, selects and allocates only; -O2 adds memory promotion and SCCP
per function; -O3 adds module inlining and the loop and load passes. -O0 would
need the fast-allocation path Stogir does not have, so it must be a hard error
naming the levels that exist, never another level or backend in its place.
"""
from pathlib import Path
import os
import subprocess
import sys
import tempfile

ROOT = Path(__file__).resolve().parents[2]
COMPILER = Path(sys.argv[1] if len(sys.argv) > 1 else os.environ['COIL']).resolve()
SOURCE = ROOT / 'tests/backend/stogir-levels.coil'
ENV = {k: v for k, v in os.environ.items() if not k.startswith('COIL_')}
ENV['COIL_LIBRARY_STATE'] = '0'


def build(out, *flags):
    return subprocess.run([str(COMPILER), 'build', str(SOURCE), '--no-debug', '-o', str(out), *flags],
                          cwd=ROOT, env=ENV, capture_output=True, text=True, timeout=600)


with tempfile.TemporaryDirectory(prefix='stogir-levels-') as temporary:
    temporary = Path(temporary)
    reference = build(temporary / 'reference', '--backend', 'llvm', '-O1')
    assert reference.returncode == 0, reference.stderr
    expected = subprocess.run([str(temporary / 'reference')], capture_output=True, text=True, timeout=60)
    assert expected.returncode == 0 and expected.stdout.count('\n') == 4, expected
    sizes = {}
    for level in (1, 2, 3):
        exe = temporary / f'level{level}'
        built = build(exe, '--backend', 'stogir', f'-O{level}')
        assert built.returncode == 0, f'-O{level}: {built.stderr}'
        ran = subprocess.run([str(exe)], capture_output=True, text=True, timeout=60)
        assert (ran.returncode, ran.stdout) == (0, expected.stdout), f'-O{level}: {ran}'
        sizes[level] = exe.stat().st_size
    refused = build(temporary / 'level0', '--backend', 'stogir', '-O0')
    assert refused.returncode != 0, '-O0 built'
    assert 'stogir: -O0 is not implemented' in refused.stderr and '-O1' in refused.stderr, refused.stderr
    assert not (temporary / 'level0').exists(), '-O0 left a program behind'

print('stogir levels: ok')

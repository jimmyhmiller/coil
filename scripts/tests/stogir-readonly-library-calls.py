#!/usr/bin/env python3
"""Read-only C library calls reach Stogir from real Coil source.

The adapter recognises `memcmp` by the name of the undefined object symbol a
call refers to. This compiles tests/backend/stogir-readonly-library-calls.coil
and checks, in the object it produces, that
  - a function whose only call is memcmp is classified non-writing, and one
    calling a Coil function named `memcmp` that stores is not;
  - a loop that only calls memcmp reads its in-memory bound once, outside the
    loop, while the same loop with a store in it reads the bound inside.
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
SOURCE = ROOT / 'tests/backend/stogir-readonly-library-calls.coil'
MODULE = 'tests.backend.stogir-readonly-library-calls'
ENV = dict(os.environ, COIL_LIBRARY_STATE='0', COIL_TPDE_SERIAL='1', COIL_TPDE_STATS='1')


def functions(assembly):
    """name -> [(address, mnemonic, operands)]"""
    result = {}
    current = None
    for line in assembly.splitlines():
        header = re.match(r'^[0-9a-f]+ <(.+)>:$', line.strip())
        if header:
            current = result.setdefault(header.group(1), [])
            continue
        instruction = re.match(r'\s*([0-9a-f]+):\s+(\S+)\s*(.*)', line)
        if instruction and current is not None:
            current.append((int(instruction.group(1), 16), instruction.group(2),
                            instruction.group(3).split(';')[0].strip()))
    return result


def loop_memory_reads(body):
    """Loads from anything but the frame between the lowest backward branch
    target and the highest backward branch."""
    spans = []
    for address, mnemonic, operands in body:
        if mnemonic == 'b' or mnemonic.startswith('b.') or mnemonic in ('cbz', 'cbnz', 'tbz', 'tbnz'):
            target = re.search(r'0x([0-9a-f]+)', operands.split(',')[-1])
            if target and int(target.group(1), 16) <= address:
                spans.append((int(target.group(1), 16), address))
    assert spans, 'no loop found'
    low = min(start for start, _ in spans)
    high = max(end for _, end in spans)
    return [(address, mnemonic, operands) for address, mnemonic, operands in body
            if low <= address <= high and mnemonic.startswith('ld')
            and '[sp' not in operands and '[x29' not in operands]


with tempfile.TemporaryDirectory(prefix='stogir-readonly-') as temporary:
    obj = Path(temporary) / 'program.o'
    result = subprocess.run([str(COMPILER), 'emit-obj', str(SOURCE), '--backend', 'stogir',
                             '-O3', '--no-debug', '-o', str(obj)],
                            cwd=ROOT, env=ENV, capture_output=True, text=True, timeout=120)
    assert result.returncode == 0, result.stdout + result.stderr
    assert f'stogir nonwriting-body {MODULE}.same-row: true' in result.stderr, \
        'a body that only calls memcmp is not classified non-writing'
    assert f'stogir nonwriting-body {MODULE}.spend-row: false' in result.stderr, \
        'a caller of a storing Coil function named memcmp is classified non-writing'
    listing = subprocess.run([stogir_target.OBJDUMP, '-d', '--no-show-raw-insn', str(obj)],
                             capture_output=True, text=True, check=True).stdout
    found = functions(listing)
    # The comparison must still be a call: one expanded inline reads its
    # operands in the loop and would say nothing about calls.
    assert any(mnemonic == 'bl' for _, mnemonic, _ in found[f'_{MODULE}.count-equal']), \
        'count-equal no longer calls memcmp'
    clean = loop_memory_reads(found[f'_{MODULE}.count-equal'])
    assert not clean, f'the bound is still read inside the memcmp-only loop: {clean}'
    for name in ('count-equal-spending', 'count-equal-namesake'):
        kept = loop_memory_reads(found[f'_{MODULE}.{name}'])
        assert kept, f'{name}: the bound is no longer read inside a loop that can write it'
print('read-only library calls: object checks pass')

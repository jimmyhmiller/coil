#!/usr/bin/env python3
"""Named symbol addresses reach the linker as GOT loads.

A Stogir image reads the address of a named symbol from a private eight-byte
slot. The adapter rewrites every such read as the GOT-load relocation pair
against the symbol and drops the slot. This compiles
tests/backend/stogir-symbol-addresses.coil and checks that
  - the object has GOT-load relocations and no `__stogir` slot section;
  - in the linked program the functions that address the static tables hold no
    load through an ADRP page (the linker made each pair ADRP/ADD);
  - the program, which also calls a C library function through its address,
    runs and reports no failure.
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
SOURCE = ROOT / 'tests/backend/stogir-symbol-addresses.coil'
MODULE = 'tests.backend.stogir-symbol-addresses'
ENV = dict(os.environ, COIL_LIBRARY_STATE='0', COIL_TPDE_SERIAL='1')


def functions(assembly):
    """name -> [(mnemonic, operands)]"""
    result = {}
    current = None
    for line in assembly.splitlines():
        header = re.match(r'^[0-9a-f]+ <(.+)>:$', line.strip())
        if header:
            current = result.setdefault(header.group(1), [])
            continue
        instruction = re.match(r'\s*[0-9a-f]+:\s+(\S+)\s*(.*)', line)
        if instruction and current is not None:
            current.append((instruction.group(1), instruction.group(2).split(';')[0].strip()))
    return result


def page_loads(body):
    """Loads whose base register the previous instruction set with ADRP."""
    found = []
    for (before, page), (mnemonic, operands) in zip(body, body[1:]):
        if before == 'adrp' and mnemonic.startswith('ld'):
            register = page.split(',')[0].strip()
            if f'[{register}' in operands:
                found.append(f'{mnemonic} {operands}')
    return found


with tempfile.TemporaryDirectory(prefix='stogir-symbols-') as temporary:
    obj = Path(temporary) / 'program.o'
    exe = Path(temporary) / 'program'
    for command, output in ((['emit-obj'], obj), (['build'], exe)):
        result = subprocess.run([str(COMPILER), *command, str(SOURCE), '--backend', 'stogir',
                                 '-O3', '--no-debug', '-o', str(output)],
                                cwd=ROOT, env=ENV, capture_output=True, text=True, timeout=300)
        assert result.returncode == 0, result.stdout + result.stderr
    relocations = subprocess.run([stogir_target.OBJDUMP, '-r', str(obj)],
                                 capture_output=True, text=True, check=True).stdout
    assert 'GOT_LOAD_PAGE21' in relocations and 'GOT_LOAD_PAGEOFF12' in relocations, \
        'no GOT-load relocations in the object'
    headers = subprocess.run([stogir_target.OBJDUMP, '-h', str(obj)],
                             capture_output=True, text=True, check=True).stdout
    assert '__stogir' not in headers, 'the object still carries address slots'
    listing = subprocess.run([stogir_target.OBJDUMP, '-d', '--no-show-raw-insn', str(exe)],
                             capture_output=True, text=True, check=True).stdout
    found = functions(listing)
    for name in ('weigh', 'mix'):
        body = found[f'_{MODULE}.{name}']
        assert any(mnemonic == 'adrp' for mnemonic, _ in body), f'{name}: no table address'
        loads = page_loads(body)
        assert not loads, f'{name}: a table address is still loaded from memory: {loads}'
    run = subprocess.run([str(exe)], capture_output=True, text=True, timeout=60)
    assert run.returncode == 0, f'program reported failures: {run.returncode}\n{run.stdout}{run.stderr}'
print('symbol addresses: object, link and run checks pass')

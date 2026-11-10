#!/usr/bin/env python3
"""Volatile accesses reach Stogir's machine code one for one.

`primitive/volatile-load` and `primitive/volatile-store!` (and `load volatile`
/ `store volatile` in an llvm-ir body) are marked in CIR and lowered to
Stogir's LOAD_v / STORE_v, which no pass removes, forwards, hoists, sinks,
repeats or pairs with a neighbour. This builds
tests/backend/stogir-volatile.coil at -O1, -O2 and -O3, runs it, and counts
the loads and stores that address the device in each function's body:
  - a polling loop and a spin loop keep exactly one load inside the loop;
  - two reads stay two loads, also of neighbouring registers (no LDP);
  - an unused read stays; a store followed by another store to the same
    register stays, volatile or not; neighbouring stores are not one STP;
  - a read after a write is a load; a conditional read stays behind its test;
  - both halves of a 128-bit register are accessed each time;
  - a function that reads a register is called each time.
"""
from pathlib import Path
import os
import re
import subprocess
import sys
import tempfile

ROOT = Path(__file__).resolve().parents[2]
COMPILER = Path(sys.argv[1] if len(sys.argv) > 1 else os.environ['COIL']).resolve()
SOURCE = ROOT / 'tests/backend/stogir-volatile.coil'
PREFIX = '_tests.backend.stogir-volatile.'
ENV = {k: v for k, v in os.environ.items() if not k.startswith('COIL_')}
ENV['COIL_LIBRARY_STATE'] = '0'

# function -> (loads, stores, loads in a loop, calls)
EXPECTED = {
    'poll': (1, 0, 1, 0),
    'spin': (1, 0, 1, 0),
    'twice': (2, 0, 0, 0),
    'neighbours': (2, 0, 0, 0),
    'acknowledge': (1, 0, 0, 0),
    'command': (0, 2, 0, 0),
    'pulse': (0, 2, 0, 0),
    'configure': (0, 2, 0, 0),
    'echo': (1, 1, 0, 0),
    'maybe': (1, 0, 0, 0),
    'wide-twice': (4, 0, 0, 0),
    'wide-set': (0, 4, 0, 0),
    'status-of': (1, 0, 0, 0),
    'called-twice': (0, 0, 0, 2),
}


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


def census(body):
    """Accesses that do not address the stack; a pair counts as one instruction."""
    spans = []
    for address, mnemonic, operands in body:
        target = re.search(r'0x([0-9a-f]+) <', operands)
        if target and (mnemonic.startswith('b.') or mnemonic in ('b', 'cbz', 'cbnz', 'tbz', 'tbnz')):
            destination = int(target.group(1), 16)
            if destination <= address:
                spans.append((destination, address))
    loads = stores = looped = calls = pairs = 0
    for address, mnemonic, operands in body:
        if mnemonic == 'bl':
            calls += 1
        if '[sp' in operands or '[x29' in operands:
            continue
        if mnemonic in ('ldp', 'stp'):
            pairs += 1
        if mnemonic.startswith('ld'):
            loads += 1
            if any(low <= address <= high for low, high in spans):
                looped += 1
        elif mnemonic.startswith('st'):
            stores += 1
    return (loads, stores, looped, calls), pairs


with tempfile.TemporaryDirectory(prefix='stogir-volatile-') as temporary:
    for level in (1, 2, 3):
        exe = Path(temporary) / f'program{level}'
        built = subprocess.run([str(COMPILER), 'build', str(SOURCE), '--backend', 'stogir',
                                f'-O{level}', '--no-debug', '-o', str(exe)],
                               cwd=ROOT, env=ENV, capture_output=True, text=True, timeout=600)
        assert built.returncode == 0, built.stderr
        ran = subprocess.run([str(exe)], capture_output=True, text=True, timeout=60)
        assert ran.returncode == 0 and 'stogir volatile: 0 failures' in ran.stdout, \
            f'-O{level}: {ran.stdout}{ran.stderr}'
        assembly = subprocess.run(['objdump', '-d', '--no-show-raw-insn', str(exe)],
                                  capture_output=True, text=True, check=True).stdout
        bodies = functions(assembly)
        for name, expected in EXPECTED.items():
            body = bodies.get(PREFIX + name)
            assert body, f'-O{level}: {name} is not in the program'
            got, pairs = census(body)
            listing = '\n'.join(f'  {m} {o}' for _, m, o in body)
            assert pairs == 0, f'-O{level}: {name} pairs volatile accesses:\n{listing}'
            assert got == expected, \
                f'-O{level}: {name}: loads, stores, loads in a loop, calls = {got}, expected {expected}:\n{listing}'

print('stogir volatile: ok')

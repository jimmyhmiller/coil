#!/usr/bin/env python3
"""Effect records computed from callee bodies reach Stogir's memory passes.

Compiles tests/backend/stogir-call-effects.coil with COIL_STOGIR_EFFECTS=1 and
inline expansion off, so that its small callees stay calls, and checks that
  - each callee's record says what its body does (reads, writes through which
    parameter and how far, keeps its argument, may write elsewhere);
  - a local counter handed to a reading callee every iteration is not read back
    from the frame inside the loop, while a loop bound handed to a writing
    callee still is;
  - the program reports no failure, built that way, without records, and at
    the default inline policy with and without records.
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
SOURCE = ROOT / 'tests/backend/stogir-call-effects.coil'
MODULE = 'tests.backend.stogir-call-effects'
BASE = {k: v for k, v in os.environ.items() if not k.startswith('COIL_STOGIR_')}
BASE.update(COIL_LIBRARY_STATE='0', COIL_TPDE_SERIAL='1')
CALLS = dict(BASE, COIL_STOGIR_INLINE='budget=0', COIL_STOGIR_EFFECTS='1')

RECORDS = {
    'weigh': 'unknown false writes 0 captures 0 extent 0',
    'weigh-pair': 'unknown false writes 0 captures 0 extent 0',
    'bump': 'unknown false writes 1 captures 0 extent 8',
    'bump-next': 'unknown false writes 1 captures 0 extent 16',
    'carry': 'unknown false writes 2 captures 0 extent 8',
    'keep': 'unknown true writes 0 captures 1 extent 0',
    'same': 'unknown false writes 0 captures 1 extent 0',
    'bump-kept': 'unknown true writes 0 captures 0 extent 0',
    'bump-kept-blind': 'unknown true writes 0 captures 0 extent 0',
    'descend': 'unknown true writes 1 captures 3 extent 8',
    'through': 'unknown true writes 0 captures 3 extent 0',
    'wipe': 'unknown true writes 0 captures 1 extent 0',
}


def functions(assembly):
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


def loop_frame_reads(body):
    """Loads from the frame between the lowest backward branch target and the
    highest backward branch."""
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
            and ('[sp' in operands or '[x29' in operands)]


with tempfile.TemporaryDirectory(prefix='stogir-call-effects-') as temporary:
    obj = Path(temporary) / 'program.o'
    result = subprocess.run([str(COMPILER), 'emit-obj', str(SOURCE), '--backend', 'stogir',
                             '-O3', '--no-debug', '-o', str(obj)],
                            cwd=ROOT, env=dict(CALLS, COIL_TPDE_STATS='1'),
                            capture_output=True, text=True, timeout=300)
    assert result.returncode == 0, result.stdout + result.stderr
    for name, record in RECORDS.items():
        line = f'stogir effects {MODULE}.{name}: present true {record}'
        assert line in result.stderr, f'{name}: expected record "{record}"'
    listing = subprocess.run([stogir_target.OBJDUMP, '-d', '--no-show-raw-insn', str(obj)],
                             capture_output=True, text=True, check=True).stdout
    found = functions(listing)
    for name in ('reads-in-loop', 'written-bound'):
        assert any(mnemonic == 'bl' for _, mnemonic, _ in found[f'_{MODULE}.{name}']), \
            f'{name} no longer calls its callee'
    reads = loop_frame_reads(found[f'_{MODULE}.reads-in-loop'])
    assert not reads, f'the counter is read back inside a loop whose callee only reads it: {reads}'
    kept = loop_frame_reads(found[f'_{MODULE}.written-bound'])
    assert kept, 'the bound is not read inside a loop whose callee writes it'
    for label, env in (('calls kept', CALLS), ('calls kept, records off', dict(BASE, COIL_STOGIR_INLINE='budget=0')),
                       ('default policy', BASE), ('default policy with records', dict(BASE, COIL_STOGIR_EFFECTS='1'))):
        exe = Path(temporary) / 'program'
        built = subprocess.run([str(COMPILER), 'build', str(SOURCE), '--backend', 'stogir',
                                '-O3', '--no-debug', '-o', str(exe)],
                               cwd=ROOT, env=env, capture_output=True, text=True, timeout=300)
        assert built.returncode == 0, built.stdout + built.stderr
        run = subprocess.run([str(exe)], capture_output=True, text=True, timeout=60)
        assert run.returncode == 0, f'{label}: {run.returncode} failures\n{run.stdout}{run.stderr}'
print('call effects: records, object and run checks pass')

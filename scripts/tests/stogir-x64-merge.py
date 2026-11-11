#!/usr/bin/env python3
"""A hand-built x86-64 library image through the Stogir adapter to a running program.

tests/backend/stogir-x64-merge.coil feeds two images with every relocation
shape the x86-64 backend makes through codegen_stogir merge!, codegen_tpde
tl-merge! and tl-elf-object, and writes the ELF object. This checks that
  - the object's relocations are exactly the ones the images ask for: PLT32
    for the call, PC32 with the library's addend (-4, and -5 or -8 before an
    immediate), a GOT load (REX_GOTPCRELX) against the symbol itself for each
    private address slot, R_X86_64_64 with its addend and PC32 in data;
  - data that holds nothing but slots is not emitted;
  - the object links with a C harness and every path through it runs.

x86-64 Linux only: the compiler's Stogir backend is the one of the machine
the compiler is built for, so the test program refuses the image elsewhere.

usage: stogir-x64-merge.py COMPILER [--show]   (--show prints objdump -dr)
"""
from pathlib import Path
import os
import platform
import re
import subprocess
import sys
import tempfile

ROOT = Path(__file__).resolve().parents[2]
if platform.system() != 'Linux' or platform.machine() != 'x86_64':
    print('stogir x64 merge: skipped (not x86-64 Linux)')
    raise SystemExit(0)
COMPILER = Path(sys.argv[1] if len(sys.argv) > 1 else os.environ['COIL']).resolve()
SHOW = '--show' in sys.argv[2:]
ENV = {k: v for k, v in os.environ.items() if not k.startswith('COIL_')}
ENV['COIL_LIBRARY_STATE'] = '0'
SOURCE = ROOT / 'tests/backend/stogir-x64-merge.coil'

HARNESS = r'''
#include <stdio.h>
long stogir_x64_value = 42;
long stogir_x64_entry(long selector);
long stogir_x64_forward(long selector);
int main(void) {
    long want[3] = {142, 242, 342};
    int failures = 0;
    for (long i = 0; i < 3; i++) {
        long got = stogir_x64_entry(i), forwarded = stogir_x64_forward(i);
        if (got != want[i] || forwarded != want[i]) {
            printf("selector %ld: entry %ld, forward %ld, want %ld\n", i, got, forwarded, want[i]);
            failures++;
        }
    }
    stogir_x64_value = 1000;
    if (stogir_x64_entry(2) != 1300) { printf("the slot does not name the variable\n"); failures++; }
    printf("stogir x64 merge: %d failures\n", failures);
    return failures;
}
'''

# (section, offset, type, symbol or None for a label of the image, addend)
EXPECTED = [
    ('.text', 0x07, 'R_X86_64_PC32', None, -4),
    ('.text', 0x0c, 'R_X86_64_PLT32', 'puts', -4),
    ('.text', 0x13, 'R_X86_64_REX_GOTPCRELX', 'stogir_x64_value', -4),
    ('.text', 0x1c, 'R_X86_64_PC32', None, -5),
    ('.text', 0x25, 'R_X86_64_PC32', None, -8),
    ('.text', 0x37, 'R_X86_64_PC32', None, -4),
    ('.text', 0x46, 'R_X86_64_PC32', None, -4),
    ('.text', 0x50, 'R_X86_64_PC32', None, -4),
    ('.text', 0x83, 'R_X86_64_REX_GOTPCRELX', 'stogir_x64_entry', -4),
    ('.data.rel.ro', 0x08, 'R_X86_64_64', None, 0),
    ('.data.rel.ro', 0x10, 'R_X86_64_64', 'stogir_x64_entry', 0x62),
    ('.data.rel.ro', 0x18, 'R_X86_64_PC32', None, 0),
]


def run(*args, check=True):
    result = subprocess.run(list(map(str, args)), cwd=ROOT, env=ENV,
                            capture_output=True, text=True, timeout=1800)
    if check and result.returncode:
        raise SystemExit(f'{" ".join(map(str, args))}: exit {result.returncode}\n'
                         f'{result.stdout}{result.stderr}')
    return result


def relocations(obj):
    """(section, offset, type, symbol, addend) of every relocation, from readelf."""
    found = []
    section = None
    for line in run('readelf', '-rW', obj).stdout.splitlines():
        header = re.match(r"Relocation section '\.rela(\S+)'", line)
        if header:
            section = header.group(1)
            continue
        row = re.match(r'^([0-9a-f]{16})\s+[0-9a-f]{16}\s+(R_X86_64_\S+)\s+[0-9a-f]{16}\s*(\S*)\s*'
                       r'([+-])\s*([0-9a-f]+)$', line.strip())
        if row and section:
            addend = int(row.group(5), 16) * (-1 if row.group(4) == '-' else 1)
            found.append((section, int(row.group(1), 16), row.group(2), row.group(3), addend))
    return found


with tempfile.TemporaryDirectory(prefix='stogir-x64-merge-') as temporary:
    work = Path(temporary)
    program = work / 'merge'
    obj = work / 'merged.o'
    run(COMPILER, 'build', SOURCE, '--backend', 'llvm', '-O1', '--no-debug', '-o', program)
    run(program, obj)
    listing = run('objdump', '-dr', '-M', 'intel', obj).stdout
    sections = run('objdump', '-h', obj).stdout
    if SHOW:
        print(listing)
        print(run('objdump', '-r', '-j', '.data.rel.ro', obj).stdout)
    found = relocations(obj)
    assert len(found) == len(EXPECTED), f'expected {len(EXPECTED)} relocations:\n{found}'
    for (section, offset, kind, name, addend), got in zip(EXPECTED, sorted(found, key=lambda r: (r[0] != '.text', r[1]))):
        assert got[:3] == (section, offset, kind) and got[4] == addend, \
            f'expected {kind} at {section}+{offset:#x} addend {addend}, found {got}'
        if name is None:
            # a label of the image: an assembler temporary
            assert got[3].startswith('.L_stogir.'), f'{section}+{offset:#x}: against {got[3]}'
        else:
            assert got[3] == name, f'{section}+{offset:#x}: against {got[3]}, expected {name}'
    # One data section, the first image's 53 bytes: the second image's data is
    # one address slot and is not emitted.
    size = re.search(r'\.data\.rel\.ro\s+([0-9a-f]{8})', sections)
    assert size and int(size.group(1), 16) == 53, f'unexpected Stogir data:\n{sections}'
    harness = work / 'harness.c'
    harness.write_text(HARNESS)
    for flags in (['-pie'], ['-no-pie'], ['-static']):
        exe = work / ('harness' + flags[0])
        run('cc', '-O1', *flags, harness, obj, '-o', exe)
        ran = run(exe, check=False)
        assert ran.returncode == 0 and 'stogir x64 merge: 0 failures' in ran.stdout \
            and ran.stdout.count('stogir x64 merge\n') == 7, \
            f'{flags[0]}: exit {ran.returncode}\n{ran.stdout}{ran.stderr}'
print('stogir x64 merge: relocations, omitted slot data and linked program: PASS')

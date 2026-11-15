#!/usr/bin/env python3
"""A cached unit is keyed on the declarative backend's settings.

The native backend (`--backend native`)
generates different code under different DECLARATIVE_* settings. A unit built
under one setting must not be reported up to date under another. This checks,
with one compiler and one output directory, that
  - a unit built with DECLARATIVE_SMALL=0 is rebuilt when the variable is
    unset, and the rebuilt object equals a build into a fresh directory;
  - every setting that changes code changes the key, and the same settings
    leave the unit up to date;
  - how many threads compile (DECLARATIVE_THREADS, COIL_NATIVE_SERIAL) is no
    part of the key, and changes no object;
  - a unit of another backend records no declarative settings;
  - the key names every field of the adapter's Settings but those that only
    show, check or say how many threads.
"""
from pathlib import Path
import hashlib
import os
import re
import shutil
import subprocess
import sys
import tempfile

import stogir_target

ROOT = Path(__file__).resolve().parents[2]
COMPILER = Path(sys.argv[1] if len(sys.argv) > 1 else os.environ['COIL']).resolve()
ADAPTER = ROOT / 'src/declarative/adapter/machine.coil'
BASE = {k: v for k, v in os.environ.items() if not k.startswith(('COIL_', 'DECLARATIVE_'))}
BASE['COIL_LIBRARY_STATE'] = '0'

LIBRARY = '''(module unitsettings.lib)
(defn small [(x i64)] (-> i64) (+ (* x 3) 1))
(defn total [(n i64)] (-> i64)
  (let [(mut s) 0] (for [i 0 n] (set! s (+ s (small i)))) s))
'''


def build(source, out, backend='native', **settings):
    result = subprocess.run([str(COMPILER), 'build-unit', str(source), '--backend', backend,
                             '-O3', '-o', str(out)], cwd=source.parent,
                            env=dict(BASE, **settings), capture_output=True, text=True, timeout=300)
    assert result.returncode == 0, result.stdout + result.stderr
    return 'up to date' in result.stdout + result.stderr


def digest(unit):
    return hashlib.sha256((unit / 'unit.o').read_bytes()).hexdigest()


def settings_line(unit):
    lines = [l for l in (unit / 'unit.key').read_text().splitlines() if l.startswith('declarative-settings ')]
    assert len(lines) <= 1, lines
    return lines[0] if lines else None


source = ADAPTER.read_text()
structure = re.search(r'\(defstruct Settings\s*\[(.*?)\]\)', source, re.S)
assert structure, 'Settings structure not found'
fields = re.findall(r'\(([a-z-]+) [^()]*?(?:\([^()]*\))?\)', structure.group(1))
UNKEYED = {'check', 'show', 'threads', 'times'}
keyed = [f for f in fields if f not in UNKEYED]
assert len(keyed) >= 7, fields
VARIABLES = {f: 'DECLARATIVE_' + f.upper().replace('-', '_') for f in keyed}
for variable in VARIABLES.values():
    assert f'c"{variable}"' in source, f'the adapter does not read {variable}'

with tempfile.TemporaryDirectory(prefix='declarative-unit-settings-') as temporary:
    temporary = Path(temporary)
    library = temporary / 'lib.coil'
    library.write_text(LIBRARY)
    unit, fresh = temporary / 'unit', temporary / 'fresh'

    assert not build(library, unit, DECLARATIVE_SMALL='0')
    restricted = digest(unit)
    line = settings_line(unit)
    assert line and 'small=0' in line, line
    for field in keyed:
        assert f' {field}=' in f' {line}', f'unit key does not record {field}: {line}'
    assert build(library, unit, DECLARATIVE_SMALL='0'), 'same settings were rebuilt'

    assert not build(library, unit), 'a unit built under DECLARATIVE_SMALL=0 was reused without it'
    assert not build(library, fresh)
    assert digest(unit) == digest(fresh), 'rebuilt unit differs from a fresh build'
    assert digest(unit) != restricted, 'the fixture does not depend on the inlining setting'
    assert build(library, unit), 'default settings were rebuilt'
    default = settings_line(unit)

    seen = {default}
    for field, variable in VARIABLES.items():
        value = '7'
        build(library, unit, **{variable: value})
        assert build(library, unit, **{variable: value}), f'{variable}={value} was rebuilt twice'
        changed = settings_line(unit)
        assert changed != default, f'{variable} does not change the unit key'
        assert changed not in seen, f'{variable} shares a key with another setting'
        seen.add(changed)
        assert not build(library, unit), f'a unit built under {variable} was reused without it'

    # How many threads compile is no part of the key: the object is the same
    # for every count, so a unit is reused across them.
    build(library, unit)
    for settings in [{'DECLARATIVE_THREADS': '1'}, {'DECLARATIVE_THREADS': '2'},
                     {'DECLARATIVE_THREADS': '8'}, {'COIL_NATIVE_SERIAL': '1'}]:
        assert build(library, unit, **settings), f'{settings} rebuilt an up-to-date unit'
        assert settings_line(unit) == default, f'{settings} entered the unit key'
        rebuilt = temporary / 'workers'
        assert not build(library, rebuilt, **settings)
        assert settings_line(rebuilt) == default
        assert digest(rebuilt) == digest(fresh), f'{settings} changed the unit object'
        shutil.rmtree(rebuilt)

    bad = subprocess.run([str(COMPILER), 'build-unit', str(library), '--backend', 'native', '-O3',
                          '-o', str(unit)], cwd=temporary, env=dict(BASE, DECLARATIVE_SMALL='many'),
                         capture_output=True, text=True, timeout=300)
    assert bad.returncode != 0 and 'DECLARATIVE_SMALL' in bad.stdout + bad.stderr, bad.stdout + bad.stderr

    other = temporary / 'other'
    build(library, other, backend='llvm', DECLARATIVE_SMALL='0')
    assert settings_line(other) is None
    assert build(library, other, backend='llvm'), 'another backend keys on declarative settings'

print('declarative unit settings: ok')

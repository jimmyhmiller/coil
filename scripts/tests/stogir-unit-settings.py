#!/usr/bin/env python3
"""A cached unit is keyed on the Stogir settings it was generated under.

Stogir generates different code under different COIL_STOGIR_* settings. A
unit built under one setting must not be reported up to date under another.
This checks, with one compiler and one output directory, that
  - a unit built with COIL_STOGIR_INLINE=budget=0 is rebuilt when the variable
    is unset, and the rebuilt object equals a build into a fresh directory;
  - every flag setting changes the key, and the same settings leave the unit
    up to date;
  - a unit of another backend records no Stogir settings;
  - the key names every field of the backend's Settings structure, and the
    backend reads the environment nowhere but in the two readers that fill it.
"""
from pathlib import Path
import hashlib
import os
import re
import subprocess
import sys
import tempfile

ROOT = Path(__file__).resolve().parents[2]
COMPILER = Path(sys.argv[1] if len(sys.argv) > 1 else os.environ['COIL']).resolve()
BACKEND = ROOT / 'src/compiler/backend/codegen_stogir.coil'
BASE = {k: v for k, v in os.environ.items() if not k.startswith('COIL_')}
BASE['COIL_LIBRARY_STATE'] = '0'

LIBRARY = '''(module unitsettings.lib)
(defn small [(x i64)] (-> i64) (+ (* x 3) 1))
(defn total [(n i64)] (-> i64)
  (let [(mut s) 0] (for [i 0 n] (set! s (+ s (small i)))) s))
'''


def build(source, out, backend='stogir', **settings):
    result = subprocess.run([str(COMPILER), 'build-unit', str(source), '--backend', backend,
                             '-O3', '-o', str(out)], cwd=source.parent,
                            env=dict(BASE, **settings), capture_output=True, text=True, timeout=300)
    assert result.returncode == 0, result.stdout + result.stderr
    return 'up to date' in result.stdout + result.stderr


def digest(unit):
    return hashlib.sha256((unit / 'unit.o').read_bytes()).hexdigest()


def settings_line(unit):
    lines = [l for l in (unit / 'unit.key').read_text().splitlines() if l.startswith('stogir-settings ')]
    assert len(lines) <= 1, lines
    return lines[0] if lines else None


source = BACKEND.read_text()
structure = re.search(r'\(defstruct Settings\s*\[(.*?)\]\)\n\(derive Debug Settings\)', source, re.S)
assert structure, 'Settings structure not found'
fields = re.findall(r'\(([a-z-]+) (?:bool|\(slice u8\))\)', structure.group(1))
assert len(fields) >= 21, fields
readers = [m.start() for m in re.finditer(r'getenv', source)]
allowed = [source.index('(defn settings-text'), source.index('(defn settings-read')]
for at in readers:
    line = source[source.rfind('\n', 0, at) + 1:source.find('\n', at)]
    assert line.startswith('(import ') or allowed[0] < at < allowed[1], \
        f'the backend reads the environment outside its settings readers: {line.strip()}'
# Execution holds what changes how generation runs and never its output; it
# is read by the same readers and must stay out of the key.
EXECUTION = ['COIL_STOGIR_THREADS']
assert re.search(r'\(defstruct Execution \[\(threads i64\) \(serial bool\)\]\)', source), \
    'Execution structure changed: update the variables it reads here'
assert 'derive Debug Execution' not in source, 'Execution must not be rendered'
# Each variable settings-read names is spelled once per field.
variables = re.findall(r'c"(COIL_STOGIR_[A-Z_]+)"', source)
for variable in EXECUTION:
    assert variables.count(variable) == 2, variable  # read once: presence, then text
    variables = [v for v in variables if v != variable]
assert len(variables) == len(set(variables)) == len(fields), (variables, fields)

with tempfile.TemporaryDirectory(prefix='stogir-unit-settings-') as temporary:
    temporary = Path(temporary)
    library = temporary / 'lib.coil'
    library.write_text(LIBRARY)
    unit, fresh = temporary / 'unit', temporary / 'fresh'

    assert not build(library, unit, COIL_STOGIR_INLINE='budget=0')
    restricted = digest(unit)
    line = settings_line(unit)
    assert line and ':inline "budget=0"' in line, line
    for field in fields:
        assert f':{field} ' in line, f'unit key does not record {field}: {line}'
    assert build(library, unit, COIL_STOGIR_INLINE='budget=0'), 'same settings were rebuilt'

    assert not build(library, unit), 'a unit built under COIL_STOGIR_INLINE=budget=0 was reused without it'
    assert not build(library, fresh)
    assert digest(unit) == digest(fresh), 'rebuilt unit differs from a fresh build'
    assert digest(unit) != restricted, 'the fixture does not depend on the inline setting'
    assert build(library, unit), 'default settings were rebuilt'
    default = settings_line(unit)

    seen = {default}
    for variable in variables:
        if variable == 'COIL_STOGIR_INLINE':
            continue
        if variable == 'COIL_STOGIR_GRAPH':
            values = ['unitsettings.lib.total']
        else:
            values = ['0', '1']
        lines = {}
        for value in values:
            build(library, unit, **{variable: value})
            assert build(library, unit, **{variable: value}), f'{variable}={value} was rebuilt twice'
            lines[value] = settings_line(unit)
        changing = [value for value, line in lines.items() if line != default]
        assert len(changing) == 1, f'{variable} does not change the unit key: {lines}'
        assert lines[changing[0]] not in seen, f'{variable} shares a key with another setting'
        seen.add(lines[changing[0]])
        build(library, unit, **{variable: changing[0]})
        assert not build(library, unit), f'a unit built under {variable} was reused without it'

    # How generation runs is no part of the key: the object is the same for
    # every worker count, so a unit is reused across them.
    build(library, unit)
    for settings in [{'COIL_STOGIR_THREADS': '1'}, {'COIL_STOGIR_THREADS': '2'},
                     {'COIL_STOGIR_THREADS': '8'}, {'COIL_TPDE_SERIAL': '1'}]:
        assert build(library, unit, **settings), f'{settings} rebuilt an up-to-date unit'
        assert settings_line(unit) == default, f'{settings} entered the unit key'
        rebuilt = temporary / 'workers'
        assert not build(library, rebuilt, **settings)
        assert settings_line(rebuilt) == default
        assert digest(rebuilt) == digest(fresh), f'{settings} changed the unit object'
        import shutil
        shutil.rmtree(rebuilt)
    assert 'threads' not in default and 'serial' not in default, default

    bad = subprocess.run([str(COMPILER), 'build-unit', str(library), '--backend', 'stogir', '-O3',
                          '-o', str(unit)], cwd=temporary, env=dict(BASE, COIL_STOGIR_PREDICT='yes'),
                         capture_output=True, text=True, timeout=300)
    assert bad.returncode != 0 and 'COIL_STOGIR_PREDICT' in bad.stderr, bad.stderr

    other = temporary / 'other'
    build(library, other, backend='arm64', COIL_STOGIR_INLINE='budget=0')
    assert settings_line(other) is None
    assert build(library, other, backend='arm64'), 'another backend keys on Stogir settings'

print('stogir unit settings: ok')

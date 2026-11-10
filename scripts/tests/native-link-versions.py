#!/usr/bin/env python3
"""Every backend's macOS program records the same platform, minos and sdk.

The single-object native backends (Stogir, arm64) link with ld directly; the
LLVM backend links through the cc driver. Both must record what the driver
records: `sdk` is the version of the SDK linked against (the system picks,
among other things, its allocator by it) and `minos` is the deployment target
the link names, else MACOSX_DEPLOYMENT_TARGET, else the SDK's version. The
objects themselves carry one build version whatever the backend.
"""
from pathlib import Path
import json
import os
import platform
import re
import subprocess
import sys
import tempfile

if platform.system() != 'Darwin' or platform.machine() != 'arm64':
    print('native link versions: skipped (not macOS arm64)')
    raise SystemExit(0)

ROOT = Path(__file__).resolve().parents[2]
COMPILER = Path(sys.argv[1] if len(sys.argv) > 1 else os.environ['COIL']).resolve()
ENV = {k: v for k, v in os.environ.items()
       if not k.startswith('COIL_') and k != 'MACOSX_DEPLOYMENT_TARGET'}
ENV['COIL_LIBRARY_STATE'] = '0'
BACKENDS = ('llvm', 'stogir', 'arm64')

PROGRAM = '''(defn main [] (-> i64) (println "linked") 0)
'''


def version(path):
    text = subprocess.run(['otool', '-l', str(path)], capture_output=True, text=True, check=True).stdout
    found = re.search(r'cmd LC_BUILD_VERSION\n\s*cmdsize \d+\n\s*platform (\S+)\n\s*minos (\S+)\n\s*sdk (\S+)', text)
    assert found, f'{path}: no LC_BUILD_VERSION'
    return found.groups()


def link(source, out, backend, *flags, **env):
    result = subprocess.run([str(COMPILER), 'build', str(source), '--backend', backend, '--no-debug',
                             '-O1', '-o', str(out), *flags], cwd=source.parent, env=dict(ENV, **env),
                            capture_output=True, text=True, timeout=600)
    assert result.returncode == 0, result.stderr
    assert 'warning' not in result.stderr, result.stderr
    ran = subprocess.run([str(out)], capture_output=True, text=True, timeout=60)
    assert (ran.returncode, ran.stdout) == (0, 'linked\n'), ran
    return version(out)


sdk_path = subprocess.run(['xcrun', '--show-sdk-path'], capture_output=True, text=True, check=True).stdout.strip()
sdk = json.loads((Path(sdk_path) / 'SDKSettings.json').read_text())['Version']

with tempfile.TemporaryDirectory(prefix='native-link-versions-') as temporary:
    temporary = Path(temporary)
    source = temporary / 'program.coil'
    source.write_text(PROGRAM)

    objects = set()
    for backend in BACKENDS:
        obj = temporary / f'{backend}.o'
        result = subprocess.run([str(COMPILER), 'emit-obj', str(source), '--backend', backend,
                                 '--no-debug', '-O1', '-o', str(obj)], cwd=temporary, env=ENV,
                                capture_output=True, text=True, timeout=600)
        assert result.returncode == 0, result.stderr
        objects.add(version(obj))
    assert len(objects) == 1, f'objects differ in build version: {objects}'

    plain = {backend: link(source, temporary / f'plain-{backend}', backend) for backend in BACKENDS}
    assert len(set(plain.values())) == 1, f'programs differ in build version: {plain}'
    assert plain['stogir'][2] == sdk, f'sdk {plain["stogir"][2]} is not the SDK version {sdk}'

    env = {backend: link(source, temporary / f'env-{backend}', backend, MACOSX_DEPLOYMENT_TARGET='13.1')
           for backend in BACKENDS}
    assert set(env.values()) == {('1', '13.1', sdk)}, env

    named = {backend: link(source, temporary / f'named-{backend}', backend,
                           '--target', 'arm64-apple-macosx14.0.0', MACOSX_DEPLOYMENT_TARGET='13.1')
             for backend in BACKENDS}
    assert set(named.values()) == {('1', '14.0', sdk)}, named

print('native link versions: ok')

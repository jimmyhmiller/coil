#!/usr/bin/env python3
"""Bound frontend memory across repeated retained JIT replacements."""

import argparse
import json
import os
from pathlib import Path
import re
import shlex
import subprocess
import sys
import tempfile


ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(Path(__file__).resolve().parent))
import cleanup_on_signal  # noqa: E402
cleanup_on_signal.install()


def run(*command: str, env: dict[str, str] | None = None) -> subprocess.CompletedProcess[str]:
    result = subprocess.run(command, cwd=ROOT, text=True, capture_output=True, env=env)
    if result.returncode:
        raise AssertionError(
            f"{' '.join(command)} exited {result.returncode}\n"
            f"{result.stdout}{result.stderr}"
        )
    return result


def source_for_replacements(count: int) -> str:
    lines = [
        "(module compiler.tests.jit-session-memory)",
        '(import "coil.alloc" :use [malloc-allocator])',
        '(import "coil.jit" :as jit)',
        '(defn main [] (-> i64)',
        '  (let [(mut session) (jit/jit-session-new (malloc-allocator))',
        '        (mut status) 0]',
        '    (when (!= (jit/jit-compile! (mut session) "(defn retained [] (-> i64) 42)") 0)',
        '      (set! status 1))',
    ]
    for index in range(count):
        lines.extend([
            '    (when (= (jit/jit-compile! (mut session) '
            f'"(defn invalid{index} [] (-> i64) true)") 0)',
            '      (set! status 2))',
        ])
    lines.extend([
        '    (when (!= (jit/jit-compile-with-entry! (mut session) "" "(if (= (retained) 42) 0 90)") 0)',
        '      (set! status 3))',
        '    (jit/jit-reset! (mut session))',
        '    (load status)))',
    ])
    return '\n'.join(lines) + '\n'


def source_for_accepted(count: int, replace: bool, reader: bool = False) -> str:
    lines = [
        '(module compiler.tests.jit-accepted-memory)',
        '(import "coil.alloc" :use [malloc-allocator])',
        '(import "coil.jit" :as jit)',
        '(defn main [] (-> i64) (block :probe',
        ' (let [(mut session) (jit/jit-session-new (malloc-allocator))]',
    ]
    if reader:
        lines.append('(when (!= (jit/jit-session-set-source-provider! (mut session) '
                     '"retained.memory-reader" "read-source" "" "") 0) (return-from :probe 6))')
    if replace:
        seed = '(import "coil.repl") (defn value [] (-> i64) 42)'
        entry = '(coil.repl/publish)'
    else:
        seed = '(defn base [] (-> i64) 42)'
        entry = '0'
    def submit(form: str, body: str, failure: int) -> None:
        lines.append('(when (!= (jit/jit-compile-with-entry! (mut session) '
                     + json.dumps(form) + ' ' + json.dumps(body) + ') 0) '
                     + f'(return-from :probe {failure}))')
    submit(seed, entry, 1)
    for i in range(count):
        submit('(defn value [] (-> i64) 42)' if replace else
               f'(defn f{i} [] (-> i64) (base))', entry, 2)
    submit('', '(if (= (' + ('value' if replace else f'f{count-1}') + ') 42) 0 99)', 3)
    lines += ['(when (!= (jit/jit-reset! (mut session)) 0) (return-from :probe 4))',
              '(when (!= (jit/jit-generation-count (mut session)) 0) (return-from :probe 5))',
              '0)))']
    return '\n'.join(lines) + '\n'


def source_for_schema_roots(count: int) -> str:
    lines = [
        '(module compiler.tests.jit-schema-memory)',
        '(import "coil.alloc" :use [malloc-allocator])',
        '(import "coil.jit" :as jit)',
        '(defn main [] (-> i64)',
        ' (let [(mut session) (jit/jit-session-new (malloc-allocator))]',
    ]
    def submit(form: str, entry: str = '0') -> None:
        lines.append('(assert (= (jit/jit-compile-with-entry! (mut session) '
                     + json.dumps(form) + ' ' + json.dumps(entry) + ') 0))')
        lines.append('(assert (>= (jit/jit-reclaim-retired! (mut session)) 0))')
        lines.append('(assert (<= (jit/jit-generation-count (mut session)) 3))')
    submit('(import "coil.jit.lifetime") (defn identity [(x i64)] (-> i64) x)')
    for i in range(count):
        # Fixed-width names distinguish semantic identity from string-size drift.
        name = f'Type{i:06d}'
        root = f'root{i:06d}'
        submit(f'(defstruct {name} :jit/retain false [(value i64)]) '
               f'(defn {root} :jit/retain false :jit/root 1 :jit/root-version {i+1} '
               f'[] (-> i64) (let [v ({name} :value 42)] (identity (.value v))))')
    submit('', f'(if (= (root{count-1:06d}) 42) 0 99)')
    lines += ['(assert (= (jit/jit-reset! (mut session)) 0))', '0))']
    return '\n'.join(lines) + '\n'


def peak_rss(stderr: str) -> int:
    if sys.platform == 'darwin':
        match = re.search(r'(\d+)\s+maximum resident set size', stderr)
        multiplier = 1
    else:
        match = re.search(r'Maximum resident set size \(kbytes\):\s*(\d+)', stderr)
        multiplier = 1024
    assert match, f'time did not report peak RSS:\n{stderr}'
    return int(match.group(1)) * multiplier


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('compiler', nargs='?', default=os.environ.get('COIL'))
    parser.add_argument('--replacements', type=int, default=24)
    parser.add_argument('--submissions', type=int, default=40,
                        help='accepted submissions per steady-state scenario')
    args = parser.parse_args()
    if not args.compiler:
        raise SystemExit('usage: jit-session-memory.py COMPILER (or set $COIL)')
    compiler_path = Path(args.compiler).resolve()
    compiler = str(compiler_path)
    # The generated metadata visitors (retained_snapshot.coil, type_references.coil)
    # must match the compiler's declared types, or retention copies the wrong bytes.
    run(sys.executable, str(ROOT / 'scripts/compiler/gen-retained-snapshot.py'), '--check')
    with tempfile.TemporaryDirectory(prefix='coil-jit-session-memory-',
                                     dir=os.environ.get('COIL_TEST_SCRATCH')) as raw:
        directory = Path(raw)
        # Every SDK session here locates its toolchain through `coil` on PATH:
        # pin the compiler under test, never an installed toolchain that predates it.
        toolbin = directory / 'bin'
        toolbin.mkdir()
        # A symlink, not a wrapper script: the SDK finds the library from where
        # the `coil` it resolves on PATH really lives.
        (toolbin / 'coil').symlink_to(compiler)
        os.environ['PATH'] = str(toolbin) + os.pathsep + os.environ['PATH']
        # Hosts are built at -O0: the JIT work they measure runs in the -O3 unit.
        unit_flags: list[str] = ['-O0']
        if os.environ.get('COIL_TEST_JIT_UNIT'):
            unit_flags += ['--unit', os.environ['COIL_TEST_JIT_UNIT']]
        else:
            installed_sdk = compiler_path.parent.parent / 'lib/coil/compiler'
            installed_matches = all(
                (installed_sdk / name).is_file()
                and (installed_sdk / name).read_bytes() == (ROOT / 'src/compiler' / name).read_bytes()
                for name in ('jit_api.coil', 'driver.coil'))
            # A verified installed toolchain ships its matching unit and links it
            # by itself. Anything else needs a unit built from this checkout, so
            # the test cannot silently link an older installed SDK.
            if not installed_matches:
                if installed_sdk.is_dir():
                    raise AssertionError('installed compiler SDK does not match this checkout; '
                                         'set COIL_TEST_JIT_UNIT to a unit built from it')
                unit = directory / 'jit-unit'
                run(compiler, 'build-unit', str(ROOT / 'src/compiler/jit_api.coil'),
                    '-o', str(unit), '--backend', 'llvm', '-O3', '--quiet')
                unit_flags += ['--unit', str(unit)]

        def timed_run(name: str, source: str, env: dict[str, str] | None = None) -> str:
            path = directory / (name + '.coil')
            executable = directory / name
            path.write_text(source)
            run(compiler, 'build', str(path), '-o', str(executable), *unit_flags)
            return run('/usr/bin/time', '-l' if sys.platform == 'darwin' else '-v',
                       str(executable), env=env).stderr

        # Rejected submissions must release their frontend arenas.
        peak = peak_rss(timed_run('replacements', source_for_replacements(args.replacements)))
        print(f'{args.replacements} rejected retained JIT deltas: peak RSS {peak} B', flush=True)
        assert peak < 768 * 1024 * 1024, 'rejected frontend arenas accumulated'

        # Accepted commits must retire their compiler arenas too. A rejection-only
        # soak cannot establish this: it completely missed multi-GB accepted growth.
        environment = dict(os.environ, COIL_JIT_TRACE='1')
        count = args.submissions
        (directory / 'reader.coil').write_text(
            '(module retained.memory-reader)\n'
            '(import "coil.primitive" :as p)\n'
            '(defn read-source [(context Code)] (-> Code)\n'
            ' (p/code-read (p/code-str (p/code-nth context 2)) context))\n')
        environment['COIL_NAMESPACE_ROOTS'] = str(directory)
        for replacement, reader in ((False, False), (True, False), (True, True)):
            name = 'reader-replace' if reader else ('replace' if replacement else 'accepted')
            stderr = timed_run(name, source_for_accepted(count, replacement, reader), environment)
            retained = [int(n) for n in re.findall(r'jit-work retained-bytes (\d+)', stderr)]
            assert len(retained) == count + 2, 'accepted memory probe did not complete every submission'
            payload = [int(n) for n in re.findall(r'jit-work retained-payload-bytes (\d+)', stderr)]
            assert len(payload) == len(retained), 'missing live-byte accounting'
            bodies = [int(n) for n in re.findall(r'jit-work body-owned-bytes (\d+)', stderr)]
            assert len(bodies) == len(retained), 'missing immutable-body accounting'
            body_live = bodies[10:-1]
            steady = retained[10:-1]
            live = payload[10:-1]
            if replacement:
                # Each republication moves the Var's versioned metadata root
                # (coil.repl); its bookkeeping alternates by a couple of bytes.
                # Retaining a historical definition would add hundreds per submission.
                assert max(live) - min(live) <= 64, (
                    'identical replacement retained historical metadata', live)
                # Address-order packing can change alignment gaps by a few bytes.
                assert max(steady) - min(steady) <= 64, ('snapshot padding grew', steady)
                assert max(body_live) - min(body_live) <= 64, (
                    'identical replacement retained historical body blocks', body_live)
            else:
                assert steady[-1] - steady[0] < 4096 * len(steady), (
                    'trivial definitions retained more than their metadata', steady)
                assert body_live[-1] - body_live[0] < 4096 * len(body_live), (
                    'trivial definitions retained more than their body storage', body_live)
            peak = peak_rss(stderr)
            assert peak < 512 * 1024 * 1024, 'accepted compilation scratch accumulated'
            print(json.dumps({'scenario': name, 'submissions': count,
                              'steady_metadata_bytes': [min(steady), max(steady)],
                              'steady_live_bytes': [min(live), max(live)],
                              'steady_body_bytes': [min(body_live), max(body_live)],
                              'peak_rss_bytes': peak}), flush=True)

        # Superseded type schemas and roots are released as they are replaced.
        stderr = timed_run('schema-roots', source_for_schema_roots(count), environment)
        payload = [int(n) for n in re.findall(r'jit-work retained-payload-bytes (\d+)', stderr)]
        assert len(payload) == count + 2, 'schema root probe did not finish every publication'
        steady = payload[10:-1]
        assert max(steady) - min(steady) <= 64, ('schema roots or repeated resolution aliases accumulated', steady)
        bodies = [int(n) for n in re.findall(r'jit-work body-owned-bytes (\d+)', stderr)]
        assert len(bodies) == len(payload), 'missing schema-body accounting'
        body_live = bodies[10:-1]
        assert max(body_live) - min(body_live) <= 64, ('obsolete schema bodies accumulated', body_live)
        peak = peak_rss(stderr)
        assert peak < 512 * 1024 * 1024, 'schema compiler scratch accumulated'
        print(json.dumps({'scenario': 'schema-roots', 'submissions': count,
                          'steady_live_bytes': [min(steady), max(steady)],
                          'steady_body_bytes': [min(body_live), max(body_live)],
                          'peak_rss_bytes': peak}), flush=True)


if __name__ == '__main__':
    main()

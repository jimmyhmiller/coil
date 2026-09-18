#!/usr/bin/env python3
"""Bound frontend memory across repeated retained JIT replacements."""

import argparse
from collections import Counter
import json
import os
from pathlib import Path
import re
import shlex
import subprocess
import sys
import tempfile


ROOT = Path(__file__).resolve().parents[2]


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
    parser = argparse.ArgumentParser()
    parser.add_argument('compiler')
    parser.add_argument('--replacements', type=int, default=24)
    args = parser.parse_args()
    compiler_path = Path(args.compiler).resolve()
    compiler = str(compiler_path)
    run(sys.executable, str(ROOT / 'scripts/compiler/gen-retained-snapshot.py'), '--check')
    with tempfile.TemporaryDirectory(prefix='.coil-jit-session-memory-', dir=ROOT) as raw:
        directory = Path(raw)
        installed_sdk = compiler_path.parent.parent / 'lib/coil/compiler'
        sources = ('jit_api.coil', 'driver.coil')
        installed_matches = all(
            (installed_sdk / name).is_file()
            and (installed_sdk / name).read_bytes() == (ROOT / 'src/compiler' / name).read_bytes()
            for name in sources
        )
        # A verified installed toolchain already ships the matching JIT unit;
        # adding another copy would duplicate every symbol. A candidate uses
        # an explicit unit built from this checkout, so its test cannot silently
        # link the previously installed SDK instead.
        unit_flags: list[str] = []
        if not installed_matches:
            if installed_sdk.is_dir():
                raise AssertionError('installed compiler SDK does not match this checkout')
            unit = directory / 'jit-unit'
            run(compiler, 'build-unit', str(ROOT / 'src/compiler/jit_api.coil'),
                '-o', str(unit), '--backend', 'llvm', '-O3', '--quiet')
            unit_flags = ['--unit', str(unit)]
        graph_executable = directory / 'retained-graph'
        run(compiler, 'build', str(ROOT / 'tests/compiler/retained_graph_test.coil'),
            '-o', str(graph_executable))
        run(str(graph_executable))
        print('precise graph copies only live bytes and preserves cyclic interior aliases', flush=True)

        source = directory / 'replacements.coil'
        executable = directory / 'replacements'
        source.write_text(source_for_replacements(args.replacements))
        run(compiler, 'build', str(source), '-o', str(executable), *unit_flags)
        timed = run('/usr/bin/time', '-l' if sys.platform == 'darwin' else '-v',
                    str(executable))
        peak = peak_rss(timed.stderr)
        print(f'{args.replacements} rejected retained JIT deltas: peak RSS {peak} B', flush=True)
        assert peak < 768 * 1024 * 1024, 'rejected frontend arenas accumulated'

        # Accepted commits must retire their compiler arenas too. A rejection-only
        # soak cannot establish this: it completely missed multi-GB accepted growth.
        environment = dict(os.environ, COIL_JIT_TRACE='1')
        toolbin = directory / 'bin'
        toolbin.mkdir()
        (toolbin / 'coil').symlink_to(compiler)
        environment['PATH'] = str(toolbin) + os.pathsep + os.environ['PATH']
        # A checked Code-returning trait method must not be rediscovered as a
        # syntax macro on the first delta. Disable the disk cache: otherwise a
        # cached macro image hides recompilation of the accepted helper closure.
        cold_source = directory / 'cold.coil'
        cold_executable = directory / 'cold'
        cold_source.write_text(source_for_accepted(3, False))
        run(compiler, 'build', str(cold_source), '-o', str(cold_executable), *unit_flags)
        cold = run(str(cold_executable), env=dict(environment, COIL_META_CACHE='0'))
        submissions = []
        active = None
        for line in cold.stderr.splitlines():
            if not line.startswith('jit-work '):
                continue
            _, stage, name = line.split(' ', 2)
            if stage == 'begin':
                assert active is None
                active = Counter()
            elif stage == 'end':
                assert name == 'accepted' and active is not None
                submissions.append(active)
                active = None
            else:
                assert active is not None
                active[stage] += 1
        assert active is None and len(submissions) == 5, submissions
        assert all(row['parse'] <= 4 and (row['check'], row['emit']) == (2, 2)
                   for row in submissions[1:-1]), submissions
        print('cold-cache public JIT: every definition delta, including the first, parses at most 4/checks 2/emits 2', flush=True)

        count = max(80, args.replacements)
        provider = directory / 'reader.coil'
        provider.write_text('(module retained.memory-reader)\n'
                            '(import "coil.primitive" :as p)\n'
                            '(defn read-source [(context Code)] (-> Code)\n'
                            ' (p/code-read (p/code-str (p/code-nth context 2)) context))\n')
        environment['COIL_NAMESPACE_ROOTS'] = str(directory)
        for replacement, reader in ((False, False), (True, False), (True, True)):
            name = 'reader-replace' if reader else ('replace' if replacement else 'accepted')
            accepted = directory / (name + '.coil')
            executable = directory / name
            accepted.write_text(source_for_accepted(count, replacement, reader))
            run(compiler, 'build', str(accepted), '-o', str(executable), *unit_flags)
            timed = run('/usr/bin/time', '-l' if sys.platform == 'darwin' else '-v',
                        str(executable), env=environment)
            retained = [int(n) for n in re.findall(r'jit-work retained-bytes (\d+)', timed.stderr)]
            assert len(retained) == count + 2, 'accepted memory probe did not complete every submission'
            payload = [int(n) for n in re.findall(r'jit-work retained-payload-bytes (\d+)', timed.stderr)]
            assert len(payload) == len(retained), 'missing live-byte accounting'
            bodies = [int(n) for n in re.findall(r'jit-work body-owned-bytes (\d+)', timed.stderr)]
            assert len(bodies) == len(retained), 'missing immutable-body accounting'
            body_live = bodies[10:-1]
            steady = retained[10:-1]
            live = payload[10:-1]
            if replacement:
                assert max(live) == min(live), (
                    'identical replacement retained historical metadata', live)
                # Address-order packing can change alignment gaps by a few bytes.
                # Payload is exact; total packed storage must also stay bounded.
                assert max(steady) - min(steady) <= 64, ('snapshot padding grew', steady)
                assert max(body_live) == min(body_live), (
                    'identical replacement retained historical body blocks', body_live)
            else:
                assert steady[-1] - steady[0] < 4096 * len(steady), (
                    'trivial definitions retained more than their metadata', steady)
                assert body_live[-1] - body_live[0] < 4096 * len(body_live), (
                    'trivial definitions retained more than their body storage', body_live)
            peak = peak_rss(timed.stderr)
            assert peak < 512 * 1024 * 1024, 'accepted compilation scratch accumulated'
            print(json.dumps({'scenario': name, 'submissions': count,
                              'steady_metadata_bytes': [min(steady), max(steady)],
                              'steady_live_bytes': [min(live), max(live)],
                              'steady_body_bytes': [min(body_live), max(body_live)],
                              'peak_rss_bytes': peak}), flush=True)

        # Exercise ORC even on macOS ARM64, whose public JIT defaults to Mach-O.
        llvm_flags: list[str] = []
        for flag in shlex.split(run(os.environ.get('LLVM_CONFIG', 'llvm-config'),
                                   '--ldflags', '--libs', '--system-libs').stdout):
            llvm_flags += ['--link-flag', flag]
        llvm_executable = directory / 'llvm-session'
        run(compiler, 'build', str(ROOT / 'tests/compiler/jit_llvm_session_test.coil'),
            '-o', str(llvm_executable), '--backend', 'llvm', *llvm_flags)
        run(str(llvm_executable), env=environment)
        print('ORC incremental objects, static cells, rejection, old pointers, leases, and reset', flush=True)

        # A retained monomorph report contains nested syntax built during the
        # compilation unit. It must remain readable after that unit retires and
        # after later rejected and aborted JIT transactions. This fixture used
        # to segfault after its expected structured-rejection diagnostic.
        feature = ROOT / 'tests/compiler/features/jit_retained_code_state.coil'
        feature_executable = directory / 'retained-code-state'
        run(compiler, 'build', str(feature), '-o', str(feature_executable),
            *unit_flags)
        run(str(feature_executable))
        print('retained Code state survives committed, rejected, and aborted edits',
              flush=True)


        source = directory / 'schema-roots.coil'
        executable = directory / 'schema-roots'
        source.write_text(source_for_schema_roots(count))
        run(compiler, 'build', str(source), '-o', str(executable), *unit_flags)
        timed = run('/usr/bin/time', '-l' if sys.platform == 'darwin' else '-v',
                    str(executable), env=environment)
        payload = [int(n) for n in re.findall(r'jit-work retained-payload-bytes (\d+)', timed.stderr)]
        assert len(payload) == count + 2, 'schema root probe did not finish every publication'
        steady = payload[10:-1]
        assert max(steady) - min(steady) <= 64, ('schema roots or repeated resolution aliases accumulated', steady)
        bodies = [int(n) for n in re.findall(r'jit-work body-owned-bytes (\d+)', timed.stderr)]
        assert len(bodies) == len(payload), 'missing schema-body accounting'
        body_live = bodies[10:-1]
        assert max(body_live) - min(body_live) <= 64, ('obsolete schema bodies accumulated', body_live)
        peak = peak_rss(timed.stderr)
        assert peak < 512 * 1024 * 1024, 'schema compiler scratch accumulated'
        print(json.dumps({'scenario': 'schema-roots', 'submissions': count,
                          'steady_live_bytes': [min(steady), max(steady)],
                          'steady_body_bytes': [min(body_live), max(body_live)],
                          'peak_rss_bytes': peak}), flush=True)


if __name__ == '__main__':
    main()

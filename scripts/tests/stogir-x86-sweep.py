#!/usr/bin/env python3
"""Correctness sweep of the Stogir backend against the LLVM backend.

Builds each program with `--backend stogir` at -O1, -O2 and -O3 and with the
LLVM backend, runs both, and compares stdout and the exit status. Groups:

  corpus    tests/corpus/corpus.txt (with each program's argv)
  demos     tests/demos.txt (src/examples; the listed exit status must hold too)
  simd      tests/simd/*.coil that have a main
  backend   tests/backend/*.coil and tests/cli/*.coil that have a main and run
            without arguments under LLVM (exit status and output as LLVM gives)
  stdlib    `coil test tests/stdlib/NAME` under each backend; the pass/fail
            summary lines must be the same
  examples  `coil test` in each examples/ project, likewise
  library   DIR/tests/*.coil of a coil-stogir checkout given with --library:
            the library's own tests, compiled by Stogir instead of LLVM

Every failure is classified by the first line that explains it: a compiler
message (`stogir: FUNCTION: MESSAGE` is reported as MESSAGE, so equal causes
count together), a crash signal, or `ran wrong`. The summary lists the classes
with counts and the programs in each. Logs of failures go to --logs DIR.

usage: stogir-x86-sweep.py COMPILER [--group G]... [--only SUBSTRING]...
           [--levels 1,2,3] [--jobs N] [--logs DIR] [--library DIR]

Exit status 0 when every program is correct at every level.
"""
from concurrent.futures import ThreadPoolExecutor
from pathlib import Path
import argparse
import collections
import os
import re
import shlex
import shutil
import subprocess
import sys
import tempfile

ROOT = Path(__file__).resolve().parents[2]
GROUPS = ('corpus', 'demos', 'simd', 'backend', 'stdlib', 'examples', 'library')
parser = argparse.ArgumentParser(description=__doc__,
                                 formatter_class=argparse.RawDescriptionHelpFormatter)
parser.add_argument('compiler', type=Path)
parser.add_argument('--group', action='append', choices=GROUPS)
parser.add_argument('--only', action='append', default=[])
parser.add_argument('--levels', default='1,2,3')
parser.add_argument('--jobs', type=int, default=max(1, (os.cpu_count() or 2) // 2))
parser.add_argument('--logs', type=Path)
parser.add_argument('--library', type=Path)
options = parser.parse_args()
COMPILER = options.compiler.resolve()
LEVELS = [f'-O{n}' for n in options.levels.split(',')]
ENV = {k: v for k, v in os.environ.items() if not k.startswith('COIL_')}
ENV['COIL_LIBRARY_STATE'] = '0'
BUILD_TIMEOUT = 900
RUN_TIMEOUT = 120


def run(arguments, cwd, timeout, stdin=None):
    try:
        return subprocess.run(list(map(str, arguments)), cwd=cwd, env=ENV, capture_output=True,
                              timeout=timeout, input=stdin)
    except subprocess.TimeoutExpired:
        return None


def text(result):
    return (result.stdout + result.stderr).decode('utf-8', 'replace')


def explain(result):
    """The class of a failed compiler or program run."""
    if result is None:
        return 'timed out'
    output = text(result)
    for line in output.splitlines():
        message = re.match(r'^stogir: (.*?): (.*)$', line)
        if message:
            return 'stogir: ' + re.sub(r'\d+', 'N', message.group(2))[:150]
    for line in output.splitlines():
        if line.startswith(('error', 'panic', 'ld:', '/usr/bin/ld')) or 'undefined reference' in line:
            return re.sub(r'\d+', 'N', line.strip())[:150]
    if result.returncode < 0:
        return f'signal {-result.returncode}'
    lines = [line for line in output.strip().splitlines() if line.strip()]
    return (lines[-1][:150] if lines else f'exit {result.returncode}, no output')


class Case:
    """One program: how to build it with given flags, and how to run what was built."""

    def __init__(self, group, name, source=None, argv=(), cwd=ROOT, expect_exit=None):
        self.group, self.name, self.source = group, name, source
        self.argv, self.cwd, self.expect_exit = list(argv), cwd, expect_exit

    def build(self, work, tag, flags):
        # the same file name under every backend: a program may print argv[0]
        (work / tag.lstrip('-')).mkdir(exist_ok=True)
        exe = work / tag.lstrip('-') / 'program'
        result = run([COMPILER, 'build', self.source, *flags, '--no-debug', '-o', exe],
                     self.cwd, BUILD_TIMEOUT)
        if result is None or result.returncode != 0 or not exe.exists():
            return None, result
        return exe, result

    def observe(self, exe):
        result = run(['./program', *self.argv], exe.parent, RUN_TIMEOUT, stdin=b'')
        if result is None:
            return None
        return result.returncode, result.stdout

    def check(self, work):
        """{level: (status, class)}; status ok, compile, run or reference."""
        reference, built = self.build(work, '-llvm', ['--backend', 'llvm'])
        if reference is None:
            return {level: ('reference', 'LLVM build failed: ' + explain(built)) for level in LEVELS}
        want = self.observe(reference)
        if want is None or want[0] < 0 or (self.expect_exit is not None and want[0] != self.expect_exit):
            return {level: ('reference', f'LLVM program unusable: {want and want[0]}') for level in LEVELS}
        outcome = {}
        for level in LEVELS:
            exe, built = self.build(work, level, ['--backend', 'stogir', level])
            if exe is None:
                outcome[level] = ('compile', explain(built))
                save(self, level, built)
                continue
            got = self.observe(exe)
            if got == want:
                outcome[level] = ('ok', '')
            elif got is None:
                outcome[level] = ('run', 'ran wrong: timed out')
            elif got[0] < 0:
                outcome[level] = ('run', f'ran wrong: signal {-got[0]}')
            elif got[0] != want[0]:
                outcome[level] = ('run', f'ran wrong: exit status')
            else:
                outcome[level] = ('run', 'ran wrong: output')
            if got != want:
                save_text(self, level, f'want exit {want[0]}\n{want[1][-4000:]!r}\n'
                                       f'got {got and got[0]}\n{got and got[1][-4000:]!r}\n')
        return outcome


class TestCase(Case):
    """`coil test` of a file or project: the summary lines must match LLVM's."""

    def summary(self, flags):
        arguments = [COMPILER, 'test', *([self.source] if self.source else []), *flags, '--no-debug']
        result = run(arguments, self.cwd, BUILD_TIMEOUT)
        if result is None:
            return None, None
        counts = re.findall(r'(\d+) passed|(\d+) failed', text(result))
        return (result.returncode, tuple(counts)), result

    def check(self, work):
        want, reference = self.summary(['--backend', 'llvm'])
        if want is None or want[0] != 0:
            return {level: ('reference', 'LLVM tests do not pass') for level in LEVELS}
        outcome = {}
        for level in LEVELS:
            got, result = self.summary(['--backend', 'stogir', level])
            if got == want:
                outcome[level] = ('ok', '')
            else:
                failed = sorted(set(re.findall(r'^\s*(?:FAIL(?:ED)?|not ok)[: ]+(\S+)', text(result), re.M))) \
                    if result else []
                outcome[level] = ('run' if result and 'stogir: ' not in text(result) else 'compile',
                                  explain(result) if not failed else 'tests failed: ' + ' '.join(failed[:6]))
                save(self, level, result)
        return outcome


def save_text(case, level, content):
    if options.logs:
        options.logs.mkdir(parents=True, exist_ok=True)
        (options.logs / f'{case.group}-{case.name.replace("/", "_")}{level}.log').write_text(content)


def save(case, level, result):
    save_text(case, level, 'timed out' if result is None else text(result)[-20000:])


def has_main(path):
    return re.search(r'^\(defn main\b', path.read_text(errors='replace'), re.M) is not None


def cases():
    found = []
    for raw in (ROOT / 'tests/corpus/corpus.txt').read_text().splitlines():
        line = raw.strip()
        if line and not line.startswith('#'):
            words = shlex.split(line)
            argv = words[words.index('--') + 1:] if '--' in words else []
            found.append(Case('corpus', Path(words[0]).stem, ROOT / 'tests/corpus' / words[0], argv))
    for raw in (ROOT / 'tests/demos.txt').read_text().splitlines():
        line = raw.strip()
        if line and not line.startswith('#'):
            words = shlex.split(line)
            argv = words[words.index('--') + 1:] if '--' in words else []
            if words[1] == 'test':
                found.append(TestCase('demos', Path(words[0]).stem, ROOT / words[0]))
            else:
                found.append(Case('demos', Path(words[0]).stem, ROOT / words[0], argv,
                                  expect_exit=int(words[1])))
    for path in sorted((ROOT / 'tests/simd').glob('*.coil')):
        if has_main(path):
            found.append(Case('simd', path.stem, path))
    for directory in ('tests/backend', 'tests/cli'):
        for path in sorted((ROOT / directory).glob('*.coil')):
            if has_main(path) and 'coil.compiler.' not in path.read_text(errors='replace'):
                found.append(Case('backend', f'{Path(directory).name}/{path.stem}', path))
    for path in sorted((ROOT / 'tests/stdlib').glob('*.coil')):
        found.append(TestCase('stdlib', path.stem, path))
    for manifest in sorted((ROOT / 'examples').glob('*/Coil.toml')):
        found.append(TestCase('examples', manifest.parent.name, None, cwd=manifest.parent))
    if options.library:
        library = options.library.resolve()
        for path in sorted((library / 'tests').glob('*.coil')):
            if has_main(path):
                found.append(Case('library', path.stem, path, cwd=library))
    groups = options.group or [g for g in GROUPS if g != 'library' or options.library]
    return [case for case in found if case.group in groups
            and (not options.only or any(s in case.name for s in options.only))]


def main():
    selected = cases()
    with tempfile.TemporaryDirectory(prefix='stogir-x86-sweep-') as temporary:
        def one(case):
            work = Path(temporary) / case.group / case.name.replace('/', '_')
            work.mkdir(parents=True)
            try:
                return case, case.check(work)
            finally:
                shutil.rmtree(work, ignore_errors=True)
        with ThreadPoolExecutor(options.jobs) as pool:
            results = list(pool.map(one, selected))
    classes = collections.defaultdict(list)
    table = collections.defaultdict(lambda: collections.Counter())
    for case, outcome in results:
        for level, (status, reason) in outcome.items():
            table[case.group][status] += 1
            if status != 'ok':
                classes[reason].append(f'{case.group}/{case.name}{level}')
    wrong = 0
    for group in GROUPS:
        if group in table:
            counts = table[group]
            total = sum(counts.values())
            wrong += total - counts['ok'] - counts['reference']
            print(f'{group:9} {counts["ok"]:4} ok of {total:4} program-levels; '
                  f'{counts["compile"]} do not compile, {counts["run"]} run wrong, '
                  f'{counts["reference"]} without an LLVM reference')
    for reason, names in sorted(classes.items(), key=lambda item: -len(item[1])):
        print(f'\n{len(names):4}  {reason}')
        print('      ' + ' '.join(sorted(names)[:40]) + (' ...' if len(names) > 40 else ''))
    print(f'\nstogir x86 sweep: {"PASS" if wrong == 0 else f"{wrong} program-levels wrong"}')
    return 0 if wrong == 0 else 1


sys.exit(main())

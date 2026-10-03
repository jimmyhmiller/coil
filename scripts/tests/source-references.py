#!/usr/bin/env python3
"""Exercise authored binding evidence and atomic import qualification through lint."""
import argparse
from pathlib import Path
import shutil
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[2]


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--compiler', required=True)
    compiler = str(Path(parser.parse_args().compiler).resolve())
    with tempfile.TemporaryDirectory(prefix='source-references-', dir=ROOT / 'build') as directory:
        project = Path(directory)
        shutil.copytree(ROOT / 'tests/metaprogramming/source_refs', project, dirs_exist_ok=True)
        def run(*args):
            result = subprocess.run([compiler, *args], cwd=project, text=True, capture_output=True)
            if result.returncode:
                raise AssertionError(f'{args}: {result.returncode}\n{result.stdout}\n{result.stderr}')
            return result.stdout + result.stderr
        main_path = project / 'main.coil'
        original = main_path.read_text()
        run('lint', 'main.coil', '--use', 'source-probe.checker')
        run('run', 'main.coil')
        output = run('lint', 'main.coil', '--use', 'source-probe.qualify', '--diff')
        assert main_path.read_text() == original, 'diff changed source'
        assert 'lib/measured' in output and 'lib/double' in output and 'lib/Box' in output, output
        run('lint', 'main.coil', '--use', 'source-probe.qualify', '--fix')
        qualified = main_path.read_text()
        assert ':as lib' in qualified and ':use *' not in qualified
        assert 'lib/amount' not in qualified, 'shadowed local was qualified'
        run('run', 'main.coil')
        output = run('lint', 'main.coil', '--use', 'source-probe.qualify', '--fix')
        assert main_path.read_text() == qualified and 'qualify imported references' not in output, output
        main_path.write_text(original)
        run('lint', 'main.coil', '--use', 'coil.lint.import-aliases', '--fix')
        assert 'lib/measured' in main_path.read_text()
        run('run', 'main.coil')

        def refusal(source, reason):
            main_path.write_text(source)
            output = run('lint', 'main.coil', '--use', 'source-probe.qualify', '--fix')
            assert reason in output, output
            assert '(import "source-probe.lib" :use *' in main_path.read_text(), main_path.read_text()
            assert 'lib/double' not in main_path.read_text(), 'partial edit was applied'

        refusal(original.replace(':use *)', ':use * :reexport)'), 'public export surface')
        refusal(original.replace('(defn main', '(import "source-probe.lib" :as other)\n(defn main'), 'multiple imports')
        (project / 'other.coil').write_text('(module source-probe.other)\n(defn other [] (-> i64) 0)\n')
        refusal(original.replace('(defn main', '(import "source-probe.other" :as lib)\n(defn main'), 'already bound')
        lib_path = project / 'lib.coil'
        lib_original = lib_path.read_text()
        lib_path.write_text(lib_original + '\n(defn discard [(value Code)] (-> Code) `0)\n')
        refusal(original.replace('(- (double', '(+ (discard double) (- (double').replace(' 8)))', ' 8))))'), 'incomplete')
        lib_path.write_text(lib_original + '\n(import "coil.primitive" :as p)\n(defn inspect [(value Code)] (-> Code) (do (p/code-sym (get value 0)) value))\n')
        refusal(original.replace('(double (measured', '(inspect (double (measured').replace(' 8)))', ') 8)))'), 'macro inspected')
        lib_path.write_text(lib_original)

        # Literal syntax is data, while primitive dispatch has real ownership.
        main_path.write_text(original + '\n(defn syntax-data [] (-> Code) `(double measured))\n')
        run('lint', 'main.coil', '--use', 'source-probe.checker')
        run('lint', 'main.coil', '--use', 'source-probe.qualify', '--fix')
        assert '`(double measured)' in main_path.read_text(), main_path.read_text()
        run('run', 'main.coil')
        (project / 'primitive_checker.coil').write_text('''(module source-probe.primitive-checker)
(import "coil.meta" :as meta)
(import "coil.primitive" :as p)
(defn qualify [(modules Code)] (-> Code)
  (do (for import (iter (meta/imports `source-probe.main))
        (when (= (meta/import-target import) `coil.primitive)
          (meta/suggest-edits (meta/qualify-import import `p) "primitive qualification") 0)) `0))
(checker qualify)
''')
        main_path.write_text('(module source-probe.main)\n(import "coil.primitive" :use [code-copy])\n(defn copy [(x Code)] (-> Code) (code-copy x))\n(defn main [] (-> i64) 0)\n')
        run('lint', 'main.coil', '--use', 'source-probe.primitive-checker', '--fix')
        assert '(p/code-copy x)' in main_path.read_text(), main_path.read_text()
        run('run', 'main.coil')

        # Reexport facades preserve the facade spelling despite a canonical owner elsewhere.
        (project / 'facade.coil').write_text('(module source-probe.facade)\n(import "source-probe.lib" :use * :reexport)\n')
        (project / 'facade_checker.coil').write_text('''(module source-probe.facade-checker)
(import "coil.meta" :as meta)
(import "coil.primitive" :as p)
(defn qualify [(modules Code)] (-> Code)
  (do (for import (iter (meta/imports `source-probe.main))
        (when (= (meta/import-target import) `source-probe.facade)
          (meta/suggest-edits (meta/qualify-import import `api) "facade qualification") 0)) `0))
(checker qualify)
''')
        main_path.write_text(original.replace('"source-probe.lib" :use *', '"source-probe.facade" :use * :rename [[double twice]]').replace('(double ', '(twice '))
        run('lint', 'main.coil', '--use', 'source-probe.facade-checker', '--fix')
        assert 'api/double' in main_path.read_text() and 'api/twice' not in main_path.read_text(), main_path.read_text()
        run('run', 'main.coil')
        main_path.write_text('''(module source-probe.main)
(import "coil.meta" :as meta)
(import "coil.primitive" :as p)
(defn unavailable [(unused Code)] (-> Code)
  (do
    (unless (and (p/code-eq (meta/source-modules) `:unavailable)
                 (and (p/code-eq (meta/references `source-probe.main) `:unavailable)
                      (p/code-eq (meta/source-binding `double) `:unavailable)))
      (p/error "source model leaked outside lint") 0)
    `0))
(defn main [] (-> i64) (unavailable `0))
''')
        run('run', 'main.coil')
    print('authored source references: binding identity, macro heads, local shadowing, diff, idempotence, alias policy, atomic refusals, quoted data, primitives, renamed facade, phase isolation: PASS')


if __name__ == '__main__':
    main()

#!/usr/bin/env python3
"""The coil.jit session API: retained environments, lifetime, policy and projects.

    jit-static-session.py [COMPILER]        (default: $COIL)

Each fixture in tests/jit/ is an SDK host program whose `main` returns 0 on
success. They are grouped into a few host programs, each of which imports its
group's fixtures as modules and calls their `main`s in turn, so the suite pays
for eight links of the coil.jit unit rather than sixty. A host prints `== NAME`
to stderr before each fixture, so a crash names the fixture it happened in.

The unit comes from COIL_TEST_JIT_UNIT (the comprehensive tier passes the
installed toolchain's warmed one); without it this builds one, which compiles
the whole compiler.
"""
from __future__ import annotations

import os
import shlex
import subprocess
import sys
import tempfile
import time
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
FIXTURES = ROOT / "tests" / "jit"
sys.path.insert(0, str(Path(__file__).resolve().parent))
import cleanup_on_signal  # noqa: E402
cleanup_on_signal.install()

raw_compiler = sys.argv[1] if len(sys.argv) > 1 else os.environ.get("COIL")
if not raw_compiler:
    raise SystemExit("usage: jit-static-session.py COMPILER (or set $COIL)")
COMPILER = Path(raw_compiler).resolve()
TOOLCHAIN_ENV = os.environ.copy()
TOOLCHAIN_ENV.pop("COIL_NAMESPACE_ROOTS", None)

# Groups of fixtures that share one host process. Order matters only in
# "lifetime": scratch_footprint measures the process footprint after its first
# compile, so it runs before any other session exists.
GROUPS: dict[str, list[str]] = {
    "lifetime": ["scratch_footprint", "static_lifetime", "generation_tokens",
                 "retire_declarations", "retire_definitions", "session_free",
                 "shared_prelude", "retained_code_state"],
    "sessions": ["static_session", "static_policy", "static_dynamic", "static_isolation",
                 "single_form_proof", "retained_declarations",
                 "deferred_publication", "repair_diagnostics", "redefined_signature",
                 "qualified_names", "session_imports", "session_import_meta",
                 "import_tolerant_helper"],
    "replacement": ["repl_policy", "repl_reclaim", "repl_second_submission", "repl_inline_edit",
                    "repl_impl_replace", "const_across_submissions", "repl_const_eval",
                    "const_generic_trait_method", "generic_replacement", "defalias_rebind",
                    "before_expand_const_replacement", "before_expand_sum_replacement",
                    "entry_compile_time_code"],
    "environment": ["deep_source", "env_values", "host_environment", "meta_pipeline", "meta_accepted_impl",
                    "meta_generator_later", "frontend_policy", "llvm_backend",
                    "cimport_header_change"],
    # Run with the project below as the working directory.
    "project": ["repl_import_var", "project_context", "project_free", "defalias_imports"],
    # Run in a directory whose Coil.toml has an unknown key.
    "broken-project": ["project_manifest_error"],
    # Run with the scratch directory as the namespace root, for its source providers.
    "providers": ["static_no_replay", "static_reader", "designated_entry_revisions"],
    # COIL_META_MAIN=1 changes how every compile in the process runs metaprograms.
    "meta-main": ["meta_main"],
}
# Fixtures whose main takes (argc argv): the host passes its own through.
TAKES_ARGV = {"static_no_replay"}
# The import a session in this fixture submits resolves through tests/jit.
SESSION_ROOTS = {"sessions": str(FIXTURES)}


def run(*args, env=None, cwd=ROOT, timeout=240):
    result = subprocess.run(list(map(str, args)), cwd=cwd, text=True,
                            capture_output=True, timeout=timeout, env=env or TOOLCHAIN_ENV)
    assert result.returncode == 0, (args, result.returncode, result.stdout[-4000:], result.stderr[-4000:])
    return result


def module_name(fixture: str) -> str:
    first = (FIXTURES / f"{fixture}.coil").read_text().split("(module ", 1)
    assert len(first) == 2, f"tests/jit/{fixture}.coil has no (module …)"
    return first[1].split(")", 1)[0].strip()


def host_source(group: str, fixtures: list[str]) -> str:
    argv = any(f in TAKES_ARGV for f in fixtures)
    lines = [f"(module jit-host.{group})"]
    lines += [f'(import "{module_name(f)}" :as f{i})' for i, f in enumerate(fixtures)]
    lines.append("(defn report [(name (slice u8)) (status i64)] (-> i64)")
    lines.append('  (if (= status 0) (do (println "PASS: {}" name) 0)')
    lines.append('      (do (println "FAIL: {} returned {}" name status) 1)))')
    lines.append("(defn main [(argc i32) (argv (ptr (ptr i8)))] (-> i64)" if argv
                 else "(defn main [] (-> i64)")
    lines.append("  (let [(mut failed) 0]")
    for i, fixture in enumerate(fixtures):
        # A fixture's main may return any integer width.
        call = f"(cast i64 (f{i}/main argc argv))" if fixture in TAKES_ARGV else f"(cast i64 (f{i}/main))"
        lines.append(f'    (eprintln "== {fixture}")')
        lines.append(f'    (set! failed (+ failed (report "{fixture}" {call})))')
    lines.append("    failed))")
    return "\n".join(lines) + "\n"


def terminal_repl_checks(project: Path) -> None:
    terminal = subprocess.run([str(COMPILER), "repl"], cwd=project, text=True,
        input=":load project-dependency.values\n(answer)\n:quit\n",
        capture_output=True, timeout=120, env=TOOLCHAIN_ENV)
    assert terminal.returncode == 0, (terminal.returncode, terminal.stdout, terminal.stderr)
    assert "42" in terminal.stdout, (terminal.stdout, terminal.stderr)
    print("PASS: terminal REPL uses the current project manifest", flush=True)
    if sys.platform == "darwin":
        app = subprocess.run([str(COMPILER), "repl", "--app", "project-host.app"],
            cwd=project, text=True, input=":run\n", capture_output=True,
            timeout=120, env=TOOLCHAIN_ENV)
        assert app.returncode == 0, (app.returncode, app.stdout, app.stderr)
        assert "Type :run" in app.stdout, (app.stdout, app.stderr)
        print("PASS: project app REPL compiles and launches in one JIT session", flush=True)


def make_project(work: Path) -> Path:
    project = work / "project"
    dep = project / "dependency"
    (dep / "src").mkdir(parents=True)
    (project / "src").mkdir()
    (project / "Coil.toml").write_text(
        '[package]\nname = "project-host"\nsource-roots = ["src"]\n'
        '[dependencies]\nproject-dependency = { path = "dependency" }\n')
    (dep / "Coil.toml").write_text('[package]\nname = "project-dependency"\nsource-roots = ["src"]\n')
    (dep / "src/values.coil").write_text('(module project-dependency.values)\n(defn answer [] (-> i64) 42)\n')
    (project / "src/app.coil").write_text(
        '(module project-host.app)\n(export repl-launch redraw repl-stop)\n'
        '(defn repl-launch [] (-> i64) 0)\n(defn redraw [] (-> i64) 0)\n(defn repl-stop [] (-> i64) 0)\n')
    (dep / "src/live_color.coil").write_text(
        '(module project-dependency.live-color)\n(import "coil.repl")\n(export value)\n'
        '(defn value [] (-> i64) 41)\n(defn __repl_vars [] (-> Code) (coil.repl/var-module))\n')
    (project / "src/aot.coil").write_text(
        '(module project-host.aot)\n(import "project-dependency.live-color" :as color)\n'
        '(defn main [] (-> i64) (- (color/value) 41))\n')
    # Rebinding an alias in a module loaded from disk reaches `:as` and `:use`
    # importers without changing their import declarations.
    (dep / "src/shapes.coil").write_text(
        '(module project-dependency.shapes)\n(defstruct P-v1 [(x i64)])\n(defalias P P-v1)\n'
        '(defn get-v1 [(p P)] (-> i64) (.x p))\n(defalias get get-v1)\n')
    (project / "src/user.coil").write_text(
        '(module project-host.user)\n(import "project-dependency.shapes" :as shapes)\n'
        '(import "project-dependency.shapes" :use [P])\n(defn old [] (-> i64) (shapes/get (P :x 41)))\n')
    return project


def make_broken_project(work: Path) -> Path:
    project = work / "broken-project"
    project.mkdir()
    (project / "Coil.toml").write_text('[package]\nname = "broken"\nentrypoint = "main.coil"\n')
    return project


def broken_manifest_checks(project: Path) -> None:
    terminal = subprocess.run([str(COMPILER), "repl"], cwd=project, text=True, input=":quit\n",
        capture_output=True, timeout=120, env=TOOLCHAIN_ENV)
    assert terminal.returncode == 1, (terminal.returncode, terminal.stdout, terminal.stderr)
    assert "error: Coil.toml:3: unknown key 'entrypoint'" in terminal.stderr, (terminal.stdout, terminal.stderr)
    print("PASS: the terminal REPL reports a malformed manifest and exits 1", flush=True)


def make_providers(work: Path) -> Path:
    providers = work / "providers"
    providers.mkdir()
    (providers / "dependency.coil").write_text(
        '(module retained.dependency)\n(defstruct Point [(x i64)])\n'
        '(defn point [] (-> Point) (Point :x 42))\n')
    (providers / "provider.coil").write_text(
        '(module retained.provider)\n(import "coil.primitive" :as p)\n'
        '(defn read-source [(context Code)] (-> Code)\n'
        '  (p/code-read (p/code-str (p/code-nth context 2)) context))\n')
    (providers / "entry_provider2.coil").write_text('''(module entry.provider2)
(import "coil.primitive" :as p)
(import "coil.slice" :use [subslice])

;; Each submission is one `(defn NAME …)`. It gets a fresh identity that is not
;; retained after publication, NAME is bound to it, and the submission supplies
;; its own entry.
(defn read-source [(context Code)] (-> Code)
  (let [path (p/code-str (p/code-nth context 1))
        digits (subslice path 5 (- (len path) 1))
        entry (p/syntax->datum (p/code-symbol `__coil_session_entry_s digits))
        read (p/code-read (p/code-str (p/code-nth context 2)) context)
        f (if (and (p/code-list? read) (= (get read 0) `do)) (get read 1) read)
        name (get f 1)
        version (p/syntax->datum (p/code-symbol name (p/code-str (p/code-symbol `_v digits))))
        (mut rest) (p/code-list-new)]
    (for i (range 2 (len f)) (push! (mut rest) (get f i)))
    `(do (defn ~version ~@(p/code-list-done (load rest)))
         (defalias ~name ~version)
         (defn ~entry [] (-> i64) 0))))
''')
    return providers


def main() -> None:
    started = time.monotonic()
    with tempfile.TemporaryDirectory(prefix="coil-jit-sessions-", dir=os.environ.get("COIL_TEST_SCRATCH")) as raw:
        work = Path(raw)
        # SDK sessions using the default "coil" toolchain must initialize from the
        # compiler under test and its library, not an unrelated installation.
        toolbin = work / "bin"
        toolbin.mkdir()
        # A symlink, not a wrapper script: the SDK finds the library from where
        # the `coil` it resolves on PATH really lives.
        (toolbin / "coil").symlink_to(COMPILER)
        TOOLCHAIN_ENV["PATH"] = str(toolbin) + os.pathsep + os.environ["PATH"]

        unit = Path(os.environ["COIL_TEST_JIT_UNIT"]) if os.environ.get("COIL_TEST_JIT_UNIT") else work / "sdk"
        if not os.environ.get("COIL_TEST_JIT_UNIT"):
            run(COMPILER, "build-unit", ROOT / "src/compiler/jit_api.coil", "-o", unit,
                "--backend", "llvm", "-O3", "--quiet", timeout=1200)
        # Diagnostic labels such as <bundled compiler/frontend/check.coil> must not hide
        # actual compiler or library dependencies from the prebuilt-unit cache.
        sources = (unit / "unit.sources").read_text()
        for name in ("compiler/frontend/check.coil", "compiler/frontend/resolve.coil", "stdlib/var.coil"):
            assert name in sources, (name, sources)
        # Hosts are a few lines around calls into the -O3 unit, which does all the
        # JIT work, so they are built at -O0.
        flags = ["--unit", unit, "--backend", "llvm", "-O0"]
        if sys.platform.startswith("linux"):
            for flag in shlex.split(run(os.environ.get("LLVM_CONFIG", "llvm-config"),
                                       "--ldflags", "--libs", "--system-libs").stdout):
                flags += ["--link-flag", flag]
        build_env = dict(TOOLCHAIN_ENV, COIL_NAMESPACE_ROOTS=str(FIXTURES))

        project = make_project(work)
        broken = make_broken_project(work)
        providers = make_providers(work)
        terminal_repl_checks(project)
        broken_manifest_checks(broken)
        # A module that opts into the REPL's Var lowering builds ahead of time too.
        aot_binary = work / "repl-var-module-aot"
        run(COMPILER, "build", project / "src/aot.coil", "-o", aot_binary, *flags, cwd=project)
        run(aot_binary, cwd=project)
        print("PASS: an AOT build of a module using REPL Var lowering", flush=True)

        failures = []
        for group, fixtures in GROUPS.items():
            if sys.platform != "darwin":
                fixtures = [f for f in fixtures if f != "scratch_footprint"]
            source = work / f"host_{group.replace('-', '_')}.coil"
            source.write_text(host_source(group, fixtures))
            binary = work / f"host-{group}"
            begin = time.monotonic()
            run(COMPILER, "build", source, "-o", binary, *flags, env=build_env)
            built = time.monotonic() - begin
            env, cwd, args = dict(TOOLCHAIN_ENV), ROOT, []
            if group in SESSION_ROOTS:
                env["COIL_NAMESPACE_ROOTS"] = SESSION_ROOTS[group]
            if group == "project":
                cwd = project
            if group == "broken-project":
                cwd = broken
            if group == "providers":
                env["COIL_NAMESPACE_ROOTS"] = str(providers)
                args = [providers / "dependency.coil"]
            if group == "meta-main":
                env["COIL_META_MAIN"] = "1"
            result = subprocess.run([str(binary), *map(str, args)], cwd=cwd, env=env, text=True,
                                    capture_output=True, timeout=600)
            print(result.stdout, end="", flush=True)
            ran = time.monotonic() - begin - built
            if result.returncode != 0:
                last = [line for line in result.stderr.splitlines() if line.startswith("== ")]
                failures.append(group)
                print(f"FAIL: host {group} exited {result.returncode}"
                      f" (last fixture started: {last[-1][3:] if last else 'none'})\n"
                      + result.stderr[-3000:], flush=True)
            print(f"   host {group}: {len(fixtures)} fixtures, build {built:.1f}s, run {ran:.1f}s", flush=True)
            if group == "providers" and (providers / "dependency.coil").exists():
                failures.append("static_no_replay did not remove its input")

        # Public SDK source graph: discovery follows module identity, the prebuilt
        # ABI stays opaque, read failures keep their diagnostics.
        graph = work / "graph-test"
        run(COMPILER, "build", FIXTURES / "source_graph.coil", "-o", graph, *flags)
        consumer = work / "consumer"
        consumer.mkdir()
        entry = consumer / "entry.coil"
        dependency = consumer / "arbitrary-file-name.coil"
        entry.write_text('(module graph.entry)\n(import "graph.dependency" :as dep)\n'
                         '(defn main [] (-> i64) (dep/value))\n')
        dependency.write_text('(module graph.dependency)\n(defn value [] (-> i64) 42)\n')
        graph_env = dict(TOOLCHAIN_ENV, COIL_NAMESPACE_ROOTS=str(consumer))
        run(graph, entry, cwd=Path("/"), env=graph_env)
        dependency.write_text('(module graph.dependency)\n(defn value [\n')
        run(graph, entry, "invalid", cwd=Path("/"), env=graph_env)
        run(graph, consumer / "missing.coil", "invalid", cwd=Path("/"), env=graph_env)
        print("PASS: SDK source graph follows module identity and keeps read diagnostics", flush=True)

        # The demo in src/examples/jit_expose: a metaprogram hands an application to a
        # session, which type checks new code against it. Its output is its contract.
        demo = work / "jit-expose-demo"
        run(COMPILER, "build", ROOT / "src/examples/jit_expose/demo.coil", "-o", demo, *flags,
            env=dict(TOOLCHAIN_ENV, COIL_NAMESPACE_ROOTS="src/examples"))
        out = run(demo).stdout
        for line in ("status 0", "calls = 1", "expects a reference to example.jit-expose.app.Point, got i64",
                     "call to undefined function 'no-such-function'", "the program reads 41"):
            assert line in out, (line, out)
        print("PASS: jit_expose demo", flush=True)

    if failures:
        raise SystemExit(f"jit sessions: FAILED ({', '.join(failures)}) in {time.monotonic() - started:.1f}s")
    print(f"jit sessions: passed in {time.monotonic() - started:.1f}s")


if __name__ == "__main__":
    main()

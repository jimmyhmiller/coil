#!/usr/bin/env python3
"""Retained compiler environments, static linkage, and user-owned JIT policy."""
from pathlib import Path
import concurrent.futures
import os
import shlex
import subprocess
import sys
import tempfile

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(Path(__file__).resolve().parent))
import cleanup_on_signal  # noqa: E402
cleanup_on_signal.install()
COMPILER = Path(sys.argv[1]).resolve()
TOOLCHAIN_ENV = os.environ.copy()
# Sealed compiler metadata is read-only for every fixture here, so a store into an
# accepted artifact is a fault at that store rather than a later wrong answer.
TOOLCHAIN_ENV["COIL_JIT_PROTECT"] = "1"


def run(*args, env=None, cwd=ROOT):
    result = subprocess.run(list(map(str, args)), cwd=cwd, text=True,
                            capture_output=True, timeout=240, env=env or TOOLCHAIN_ENV)
    assert result.returncode == 0, (args, result.returncode, result.stdout, result.stderr)
    return result


def repl_signature_check():
    # A rejected signature edit must not leave phase metadata dangling in the CLI's
    # enclosing command scope. The accepted definition remains callable afterwards.
    repl = subprocess.run([str(COMPILER), "repl"], cwd=ROOT, text=True,
        input="(defn f [] (-> i64) 7)\n(f)\n(defn f [] (-> bool) true)\n(f)\n:quit\n",
        capture_output=True, timeout=120)
    assert repl.returncode == 0, (repl.returncode, repl.stdout, repl.stderr)
    assert repl.stdout.count("7") == 2, repl.stdout
    assert "conflicting types for parameter" in repl.stderr, repl.stderr
    return "rejected REPL signature edit keeps the accepted definition"


with tempfile.TemporaryDirectory(prefix=".coil-static-jit-", dir=ROOT) as raw:
    work = Path(raw)
    # SDK sessions using the default "coil" toolchain must initialize from the
    # candidate and its matching library, not an unrelated global installation.
    toolbin = work / "bin"
    toolbin.mkdir()
    (toolbin / "coil").symlink_to(COMPILER)
    TOOLCHAIN_ENV["PATH"] = str(toolbin) + os.pathsep + os.environ["PATH"]

    # Everything below is an independent host program, so one pool runs it all.
    # Work that needs no prebuilt unit starts first and overlaps the unit build,
    # the longest single step. COIL_JOBS=1 runs one job at a time.
    jobs = int(os.environ.get("COIL_JOBS") or os.cpu_count() or 1)
    pool = concurrent.futures.ThreadPoolExecutor(max_workers=max(1, jobs))

    # This test reaches private unit lifetime APIs and deliberately source-links
    # the implementation, rather than crossing the public opaque unit interface.
    # That compiles the whole compiler, and optimizing it (40 s of CPU apiece)
    # buys nothing the lifetime checks look at, so it is built at -O0 (12 s), as
    # are the fixtures that import coil.compiler.driver (they get -O0 via flags).
    def source_linked(name):
        binary = work / name
        run(COMPILER, "build", ROOT / f"tests/compiler/features/{name}.coil", "-o", binary, "-O0")
        run(binary)
        return name

    pending = [pool.submit(repl_signature_check)]
    pending += [pool.submit(source_linked, name)
                for name in ("retained_compiler_context", "hygienic_inherent_calls")]

    # The generated suite builds this unit once for every script that needs it.
    unit = Path(os.environ["COIL_TEST_JIT_UNIT"]) if os.environ.get("COIL_TEST_JIT_UNIT") else work / "sdk"
    if not os.environ.get("COIL_TEST_JIT_UNIT"):
        run(COMPILER, "build-unit", ROOT / "src/compiler/jit_api.coil", "-o", unit,
            "--backend", "llvm", "-O3", "--quiet")
    # Diagnostic labels such as <bundled compiler/check.coil> must not hide
    # actual compiler or library dependencies from the prebuilt-unit cache.
    sources = (unit / "unit.sources").read_text()
    for name in ("compiler/check.coil", "compiler/resolve.coil", "stdlib/var.coil"):
        assert name in sources, (name, sources)
    # Host programs are built at -O0. A host's own code is a few lines around
    # calls into the -O3 unit, which does all the JIT work, so optimizing it only
    # costs build time (3.3 s of CPU per host at the default, 1.1 s at -O0).
    flags = ["--unit", unit, "--backend", "llvm", "-O0"]
    if sys.platform.startswith("linux"):
        for flag in shlex.split(run(os.environ.get("LLVM_CONFIG", "llvm-config"),
                                   "--ldflags", "--libs", "--system-libs").stdout):
            flags += ["--link-flag", flag]
    fixtures = ("derive_qualified_shape", "retained_heap", "jit_metadata_lifetime", "jit_type_lifetime", "jit_impl_lifetime", "jit_monomorph_report_lifetime", "jit_source_sharing", "jit_body_sharing", "jit_native_metadata_roots", "jit_repl_policy", "jit_static_session", "jit_static_lifetime", "jit_static_policy",
                "jit_static_dynamic", "jit_static_isolation", "jit_single_form_proof", "jit_checked_baseline", "jit_env_values", "jit_deep_source", "jit_env_stale", "jit_live_checker", "jit_redefined_signature",
                "jit_generation_tokens", "jit_reserved_tokens", "jit_frontend_policy", "jit_meta_pipeline", "jit_deferred_publication", "jit_repair_diagnostics", "jit_defalias_rebind", "jit_retire_declarations", "jit_session_imports", "jit_session_free", "jit_llvm_backend", "jit_repl_second_submission", "jit_repl_impl_replace", "jit_const_across_submissions", "jit_repl_const_eval", "jit_const_generic_trait_method", "jit_meta_accepted_impl", "jit_meta_dependencies", "jit_meta_generator_later", "jit_shared_prelude", "jit_before_expand_const_replacement", "jit_before_expand_sum_replacement", "jit_qualified_names", "jit_entry_compile_time_code", "jit_generic_replacement", "jit_import_tolerant_helper")
    if sys.platform == "darwin":
        fixtures += ("jit_scratch_footprint",)
    # COIL_META_MAIN=1 in an embedding host: main-thread compiles run metaprograms
    # in place; a worker-thread compile is a diagnostic instead of a crash.
    binary = work / "jit_meta_main"
    run(COMPILER, "build", ROOT / "tests/compiler/features/jit_meta_main.coil", "-o", binary, *flags)
    run(binary, env=dict(TOOLCHAIN_ENV, COIL_META_MAIN="1"))
    print("PASS: jit_meta_main", flush=True)
    # Each fixture is its own SDK host with its own binary and JIT sessions.
    def build_and_run(name):
        binary = work / name
        run(COMPILER, "build", ROOT / f"tests/compiler/features/{name}.coil",
            "-o", binary, *flags)
        run(binary)
        return name

    # The project checks share one project directory and edit it as they go, so
    # they run in order, as one job beside the fixtures.
    def project_chain():
        project = work / "project"
        project.mkdir()
        dep = project / "dependency"
        (dep / "src").mkdir(parents=True)
        (project / "Coil.toml").write_text(
            '[package]\nname = "project-host"\nsource-roots = ["src"]\n'
            '[dependencies]\nproject-dependency = { path = "dependency" }\n')
        (project / "src").mkdir()
        (dep / "Coil.toml").write_text(
            '[package]\nname = "project-dependency"\nsource-roots = ["src"]\n')
        (dep / "src/values.coil").write_text(
            '(module project-dependency.values)\n(defn answer [] (-> i64) 42)\n')
        terminal = subprocess.run([str(COMPILER), "repl"], cwd=project, text=True,
            input=":load project-dependency.values\n(answer)\n:quit\n",
            capture_output=True, timeout=120, env=TOOLCHAIN_ENV)
        assert terminal.returncode == 0, (terminal.returncode, terminal.stdout,
                                           terminal.stderr)
        assert "42" in terminal.stdout, (terminal.stdout, terminal.stderr)
        print("PASS: terminal REPL uses the current project manifest", flush=True)
        if sys.platform == "darwin":
            (project / "src/app.coil").write_text(
                '(module project-host.app)\n'
                '(export repl-launch redraw repl-stop)\n'
                '(defn repl-launch [] (-> i64) 0)\n'
                '(defn redraw [] (-> i64) 0)\n'
                '(defn repl-stop [] (-> i64) 0)\n')
            app = subprocess.run([str(COMPILER), "repl", "--app", "project-host.app"],
                cwd=project, text=True, input=":run\n", capture_output=True,
                timeout=120, env=TOOLCHAIN_ENV)
            assert app.returncode == 0, (app.returncode, app.stdout, app.stderr)
            assert "Type :run" in app.stdout, (app.stdout, app.stderr)
            print("PASS: project app REPL compiles and launches in one JIT session", flush=True)
        (dep / "src/live_color.coil").write_text(
            '(module project-dependency.live-color)\n'
            '(import "coil.repl")\n'
            '(export value)\n'
            '(defn value [] (-> i64) 41)\n'
            '(defn __repl_vars [] (-> Code) (coil.repl/var-module))\n')
        (project / "src/aot.coil").write_text(
            '(module project-host.aot)\n'
            '(import "project-dependency.live-color" :as color)\n'
            '(defn main [] (-> i64) (- (color/value) 41))\n')
        aot_binary = work / "repl-var-module-aot"
        run(COMPILER, "build", project / "src/aot.coil", "-o", aot_binary, *flags,
            cwd=project)
        run(aot_binary, cwd=project)
        binary = work / "jit-repl-import-var"
        run(COMPILER, "build", ROOT / "tests/compiler/features/jit_repl_import_var.coil",
            "-o", binary, *flags)
        run(binary, cwd=project)
        print("PASS: AOT and imported JIT modules share REPL Var lowering", flush=True)
        binary = work / "project-context"
        run(COMPILER, "build", ROOT / "tests/compiler/features/jit_project_context.coil",
            "-o", binary, *flags)
        run(binary, cwd=project)
        print("PASS: SDK manifest dependency context without process environment mutation", flush=True)
        binary = work / "project-free"
        run(COMPILER, "build", ROOT / "tests/compiler/features/jit_project_free.coil",
            "-o", binary, *flags)
        run(binary, cwd=project)
        print("PASS: freeing a session releases the manifest it loaded", flush=True)
        # Rebinding an alias in a module loaded from disk reaches `:as` and `:use`
        # importers without changing their import declarations.
        (dep / "src/shapes.coil").write_text(
            '(module project-dependency.shapes)\n'
            '(defstruct P-v1 [(x i64)])\n(defalias P P-v1)\n'
            '(defn get-v1 [(p P)] (-> i64) (.x p))\n(defalias get get-v1)\n')
        (project / "src/user.coil").write_text(
            '(module project-host.user)\n'
            '(import "project-dependency.shapes" :as shapes)\n'
            '(import "project-dependency.shapes" :use [P])\n'
            '(defn old [] (-> i64) (shapes/get (P :x 41)))\n')
        binary = work / "defalias-imports"
        run(COMPILER, "build", ROOT / "tests/compiler/features/jit_defalias_imports.coil",
            "-o", binary, *flags)
        run(binary, cwd=project)
        print("PASS: alias rebinding through imports of disk modules", flush=True)
        dependency = work / "dependency.coil"
        dependency.write_text('(module retained.dependency)\n'
                              '(defstruct Point [(x i64)])\n'
                              '(defn point [] (-> Point) (Point :x 42))\n')
        binary = work / "no-replay"
        run(COMPILER, "build", ROOT / "tests/compiler/features/jit_static_no_replay.coil",
            "-o", binary, *flags)
        run(binary, dependency, env=dict(TOOLCHAIN_ENV, COIL_NAMESPACE_ROOTS=str(work)))
        assert not dependency.exists(), "the no-replay test did not remove its input"
        print("PASS: new forms use an imported type after its source file is removed", flush=True)
        provider = work / "provider.coil"
        provider.write_text('(module retained.provider)\n'
                            '(import "coil.primitive" :as p)\n'
                            '(defn read-source [(context Code)] (-> Code)\n'
                            '  (p/code-read (p/code-str (p/code-nth context 2)) context))\n')
        binary = work / "reader"
        run(COMPILER, "build", ROOT / "tests/compiler/features/jit_static_reader.coil",
            "-o", binary, *flags)
        run(binary, env=dict(TOOLCHAIN_ENV, COIL_NAMESPACE_ROOTS=str(work)))
        print("PASS: retained source provider and one-time ABI preamble", flush=True)
        # The provider is compiled once per session: later reads reuse its engine.
        binary = work / "reader-reuse"
        run(COMPILER, "build", ROOT / "tests/compiler/features/jit_reader_engine_reuse.coil",
            "-o", binary, *flags)
        # The trace is diagnostic output, not text this test owns; count its ASCII
        # markers from the raw bytes.
        traced = subprocess.run([str(binary)], cwd=ROOT, capture_output=True, timeout=240,
                                env=dict(TOOLCHAIN_ENV, COIL_NAMESPACE_ROOTS=str(work), COIL_TRACE="1"))
        assert traced.returncode == 0, (traced.returncode, traced.stderr[-2000:])
        builds = traced.stderr.count(b"coil-trace count reader.engine-builds ")
        reuses = traced.stderr.count(b"coil-trace count reader.engine-reuses ")
        assert builds == 1 and reuses == 3, ("source provider engine builds/reuses", builds, reuses)
        print("PASS: a session's source provider engine is built once and reused", flush=True)
        (work / "entry_provider2.coil").write_text('''(module entry.provider2)
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
        `(do (import "coil.jit.lifetime")
             (defn ~version :jit/retain false ~@(p/code-list-done (load rest)))
             (defalias ~name ~version)
             (defn ~entry [] (-> i64) 0))))
    ''')
        binary = work / "designated-entry"
        run(COMPILER, "build", ROOT / "tests/compiler/features/jit_designated_entry_revisions.coil",
            "-o", binary, *flags)
        run(binary, env=dict(TOOLCHAIN_ENV, COIL_NAMESPACE_ROOTS=str(work)))
        print("PASS: a provider's designated entries across many replacing revisions", flush=True)
        return "project checks"

    pending += [pool.submit(project_chain)]
    pending += [pool.submit(build_and_run, name) for name in fixtures]
    try:
        for future in concurrent.futures.as_completed(pending):
            print(f"PASS: {future.result()}", flush=True)
    finally:
        pool.shutdown(wait=True, cancel_futures=True)

    # Importing the public JIT facade checks a large compiler graph. Keep this
    # stack-depth regression serial so its memory does not overlap other hosts.
    print(f"PASS: {build_and_run('jit_import_jit_facade')}", flush=True)

    # A retained type-resolution record once borrowed names from the next
    # resolve round's scratch arena. Source-link under ASan so the SDK itself
    # is instrumented and the stale reflection lookup fails at the read.
    reflected = work / "jit-nested-type-reflection"
    run(COMPILER, "build", ROOT / "tests/compiler/features/jit_nested_type_reflection.coil",
        "-o", reflected, "-O0", "--sanitize=address")
    run(reflected, env=dict(TOOLCHAIN_ENV, ASAN_OPTIONS="detect_leaks=0"))
    print("PASS: retained nested type reflection under AddressSanitizer", flush=True)

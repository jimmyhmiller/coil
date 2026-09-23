#!/usr/bin/env python3
"""Retained compiler environments, static linkage, and user-owned JIT policy."""
from pathlib import Path
import os
import shlex
import subprocess
import sys
import tempfile

ROOT = Path(__file__).resolve().parents[2]
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


# A rejected signature edit must not leave phase metadata dangling in the CLI's
# enclosing command scope. The accepted definition remains callable afterwards.
repl = subprocess.run([str(COMPILER), "repl"], cwd=ROOT, text=True,
    input="(defn f [] (-> i64) 7)\n(f)\n(defn f [] (-> bool) true)\n(f)\n:quit\n",
    capture_output=True, timeout=120)
assert repl.returncode == 0, (repl.returncode, repl.stdout, repl.stderr)
assert repl.stdout.count("7") == 2, repl.stdout
assert "conflicting types for parameter" in repl.stderr, repl.stderr

with tempfile.TemporaryDirectory(prefix=".coil-static-jit-", dir=ROOT) as raw:
    work = Path(raw)
    # SDK sessions using the default "coil" toolchain must initialize from the
    # candidate and its matching library, not an unrelated global installation.
    toolbin = work / "bin"
    toolbin.mkdir()
    (toolbin / "coil").symlink_to(COMPILER)
    TOOLCHAIN_ENV["PATH"] = str(toolbin) + os.pathsep + os.environ["PATH"]
    unit = work / "sdk"
    run(COMPILER, "build-unit", ROOT / "src/compiler/jit_api.coil", "-o", unit,
        "--backend", "llvm", "-O3", "--quiet")
    # Diagnostic labels such as <bundled compiler/check.coil> must not hide
    # actual compiler or library dependencies from the prebuilt-unit cache.
    sources = (unit / "unit.sources").read_text()
    for name in ("compiler/check.coil", "compiler/resolve.coil", "stdlib/var.coil"):
        assert name in sources, (name, sources)
    flags = ["--unit", unit, "--backend", "llvm"]
    if sys.platform.startswith("linux"):
        for flag in shlex.split(run(os.environ.get("LLVM_CONFIG", "llvm-config"),
                                   "--ldflags", "--libs", "--system-libs").stdout):
            flags += ["--link-flag", flag]
    fixtures = ("derive_qualified_shape", "retained_heap", "jit_metadata_lifetime", "jit_type_lifetime", "jit_impl_lifetime", "jit_monomorph_report_lifetime", "jit_source_sharing", "jit_body_sharing", "jit_native_metadata_roots", "jit_repl_policy", "jit_static_session", "jit_static_lifetime", "jit_static_policy",
                "jit_static_dynamic", "jit_static_isolation", "jit_single_form_proof", "jit_checked_baseline", "jit_env_values", "jit_env_stale", "jit_live_checker", "jit_redefined_signature",
                "jit_generation_tokens", "jit_reserved_tokens", "jit_frontend_policy", "jit_meta_pipeline", "jit_deferred_publication", "jit_repair_diagnostics", "jit_defalias_rebind", "jit_retire_declarations")
    for name in fixtures:
        binary = work / name
        run(COMPILER, "build", ROOT / f"tests/compiler/features/{name}.coil",
            "-o", binary, *flags)
        run(binary)
        print(f"PASS: {name}", flush=True)
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
    run(binary, dependency, env=dict(os.environ, COIL_NAMESPACE_ROOTS=str(work)))
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
    run(binary, env=dict(os.environ, COIL_NAMESPACE_ROOTS=str(work)))
    print("PASS: retained source provider and one-time ABI preamble", flush=True)
    # This test reaches private unit lifetime APIs and deliberately source-links
    # the implementation, rather than crossing the public opaque unit interface.
    for name in ("retained_compiler_context", "hygienic_inherent_calls"):
        binary = work / name
        run(COMPILER, "build", ROOT / f"tests/compiler/features/{name}.coil", "-o", binary)
        run(binary)
        print(f"PASS: {name}", flush=True)

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
    fixtures = ("jit_metadata_lifetime", "jit_type_lifetime", "jit_impl_lifetime", "jit_monomorph_report_lifetime", "jit_native_metadata_roots", "jit_repl_policy", "jit_static_session", "jit_static_lifetime", "jit_static_policy",
                "jit_static_dynamic", "jit_static_isolation", "jit_single_form_proof",
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

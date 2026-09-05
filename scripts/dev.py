#!/usr/bin/env python3
"""Single developer entry point for building, testing, snapshotting, and examples."""

from __future__ import annotations

import argparse
import concurrent.futures
import hashlib
import os
import platform
import shlex
import shutil
import stat
import subprocess
import sys
import tempfile
import time
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent


def execute(*command: str, env: dict[str, str] | None = None, cwd: Path = ROOT) -> None:
    print("+", shlex.join(command), flush=True)
    subprocess.run(command, cwd=cwd, env=env, check=True)


def build(args: argparse.Namespace) -> None:
    if args.variant == "candidate":
        compiler = shutil.which("coil")
        if compiler is None:
            raise SystemExit("candidate build needs an existing `coil` on PATH")
        output = Path(args.output or "build/bin/coil-candidate")
        output = output if output.is_absolute() else ROOT / output
        output.parent.mkdir(parents=True, exist_ok=True)
        if Path(compiler).resolve() == output.resolve():
            raise SystemExit("candidate output must not overwrite the stage0 compiler")
        # A compiler normally loads compiler support modules beside its own
        # executable. Stage the existing binary in a temporary toolchain layout
        # pointing at this checkout, or an installed stage0 would quietly compile
        # its installed copy of rules.coil/driver.coil instead of the edits here.
        build_root = ROOT / "build"
        build_root.mkdir(parents=True, exist_ok=True)
        with tempfile.TemporaryDirectory(prefix=".coil-candidate-stage0-", dir=build_root) as raw:
            prefix = Path(raw)
            staged = prefix / "bin" / "coil"
            staged.parent.mkdir(parents=True)
            shutil.copy2(compiler, staged)
            library = prefix / "lib" / "coil"
            library.mkdir(parents=True)
            (library / "stdlib").symlink_to(ROOT / "src" / "stdlib", target_is_directory=True)
            (library / "compiler").symlink_to(ROOT / "src" / "compiler", target_is_directory=True)
            (library / "prelude.coil").symlink_to(ROOT / "src" / "compiler" / "prelude.coil")
            bootstrap_env = os.environ.copy()
            # Stage 0 predates package namespace exclusions and therefore cannot
            # interpret this checkout's root workspace yet. Build the first
            # candidate through the direct compiler source root; that candidate
            # is what verifies the workspace configuration below.
            bootstrap_env["COIL_NAMESPACE_ROOTS"] = str(ROOT / "src" / "compiler")
            execute(str(staged), "build", "src/compiler/main.coil", "-o", str(output),
                    *llvm_flags("dynamic"), env=bootstrap_env)
        print(f"built compiler candidate -> {output}")
        return

    host = (sys.platform, platform.machine().lower())
    variant = args.variant
    if variant == "full":
        if host == ("linux", "x86_64"):
            variant = "linux"
        elif host != ("darwin", "arm64"):
            raise SystemExit(f"full bootstrap is unsupported on {host[0]}/{host[1]}")
    elif variant == "nollvm":
        if host == ("linux", "x86_64"):
            variant = "nollvm-linux"
        elif host != ("darwin", "arm64"):
            raise SystemExit(f"LLVM-free bootstrap is unsupported on {host[0]}/{host[1]}")
    scripts = {
        "full": "scripts/compiler/rebootstrap.sh",
        "nollvm": "scripts/compiler/rebootstrap-nollvm.sh",
        "linux": "scripts/compiler/rebootstrap-linux.sh",
        "nollvm-linux": "scripts/compiler/rebootstrap-nollvm-linux.sh",
        "x64": "scripts/compiler/bootstrap-x64.sh",
    }
    command = [scripts[variant]]
    if args.output:
        command.append(args.output)
    env = None
    if args.no_install:
        if variant != "full":
            raise SystemExit("--no-install is currently supported only by the full bootstrap")
        env = os.environ.copy()
        env["COIL_SKIP_INSTALL"] = "1"
    execute(*command, env=env)


def install_library(prefix: Path) -> Path:
    """Install the standard library into <prefix>/lib/coil, replacing what is there.

    The compiler finds this directory by walking up from its own location, so the
    library and the binary that reads it are one toolchain with one version. They
    are therefore installed together, always, by this one function -- there is no
    way to install a compiler without its library or to leave a module behind from
    an older one (the directory is replaced, not merged, so a deleted module
    disappears instead of lingering as a phantom).
    """
    libdir = prefix / "lib" / "coil"
    libdir.mkdir(parents=True, exist_ok=True)

    staged = libdir / "stdlib.incoming"
    shutil.rmtree(staged, ignore_errors=True)
    shutil.copytree(ROOT / "src" / "stdlib", staged)

    live = libdir / "stdlib"
    previous = libdir / "stdlib.previous"
    shutil.rmtree(previous, ignore_errors=True)
    if live.exists():
        live.rename(previous)
    staged.rename(live)
    shutil.rmtree(previous, ignore_errors=True)

    shutil.copy2(ROOT / "src" / "compiler" / "prelude.coil", libdir / "prelude.coil")
    # `coil.jit` is an optional source-linked compiler SDK. Keep its implementation
    # out of stdlib/ so ordinary programs never discover or link compiler modules.
    sdk_staged = libdir / "compiler.incoming"
    shutil.rmtree(sdk_staged, ignore_errors=True)
    shutil.copytree(ROOT / "src" / "compiler", sdk_staged)
    sdk_live = libdir / "compiler"
    sdk_previous = libdir / "compiler.previous"
    shutil.rmtree(sdk_previous, ignore_errors=True)
    if sdk_live.exists():
        sdk_live.rename(sdk_previous)
    sdk_staged.rename(sdk_live)
    shutil.rmtree(sdk_previous, ignore_errors=True)
    return libdir


def install_native_archives(source: Path, destination: Path) -> Path | None:
    """Install optional native archives beside the compiler binary.

    Hosted stdlib modules resolve these archives relative to the executable, so
    copying only the compiler and Coil sources produces a toolchain that works
    until an HTTP/llhttp program reaches the native link step. Keep the directory
    replacement atomic for the same reason as the stdlib replacement above.
    """
    source_dir = source.parent / "native"
    if not source_dir.is_dir():
        return None

    live = destination.parent / "native"
    staged = destination.parent / "native.incoming"
    previous = destination.parent / "native.previous"
    shutil.rmtree(staged, ignore_errors=True)
    shutil.copytree(source_dir, staged)
    shutil.rmtree(previous, ignore_errors=True)
    if live.exists():
        live.rename(previous)
    staged.rename(live)
    shutil.rmtree(previous, ignore_errors=True)
    return live


def install(args: argparse.Namespace) -> None:
    """Install a compiler AND its standard library into the user's command path.

    Rebuilding the self-hosted compiler is intentionally opt-in: the normal
    developer workflow is to build/check once, then make that artifact the
    globally available `coil` command without paying for the bootstrap gates
    again. `--build` delegates to the existing verified bootstrap scripts.

    The library goes in before the binary, so the last step is the one that makes
    the new compiler current -- and `coil --version` is run at the end to print
    which library the installed command actually found.
    """
    destination = install_destination(args.dest)
    if args.build:
        built = ROOT / "build" / "bin" / "coil"
        build(argparse.Namespace(variant=args.variant, output=str(built), no_install=False))
        source = built
    else:
        source = Path(args.source).expanduser()
        if not source.is_absolute():
            source = ROOT / source
    if not source.is_file():
        raise SystemExit(
            f"install: compiler artifact not found: {source}\n"
            "build it first, or use `python3 scripts/dev.py install --build`"
        )

    destination.parent.mkdir(parents=True, exist_ok=True)
    # <prefix>/bin/coil -> <prefix>/lib/coil, the layout loader.coil searches for.
    libdir = install_library(destination.parent.parent)
    print(f"installed library -> {libdir}")

    native_dir = install_native_archives(source, destination)
    if native_dir is not None:
        print(f"installed native archives -> {native_dir}")

    if source.resolve() == destination.resolve():
        print(f"already installed: {destination}")
        report_installed(destination)
        return

    shutil.copy2(source, destination)
    destination.chmod(source.stat().st_mode | stat.S_IXUSR | stat.S_IXGRP | stat.S_IXOTH)
    if sys.platform == "darwin":
        subprocess.run(
            ["codesign", "-s", "-", "--force", str(destination)],
            stdout=subprocess.DEVNULL,
            stderr=subprocess.DEVNULL,
            check=False,
        )
    print(f"installed {source} -> {destination}")
    report_installed(destination)


def report_installed(destination: Path) -> None:
    """Print what the installed command reports about itself.

    `coil --version` names the library it found, so this turns "did the install
    actually take, and against which standard library" into something the install
    itself answers.
    """
    done = subprocess.run([str(destination), "--version"], capture_output=True, text=True)
    for line in (done.stdout or done.stderr).splitlines():
        print(f"  {line}")
    if "NOT FOUND" in done.stdout:
        raise SystemExit(
            "install: the installed compiler cannot find its standard library.\n"
            f"  expected {destination.parent.parent / 'lib' / 'coil' / 'stdlib'}"
        )


def install_destination(explicit: str | None) -> Path:
    if explicit:
        destination = Path(explicit).expanduser()
        return destination if destination.is_absolute() else ROOT / destination

    # Prefer the command the user is already invoking when it lives in their
    # home directory (for example ~/.cargo/bin/coil). Otherwise use the
    # conventional user-local bin directory and avoid requiring sudo.
    active = shutil.which("coil")
    if active:
        active_path = Path(active).expanduser()
        try:
            active_path.relative_to(Path.home())
            return active_path
        except ValueError:
            pass
    return Path.home() / ".local" / "bin" / "coil"


def verified_test_compiler(raw: str) -> str:
    """Resolve a compiler and prove its matching library works off-checkout.

    Integration gates deliberately change working directory. A loose candidate can
    appear healthy while invoked from this checkout, then turn every unrelated test
    into "cannot find the coil standard library" once a worker enters /tmp. Fail once,
    before the suite, with the actual toolchain-layout problem instead.
    """
    compiler = Path(raw).expanduser()
    if not compiler.is_absolute():
        compiler = ROOT / compiler
    compiler = compiler.resolve()
    if not os.access(compiler, os.X_OK):
        raise SystemExit(f"test compiler is not executable: {compiler}")
    with tempfile.TemporaryDirectory(prefix="coil-toolchain-preflight-") as cwd:
        checked = subprocess.run(
            [str(compiler), "--version"],
            cwd=cwd,
            capture_output=True,
            text=True,
        )
    output = checked.stdout + checked.stderr
    if (checked.returncode != 0
            or "stdlib:" not in output
            or "stdlib: NOT FOUND" in output):
        detail = output.strip() or f"exit status {checked.returncode} with no diagnostic"
        raise SystemExit(
            "test compiler cannot locate its matching standard library from an "
            f"unrelated working directory:\n  {compiler}\n{detail}\n"
            "Build the candidate under this checkout (the default is "
            "build/bin/coil-candidate) or install the compiler and library together."
        )
    return str(compiler)


def test(args: argparse.Namespace) -> None:
    compiler = args.compiler if args.suite == "all" else verified_test_compiler(args.compiler)
    if args.suite == "all":
        execute("scripts/compiler/rebootstrap.sh")
    elif args.suite == "snapshots":
        execute(sys.executable, "scripts/oracle.py", "gate", "all", "--compiler", compiler,
                *(["--verbose"] if args.verbose else []))
    elif args.suite == "cli":
        execute("scripts/compiler/oracle/gate-cli.sh", compiler)
    elif args.suite == "runtime":
        execute(sys.executable, "scripts/oracle.py", "runtime", "gate", "arm64", "--compiler", compiler)
    elif args.suite == "http":
        test_http(compiler)
    elif args.suite == "wasm":
        test_wasm(compiler)
    elif args.suite == "meta":
        test_meta(compiler)
    elif args.suite == "metaprogramming":
        execute("scripts/tests/metaprogramming/compile-and-run/run.sh", compiler)
    elif args.suite == "core-providers":
        execute("scripts/tests/core-providers.sh", compiler)
    elif args.suite == "meta-entries":
        # The metaprogram-entry gates, host-independent. Neither ran anywhere
        # for a while -- gate-staged-meta was not invoked by anything at all,
        # and a release-build segfault on `coil run <typo>` outlived a green
        # manual gate-run-meta run because nothing re-ran it. Neither bootstrap
        # runs them (both prove the fixpoint and nothing else), so this suite is
        # the only caller, and the CI `full` job runs it against the compiler
        # that job just built.
        execute("scripts/compiler/oracle/gate-run-meta.sh", compiler)
        execute("scripts/compiler/oracle/gate-staged-meta.sh", compiler)
    elif args.suite == "interpreter":
        execute(sys.executable, "scripts/oracle.py", "interpreter", "live", "--compiler", compiler,
                *(["--verbose"] if args.verbose else []))
    elif args.suite == "modernize-fast":
        execute(sys.executable, "tests/compiler/features/transparent_arc_source_guard.py")
        execute(sys.executable, "tests/compiler/features/authored_gensym_source_guard.py")
        execute(sys.executable, "tests/compiler/features/tagged_form_revision_guard.py")
        test_modernize_fast(compiler)


def _test_modernize_fast_serial(compiler: str) -> None:
    """Bounded focused tests for an already-built candidate compiler."""
    started = time.monotonic()
    # Project-mode subprocesses run from their fixture directory. Keep that
    # directory below the checkout so a stage compiler in /tmp can still find
    # this checkout's standard library by walking upward from the working tree.
    with tempfile.TemporaryDirectory(prefix=".coil-modernize-fast-", dir=ROOT) as raw_tmp:
        tmp = Path(raw_tmp)
        candidate = Path(compiler).resolve()
        if not candidate.is_file():
            raise SystemExit(f"fast modernization gate: compiler not found: {candidate}")

        # Header importing is compiler/load work. Exercise literal aliases,
        # expressions, casts, fixed arrays, and opaque ABI fallback on every host.
        bindings = tmp / "cimport-expressions.coil"
        execute(str(candidate), "cimport", "tests/compiler/cimport/expressions.h",
                "-o", str(bindings))
        generated = bindings.read_text()
        for expected in (
                "(const COIL_ALIAS_OPTION 256)",
                "(const COIL_OR_OPTION 260)",
                "(const COIL_CAST_OPTION 512)",
                "(array u8 37)",
                "(defstruct coil_uninspectable :layout explicit"):
            if expected not in generated:
                raise SystemExit(f"fast modernization gate: cimport omitted {expected!r}")
        execute(str(candidate), "check", str(bindings))

        width_test = tmp / "integer-widths"
        execute(str(candidate), "build", "tests/compiler/features/integer_ord_all_widths.coil",
                "--backend", "arm64", "-o", str(width_test))
        execute(str(width_test))

        ambient_test = tmp / "ambient-core-ops"
        execute(str(candidate), "build", "tests/compiler/features/ambient_core_ops.coil",
                "--backend", "arm64", "-o", str(ambient_test))
        execute(str(ambient_test))

        named_call_test = tmp / "named-call-source-order"
        execute(str(candidate), "build", "tests/compiler/features/named_call_source_order.coil",
                "--backend", "arm64", "-o", str(named_call_test))
        execute(str(named_call_test))

        for rejected in (
                "tests/compiler/features/nonambient_primitive_rejected.coil",
                "tests/compiler/features/nonambient_alloc_rejected.coil"):
            result = subprocess.run(
                [str(candidate), "check", rejected], cwd=ROOT,
                stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
            if result.returncode == 0:
                raise SystemExit(f"fast modernization gate: non-ambient operation compiled: {rejected}")

        # Refer control (:exclude / :rename / explicit coil.core import). The refer rules
        # live in one predicate but are consulted by four separate passes, so each surface
        # gets its own fixture: a name hidden from the resolver while the trait method
        # stayed callable would be worse than not having the feature.
        refer_test = tmp / "refer-control"
        execute(str(candidate), "build", "tests/compiler/features/refer_control.coil",
                "--backend", "arm64", "-o", str(refer_test))
        execute(str(refer_test))
        for positive in ("refer_no_core", "refer_core_qualified"):
            execute(str(candidate), "check", f"tests/compiler/features/{positive}.coil")
        for surface in ("value", "macro", "method", "alias"):
            rejected = f"tests/compiler/features/refer_exclude_{surface}_rejected.coil"
            result = subprocess.run(
                [str(candidate), "check", rejected], cwd=ROOT,
                stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
            if result.returncode == 0:
                raise SystemExit(
                    f"fast modernization gate: an excluded name survived on the {surface} surface: {rejected}")

        # Namespace forwarding is compiler name-resolution work, so keep facade
        # regressions in the focused inner loop instead of discovering them in a
        # full release rebootstrap.
        reexport_test = tmp / "reexport-qualified"
        execute(str(candidate), "build", "tests/compiler/features/reexport_qualified.coil",
                "--backend", "arm64", "-o", str(reexport_test))
        result = subprocess.run([str(reexport_test)], cwd=ROOT)
        if result.returncode != 42:
            raise SystemExit(f"fast modernization gate: re-export facade returned {result.returncode}, want 42")
        private_result = subprocess.run(
            [str(candidate), "check", "tests/compiler/features/reexport_private_rejected.coil"],
            cwd=ROOT, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
        if private_result.returncode == 0:
            raise SystemExit("fast modernization gate: facade leaked a private re-export")

        process_test = tmp / "process-facade"
        execute(str(candidate), "build", "tests/compiler/features/process_facade.coil",
                "--backend", "arm64", "-o", str(process_test))
        execute(str(process_test))

        hosted_test = tmp / "hosted-system"
        execute(str(candidate), "build", "tests/hosted_system_test.coil",
                "--backend", "arm64", "-o", str(hosted_test))
        execute(str(hosted_test))

        # An implicit place for an aggregate-valued let inside a loop belongs to
        # the function frame. It must not become a dynamic alloca at the binding
        # site and consume stack on every backedge.
        aggregate_source = "tests/compiler/features/aggregate_loop_stack.coil"
        for opt in ("-O0", "-O3"):
            aggregate_test = tmp / f"aggregate-loop-{opt[1:].lower()}"
            execute(str(candidate), "build", aggregate_source, opt, "-o", str(aggregate_test))
            execute(str(aggregate_test))
        aggregate_ir = subprocess.run(
            [str(candidate), "emit-ir", aggregate_source], cwd=ROOT,
            stdout=subprocess.PIPE, text=True, check=True).stdout
        main_ir = aggregate_ir.split("define i64 @main", 1)[1].split("\n}", 1)[0]
        loop_ir = main_ir.split("loop.body:", 1)[1]
        if "alloca " in loop_ir:
            raise SystemExit("fast modernization gate: aggregate loop contains a dynamic alloca")

        # Public comparisons in static-assert must remain constant expressions.
        static_test = tmp / "static-assert"
        execute(str(candidate), "build", "src/examples/bitfields.coil", "--backend", "arm64",
                "-o", str(static_test))
        result = subprocess.run([str(static_test)], cwd=ROOT)
        if result.returncode != 42:
            raise SystemExit(f"fast modernization gate: static-assert returned {result.returncode}, want 42")

        probe = tmp / "probe.coil"
        probe.write_text("""(module modernization-probe)
(import "coil.primitive" :as primitive)
(defn main [] (-> i64)
  (let [(mut x) 0]
    (primitive/store! x 2)
    (if (primitive/icmp-ge (primitive/load x) 2) 0 1)))
""")
        execute(str(candidate), "lint", str(probe), "--fix")
        fixed = probe.read_text()
        forbidden = ("primitive/load", "primitive/store!", "primitive/field", "primitive/icmp-")
        if any(token in fixed for token in forbidden):
            raise SystemExit("fast modernization gate: autofix left a legacy core operation")
        before = hashlib.sha256(fixed.encode()).digest()
        execute(str(candidate), "lint", str(probe), "--fix")
        if before != hashlib.sha256(probe.read_bytes()).digest():
            raise SystemExit("fast modernization gate: lint --fix is not idempotent")

        broken = tmp / "broken.coil"
        broken.write_text("""(module broken-modernization-probe)
(defn main [] (-> i64) (iadd missing 1))
""")
        before = hashlib.sha256(broken.read_bytes()).digest()
        result = subprocess.run([str(candidate), "lint", str(broken), "--fix"],
                                cwd=ROOT, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
        if result.returncode == 0 or before != hashlib.sha256(broken.read_bytes()).digest():
            raise SystemExit("fast modernization gate: failed fix was not rolled back byte-for-byte")

        broken_project = tmp / "broken-project"
        (broken_project / "src").mkdir(parents=True)
        (broken_project / "Coil.toml").write_text("""[package]
name = "broken-project"
entry = "src/main.coil"
source-roots = ["src"]
""")
        project_main = broken_project / "src/main.coil"
        project_main.write_text("""(module broken-project)
(import "broken-dependency")
(defn main [] (-> i64) (iadd 40 2))
""")
        (broken_project / "src/dependency.coil").write_text("""(module broken-dependency)
(defn broken [] (-> i64) missing)
""")
        before = hashlib.sha256(project_main.read_bytes()).digest()
        result = subprocess.run([str(candidate), "lint", "--fix"], cwd=broken_project,
                                stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
        if result.returncode == 0 or before != hashlib.sha256(project_main.read_bytes()).digest():
            raise SystemExit("fast modernization gate: failed project fix was not rolled back atomically")

    elapsed = time.monotonic() - started
    print(f"fast modernization gate: PASS ({elapsed:.2f}s, compiler={candidate})")


def test_modernize_fast(compiler: str) -> None:
    """Run the independent focused modernization fixtures concurrently."""
    started = time.monotonic()
    # Project-mode subprocesses run from their fixture directory. Keep that
    # directory below the checkout so a stage compiler in /tmp can still find
    # this checkout's standard library by walking upward from the working tree.
    with tempfile.TemporaryDirectory(prefix=".coil-modernize-fast-", dir=ROOT) as raw_tmp:
        tmp = Path(raw_tmp)
        candidate = Path(compiler).resolve()
        if not candidate.is_file():
            raise SystemExit(f"fast modernization gate: compiler not found: {candidate}")
        coil = str(candidate)
        capability = subprocess.run(
            [coil, "emit-ir", "tests/compiler/features/aggregate_loop_stack.coil"],
            cwd=ROOT, stdout=subprocess.DEVNULL, stderr=subprocess.PIPE, text=True)
        has_llvm = capability.returncode == 0
        if not has_llvm and "built without the LLVM backend" not in capability.stderr:
            raise SystemExit(
                "fast modernization gate: compiler's emit-ir capability probe failed:\n"
                + capability.stderr)
        # The native backend emits Mach-O/AArch64 objects. Only select it when
        # this host can link and execute them; elsewhere these fixtures use LLVM.
        backend_flags = (("--backend", "arm64")
                         if sys.platform == "darwin" and platform.machine() == "arm64"
                         else ())

        def expect_rejected(path: str, message: str) -> None:
            result = subprocess.run([coil, "check", path], cwd=ROOT,
                                    stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
            if result.returncode == 0:
                raise RuntimeError(message)

        def cimport_task() -> None:
            bindings = tmp / "cimport-expressions.coil"
            execute(coil, "cimport", "tests/compiler/cimport/expressions.h", "-o", str(bindings))
            generated = bindings.read_text()
            for expected in ("(const COIL_ALIAS_OPTION 256)", "(const COIL_OR_OPTION 260)",
                             "(const COIL_CAST_OPTION 512)", "(array u8 37)",
                             "(defstruct coil_uninspectable :layout explicit"):
                if expected not in generated:
                    raise RuntimeError(f"fast modernization gate: cimport omitted {expected!r}")
            execute(coil, "check", str(bindings))

        def build_run(source: str, name: str, *flags: str, want: int = 0) -> None:
            output = tmp / name
            execute(coil, "build", source, *flags, "-o", str(output))
            result = subprocess.run([str(output)], cwd=ROOT)
            if result.returncode != want:
                raise RuntimeError(f"fast modernization gate: {name} returned {result.returncode}, want {want}")

        def aggregate_ir_task() -> None:
            source = "tests/compiler/features/aggregate_loop_stack.coil"
            ir = subprocess.run([coil, "emit-ir", source], cwd=ROOT,
                                stdout=subprocess.PIPE, text=True, check=True).stdout
            main_ir = ir.split("define i64 @main", 1)[1].split("\n}", 1)[0]
            if "alloca " in main_ir.split("loop.body:", 1)[1]:
                raise RuntimeError("fast modernization gate: aggregate loop contains a dynamic alloca")

        def alloc_static_initial_task() -> None:
            source = "tests/compiler/features/alloc_static_initial.coil"
            build_run(source, "alloc-static-initial")
            ir = subprocess.run([coil, "emit-ir", source], cwd=ROOT,
                                stdout=subprocess.PIPE, text=True, check=True).stdout
            expected = (
                "global %alloc-static-initial.Triple { i32 1, i32 2, i32 3 }",
                "global %alloc-static-initial.Entry { i32 4, ptr @alloc-static-initial.answer, i32 5 }",
            )
            if any(fragment not in ir for fragment in expected):
                raise RuntimeError("fast modernization gate: alloc-static initializer was not emitted as data")
            if any("store" in line and "@repl_static.alloc-static-initial" in line
                   for line in ir.splitlines()):
                raise RuntimeError("fast modernization gate: alloc-static initializer emitted runtime stores")

        def mtrace_fatal_report_task() -> None:
            if not backend_flags:
                return
            result = subprocess.run(
                [coil, "build",
                 "tests/compiler/oracle/diag/build-inputs/15-llvm-ir-parse-fail.coil",
                 *backend_flags, "-o", str(tmp / "mtrace-fatal")],
                cwd=ROOT, text=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE,
                env={**os.environ, "COIL_MTRACE": "mem"})
            if result.returncode == 0:
                raise RuntimeError("fast modernization gate: fatal mtrace probe unexpectedly built")
            if result.stderr.count("mtrace  mem: per-metaprogram allocation") != 1:
                raise RuntimeError(
                    "fast modernization gate: fatal backend path did not print one memory report")
            if "cga64: llvm-ir: unsupported line" not in result.stderr:
                raise RuntimeError(
                    "fast modernization gate: fatal mtrace probe lost its original diagnostic")

        def alias_memory_task() -> None:
            source = "tests/compiler/features/alias_memory.coil"
            ir = subprocess.run([coil, "emit-ir", source], cwd=ROOT,
                                stdout=subprocess.PIPE, text=True, check=True).stdout
            for expected in ('!"Coil explicit type aliasing"',
                             '!"omnipotent char"', '!"integer32"'):
                if expected not in ir:
                    raise RuntimeError(
                        f"fast modernization gate: alias metadata omitted {expected}")
            if ir.count("!tbaa") < 2:
                raise RuntimeError("fast modernization gate: alias load/store omitted TBAA tags")
            build_run(source, "alias-memory", *backend_flags)

        def reexport_task() -> None:
            build_run("tests/compiler/features/reexport_qualified.coil", "reexport-qualified",
                      *backend_flags, want=42)
            expect_rejected("tests/compiler/features/reexport_private_rejected.coil",
                            "fast modernization gate: facade leaked a private re-export")

        def lint_task() -> None:
            hex_probe = tmp / "legacy-hex-escape.coil"
            hex_probe.write_text(r'''(module legacy-hex-escape)
(import "coil.primitive" :as primitive)
; A comment containing "\x42" is not source syntax.
(defn main [] (-> i64)
  (let [legacy \a
        delimiter \]
        quote \"
        canonical #\space
        json "{\\\"id\\\":"
        text "\x41face"
        bytes c"\x00Z"
        slash-cstr c"\\u00"
        quoted-cstr c"\\\""
        adjacent-op (primitive/idiv 4 2)
        current "\x3bb;"]
    0))
''')
            execute(coil, "lint", str(hex_probe), "--fix")
            hex_fixed = hex_probe.read_text()
            if '"\\x41;face"' not in hex_fixed or 'c"\\x00;Z"' not in hex_fixed:
                raise RuntimeError("fast modernization gate: legacy hex escapes were not terminated")
            if '; A comment containing "\\x42"' not in hex_fixed or '"\\x3bb;"' not in hex_fixed:
                raise RuntimeError("fast modernization gate: hex escape preflight edited non-legacy text")
            if "legacy #\\a" not in hex_fixed or "delimiter #\\]" not in hex_fixed:
                raise RuntimeError("fast modernization gate: legacy character literals were not migrated")
            if 'quote #\\"' not in hex_fixed or 'json "{\\\\\\"id\\\\\\":"' not in hex_fixed:
                raise RuntimeError("fast modernization gate: character migration corrupted an escaped string")
            if "canonical #\\space" not in hex_fixed:
                raise RuntimeError("fast modernization gate: canonical character literal was changed")
            if 'c"\\\\u00"' not in hex_fixed or 'c"\\\\\\\""' not in hex_fixed:
                raise RuntimeError("fast modernization gate: semantic rewrite corrupted C-string backslashes")
            execute(coil, "check", str(hex_probe))
            before_hex = hashlib.sha256(hex_probe.read_bytes()).digest()
            execute(coil, "lint", str(hex_probe), "--fix")
            if before_hex != hashlib.sha256(hex_probe.read_bytes()).digest():
                raise RuntimeError("fast modernization gate: hex escape fix is not idempotent")

            probe = tmp / "probe.coil"
            probe.write_text("""(module modernization-probe)
(import "coil.primitive" :as primitive)
(defn main [] (-> i64)
  (let [(mut x) 0]
    (primitive/store! x 2)
    (if (primitive/icmp-ge (primitive/load x) 2) 0 1)))
""")
            execute(coil, "lint", str(probe), "--fix")
            fixed = probe.read_text()
            if any(token in fixed for token in
                   ("primitive/load", "primitive/store!", "primitive/field", "primitive/icmp-")):
                raise RuntimeError("fast modernization gate: autofix left a legacy core operation")
            before = hashlib.sha256(fixed.encode()).digest()
            execute(coil, "lint", str(probe), "--fix")
            if before != hashlib.sha256(probe.read_bytes()).digest():
                raise RuntimeError("fast modernization gate: lint --fix is not idempotent")

            pointer_field_probe = tmp / "pointer-field-store.coil"
            pointer_field_probe.write_text("""(module pointer-field-store)
(import "coil.primitive" :as primitive)
(defstruct Child [(value i64)])
(defstruct Parent [(child (ptr Child))])
(defn assign [(p (ptr Parent))] (-> void)
  (primitive/store! (primitive/field (primitive/load (primitive/field p child)) value) 42))
""")
            execute(coil, "lint", str(pointer_field_probe), "--fix")
            pointer_field_fixed = pointer_field_probe.read_text()
            expected_pointer_store = "(set! (.value (.child p)) 42)"
            if expected_pointer_store not in pointer_field_fixed:
                raise RuntimeError(
                    "fast modernization gate: pointer-valued nested field store lost its dereference")
            execute(coil, "check", str(pointer_field_probe))
            before_pointer_field = hashlib.sha256(pointer_field_probe.read_bytes()).digest()
            execute(coil, "lint", str(pointer_field_probe), "--fix")
            if before_pointer_field != hashlib.sha256(pointer_field_probe.read_bytes()).digest():
                raise RuntimeError(
                    "fast modernization gate: pointer-valued nested field fix is not idempotent")

            stack_probe = tmp / "legacy-stack.coil"
            stack_probe.write_text("""(module legacy-stack)
(import "coil.alloc" :as alloc)
(import "coil.primitive" :as primitive)
(defn read-cell [(p (ptr i64))] (-> i64) (primitive/load p))
(defn safe [] (-> i64)
  (let [p (alloc/stack i64)]
    (primitive/store! p 20)
    (+ (primitive/load p) 22)))
(defn address-sensitive [] (-> i64)
  (let [p (alloc/stack i64)]
    (read-cell p)))
(defn initialized-address-sensitive [] (-> i64)
  (let [p (alloc/stack i64)]
    (primitive/store! p 7)
    (read-cell p)))
""")
            execute(coil, "lint", str(stack_probe), "--fix")
            stack_fixed = stack_probe.read_text()
            if "(let [(mut p) 20]" not in stack_fixed:
                raise RuntimeError("fast modernization gate: initialized stack cell did not become a mutable local")
            if stack_fixed.count("(primitive/alloc-stack i64)") != 2:
                raise RuntimeError("fast modernization gate: address-sensitive stack cell was not preserved explicitly")
            if "alloc/stack" in stack_fixed:
                raise RuntimeError("fast modernization gate: public stack allocation survived autofix")
            execute(coil, "check", str(stack_probe))

            nested_or_probe = tmp / "nested-or.coil"
            nested_or_probe.write_text("""(module nested-or)
(defn choose [(a bool) (b bool) (c bool) (d bool) (e bool)] (-> bool)
  (or (or a b) (or c (or d e))))
(defn mixed [(a bool) (b bool) (c bool) (d bool) (e bool)] (-> bool)
  (or a (or b c d) e))
(defn is-icmp? [(h Code)] (-> bool)
  (or (= h `icmp-lt)
      (or (= h `icmp-gt)
          (or (= h `icmp-le)
              (or (= h `icmp-ge)
                  (or (= h `icmp-eq)
                      (= h `icmp-ne)))))))
""")
            execute(coil, "lint", str(nested_or_probe), "--fix")
            nested_or_fixed = nested_or_probe.read_text()
            if nested_or_fixed.count("(or a b c d e)") != 2:
                raise RuntimeError(
                    "fast modernization gate: nested `or` flattening left a nested form")
            for quoted in ("`icmp-lt", "`icmp-gt", "`icmp-le",
                           "`icmp-ge", "`icmp-eq", "`icmp-ne"):
                if quoted not in nested_or_fixed:
                    raise RuntimeError(
                        "fast modernization gate: nested `or` flattening did not preserve "
                        f"author spelling {quoted!r}")
            if "(quasiquote " in nested_or_fixed:
                raise RuntimeError(
                    "fast modernization gate: nested `or` flattening expanded quote shorthand")
            execute(coil, "check", str(nested_or_probe))
            before_nested_or = hashlib.sha256(nested_or_probe.read_bytes()).digest()
            execute(coil, "lint", str(nested_or_probe), "--fix")
            if before_nested_or != hashlib.sha256(nested_or_probe.read_bytes()).digest():
                raise RuntimeError(
                    "fast modernization gate: nested `or` fix is not idempotent")

            preflight = tmp / "legacy-preflight.coil"
            preflight.write_text("""(module legacy-preflight)
(import "coil.alloc" :as alloc)
(extern free :cc c [(ptr i8)] (-> void))
(defstruct Holder [(allocator (ptr alloc/Allocator))])
(defn owner [(a (dyn alloc/Allocator))] (-> (ptr i64))
  (alloc.box! a i64 1))
(defn arch? [(wanted Code)] (-> bool)
  (code-eq (target-arch) wanted))
(defn release-or [(p (ptr i8)) (release bool)] (-> i64)
  (if release (do (free p)) 7))
""")
            execute(coil, "lint", str(preflight), "--fix")
            migrated = preflight.read_text()
            for expected in ("(dyn alloc/Allocator)", "(alloc/box! a i64 1)",
                             "(= (primitive/target-arch) wanted)",
                             "(primitive/target-arch)", "(do (free p) 0)"):
                if expected not in migrated:
                    raise RuntimeError(
                        f"fast modernization gate: preflight omitted {expected!r}")
            if "(defstruct Holder [(allocator (dyn alloc/Allocator))])" not in migrated:
                raise RuntimeError(
                    "fast modernization gate: allocator field type was not migrated")
            execute(coil, "check", str(preflight))

            use_only = tmp / "legacy-use-only.coil"
            use_only.write_text("""(module legacy-use-only)
(import "coil.alloc" :use *)
(import "coil.primitive" :use *)
(defn cell [] (-> (ptr i64)) (static i64))
(defn bits [(x i64) (y i64)] (-> i64) (iand x y))
""")
            execute(coil, "lint", str(use_only), "--fix")
            use_migrated = use_only.read_text()
            for expected in (":use * :as primitive",
                             "(primitive/alloc-static i64)", "(primitive/iand x y)"):
                if expected not in use_migrated:
                    raise RuntimeError(
                        f"fast modernization gate: use-only import omitted {expected!r}")
            execute(coil, "check", str(use_only))

            serde_probe = tmp / "serde-derive-probe.coil"
            serde_probe.write_text("""(module serde-derive-modernization-probe)
(import "coil.serde" :use *)
(import "coil.serde.derive" :use *)
(defsum Event (Ready []))
(derive-serde-sum Event)
(defstruct User [(display_name (slice u8))])
(derive-serde User (rename-all :camelCase))
(defstruct Outbound [(value i64)])
(derive-serialize Outbound)
(defstruct Inbound [(value i64)])
(derive-deserialize Inbound)
(defn main [] (-> i64) 0)
""")
            execute(coil, "lint", str(serde_probe), "--fix")
            serde_fixed = serde_probe.read_text()
            for legacy in ("derive-serde-sum", "derive-serde", "derive-serialize", "derive-deserialize"):
                if legacy in serde_fixed:
                    raise RuntimeError(f"fast modernization gate: autofix left legacy {legacy}")
            for replacement in ("(derive Serialize Deserialize Event)",
                                "(derive Serialize Outbound)", "(derive Deserialize Inbound)"):
                if replacement not in serde_fixed:
                    raise RuntimeError(f"fast modernization gate: missing serde derive rewrite {replacement!r}")
            if serde_fixed.count("(rename-all :camelCase)") != 2:
                raise RuntimeError("fast modernization gate: serde options were not copied to both traits")
            execute(coil, "check", str(serde_probe))

        def default_lint_task() -> None:
            probe = tmp / "default-lint.coil"
            probe.write_text((ROOT / "tests/metaprogramming/default_lint_input.coil").read_text())
            before = probe.read_bytes()
            preview = subprocess.run([coil, "lint", str(probe), "--diff"], cwd=ROOT,
                                     stdout=subprocess.PIPE, stderr=subprocess.PIPE,
                                     text=True, check=True)
            if probe.read_bytes() != before:
                raise RuntimeError("fast modernization gate: lint --diff changed its input")
            preview_added = "\n".join(
                line[1:] for line in preview.stdout.splitlines()
                if line.startswith("+") and not line.startswith("+++")
            )
            moved_rewrite = "(Moved\n                    :x 1\n                    :y 2\n                    :at 3)"
            for final_rewrite in ("(set! (.value box)", "(.value box)",
                                  moved_rewrite, "try-or!",
                                  "(let [heap (primitive/alloc-static Box)] heap)"):
                if final_rewrite not in preview_added:
                    raise RuntimeError(
                        f"fast modernization gate: lint --diff stopped before fixpoint {final_rewrite!r}")
            if "fixed " in preview.stderr:
                raise RuntimeError("fast modernization gate: lint --diff claimed it wrote a file")
            execute(coil, "lint", str(probe), "--fix")
            fixed = probe.read_text()
            for legacy in ("primitive/icmp-ge", "match-else (", "(Moved 1 2 3)", "(match value"):
                if legacy in fixed:
                    raise RuntimeError(f"fast modernization gate: default lint left {legacy!r}")
            if (moved_rewrite not in fixed or "try-or!" not in fixed
                    or "(set! (.value box)" not in fixed or "(.value box)" not in fixed
                    or "(let [heap (primitive/alloc-static Box)] heap)" not in fixed):
                raise RuntimeError("fast modernization gate: default lint profile did not run every safe fixer")
            if "(Counts :ok 3 :failed 2)" not in fixed or "(mut result)" in fixed:
                raise RuntimeError("fast modernization gate: complete zeroed struct init was not replaced")
            if "(mut reversed)" not in fixed or "(mut dependent)" not in fixed:
                raise RuntimeError("fast modernization gate: unsafe zeroed struct init was rewritten")
            if "(box! a Counts (Counts :ok 8 :failed 1))" not in fixed or "(unwrap-ptr" in fixed:
                raise RuntimeError("fast modernization gate: manual-box fix left the legacy allocation sequence")
            if "(alloc/box! a Counts (Counts :ok 6 :failed 3))" not in fixed:
                raise RuntimeError("fast modernization gate: qualified manual-box fix failed")
            if "(let [p (box! a Counts (Counts :ok 5 :failed 4))]" not in fixed:
                raise RuntimeError("fast modernization gate: manual-box fix lost an address-sensitive result wrapper")
            execute(coil, "fmt", "--write", str(probe))
            formatted = probe.read_text()
            if not all(part in formatted for part in ("(Moved\n", ":x 1\n", ":y 2\n", ":at 3)")):
                raise RuntimeError("fast modernization gate: named constructor was not formatted by field")
            execute(coil, "check", str(probe))

            collection_probe = tmp / "legacy-collections.coil"
            collection_probe.write_text("""(module legacy-collections)
(import "coil.alloc" :use [malloc-allocator])
(import "coil.arraylist" :as arraylist)
(import "coil.hashmap" :as hashmap)
(import "coil.primitive" :as primitive)
(import "coil.slice" :as slice)
(defn inspect [(forms Code)] (-> Code)
  (if (primitive/code-eq (primitive/code-nth forms 0) `ok)
      (if (= (primitive/code-count forms) 1) `42 `0)
      `0))
(defn slice-first [(items (slice i64))] (-> i64)
  (if (slice/slice-empty? items) 0
      (+ (slice/slice-len items) (slice/slice-get items 0))))
(defn map-value [(m (hashmap/HashMap i64 i64))] (-> (Option i64))
  (if (= (hashmap/hm-len [i64 i64] m) 0) (None)
      (hashmap/hm-get [i64 i64] m 1)))
(defn map-put! [(m (mut (hashmap/HashMap i64 i64)))] (-> i64)
  (hashmap/hm-put! [i64 i64] (mut m) 1 42))
(defn push-none! [(items (mut (arraylist/ArrayList (Option i64))))] (-> i64)
  (arraylist/al-push! [(Option i64)] (mut items) (None)))
(defn main [] (-> i64)
  (let [a (malloc-allocator)
        (mut xs) (arraylist/al-new [i64] a)
        _push (arraylist/al-push! [i64] (mut xs) 42)
        _set (arraylist/al-set! [i64] (mut xs) 0 42)
        n (arraylist/al-len [i64] xs)
        value (arraylist/al-get [i64] xs 0)]
    (if (arraylist/al-empty? [i64] xs) 1
        (if (= n 1) (- value 42) 2))))
""")
            execute(coil, "lint", str(collection_probe), "--fix")
            collection_fixed = collection_probe.read_text()
            for legacy in ("primitive/code-eq", "primitive/code-nth", "primitive/code-count",
                           "arraylist/al-push!", "arraylist/al-len", "arraylist/al-get",
                           "arraylist/al-set!", "arraylist/al-empty?", "slice/slice-empty?",
                           "slice/slice-len", "slice/slice-get", "hashmap/hm-len",
                           "hashmap/hm-get", "hashmap/hm-put!"):
                if legacy in collection_fixed:
                    raise RuntimeError(
                        f"fast modernization gate: collection autofix left {legacy!r}")
            for replacement in ("(= (get forms 0) `ok)", "(len forms)",
                                "(push! [i64] (mut xs) 42)", "(len xs)", "(get xs 0)",
                                "(set! (mut xs) 0 42)", "(empty? xs)",
                                "(empty? items)", "(len items)", "(get items 0)",
                                "(len m)", "(get m 1)", "(set! (mut m) 1 42)"):
                if replacement not in collection_fixed:
                    raise RuntimeError(
                        f"fast modernization gate: missing collection rewrite {replacement!r}")
            if "(push! [(Option i64)] (mut items) (None))" not in collection_fixed:
                raise RuntimeError(
                    "fast modernization gate: collection rewrite dropped explicit type arguments")
            execute(coil, "check", str(collection_probe))

        def broken_lint_task() -> None:
            broken = tmp / "broken.coil"
            broken.write_text("""(module broken-modernization-probe)
(defn main [] (-> i64) (iadd missing 1))
""")
            before = hashlib.sha256(broken.read_bytes()).digest()
            result = subprocess.run([coil, "lint", str(broken), "--fix"],
                                    cwd=ROOT, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
            if result.returncode == 0 or before != hashlib.sha256(broken.read_bytes()).digest():
                raise RuntimeError("fast modernization gate: failed fix was not rolled back byte-for-byte")

        def broken_project_task() -> None:
            project = tmp / "broken-project"
            (project / "src").mkdir(parents=True)
            (project / "Coil.toml").write_text("""[package]
name = "broken-project"
entry = "src/main.coil"
source-roots = ["src"]
""")
            main = project / "src/main.coil"
            main.write_text("""(module broken-project)
(import "broken-dependency")
(defn main [] (-> i64) (iadd 40 2))
""")
            (project / "src/dependency.coil").write_text("""(module broken-dependency)
(defn broken [] (-> i64) missing)
""")
            before = hashlib.sha256(main.read_bytes()).digest()
            result = subprocess.run([coil, "lint", "--fix"], cwd=project,
                                    stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
            if result.returncode == 0 or before != hashlib.sha256(main.read_bytes()).digest():
                raise RuntimeError("fast modernization gate: failed project fix was not rolled back atomically")

        def rollback_scale_task() -> None:
            project = tmp / "rollback-scale"
            source = project / "src"
            source.mkdir(parents=True)
            (project / "Coil.toml").write_text("""[package]
name = "rollback"
entry = "src/part0.coil"
source-roots = ["src"]
""")
            (source / "badlint.coil").write_text("""(module rollback.badlint)
(import "coil.primitive" :as primitive)
(defn bad-head? [(f Code)] (-> bool)
  (and (primitive/code-list? f)
       (and (> (primitive/code-count f) 0)
            (primitive/code-eq (primitive/code-nth f 0) `rollback-trigger))))
(defn bad-walk [(f Code)] (-> i64)
  (if (primitive/code-list? f)
      (if (bad-head? f)
          (do (primitive/suggest f "transaction rollback probe" `missing) 0)
          (bad-kids f 0 (primitive/code-count f)))
      0))
(defn bad-kids [(f Code) (i i64) (n i64)] (-> i64)
  (if (>= i n) 0
      (do (bad-walk (primitive/code-nth f i))
          (bad-kids f (primitive/iadd i 1) n))))
(defn bad-modules [(ms Code) (i i64) (n i64)] (-> i64)
  (if (>= i n) 0
      (do (bad-walk (primitive/code-nth ms i))
          (bad-modules ms (primitive/iadd i 1) n))))
(defn lint-bad [(modules Code)] (-> i64)
  (bad-modules modules 0 (primitive/code-count modules)))
(checker lint-bad)
""")
            for file_index in range(7):
                forms = "\n".join(
                    f"(defn legacy-{file_index}-{form_index} [] (-> bool) "
                    f"(primitive/icmp-eq {form_index} {form_index}))"
                    for form_index in range(17)
                )
                trigger = ("\n(defn rollback-trigger [] (-> i64) 0)\n"
                           "(defn force-invalid-fix [] (-> i64) (rollback-trigger))\n"
                           if file_index == 0 else "\n")
                imports = ("".join(f'(import "rollback.part{i}")\n' for i in range(1, 7))
                           if file_index == 0 else "")
                (source / f"part{file_index}.coil").write_text(
                    f"(module rollback.part{file_index})\n"
                    f"{imports}"
                    "(import \"coil.primitive\" :as primitive)\n"
                    f"{forms}{trigger}")
            files = sorted(source.glob("*.coil"))
            before = {path: hashlib.sha256(path.read_bytes()).digest() for path in files}
            execute(coil, "check", cwd=project)
            result = subprocess.run([coil, "lint", "--fix", "--use", "rollback.badlint"],
                                    cwd=project, text=True, stdin=subprocess.DEVNULL,
                                    stdout=subprocess.PIPE, stderr=subprocess.PIPE)
            if result.returncode == 0:
                raise RuntimeError("fast modernization gate: invalid scale fix unexpectedly succeeded")
            if "reverted" not in result.stderr:
                raise RuntimeError("fast modernization gate: scale rollback did not report reversion")
            changed = [path for path in files
                       if hashlib.sha256(path.read_bytes()).digest() != before[path]]
            if changed:
                raise RuntimeError(
                    f"fast modernization gate: scale rollback changed {len(changed)} file(s)")
            execute(coil, "check", cwd=project)

        def breaking_scan_task() -> None:
            project = tmp / "breaking-scan"
            (project / "src").mkdir(parents=True)
            (project / "Coil.toml").write_text("""[package]
name = "breaking-scan"
entry = "src/main.coil"
source-roots = ["src"]
""")
            main = project / "src/main.coil"
            main.write_text("""(module breaking-scan)
(import "coil.primitive" :as primitive)
(import "coil.alloc" :as alloc)
(defn main [] (-> i64)
  (let [p (primitive/alloc-stack i64)]
    (primitive/store! p 0)
    (primitive/load p)))
""")
            clean = subprocess.run(
                [coil, "build", *backend_flags, "-o", str(project / "clean")],
                cwd=project, text=True, stdin=subprocess.DEVNULL,
                stdout=subprocess.PIPE, stderr=subprocess.PIPE)
            if clean.returncode != 0:
                raise RuntimeError("fast modernization gate: low-level detector probe did not build")
            if "obsolete Coil syntax" in clean.stderr:
                raise RuntimeError("fast modernization gate: valid low-level primitives triggered migration offer")

            main.write_text("""(module breaking-scan)
(defn main [] (-> i64)
  (let [p (alloc-stack i64)] 0))
""")
            legacy = subprocess.run(
                [coil, "build", *backend_flags, "-o", str(project / "legacy")],
                cwd=project, text=True, stdin=subprocess.DEVNULL,
                stdout=subprocess.PIPE, stderr=subprocess.PIPE)
            if "obsolete Coil syntax" not in legacy.stderr:
                raise RuntimeError("fast modernization gate: obsolete alloc spelling did not trigger migration offer")

        tasks = [
            cimport_task,
            lambda: build_run("tests/compiler/features/integer_ord_all_widths.coil", "integer-widths",
                              *backend_flags),
            lambda: build_run("tests/compiler/features/ambient_core_ops.coil", "ambient-core-ops",
                              *backend_flags),
            lambda: build_run("tests/compiler/features/code_eq_trait.coil", "code-eq-trait",
                              *backend_flags, want=42),
            lambda: build_run("tests/compiler/features/named_call_source_order.coil",
                              "named-call-source-order", *backend_flags),
            lambda: expect_rejected("tests/compiler/features/nonambient_primitive_rejected.coil",
                                    "fast modernization gate: non-ambient primitive compiled"),
            lambda: expect_rejected("tests/compiler/features/nonambient_alloc_rejected.coil",
                                    "fast modernization gate: non-ambient allocation compiled"),
            lambda: build_run("tests/compiler/features/refer_control.coil", "refer-control",
                              *backend_flags),
            lambda: execute(coil, "check", "tests/compiler/features/refer_no_core.coil"),
            lambda: execute(coil, "check", "tests/compiler/features/refer_core_qualified.coil"),
            reexport_task,
            lambda: build_run("tests/compiler/features/process_facade.coil", "process-facade",
                              *backend_flags),
            lambda: build_run("tests/hosted_system_test.coil", "hosted-system", *backend_flags),
            lambda: build_run("tests/compiler/features/aggregate_loop_stack.coil", "aggregate-loop-o0", "-O0"),
            lambda: build_run("tests/compiler/features/aggregate_loop_stack.coil", "aggregate-loop-o3", "-O3"),
            lambda: build_run("tests/compiler/features/void_if_discarded.coil", "void-if-discarded"),
            lambda: build_run("src/examples/bitfields.coil", "static-assert", *backend_flags, want=42),
            lambda: build_run("tests/compiler/features/alloc_static_initial.coil",
                              "alloc-static-initial-direct", *backend_flags),
            mtrace_fatal_report_task,
            lint_task,
            default_lint_task,
            broken_lint_task,
            broken_project_task,
            rollback_scale_task,
            breaking_scan_task,
        ]
        if has_llvm:
            tasks.extend((aggregate_ir_task, alloc_static_initial_task, alias_memory_task,
                          lambda: build_run("tests/compiler/features/linker_address_native.coil",
                                            "linker-address-native")))
        else:
            print("fast modernization gate: LLVM-free compiler; skipping 4 LLVM-IR-specific checks")
        for surface in ("value", "macro", "method", "alias"):
            path = f"tests/compiler/features/refer_exclude_{surface}_rejected.coil"
            tasks.append(lambda path=path, surface=surface: expect_rejected(
                path, f"fast modernization gate: excluded {surface} survived"))

        with concurrent.futures.ThreadPoolExecutor(max_workers=min(16, len(tasks))) as pool:
            futures = [pool.submit(task) for task in tasks]
            for future in futures:
                future.result()

    elapsed = time.monotonic() - started
    print(f"fast modernization gate: PASS ({elapsed:.2f}s, compiler={candidate})")


def test_meta(compiler: str) -> None:
    interpreted = os.environ.copy()
    interpreted["COIL_META_INTERP"] = "1"
    if os.environ.get("COIL_META_SKIP_RUNTIME") != "1":
        execute(sys.executable, "scripts/oracle.py", "runtime", "gate", "arm64", "--compiler", compiler,
                env=interpreted)
    compiled = Path("/tmp/coil-meta-compiled")
    interp = Path("/tmp/coil-meta-interp")
    execute(compiler, "build", "src/compiler/main_a64.coil", "--backend", "arm64", "-o", str(compiled))
    execute(compiler, "build", "src/compiler/main_a64.coil", "--backend", "arm64", "-o", str(interp), env=interpreted)
    left = subprocess.run(["otool", "-X", "-s", "__TEXT", "__text", str(compiled)], stdout=subprocess.PIPE, check=True).stdout
    right = subprocess.run(["otool", "-X", "-s", "__TEXT", "__text", str(interp)], stdout=subprocess.PIPE, check=True).stdout
    if hashlib.sha256(left).digest() != hashlib.sha256(right).digest():
        raise SystemExit("compiled and interpreted metaprogram engines produced different compilers")
    print("metaprogram engines: PASS")


def test_http(compiler: str) -> None:
    """Both HTTP client gates: the buffered request, and the streaming one.

    They need a local server and libcurl, so they are their own suite rather than part
    of `build full` — a machine without the bundled curl archives can still run
    everything else.
    """
    execute("sh", "scripts/tests/http-client.sh")
    execute("sh", "scripts/tests/http-client-stream.sh", compiler)


def test_wasm(compiler: str) -> None:
    if not shutil.which("node") or not shutil.which("wasm-tools"):
        print("wasm gate: SKIP (requires node and wasm-tools)")
        return
    wasm = "/tmp/gate-wasm-coilc.wasm"
    execute(compiler, "build", "src/compiler/main_wasm.coil", "--target", "wasm64-unknown-unknown",
            "--wasm-stack-size=64", "-o", wasm)
    execute("wasm-tools", "validate", "--features=memory64", wasm)
    printed = subprocess.run(["wasm-tools", "print", wasm], text=True, stdout=subprocess.PIPE, check=True).stdout
    if sum(line.startswith("(module") for line in printed.splitlines()) != 1:
        raise SystemExit("wasm compiler is not a single static module")
    env = os.environ.copy()
    env["COIL_WASM_META_TRACE"] = "1"
    result = subprocess.run(["node", "src/tooling/wasm-host/run-coil-wasm.mjs", wasm,
                             "check", "src/compiler/main_a64.coil"], cwd=ROOT, env=env,
                            stdout=subprocess.DEVNULL, stderr=subprocess.PIPE)
    if result.returncode or b"meta_run_wasm" in result.stderr or b"WALL1" in result.stderr:
        sys.stderr.buffer.write(result.stderr)
        raise SystemExit("wasm compiler self-check failed")
    record_wasm = "/tmp/gate-wasm32-arraylist-record.wasm"
    execute(compiler, "build", "tests/compiler/features/wasm32_arraylist_record.coil",
            "--target", "wasm32-unknown-unknown", "-o", record_wasm)
    execute("wasm-tools", "validate", record_wasm)
    execute("node", "scripts/tests/wasm32-arraylist-record.mjs", record_wasm)
    dyn_wasm = "/tmp/gate-wasm32-dyn-aggregate-return.wasm"
    execute(compiler, "build", "tests/compiler/features/wasm32_dyn_aggregate_return.coil",
            "--target", "wasm32-unknown-unknown", "-o", dyn_wasm)
    execute("wasm-tools", "validate", dyn_wasm)
    execute("node", "scripts/tests/wasm32-dyn-aggregate-return.mjs", dyn_wasm)
    print("wasm gate: PASS")


def snapshot(args: argparse.Namespace) -> None:
    execute(sys.executable, "scripts/oracle.py", "snapshot", args.stage, "--compiler", args.compiler)


def refresh_snapshots(args: argparse.Namespace) -> None:
    """Audit all stages, refresh every mismatch once, and run one final audit."""
    execute(sys.executable, "scripts/oracle.py", "refresh", "--compiler", args.compiler,
            *(["--verbose"] if args.verbose else []))


def llvm_flags(mode: str) -> list[str]:
    result = subprocess.run(["scripts/compiler/llvm-link-flags.sh", mode], cwd=ROOT,
                            text=True, stdout=subprocess.PIPE, check=True)
    return shlex.split(result.stdout)


def bootstrap_c(args: argparse.Namespace) -> None:
    source = ROOT / "src/bootstrap"
    output = ROOT / "build/bootstrap/c"
    output.mkdir(parents=True, exist_ok=True)
    wasm = Path(args.wasm).resolve() if args.wasm else ROOT / "bootstrap/seeds/wasm/coilc.wasm"
    cc = os.environ.get("CC", "cc")
    opt = shlex.split(os.environ.get("OPT", "-O1"))
    execute(cc, "-O2", "-o", str(output / "wasm2c"), str(source / "wasm2c.c"))
    execute(str(output / "wasm2c"), str(wasm), str(output / "coilc.c"), "little")
    execute(cc, *opt, "-w", "-o", str(output / "coil-bootstrap"),
            str(output / "coilc.c"), str(source / "runtime.c"), "-lm")
    print(f"built {output / 'coil-bootstrap'}")


def bootstrap_wasm32(args: argparse.Namespace) -> None:
    source = ROOT / "src/bootstrap"
    output = ROOT / "build/bootstrap/wasm32"
    output.mkdir(parents=True, exist_ok=True)
    cc = os.environ.get("CC", "cc")
    opt = shlex.split(os.environ.get("OPT", "-O1"))
    compiler = Path(os.environ.get("COIL", "build/bin/coil"))
    provided = os.environ.get("COIL_SEED32")
    seed = Path(provided) if provided and os.access(provided, os.X_OK) else output / "coil-seed32"
    if seed == output / "coil-seed32":
        execute(str(compiler), "build", "src/compiler/main.coil", "-o", str(seed), *llvm_flags("dynamic"))
    execute(str(seed), "build", "src/compiler/main_wasm.coil", "--target", "wasm32-unknown-unknown",
            "--wasm-stack-size=64", "-o", str(output / "coilc32.wasm"))
    execute(cc, "-O2", "-o", str(output / "wasm2c"), str(source / "wasm2c.c"))
    execute(str(output / "wasm2c"), str(output / "coilc32.wasm"), str(output / "coilc32.c"), "little")
    execute(cc, *opt, "-w", "-o", str(output / "coil-bootstrap32"),
            str(output / "coilc32.c"), str(source / "runtime32.c"), "-lm")
    print(f"built {output / 'coil-bootstrap32'}")


def bootstrap(args: argparse.Namespace) -> None:
    bootstrap_c(args) if args.variant == "c" else bootstrap_wasm32(args)


def benchmark(args: argparse.Namespace) -> None:
    script = "python3 scripts/dev.py benchmark runtime" if args.kind == "runtime" else "python3 scripts/dev.py benchmark compile-scale"
    execute(script, *args.names)


def example(args: argparse.Namespace) -> None:
    if args.name == "freestanding":
        program = args.program
        build_dir = ROOT / "build/examples/freestanding"
        build_dir.mkdir(parents=True, exist_ok=True)
        obj, boot, elf = (build_dir / f"{program}.{suffix}" for suffix in ("o", "boot.o", "elf"))
        execute(args.compiler, "emit-obj", f"src/examples/freestanding/{program}.coil", "-o", str(obj),
                "--target", "aarch64-unknown-none")
        execute("clang", "-target", "aarch64-unknown-none", "-c", "src/examples/freestanding/start.s", "-o", str(boot))
        execute("ld.lld", "--gc-sections", "-T", "src/examples/freestanding/virt.ld", str(boot), str(obj), "-o", str(elf))
        if not args.build_only:
            execute("qemu-system-aarch64", "-M", "virt", "-cpu", "cortex-a57", "-nographic", "-kernel", str(elf))
    elif args.name == "freestanding-riscv32":
        build_dir = ROOT / "build/examples/freestanding-riscv32"
        build_dir.mkdir(parents=True, exist_ok=True)
        llvm_bindir = Path(subprocess.run(["llvm-config", "--bindir"], cwd=ROOT,
                                         text=True, stdout=subprocess.PIPE, check=True).stdout.strip())
        source = ROOT / "src/examples/freestanding/riscv32/answer.coil"
        start = ROOT / "src/examples/freestanding/riscv32/start.s"
        linker = ROOT / "src/examples/freestanding/riscv32/virt.ld"
        obj, boot, elf = (build_dir / f"answer.{suffix}" for suffix in ("o", "boot.o", "elf"))
        execute(args.compiler, "emit-obj", str(source), "-o", str(obj),
                "--target", "riscv32-unknown-none-elf")
        execute(str(llvm_bindir / "clang"), "--target=riscv32-unknown-elf", "-march=rv32imc", "-mabi=ilp32",
                "-c", str(start), "-o", str(boot))
        lld = llvm_bindir / "ld.lld"
        if not lld.is_file():
            found_lld = shutil.which("ld.lld")
            if not found_lld:
                raise SystemExit("freestanding-riscv32 requires ld.lld")
            lld = Path(found_lld)
        execute(str(lld), "-m", "elf32lriscv", "--gc-sections", "-T", str(linker),
                str(boot), str(obj), "-o", str(elf))
        execute(str(llvm_bindir / "llvm-readelf"), "-h", "-A", str(elf))
        if not args.build_only:
            execute("qemu-system-riscv32", "-M", "virt", "-bios", "none", "-nographic",
                    "-kernel", str(elf))
    elif args.name == "esp32c3":
        build_dir = ROOT / "build/examples/esp32c3"
        build_dir.mkdir(parents=True, exist_ok=True)
        llvm_bindir = Path(subprocess.run(["llvm-config", "--bindir"], cwd=ROOT,
                                         text=True, stdout=subprocess.PIPE, check=True).stdout.strip())
        source = ROOT / "src/examples/freestanding/esp32c3/firmware.coil"
        linker = ROOT / "src/examples/freestanding/esp32c3/esp32c3.ld"
        obj, elf, flash = (build_dir / name for name in
                           ("firmware.o", "firmware.elf", "flash.bin"))
        execute(args.compiler, "emit-obj", str(source), "-o", str(obj),
                "--target", "riscv32-unknown-none-elf")
        lld = llvm_bindir / "ld.lld"
        if not lld.is_file():
            found_lld = shutil.which("ld.lld")
            if not found_lld:
                raise SystemExit("esp32c3 example requires ld.lld")
            lld = Path(found_lld)
        execute(str(lld), "-m", "elf32lriscv", "--gc-sections", "-T", str(linker),
                str(obj), "-o", str(elf))
        execute(str(llvm_bindir / "llvm-objcopy"), "-O", "binary", "--gap-fill=0xff",
                "--pad-to=0x400000", str(elf), str(flash))
        execute(str(llvm_bindir / "llvm-readelf"), "-h", "-l", "-A", str(elf))
        if not args.build_only:
            qemu = os.environ.get("ESP32C3_QEMU")
            if not qemu:
                local_qemu = ROOT / "build/toolchains/qemu-esp32c3/qemu/bin/qemu-system-riscv32"
                if local_qemu.is_file():
                    qemu = str(local_qemu)
            if not qemu:
                candidate = shutil.which("qemu-system-riscv32")
                if candidate:
                    machines = subprocess.run([candidate, "-machine", "help"], cwd=ROOT,
                                              text=True, stdout=subprocess.PIPE,
                                              stderr=subprocess.STDOUT, check=True).stdout
                    if "esp32c3" in machines:
                        qemu = candidate
            if not qemu:
                raise SystemExit(
                    "Espressif QEMU is required; set ESP32C3_QEMU to its qemu-system-riscv32 binary")
            command = [qemu, "-nographic", "-icount", "3", "-machine", "esp32c3",
                       "-drive", f"file={flash},if=mtd,format=raw"]
            print("+", shlex.join(command), flush=True)
            process = subprocess.Popen(command, cwd=ROOT, text=True, stdout=subprocess.PIPE,
                                       stderr=subprocess.STDOUT)
            try:
                output, _ = process.communicate(timeout=5)
            except subprocess.TimeoutExpired:
                process.kill()
                output, _ = process.communicate()
            print(output, end="")
            if "coil esp32-c3: ok" not in output:
                raise SystemExit("ESP32-C3 emulator did not reach the Coil success sentinel")


def parser() -> argparse.ArgumentParser:
    result = argparse.ArgumentParser(description=__doc__)
    commands = result.add_subparsers(dest="command", required=True)

    command = commands.add_parser("build", help="build a compiler candidate or rebuild and verify the compiler")
    command.add_argument("variant", choices=("candidate", "full", "nollvm", "linux", "nollvm-linux", "x64"), nargs="?", default="full")
    command.add_argument("--output")
    command.add_argument(
        "--no-install",
        action="store_true",
        help="leave the verified compiler in the repository without updating the user-level installation",
    )
    command.set_defaults(func=build)

    command = commands.add_parser(
        "install",
        help="install the existing compiler artifact globally (use --build to rebuild first)",
    )
    command.add_argument("--source", default="build/bin/coil", help="compiler artifact to install")
    command.add_argument("--dest", help="exact destination path; defaults to the active user-level coil")
    command.add_argument("--build", action="store_true", help="run the full bootstrap before installing")
    command.add_argument("--variant", choices=("full", "nollvm", "linux", "nollvm-linux", "x64"),
                         default="full", help="bootstrap variant used with --build")
    command.set_defaults(func=install)

    command = commands.add_parser("test", help="run a test suite")
    command.add_argument("suite", choices=("all", "snapshots", "cli", "runtime", "http", "wasm", "meta", "meta-entries", "interpreter", "metaprogramming", "core-providers", "modernize-fast"), nargs="?", default="all")
    command.add_argument("--compiler", default="build/bin/coil")
    command.add_argument("--verbose", action="store_true")
    command.set_defaults(func=test)

    command = commands.add_parser("snapshot", help="regenerate compiler snapshots")
    command.add_argument("stage", choices=("all", *(__import__("oracle").STAGES)), nargs="?", default="all")
    command.add_argument("--compiler", default="build/bin/coil")
    command.set_defaults(func=snapshot)

    command = commands.add_parser(
        "refresh-snapshots",
        help="refresh all currently mismatched snapshot stages in one audited pass",
    )
    command.add_argument("--compiler", default="build/bin/coil")
    command.add_argument("--verbose", action="store_true")
    command.set_defaults(func=refresh_snapshots)

    command = commands.add_parser("bootstrap", help="build the portable C bootstrap")
    command.add_argument("variant", choices=("c", "wasm32"), nargs="?", default="c")
    command.add_argument("--wasm")
    command.set_defaults(func=bootstrap)

    command = commands.add_parser("benchmark", help="run benchmarks")
    command.add_argument("kind", choices=("runtime", "compile-scale"), nargs="?", default="runtime")
    command.add_argument("names", nargs="*")
    command.set_defaults(func=benchmark)

    command = commands.add_parser("example", help="build an example application")
    command.add_argument("name", choices=("freestanding", "freestanding-riscv32", "esp32c3"))
    command.add_argument("program", nargs="?", default="hello")
    command.add_argument("--compiler", default="build/bin/coil")
    command.add_argument("--build-only", action="store_true")
    command.set_defaults(func=example)
    return result


def main() -> int:
    os.chdir(ROOT)
    args = parser().parse_args()
    args.func(args)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

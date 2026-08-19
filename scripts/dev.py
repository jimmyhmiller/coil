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
    execute(*command)


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
        build(argparse.Namespace(variant=args.variant, output=str(built)))
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


def test(args: argparse.Namespace) -> None:
    compiler = args.compiler
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
        test_modernize_fast(compiler)
    elif args.suite == "scheme":
        execute(sys.executable, "scripts/scheme-progress.py", "--compiler", compiler)


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
        # regressions in the bounded inner loop instead of discovering them in a
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
    if elapsed >= 30:
        raise SystemExit(f"fast modernization gate exceeded its 30s budget: {elapsed:.2f}s")
    print(f"fast modernization gate: PASS ({elapsed:.2f}s, compiler={candidate})")


def test_modernize_fast(compiler: str) -> None:
    """Run the independent focused fixtures concurrently, within the 30s gate."""
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
        canonical #\space
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

            preflight = tmp / "legacy-preflight.coil"
            preflight.write_text("""(module legacy-preflight)
(import "coil.alloc" :as alloc)
(extern free :cc c [(ptr i8)] (-> void))
(defn owner [(a (ptr alloc.Allocator))] (-> (ptr i64))
  (alloc.box a i64 1))
(defn arch? [(wanted Code)] (-> bool)
  (code-eq (target-arch) wanted))
(defn release-or [(p (ptr i8)) (release bool)] (-> i64)
  (if release (do (free p)) 7))
""")
            execute(coil, "lint", str(preflight), "--fix")
            migrated = preflight.read_text()
            for expected in ("(ptr alloc/Allocator)", "(alloc/box a i64 1)",
                             ":use [unwrap-ptr create]", "(primitive/code-eq",
                             "(primitive/target-arch)", "(do (free p) 0)"):
                if expected not in migrated:
                    raise RuntimeError(
                        f"fast modernization gate: preflight omitted {expected!r}")
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
            for expected in (":use * :as alloc", ":use * :as primitive",
                             "(alloc/static i64)", "(primitive/iand x y)"):
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
            for final_rewrite in ("(set! (.value box)", "(.value box)",
                                  "(Moved :x 1 :y 2 :at 3)", "try-or!",
                                  "(let [heap (alloc/static Box)] heap)"):
                if final_rewrite not in preview.stdout:
                    raise RuntimeError(
                        f"fast modernization gate: lint --diff stopped before fixpoint {final_rewrite!r}")
            if "fixed " in preview.stderr:
                raise RuntimeError("fast modernization gate: lint --diff claimed it wrote a file")
            execute(coil, "lint", str(probe), "--fix")
            fixed = probe.read_text()
            for legacy in ("primitive/icmp-ge", "match-else (", "(Moved 1 2 3)", "(match value"):
                if legacy in fixed:
                    raise RuntimeError(f"fast modernization gate: default lint left {legacy!r}")
            if ("(Moved :x 1 :y 2 :at 3)" not in fixed or "try-or!" not in fixed
                    or "(set! (.value box)" not in fixed or "(.value box)" not in fixed
                    or "(let [heap (alloc/static Box)] heap)" not in fixed):
                raise RuntimeError("fast modernization gate: default lint profile did not run every safe fixer")
            if "(Counts :ok 3 :failed 2)" not in fixed or "(mut result)" in fixed:
                raise RuntimeError("fast modernization gate: complete zeroed struct init was not replaced")
            if "(mut reversed)" not in fixed or "(mut dependent)" not in fixed:
                raise RuntimeError("fast modernization gate: unsafe zeroed struct init was rewritten")
            if "(box a Counts (Counts :ok 8 :failed 1))" not in fixed or "(let [p (unwrap-ptr" not in fixed:
                raise RuntimeError("fast modernization gate: manual-box fix or its negative guard failed")
            if "(alloc/box a Counts (Counts :ok 6 :failed 3))" not in fixed:
                raise RuntimeError("fast modernization gate: qualified manual-box fix failed")
            execute(coil, "fmt", "--write", str(probe))
            formatted = probe.read_text()
            if not all(part in formatted for part in ("(Moved\n", ":x 1\n", ":y 2\n", ":at 3)")):
                raise RuntimeError("fast modernization gate: named constructor was not formatted by field")
            execute(coil, "check", str(probe))

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
  (let [p (alloc/stack i64)]
    (primitive/store! p 0)
    (primitive/load p)))
""")
            clean = subprocess.run(
                [coil, "build", "--backend", "arm64", "-o", str(project / "clean")],
                cwd=project, text=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
            if clean.returncode != 0:
                raise RuntimeError("fast modernization gate: low-level detector probe did not build")
            if "obsolete Coil syntax" in clean.stderr:
                raise RuntimeError("fast modernization gate: valid low-level primitives triggered migration offer")

            main.write_text("""(module breaking-scan)
(defn main [] (-> i64)
  (let [p (alloc-stack i64)] 0))
""")
            legacy = subprocess.run(
                [coil, "build", "--backend", "arm64", "-o", str(project / "legacy")],
                cwd=project, text=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
            if "obsolete Coil syntax" not in legacy.stderr:
                raise RuntimeError("fast modernization gate: obsolete alloc spelling did not trigger migration offer")

        tasks = [
            cimport_task,
            lambda: build_run("tests/compiler/features/integer_ord_all_widths.coil", "integer-widths",
                              *backend_flags),
            lambda: build_run("tests/compiler/features/ambient_core_ops.coil", "ambient-core-ops",
                              *backend_flags),
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
            aggregate_ir_task,
            lambda: build_run("tests/compiler/features/void_if_discarded.coil", "void-if-discarded"),
            lambda: build_run("src/examples/bitfields.coil", "static-assert", *backend_flags, want=42),
            lint_task,
            default_lint_task,
            broken_lint_task,
            broken_project_task,
            breaking_scan_task,
        ]
        for surface in ("value", "macro", "method", "alias"):
            path = f"tests/compiler/features/refer_exclude_{surface}_rejected.coil"
            tasks.append(lambda path=path, surface=surface: expect_rejected(
                path, f"fast modernization gate: excluded {surface} survived"))

        with concurrent.futures.ThreadPoolExecutor(max_workers=min(16, len(tasks))) as pool:
            futures = [pool.submit(task) for task in tasks]
            for future in futures:
                future.result()

    elapsed = time.monotonic() - started
    if elapsed >= 30:
        raise SystemExit(f"fast modernization gate exceeded its 30s budget: {elapsed:.2f}s")
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
    if args.name == "mini-scheme":
        output = ROOT / "build/examples/mini-scheme"
        output.parent.mkdir(parents=True, exist_ok=True)
        execute(args.compiler, "build", "src/apps/mini-scheme/scheme.coil", "-o", str(output))
        print(f"built {output}")
    elif args.name == "freestanding":
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

    command = commands.add_parser("build", help="rebuild and verify the compiler")
    command.add_argument("variant", choices=("full", "nollvm", "linux", "nollvm-linux", "x64"), nargs="?", default="full")
    command.add_argument("--output")
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
    command.add_argument("suite", choices=("all", "snapshots", "cli", "runtime", "http", "wasm", "meta", "meta-entries", "interpreter", "metaprogramming", "modernize-fast", "scheme"), nargs="?", default="all")
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
    command.add_argument("name", choices=("mini-scheme", "freestanding", "freestanding-riscv32", "esp32c3"))
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

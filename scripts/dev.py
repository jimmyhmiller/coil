#!/usr/bin/env python3
"""Single developer entry point for building, installing, testing, and examples."""

from __future__ import annotations

import argparse
import os
import platform
import shlex
import shutil
import stat
import subprocess
import sys
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(ROOT / "scripts" / "compiler"))
import toolchain_stamp  # noqa: E402
sys.path.insert(0, str(ROOT / "scripts" / "tests"))
import cleanup_on_signal  # noqa: E402


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
        stamp = toolchain_stamp.stamp_text()
        # The compiler links the hosted HTTP client, whose bundled curl archives
        # are found beside the compiling binary in build/bin/native. A fresh
        # checkout or worktree has none; the bootstraps provide them through
        # stage-lib.sh, and a candidate build needs them just the same.
        execute(str(ROOT / "scripts/native/build-curl.sh"))
        execute(sys.executable, str(ROOT / "scripts/compiler/stage0.py"), compiler,
                "build", str(ROOT / "src/compiler/main.coil"), "-o", str(output),
                *llvm_flags("dynamic"))
        toolchain_stamp.stamp_path(output).write_text(stamp)
        print(f"built compiler candidate -> {output}")
        units = output.with_name(output.name + ".ct-units")
        shutil.rmtree(units, ignore_errors=True)
        build_ct_units(output, units)
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
        if variant not in ("full", "linux"):
            raise SystemExit("--no-install is supported only by the full and linux bootstraps")
        env = os.environ.copy()
        env["COIL_SKIP_INSTALL"] = "1"
    execute(*command, env=env)


def verify_toolchain_pair(binary: Path) -> str:
    """The library digest `binary` was built from, when it matches this checkout.

    Install copies this checkout's src/stdlib and src/compiler beside the binary.
    A binary built from other sources -- a stale build/bin/coil, or the already
    installed compiler after the tree moved on -- would then run against a library
    it was not built with. That pairing is refused rather than installed.
    """
    stamp = toolchain_stamp.stamp_path(binary)
    current = toolchain_stamp.digest()
    if not stamp.is_file():
        raise SystemExit(
            f"install: {binary} has no {stamp.name}, so nothing says which library "
            "sources it was built from; build it with `python3 scripts/dev.py build` "
            "(or `install --build`) so the stamp is written")
    built = toolchain_stamp.stamp_digest(stamp.read_text())
    if built != current:
        raise SystemExit(
            f"install: {binary} was built from different library sources than this "
            "checkout's src/stdlib and src/compiler; installing it would pair the compiler "
            "with a library it was not built with. Rebuild it, or use `install --build`")
    return stamp.read_text()


def refuse_downgrade(new_stamp: str, destination: Path, allow: bool) -> None:
    """Refuse to replace an installed compiler with an older one.

    Both stamps name the commit they were built from. Installing a build whose
    commit is a strict ancestor of the installed one silently rolls every user of
    `coil` back; it needs `--allow-downgrade`.
    """
    installed_stamp = toolchain_stamp.stamp_path(destination)
    if allow or not installed_stamp.is_file():
        return
    new_commit = toolchain_stamp.stamp_commit(new_stamp)
    old_commit = toolchain_stamp.stamp_commit(installed_stamp.read_text())
    if not new_commit or not old_commit or new_commit == old_commit:
        return
    older = subprocess.run(["git", "-C", str(ROOT), "merge-base", "--is-ancestor", new_commit, old_commit],
                           capture_output=True).returncode == 0
    if older:
        raise SystemExit(
            f"install: {destination} is {old_commit[:12]}, newer than this build ({new_commit[:12]}); "
            "refusing to downgrade. Pass --allow-downgrade to install it anyway")


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
    # The tpde backend's package (tpde.*) is vendored in src/compiler/tpde.
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
    # Beside the binary for a checkout build; otherwise the checkout's own
    # build/bin/native, which scripts/native/build-curl.sh fills from the machine's
    # cache. A candidate built elsewhere (`build candidate --output /tmp/x`) used to
    # install with no archives at all, and the toolchain failed at the first HTTP
    # program's link.
    source_dir = source.parent / "native"
    if not source_dir.is_dir():
        execute(str(ROOT / "scripts/native/build-curl.sh"))
        source_dir = ROOT / "build" / "bin" / "native"

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
    the new compiler current. An off-checkout compilation checks the installed
    library before the command reports its version.
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

    stamp = verify_toolchain_pair(source)
    refuse_downgrade(stamp, destination, getattr(args, "allow_downgrade", False))

    destination.parent.mkdir(parents=True, exist_ok=True)
    # <prefix>/bin/coil -> <prefix>/lib/coil, the layout loader.coil searches for.
    libdir = install_library(destination.parent.parent)
    print(f"installed library -> {libdir}")

    native_dir = install_native_archives(source, destination)
    if native_dir is not None:
        print(f"installed native archives -> {native_dir}")

    if source.resolve() == destination.resolve():
        # The stamp beside it was verified above: the library just installed is
        # the one this binary was built from.
        print(f"already installed: {destination}")
        report_installed(destination)
        return

    # Written beside the destination and renamed over it, never copied into it.
    # Linux refuses to open a running executable for writing (ETXTBSY), so with any
    # `coil` process alive -- an editor's language tooling, a long test run -- an
    # in-place copy failed the install after the whole bootstrap had passed. A
    # rename replaces the name and leaves the running process its old file; it
    # also means nobody ever executes a half-written compiler.
    staged = destination.with_name(f".{destination.name}.installing-{os.getpid()}")
    try:
        shutil.copy2(source, staged)
        staged.chmod(source.stat().st_mode | stat.S_IXUSR | stat.S_IXGRP | stat.S_IXOTH)
        if sys.platform == "darwin":
            subprocess.run(
                ["codesign", "-s", "-", "--force", str(staged)],
                stdout=subprocess.DEVNULL,
                stderr=subprocess.DEVNULL,
                check=False,
            )
        os.replace(staged, destination)
    finally:
        staged.unlink(missing_ok=True)
    toolchain_stamp.stamp_path(destination).write_text(stamp)
    print(f"installed {source} -> {destination}")
    if not args.no_warm_unit:
        # Compile-time units first: every later build links them, and before
        # they exist each one finds the previous compiler's and rebuilds them,
        # one module at a time.
        build_ct_units(destination, libdir / "ct-units")
        warm_jit_unit(destination, libdir)
        warm_lint_profile(destination, libdir)
    report_installed(destination)


def warm_jit_unit(compiler: Path, libdir: Path) -> None:
    """Prebuild coil.compiler.jit_api as a unit beside the library.

    A program that imports coil.jit links the in-process compiler. Compiled from
    source that is ~28s of LLVM per build; against a unit it is a fraction of a
    second. A unit's object follows the calling convention of the backend that
    emitted it, and Coil's backends do not share one for every aggregate, so
    there is one unit per backend: `<lib>/coil/units/<backend>/coil.compiler.jit_api`
    (the layout `shipped-unit-dir` in driver.coil reads). A consumer links only
    the unit built by its own backend, and the compiler builds a missing one on
    the first build that imports coil.jit. Installing warms the unit for the
    compiler's default backend (`llvm` for this LLVM-linked build), so the common
    path is fast from the start. Always -O3: every consumer optimization level
    shares the one unit. Best-effort: without it the compiler builds it on demand.
    """
    entry = libdir / "compiler" / "jit_api.coil"
    if not entry.is_file():
        return
    units = libdir / "units"
    # The single-backend layout that preceded per-backend units. Nothing reads
    # it any more, and its arm64 object must never be linked into an LLVM build.
    shutil.rmtree(units / "coil.compiler.jit_api", ignore_errors=True)
    out = units / "llvm" / "coil.compiler.jit_api"
    out.parent.mkdir(parents=True, exist_ok=True)
    result = subprocess.run(
        [str(compiler), "build-unit", str(entry), "-o", str(out), "--backend", "llvm", "-O3", "--quiet"],
        capture_output=True, text=True,
    )
    if result.returncode == 0:
        print(f"warmed coil.jit unit -> {out}")
    else:
        print("note: could not warm the coil.jit unit; the first coil.jit build will build it")
        shutil.rmtree(out, ignore_errors=True)


def build_ct_units(compiler: Path, root: Path, jobs: int = 4) -> None:
    """Build the compile-time unit of every library module into ROOT.

    A unit holds one library module's compile-time code -- its macros and the
    functions only they call -- compiled once, so a program that loads the
    module links it instead of compiling it (`ct-unit-root` in driver.coil
    names where a compiler looks: `<lib>/coil/ct-units` for an installed one,
    `<binary>.ct-units` beside any other). An installed compiler builds a
    missing one on demand; a checkout's binaries rely on this. Run from an empty
    directory, in parallel. A module that does not compile for this host (a
    bare-metal architecture's) has no unit, and programs compile it from source.
    """
    names = subprocess.run([str(compiler), "namespaces"], capture_output=True, text=True, check=True)
    modules = ["coil.core"] + [m for m in names.stdout.split() if m]
    root.mkdir(parents=True, exist_ok=True)
    env = dict(os.environ, COIL_CT_UNITS="0")

    def one(module: str) -> tuple[str, int]:
        with tempfile.TemporaryDirectory(prefix="coil-ct-unit-") as cwd:
            result = subprocess.run([str(compiler), "build-ct-unit", module, str(root / module)],
                                    cwd=cwd, env=env, capture_output=True, text=True)
        return module, result.returncode

    from concurrent.futures import ThreadPoolExecutor
    with ThreadPoolExecutor(jobs) as pool:
        built = list(pool.map(one, modules))
    missing = [m for m, rc in built if rc != 0]
    print(f"built {len(built) - len(missing)} compile-time units -> {root}"
          + (f" (none for {', '.join(missing)})" if missing else ""))


def ct_units(args: argparse.Namespace) -> None:
    """Build the units a checkout's compiler links (`<binary>.ct-units`)."""
    compiler = Path(args.compiler).resolve()
    units = compiler.with_name(compiler.name + ".ct-units")
    shutil.rmtree(units, ignore_errors=True)
    build_ct_units(compiler, units, args.jobs)


def warm_lint_profile(compiler: Path, libdir: Path) -> None:
    """Prebuild the standard lint profile beside the library.

    `coil lint` runs the checkers of coil.lint.default; compiling them and the
    library they import was most of what a small lint cost. The compiler keeps
    them compiled as a native image at `<lib>/coil/lint-profile` (the directory
    `lint-profile-dir` in driver.coil names) and builds a missing or stale one on
    the first lint. Installing builds it, so no lint pays for that. Run from an
    empty directory: the build must not index the caller's sources. Best-effort.
    """
    out = libdir / "lint-profile"
    with tempfile.TemporaryDirectory(prefix="coil-lint-profile-") as cwd:
        result = subprocess.run(
            [str(compiler), "build-lint-profile", str(out)],
            cwd=cwd, capture_output=True, text=True,
        )
    if result.returncode == 0:
        print(f"warmed lint profile -> {out}")
    else:
        print("note: could not warm the lint profile; the first coil lint will build it")


def report_installed(destination: Path) -> None:
    """Verify the installed library and print the compiler version."""
    verified_test_compiler(str(destination))
    done = subprocess.run(
        [str(destination), "--version"], capture_output=True, text=True, check=True,
    )
    for line in (done.stdout or done.stderr).splitlines():
        print(f"  {line}")


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
        probe = Path(cwd) / "stdlib-probe.coil"
        probe.write_text(
            '(import "coil.io" :use *)\n'
            '(defn main [] (-> i64) (do (stdout) 0))\n'
        )
        checked = subprocess.run(
            [str(compiler), "check", str(probe)],
            cwd=cwd,
            capture_output=True,
            text=True,
        )
    output = checked.stdout + checked.stderr
    if checked.returncode != 0:
        detail = output.strip() or f"exit status {checked.returncode} with no diagnostic"
        raise SystemExit(
            "test compiler cannot locate its matching standard library from an "
            f"unrelated working directory:\n  {compiler}\n{detail}\n"
            "Build the candidate under this checkout (the default is "
            "build/bin/coil-candidate) or install the compiler and library together."
        )
    return str(compiler)


def test(args: argparse.Namespace) -> None:
    """The two test tiers; see docs/reference/TESTING.md ("Testing the compiler").

    fast           the pre-push tier: <= 270 s serial, never builds the compiler
    comprehensive  the release tier: builds once, installs privately, runs everything
    """
    script = {"fast": "scripts/tests/fast.py", "comprehensive": "scripts/tests/comprehensive.py"}[args.suite]
    forwarded = list(args.forwarded)
    if args.compiler is not None:
        forwarded = ["--compiler", args.compiler, *forwarded]
    elif args.suite == "fast" and "--compiler" not in forwarded:
        forwarded = ["--compiler", "build/bin/coil", *forwarded]
    execute(sys.executable, script, *forwarded)


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
    script = {
        "runtime": ["bash", "scripts/benchmarks/run.sh"],
        "compile-scale": ["bash", "scripts/benchmarks/compile_scale.sh"],
        "frontend": ["python3", "scripts/benchmarks/frontend.py"],
    }[args.kind]
    execute(*script, *args.names)


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
    command.add_argument("--no-warm-unit", action="store_true",
                         help="skip prebuilding the coil.jit unit and the lint profile (the first coil.jit build or lint then builds it)")
    command.add_argument("--allow-downgrade", action="store_true",
                         help="install even when the installed compiler was built from a newer commit")
    command.set_defaults(func=install)

    command = commands.add_parser(
        "test", help="run a test tier: fast (pre-push) or comprehensive (release)",
        description="Run a test tier. Options after the tier go to its harness: "
                    "--quick, --only NAME, --list, --verbose, --no-x64.")
    command.add_argument("suite", choices=("fast", "comprehensive"))
    command.add_argument("--compiler", default=None,
                         help="the compiler to test (fast: default build/bin/coil; "
                              "comprehensive: default builds and installs one privately)")
    command.add_argument("forwarded", nargs=argparse.REMAINDER, help=argparse.SUPPRESS)
    command.set_defaults(func=test)

    command = commands.add_parser("bootstrap", help="build the portable C bootstrap")
    command.add_argument("variant", choices=("c", "wasm32"), nargs="?", default="c")
    command.add_argument("--wasm")
    command.set_defaults(func=bootstrap)

    command = commands.add_parser("ct-units", help="build the compile-time units of a compiler's library")
    command.add_argument("--compiler", default=str(ROOT / "build/bin/coil-candidate"))
    command.add_argument("--jobs", type=int, default=4)
    command.set_defaults(func=ct_units)

    command = commands.add_parser("benchmark", help="run benchmarks")
    command.add_argument("kind", choices=("runtime", "compile-scale", "frontend"), nargs="?", default="runtime")
    command.add_argument("names", nargs=argparse.REMAINDER)
    command.set_defaults(func=benchmark)

    command = commands.add_parser("example", help="build an example application")
    command.add_argument("name", choices=("freestanding", "freestanding-riscv32", "esp32c3"))
    command.add_argument("program", nargs="?", default="hello")
    command.add_argument("--compiler", default="build/bin/coil")
    command.add_argument("--build-only", action="store_true")
    command.set_defaults(func=example)
    return result


def main() -> int:
    cleanup_on_signal.install()
    os.chdir(ROOT)
    args = parser().parse_args()
    args.func(args)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

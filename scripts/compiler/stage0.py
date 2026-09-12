#!/usr/bin/env python3
"""Run a stage-zero compiler against this checkout's source and library.

The binding-macro transition needs one bounded compatibility step: compilers
that still implement public let/fn/defn in their parser must compile the current
compiler with those built-ins, before the new binary can load coil.binding.
Only their staged prelude omits the two new binding imports. Compiler sources,
including the new metaprogram ABI text embedded in the result, stay unchanged.
"""
from __future__ import annotations

import os
from pathlib import Path
import shutil
import subprocess
import sys
import tempfile

ROOT = Path(__file__).resolve().parents[2]
BINDING_IMPORTS = {
    '(import "coil.binding" :use [let fn defn] :reexport)',
    '(import "coil.binding.runtime" :as binding-runtime)',
}


def run(compiler: Path, arguments: list[str]) -> int:
    compiler = compiler.resolve()
    build_root = ROOT / "build"
    build_root.mkdir(exist_ok=True)
    with tempfile.TemporaryDirectory(prefix=".coil-stage0-", dir=build_root) as directory:
        prefix = Path(directory)
        probe = prefix / "binding-probe.coil"
        probe.write_text("(defn* main [] (-> i64) (let* [x 0] x))\n")
        capability = subprocess.run(
            [str(compiler), "check", str(probe)], cwd=ROOT,
            stdin=subprocess.DEVNULL, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        primitive_bindings = capability.returncode == 0

        binary = prefix / "bin/coil"
        binary.parent.mkdir()
        shutil.copy2(compiler, binary)
        # Native archives are part of the toolchain layout and are resolved beside
        # the compiler executable.  The compatibility copy must therefore carry
        # the checkout's archives just like its stdlib; running from /tmp means the
        # compiler's cwd fallback cannot see ROOT/build/bin/native.
        native = ROOT / "build/bin/native"
        if native.is_dir():
            (binary.parent / "native").symlink_to(native, target_is_directory=True)
        library = prefix / "lib/coil"
        library.mkdir(parents=True)
        (library / "stdlib").symlink_to(ROOT / "src/stdlib", target_is_directory=True)
        (library / "compiler").symlink_to(ROOT / "src/compiler", target_is_directory=True)
        prelude = ROOT / "src/compiler/prelude.coil"
        if primitive_bindings:
            (library / "prelude.coil").symlink_to(prelude)
        else:
            lines = prelude.read_text().splitlines(keepends=True)
            present = {line.rstrip("\n") for line in lines} & BINDING_IMPORTS
            if present != BINDING_IMPORTS:
                raise RuntimeError("binding bootstrap prelude imports changed; update the transition")
            (library / "prelude.coil").write_text(
                "".join(line for line in lines if line.rstrip("\n") not in BINDING_IMPORTS))
        environment = dict(os.environ)
        environment["COIL_NAMESPACE_ROOTS"] = str(ROOT / "src/compiler")
        environment["COIL_STRICT_BUNDLE"] = "0"
        # The old stage zero cannot interpret the current workspace manifest.
        return subprocess.run([str(binary), *arguments], cwd=tempfile.gettempdir(),
                              env=environment).returncode


if __name__ == "__main__":
    if len(sys.argv) < 4:
        raise SystemExit("usage: stage0.py COMPILER COMMAND SOURCE [FLAGS...]")
    command, source, *flags = sys.argv[2:]
    raise SystemExit(run(Path(sys.argv[1]), [command, str(Path(source).resolve()), *flags]))

#!/usr/bin/env python3
"""Write the native backend's generated Coil from its sources.

The backend is written in small languages (src/declarative/lang): each reads a
file of its own (a .pass, an .isa, a .lower, ...) and makes it a Coil module.
The compiler's own build does not run them, as no stage-0 compiler and no
installed toolchain need to, so what they make is kept as plain Coil, the way
src/compiler/cli/guide.coil is kept from the language reference: a module named
declarative.* in src/compiler/declarative/generated, and one named native.*
(CIR, copy analysis, assembler, buffer and operation numbers) in
src/compiler/native/generated.

    gen-declarative.py [--compiler COIL]           # rewrite generated/
    gen-declarative.py --check [--compiler COIL]   # exit 1 if generated/ is not what the sources say

The languages run in `coil check` of src/declarative/generate.coil, a module
that imports every module the sources' manifest names (this script writes it
from the manifest), with DECLARATIVE_EXPAND naming a fresh directory: each
module a language makes is written there as well as compiled.
"""

from __future__ import annotations

import argparse
import filecmp
import os
import shutil
import subprocess
import sys
import tempfile
import tomllib
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / "scripts" / "compiler"))
import project_config  # noqa: E402

SOURCES = ROOT / "src" / "declarative"
# Each package a generated module may belong to, and where its modules go.
PACKAGES = {
    "declarative.": ROOT / "src" / "compiler" / "declarative" / "generated",
    "native.": ROOT / "src" / "compiler" / "native" / "generated",
}
DRIVER = SOURCES / "generate.coil"
# The toy calculator is the languages' second client, for their tests; it is
# not part of the backend.
NOT_GENERATED = ("toy.",)


def generated_modules() -> list[str]:
    manifest = tomllib.loads((SOURCES / "Coil.toml").read_text())
    names = sorted(n for n in manifest["modules"] if not n.startswith(NOT_GENERATED))
    for name in names:
        if not name.startswith(tuple(PACKAGES)):
            raise SystemExit(f"gen-declarative: module {name} in src/declarative/Coil.toml is in none of "
                             f"{', '.join(p + '*' for p in PACKAGES)}, so no package of the compiler could hold it")
    return names


def driver_text(names: list[str]) -> str:
    lines = [";;; Every module src/declarative/Coil.toml names: checking this runs every",
             ";;; language over every source file. Written by",
             ";;; scripts/compiler/gen-declarative.py from that manifest.",
             "(module generate)"]
    lines += [f'(import "{name}" :as m{i})' for i, name in enumerate(names)]
    return "\n".join(lines) + "\n"


def relative_file(name: str) -> Path:
    """Where the languages write module NAME under DECLARATIVE_EXPAND
    (expanded-path in lang/readers.coil): declarative.a64.unit as a64/unit.coil,
    native.cir-ops as native/cir-ops.coil."""
    rest = name.removeprefix("declarative.")
    parts = rest.split(".")
    return Path(*parts[:-1], parts[-1] + ".coil")


def split(into: Path) -> dict[Path, Path]:
    """The written tree, each package's part: native/ for native.*, the rest declarative.*."""
    return {PACKAGES["declarative."]: into / "declarative", PACKAGES["native."]: into / "native"}


def expand(compiler: str, names: list[str], into: Path) -> None:
    env = dict(os.environ)
    for variable in project_config.PROJECT_VARIABLES:
        env.pop(variable, None)
    env["DECLARATIVE_EXPAND"] = str(into)
    # A module served from a cache is not read again, and so not written out.
    env["COIL_LIBRARY_STATE"] = "0"
    result = subprocess.run([compiler, "check", str(DRIVER)], cwd=SOURCES, env=env,
                            stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True)
    if result.returncode != 0:
        raise SystemExit(f"gen-declarative: checking the sources failed:\n{result.stdout}")
    want = {relative_file(n) for n in names}
    got = {p.relative_to(into) for p in into.rglob("*.coil")}
    if want == got:
        native = into / "native"
        declarative = into / "declarative"
        declarative.mkdir()
        for entry in list(into.iterdir()):
            if entry not in (native, declarative):
                entry.rename(declarative / entry.name)
        native.mkdir(exist_ok=True)
    if want != got:
        missing = sorted(str(p) for p in want - got)
        extra = sorted(str(p) for p in got - want)
        raise SystemExit("gen-declarative: the languages did not write exactly the manifest's modules"
                         + (f"\n  not written: {' '.join(missing)}" if missing else "")
                         + (f"\n  not in the manifest: {' '.join(extra)}" if extra else ""))


def differences(a: Path, b: Path) -> list[str]:
    files_a = {p.relative_to(a) for p in a.rglob("*") if p.is_file()}
    files_b = {p.relative_to(b) for p in b.rglob("*") if p.is_file()} if b.is_dir() else set()
    out = [f"only from the sources: {p}" for p in sorted(files_a - files_b)]
    out += [f"not from the sources: {p}" for p in sorted(files_b - files_a)]
    out += [f"differs: {p}" for p in sorted(files_a & files_b)
            if not filecmp.cmp(a / p, b / p, shallow=False)]
    return out


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("--check", action="store_true", help="fail if generated/ is out of date")
    parser.add_argument("--compiler", default=os.environ.get("COIL", "coil"),
                        help="the compiler that runs the languages (default $COIL, else coil)")
    args = parser.parse_args()
    compiler = str(Path(args.compiler).resolve()) if os.sep in args.compiler else (shutil.which(args.compiler) or args.compiler)
    names = generated_modules()
    driver = driver_text(names)
    if args.check:
        if not DRIVER.is_file() or DRIVER.read_text() != driver:
            print("gen-declarative: src/declarative/generate.coil is not the manifest's modules; "
                  "run scripts/compiler/gen-declarative.py", file=sys.stderr)
            return 1
    else:
        DRIVER.write_text(driver)
    with tempfile.TemporaryDirectory(prefix="gen-declarative.") as work:
        into = Path(work) / "generated"
        expand(compiler, names, into)
        parts = split(into)
        if args.check:
            stale = False
            for generated, written in parts.items():
                diff = differences(written, generated)
                if diff:
                    stale = True
                    print(f"gen-declarative: {generated.relative_to(ROOT)} is not what src/declarative "
                          "says; run scripts/compiler/gen-declarative.py", file=sys.stderr)
                    for line in diff:
                        print(f"  {line}", file=sys.stderr)
            if stale:
                return 1
            print(f"gen-declarative: generated/ is up to date ({len(names)} modules)")
            return 0
        for generated, written in parts.items():
            shutil.rmtree(generated, ignore_errors=True)
            shutil.copytree(written, generated)
    print(f"gen-declarative: wrote {len(names)} modules to "
          + " and ".join(str(g.relative_to(ROOT)) for g in PACKAGES.values()))
    return 0


if __name__ == "__main__":
    sys.exit(main())

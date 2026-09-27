#!/usr/bin/env python3
"""Check that the portable bootstrap hosts implement every import of the compiler.

The WASM seed is translated to C by src/bootstrap/wasm2c.c and linked against a
host runtime: src/bootstrap/runtime.c for the wasm64 compiler, runtime32.c for
the wasm32 one. C does not check a prototype against a definition in another
file, so a host function that is missing fails only at link time, and one whose
signature has drifted from the module's import links and is silently wrong.
This compares each module's `env.*` imports, read from the wasm binary itself,
with the `env_*` definitions in the matching runtime: names and exact types.

    python3 scripts/tests/bootstrap-imports.py                    # committed wasm64 seed vs runtime.c
    python3 scripts/tests/bootstrap-imports.py --compiler build/bin/coil
        # also builds the current compiler for wasm32 and checks runtime32.c
"""
import argparse
import re
import subprocess
import sys
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
VALTYPES = {0x7F: "i32", 0x7E: "i64", 0x7D: "f32", 0x7C: "f64"}
CTYPES = {"uint32_t": "i32", "int32_t": "i32", "uint64_t": "i64", "int64_t": "i64",
          "float": "f32", "double": "f64"}


def leb(data, pos):
    result = shift = 0
    while True:
        byte = data[pos]
        pos += 1
        result |= (byte & 0x7F) << shift
        shift += 7
        if not byte & 0x80:
            return result, pos


def wasm_imports(path):
    """{name: (params, results)} for the module's function imports from `env`."""
    data = Path(path).read_bytes()
    if data[:4] != b"\0asm":
        raise SystemExit(f"{path}: not a wasm module")
    pos, types, imports = 8, [], {}
    while pos < len(data):
        section = data[pos]
        size, pos = leb(data, pos + 1)
        end = pos + size
        if section == 1:  # types
            count, p = leb(data, pos)
            for _ in range(count):
                assert data[p] == 0x60, "unexpected type form"
                n, p = leb(data, p + 1)
                params = tuple(VALTYPES[b] for b in data[p:p + n]); p += n
                n, p = leb(data, p)
                results = tuple(VALTYPES[b] for b in data[p:p + n]); p += n
                types.append((params, results))
        elif section == 2:  # imports
            count, p = leb(data, pos)
            for _ in range(count):
                n, p = leb(data, p); module = data[p:p + n].decode(); p += n
                n, p = leb(data, p); name = data[p:p + n].decode(); p += n
                kind = data[p]; p += 1
                if kind == 0:
                    index, p = leb(data, p)
                    if module == "env":
                        imports[name] = types[index]
                elif kind == 1:  # table: reftype + limits
                    p += 1
                    flags, p = leb(data, p); _, p = leb(data, p)
                    if flags & 1: _, p = leb(data, p)
                elif kind == 2:  # memory: limits
                    flags, p = leb(data, p); _, p = leb(data, p)
                    if flags & 1: _, p = leb(data, p)
                elif kind == 3:  # global: valtype + mutability
                    p += 2
                else:
                    raise SystemExit(f"{path}: unknown import kind {kind}")
        pos = end
    return imports


DEFINITION = re.compile(r"^(?:static\s+)?([a-z0-9_]+)\s+env_([A-Za-z0-9_]+)\s*\(([^)]*)\)\s*\{", re.M)


def runtime_definitions(path):
    """{name: (params, results)} for every env_* function the C host defines."""
    out = {}
    for ret, name, params in DEFINITION.findall(Path(path).read_text()):
        args = []
        for param in params.split(","):
            param = param.strip()
            if not param or param == "void":
                continue
            args.append(CTYPES.get(param.split()[0], "?" + param.split()[0]))
        out[name] = (tuple(args), () if ret == "void" else (CTYPES.get(ret, "?" + ret),))
    return out


def check(module, runtime, label):
    imports, defined = wasm_imports(module), runtime_definitions(runtime)
    problems = []
    for name, signature in sorted(imports.items()):
        if name not in defined:
            problems.append(f"missing  env_{name}: the module imports {signature}")
        elif defined[name] != signature:
            problems.append(f"mismatch env_{name}: module {signature}, {Path(runtime).name} {defined[name]}")
    for problem in problems:
        print(f"  {label}: {problem}")
    status = "FAIL" if problems else "ok"
    print(f"{status} {label}: {len(imports)} imports against {Path(runtime).relative_to(ROOT)}")
    return not problems


def main():
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("compiler_positional", nargs="?", help=argparse.SUPPRESS)
    parser.add_argument("--compiler", help="also build the current compiler for wasm32 and check runtime32.c")
    parser.add_argument("--module", help="check this wasm64 module against runtime.c instead of the committed seed")
    args = parser.parse_args()
    # The generated suite passes its compiler positionally, like its other scripts.
    args.compiler = args.compiler or args.compiler_positional
    if args.module:
        return 0 if check(Path(args.module), ROOT / "src/bootstrap/runtime.c", "wasm64 module") else 1
    ok = check(ROOT / "bootstrap/seeds/wasm/coilc.wasm", ROOT / "src/bootstrap/runtime.c", "committed wasm64 seed")
    if args.compiler:
        with tempfile.TemporaryDirectory(prefix="coil-bootstrap-imports-") as scratch:
            # wasm32 only: the wasm64 host is checked against the committed seed
            # above (in the Seed provenance job) and against every refreshed seed
            # by refresh-seed.sh, and a whole-compiler build is minutes of CI.
            for target, runtime in (("wasm32-unknown-unknown", "runtime32.c"),):
                module = Path(scratch) / f"{target}.wasm"
                # Built exactly as the WASM seed is. An unoptimized build keeps
                # unreachable code (the libcurl client, for one) whose imports no
                # bootstrap ever calls, so it is not what the hosts must provide.
                subprocess.run([args.compiler, "build", str(ROOT / "src/compiler/main_wasm.coil"), "--target", target,
                                "--wasm-stack-size=64", "-o", str(module)], cwd=ROOT, check=True,
                               stdout=subprocess.DEVNULL)
                ok = check(module, ROOT / "src/bootstrap" / runtime, f"current {target.split('-')[0]} compiler") and ok
    return 0 if ok else 1


if __name__ == "__main__":
    sys.exit(main())

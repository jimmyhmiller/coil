#!/usr/bin/env python3
"""Regenerate the stdlib manifest tables in src/compiler/stdlib_manifest.coil.

The three tables (`stdlib-namespaces`, `stdlib-file-for-namespace`,
`stdlib-manifest-file?`) are three views of ONE fact: which files under
src/stdlib/ make up the standard library. Maintaining them by hand meant a new
stdlib file had to be registered in three places, and forgetting was invisible
in-repo -- the loader silently falls back to scanning the source tree, so only
an installed compiler would report the namespace as missing. That is exactly how
coil.socket/sync/region/signals/cancellation went unreachable.

So the tables are derived here from the directory itself, and a gate runs this
with --check. Only the manifest is generated; the library TEXT is not in the
compiler at all -- it is installed as files beside the binary and read from
there (loader.coil), which is what keeps compiler and library one version.

This mirrors scripts/docs/gen-guide.py, which generates src/compiler/guide.coil
from the language reference the same way.

Usage:
    gen-stdlib-manifest.py                     # rewrite the generated region in place
    gen-stdlib-manifest.py --check             # exit 1 if the region is out of date
    gen-stdlib-manifest.py --print-namespaces  # the list `coil namespaces` should print
"""

from __future__ import annotations

import argparse
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
STDLIB = ROOT / "src" / "stdlib"
SDK = ROOT / "src" / "compiler"
PRELUDE = ROOT / "src" / "compiler" / "prelude.coil"
TARGET = ROOT / "src" / "compiler" / "stdlib_manifest.coil"

BEGIN = ";; BEGIN GENERATED -- regenerate with scripts/compiler/gen-stdlib-manifest.py"
END = ";; END GENERATED"

# Namespaces that are part of the library and importable but deliberately NOT
# advertised by `coil namespaces`: implementation detail modules of a public
# namespace. They still get a file-set entry and a file mapping; they are just
# absent from the discovery list. This is the ONLY hand-maintained knob in the manifest --
# everything else follows from src/stdlib/.
INTERNAL_NAMESPACES = {
    "coil.http.parser.types",
    "coil.http.parser.generated",
    # coil.prop's engine room. Importable, but `coil.prop` re-exports everything a
    # user needs, so listing the internals would triple the size of what `coil
    # namespaces` prints for one feature.
    "coil.prop.rng",
    "coil.prop.runner",
    "coil.prop.shrink",
}


def declared_module(text: str) -> str | None:
    """The file's `(module NAME)` header.

    Mirrors `namespace-declared-module` in src/compiler/loader.coil: a module
    declaration may follow an arbitrarily long license/design comment, so skip
    `;` comments and whitespace rather than reading a fixed prefix.
    """
    i, n = 0, len(text)
    while i < n:
        c = text[i]
        if c == ";":
            nl = text.find("\n", i)
            i = n if nl < 0 else nl + 1
            continue
        if c.isspace():
            i += 1
            continue
        m = re.compile(r"\(module\s+([^\s)]+)\s*\)").match(text, i)
        return m.group(1) if m else None
    return None


def collect() -> list[tuple[str, str]]:
    """(namespace, filename) for every stdlib module, sorted by namespace."""
    out: dict[str, str] = {}
    for path in sorted(STDLIB.glob("*.coil")):
        name = declared_module(path.read_text())
        if name is None:
            sys.exit(f"error: {path.relative_to(ROOT)} declares no (module ...) header")
        if name in out:
            sys.exit(f"error: namespace '{name}' declared by both {out[name]} and {path.name}")
        out[name] = path.name
    return sorted(out.items())


def collect_sdk() -> list[tuple[str, str]]:
    """Compiler implementation modules shipped for opt-in source linking."""
    out: dict[str, str] = {}
    for path in sorted(SDK.rglob("*.coil")):
        # Host-specific replacement with the same logical namespace.
        if path.name == "metashim_wasm.coil":
            continue
        name = declared_module(path.read_text())
        if name is None:
            continue
        # Standalone compiler utilities occasionally reuse a generic module name
        # such as `app`; they are shipped as include assets but are not imported by
        # the SDK facade. Keep the first namespace mapping deterministically.
        if name not in out:
            out[name] = path.relative_to(SDK).as_posix()
    return sorted(out.items())


def public_namespaces(entries: list[tuple[str, str]]) -> list[str]:
    """What `coil namespaces` should print.

    `coil.core` lives in the prelude (src/compiler/prelude.coil), not src/stdlib;
    it is advertised but has no file mapping of its own (and is auto-referred, so
    it is never explicitly imported).
    """
    core = declared_module(PRELUDE.read_text())
    if core is None:
        sys.exit("error: src/compiler/prelude.coil declares no (module ...) header")
    return sorted([core] + [ns for ns, _ in entries if ns not in INTERNAL_NAMESPACES])


def render(entries: list[tuple[str, str]], sdk_entries: list[tuple[str, str]]) -> str:
    public = public_namespaces(entries)
    lines: list[str] = []
    add = lines.append

    add(BEGIN)
    add("")
    add("; Public namespace discovery for the library: what `coil namespaces`")
    add("; prints. Internal implementation-detail namespaces are importable but omitted")
    add("; here on purpose (see INTERNAL_NAMESPACES in the generator).")
    add("(defn stdlib-namespaces [] (-> (slice u8))")
    add('  "' + "".join(ns + "\\n" for ns in public) + '")')
    add("")
    add("; Namespace -> the library filename that declares it.")
    add("(defn stdlib-file-for-namespace [(name (slice u8))] (-> (slice u8))")
    body = [f'(= name "{ns}") "{fn}"' for ns, fn in entries]
    add("  (cond " + "\n        ".join(body))
    add('        ""))')
    add("")
    add("; Is this filename a module of the standard library? `bundled?` in loader.coil")
    add("; is this question: it decides whether a name is resolved from the installed")
    add("; library or from the project being compiled.")
    add("(defn stdlib-manifest-file? [(name (slice u8))] (-> bool)")
    body = [f'(= name "{fn}") true' for fn in sorted(fn for _, fn in entries)]
    add("  (cond " + "\n        ".join(body))
    add("        false))")
    add("")
    add("; Compiler SDK modules live beside, but not inside, the ordinary stdlib.")
    add("; They enter a program's module graph only through an explicit coil.jit import.")
    add("(defn sdk-file-for-namespace [(name (slice u8))] (-> (slice u8))")
    body = [f'(= name "{ns}") "compiler/{fn}"' for ns, fn in sdk_entries]
    add("  (cond " + "\n        ".join(body))
    add('        ""))')
    add("")
    add("(defn sdk-manifest-file? [(name (slice u8))] (-> bool)")
    sdk_files = sorted(
        p.relative_to(SDK).as_posix() for p in SDK.rglob("*.coil")
    )
    body = [f'(= name "compiler/{fn}") true' for fn in sdk_files]
    add("  (cond " + "\n        ".join(body))
    add("        false))")
    add("")
    add(END)
    return "\n".join(lines)


def splice(current: str, generated: str) -> str:
    start = current.find(BEGIN)
    stop = current.find(END)
    if start < 0 or stop < 0:
        sys.exit(
            f"error: {TARGET.relative_to(ROOT)} is missing the generated-region markers\n"
            f"  expected a line '{BEGIN}'\n"
            f"  and a line '{END}'"
        )
    return current[:start] + generated + current[stop + len(END) :]


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--check", action="store_true", help="exit 1 if out of date; write nothing")
    ap.add_argument(
        "--print-namespaces",
        action="store_true",
        help="print the namespace list derived from src/stdlib/, for diffing against `coil namespaces`",
    )
    args = ap.parse_args()

    if args.print_namespaces:
        for ns in public_namespaces(collect()):
            print(ns)
        return 0

    current = TARGET.read_text()
    updated = splice(current, render(collect(), collect_sdk()))

    if current == updated:
        if args.check:
            print(f"ok: {TARGET.relative_to(ROOT)} manifest is up to date")
        return 0

    if args.check:
        rel = TARGET.relative_to(ROOT)
        print(f"error: {rel} is out of date with src/stdlib/", file=sys.stderr)
        print(
            "  a stdlib file was added, removed, or renamed without regenerating the manifest.\n"
            "  Left unfixed, the namespace is unreachable from an installed compiler (in-repo\n"
            "  it still resolves via the source-tree scan, which is why this needs a gate).\n"
            "  Fix with:\n"
            "      python3 scripts/compiler/gen-stdlib-manifest.py",
            file=sys.stderr,
        )
        return 1

    TARGET.write_text(updated)
    print(f"wrote {TARGET.relative_to(ROOT)}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

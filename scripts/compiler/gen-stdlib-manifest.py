#!/usr/bin/env python3
"""Regenerate the bundled-stdlib manifest tables in src/compiler/embedded_stdlib.coil.

The three tables (`embedded-namespaces`, `embedded-file-for-namespace`,
`embedded-lib`) are three views of ONE fact: which files under src/stdlib/ ship
inside a standalone compiler. Maintaining them by hand meant a new stdlib file
had to be registered in three places, and forgetting was invisible in-repo --
the loader silently falls back to scanning the source tree, so only a compiler
binary run OUTSIDE the repo would report the namespace as missing. That is
exactly how coil.socket/sync/region/signals/cancellation went unreachable.

So the tables are derived here from the directory itself, and a gate runs this
with --check. Note this generates only the TABLES; `include-str` still embeds
the bytes at compile time, so the shipped text can never go stale relative to
the sources -- only the list of which files exist is generated.

This mirrors scripts/docs/gen-guide.py, which generates src/compiler/guide.coil
from the language reference the same way.

Usage:
    gen-embedded-stdlib.py                     # rewrite the generated region in place
    gen-embedded-stdlib.py --check             # exit 1 if the region is out of date
    gen-embedded-stdlib.py --print-namespaces  # the list `coil namespaces` should print
"""

from __future__ import annotations

import argparse
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
STDLIB = ROOT / "src" / "stdlib"
PRELUDE = ROOT / "src" / "compiler" / "prelude.coil"
TARGET = ROOT / "src" / "compiler" / "embedded_stdlib.coil"

BEGIN = ";; BEGIN GENERATED -- regenerate with scripts/compiler/gen-embedded-stdlib.py"
END = ";; END GENERATED"

# Namespaces that are bundled and importable but deliberately NOT advertised by
# `coil namespaces`: implementation detail modules of a public namespace. They
# still get an embedded-lib entry and a file mapping; they are just absent from
# the discovery list. This is the ONLY hand-maintained knob in the manifest --
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
    """(namespace, filename) for every bundled stdlib file, sorted by namespace."""
    out: dict[str, str] = {}
    for path in sorted(STDLIB.glob("*.coil")):
        name = declared_module(path.read_text())
        if name is None:
            sys.exit(f"error: {path.relative_to(ROOT)} declares no (module ...) header")
        if name in out:
            sys.exit(f"error: namespace '{name}' declared by both {out[name]} and {path.name}")
        out[name] = path.name
    return sorted(out.items())


def public_namespaces(entries: list[tuple[str, str]]) -> list[str]:
    """What `coil namespaces` should print.

    `coil.core` lives in the prelude, not src/stdlib, and is embedded by
    `embedded-prelude`; it is advertised but has no file mapping of its own (and
    is auto-referred, so it is never explicitly imported).
    """
    core = declared_module(PRELUDE.read_text())
    if core is None:
        sys.exit("error: src/compiler/prelude.coil declares no (module ...) header")
    return sorted([core] + [ns for ns, _ in entries if ns not in INTERNAL_NAMESPACES])


def render(entries: list[tuple[str, str]]) -> str:
    public = public_namespaces(entries)
    lines: list[str] = []
    add = lines.append

    add(BEGIN)
    add("")
    add("; Public namespace discovery for the bundled library: what `coil namespaces`")
    add("; prints. Internal implementation-detail namespaces are importable but omitted")
    add("; here on purpose (see INTERNAL_NAMESPACES in the generator).")
    add("(defn embedded-namespaces [] (-> (slice u8))")
    add('  "' + "".join(ns + "\\n" for ns in public) + '")')
    add("")
    add("; Public namespace -> the bundled filename that declares it.")
    add("(defn embedded-file-for-namespace [(name (slice u8))] (-> (slice u8))")
    body = [f'(= name "{ns}") "{fn}"' for ns, fn in entries]
    add("  (cond " + "\n        ".join(body))
    add('        ""))')
    add("")
    add("; Text of a bundled stdlib module by filename, or an empty slice if not")
    add("; bundled. `bundled?` in loader.coil derives from this: a name is bundled iff")
    add("; we carry its text. `include-str` reads the file at COMPILE time, so these")
    add("; bytes are baked into the compiler binary and cannot drift from the sources.")
    add("(defn embedded-lib [(name (slice u8))] (-> (slice u8))")
    body = [
        f'(= name "{fn}") (include-str "../stdlib/{fn}")'
        for fn in sorted(fn for _, fn in entries)
    ]
    add("  (cond " + "\n        ".join(body))
    add('        ""))')
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
    updated = splice(current, render(collect()))

    if current == updated:
        if args.check:
            print(f"ok: {TARGET.relative_to(ROOT)} manifest is up to date")
        return 0

    if args.check:
        rel = TARGET.relative_to(ROOT)
        print(f"error: {rel} is out of date with src/stdlib/", file=sys.stderr)
        print(
            "  a stdlib file was added, removed, or renamed without regenerating the manifest.\n"
            "  Left unfixed, the namespace is unreachable from a compiler binary run outside\n"
            "  this repo (in-repo it still resolves via the source-tree scan, which is why\n"
            "  this needs a gate). Fix with:\n"
            "      python3 scripts/compiler/gen-embedded-stdlib.py",
            file=sys.stderr,
        )
        return 1

    TARGET.write_text(updated)
    print(f"wrote {TARGET.relative_to(ROOT)}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

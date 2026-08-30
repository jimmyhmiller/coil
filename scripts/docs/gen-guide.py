#!/usr/bin/env python3
"""Generate src/compiler/guide.coil from the language reference Markdown.

`coil guide` and `coil cheatsheet` print embedded copies of their reference
documents. They live in src/compiler/guide.coil as string constants so the
compiled binary is self-contained (works from the global install, no repo
needed). This script keeps them in sync with the Markdown sources.

Run from the repo root after editing docs/reference/LANGUAGE_GUIDE.md:
    python3 scripts/docs/gen-guide.py
then rebuild the compiler (scripts/compiler/rebootstrap.sh) — and because main.coil is in
the gate corpus, regenerate the snapshot first:
    python3 scripts/oracle.py snapshot full --compiler build/bin/coil
"""
import os
import re

ROOT = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))


def coil_escape(text):
    # Coil string literals need \ and " escaped; literal newlines stay verbatim.
    return text.replace("\\", "\\\\").replace('"', '\\"')


def read(path):
    return open(os.path.join(ROOT, path)).read()


GUIDE = read("docs/reference/LANGUAGE_GUIDE.md")
CHEATSHEET = read("docs/reference/CHEATSHEET.md")

# A topic is one or more heading-bounded fragments from the reference. Keeping the
# map here makes aliases and descriptions reviewable while all prose remains in the
# Markdown source of truth. A fragment ends at the next heading of the same or higher
# level, unless an explicit end heading is supplied.
TOPICS = [
    ("build", "building, running, projects, targets, and WebAssembly", ["getting-started", "run", "project"], "build run project target wasm executable", [("Build & run", None)]),
    ("modules", "module declarations, imports, exports, and namespaces", ["module", "import", "imports", "namespace"], "source-roots source roots package dependency export qualified", [("Modules & imports", None)]),
    ("operators", "arithmetic, comparison, remainder, and metal operations", ["operator", "remainder", "modulo", "%"], "arithmetic comparison division multiplication irem rem", [("The two operator tiers", None)]),
    ("traits", "traits, implementations, bounds, methods, and deriving", ["trait", "impl", "derive"], "method bound generic protocol implementation", [("Traits & impls", None)]),
    ("types", "integer and floating-point types, bool, literals, and casts", ["type", "integers", "numbers", "bool"], "numeric cast conversion integer literal signed unsigned", [("Numbers, bool, casts", None)]),
    ("floats", "f32/f64 arithmetic, comparison, conversion, and casts", ["float", "f32", "f64", "cast", "conversion"], "floating GetFrameTime frame time numeric arithmetic comparison NaN", [("The two operator tiers", None), ("Numbers, bool, casts", None)]),
    ("control-flow", "if, cond, loops, blocks, and return-from", ["control", "if", "loop", "block"], "branch while break continue return case", [("Control flow", None)]),
    ("structs", "defstruct, construction, fields, zeroed, load, and store!", ["struct", "defstruct", "field", "fields", "zeroed", "load", "store", "store!"], "array index construction named place layout", [("Structs", None)]),
    ("match", "sum types and exhaustive pattern matching", ["matching", "sum", "sums", "defsum", "exhaustive"], "enum variant variants pattern patterns arm tagged union", [("Sum types (tagged unions)", None)]),
    ("memory", "pointers, allocation, mutability, and lifetimes", ["pointer", "pointers", "allocation", "alloc"], "mutable mut parameter place load store index zeroed address lifetime", [("Pointers, memory, allocation", None)]),
    ("collections", "arrays, slices, maps, lists, and collection traits", ["collection", "array", "slice", "hashmap"], "index vector list map iteration", [("Collections (bundled)", None)]),
    ("strings", "strings, byte slices, and character literals", ["string", "bytes", "characters", "chars"], "text utf8 cstring character literal", [("Strings & bytes", None), ("Character literals", None)]),
    ("functions", "functions, callbacks, closures, and function pointers", ["function", "fnptr", "callback", "closures"], "defn parameter arguments native call pointer", [("Functions & function pointers", None)]),
    ("globals", "global mutable and constant state", ["global", "state"], "static const mutable", [("Global mutable state", None)]),
    ("comptime", "compile-time evaluation, macros, and reflection", ["compile-time", "macro", "macros", "reflection"], "code generation expansion const meta", [("Compile-time: comptime, macros, reflection", None)]),
    ("metaprograms", "whole-program checkers, transforms, and dialects", ["metaprogram", "checker", "checkers", "transform", "transforms"], "dialect whole program lint rewrite", [("Metaprograms: whole-program checkers & transforms", None)]),
    ("ffi", "extern, primitive/native definitions, cimport, and the C ABI", ["extern", "native", "primitive", "cimport", "c-abi"], "foreign C ABI header printf raylib", [("I/O & FFI", None)]),
    ("docs", ";;; documentation comments and generated API docs", ["doc", "comments", "documentation"], "code-doc markdown reference", [("Doc comments (`;;;`)", None)]),
    ("tests", "deftest, assert, discovery, filtering, and debug checks", ["test", "testing", "assert", "assertions", "deftest", "discovery"], "runner filter no-run list failure project", [("Tests, assertions, debug checks", "Named test suites")]),
    ("test-suites", "named test suites and project test configuration", ["suite", "suites", "named-tests"], "test roots suffixes project configuration Coil.toml default opt-in", [("Named test suites", "Property-based testing (`coil.prop`)")]),
    ("properties", "property tests, generators, shrinking, and fuzzing", ["property", "property-tests", "prop", "fuzz", "fuzzing"], "generator arbitrary shrink cases seed coverage", [("Property-based testing (`coil.prop`)", "Reserved-name gotchas ⚠")]),
    ("gotchas", "reserved names and common language traps", ["gotcha", "reserved", "reserved-names"], "call block type mistakes", [("Reserved-name gotchas ⚠", None)]),
    ("stdlib", "standard-library discovery and commonly used namespaces", ["standard-library", "library"], "bundled API modules namespaces", [("The standard library", None)]),
]


def headings(markdown):
    out = {}
    found = list(re.finditer(r"^(#{2,3}) (.+)$", markdown, re.MULTILINE))
    for i, match in enumerate(found):
        level = len(match.group(1))
        end = len(markdown)
        for later in found[i + 1:]:
            if len(later.group(1)) <= level:
                end = later.start()
                break
        title = match.group(2)
        if title in out:
            raise SystemExit(f"duplicate guide heading: {title}")
        out[title] = (match.start(), end)
    return out


HEADINGS = headings(GUIDE)


def topic_text(fragments):
    pieces = []
    for start_name, end_name in fragments:
        if start_name not in HEADINGS:
            raise SystemExit(f"guide topic starts at missing heading: {start_name}")
        start, default_end = HEADINGS[start_name]
        if end_name is None:
            end = default_end
        else:
            if end_name not in HEADINGS:
                raise SystemExit(f"guide topic ends at missing heading: {end_name}")
            end = HEADINGS[end_name][0]
        if end <= start:
            raise SystemExit(f"empty/reversed guide fragment: {start_name} -> {end_name}")
        pieces.append(GUIDE[start:end].rstrip())
    return "\n\n".join(pieces) + "\n"


seen_names = set()
for canonical, _, aliases, _, _ in TOPICS:
    for name in [canonical, *aliases]:
        if name in seen_names:
            raise SystemExit(f"duplicate guide topic or alias: {name}")
        seen_names.add(name)

toc = "Coil language guide\n\n"
for canonical, description, _, _, _ in TOPICS:
    toc += f"  {canonical:<14} {description}\n"
toc += "\nUse `coil guide <topic> [topic...]`, `coil guide --search <text>`, or `coil guide --all`.\n"


def cond_function(name, rows, fallback):
    lines = [f"(defn {name} [(name (slice u8))] (-> (slice u8))", "  (cond"]
    for key, value in rows:
        lines.append(f'    (= name "{coil_escape(key)}") "{coil_escape(value)}"')
    lines.append(f'    "{coil_escape(fallback)}"))')
    return "\n".join(lines)


def indexed_function(name, values):
    lines = [f"(defn {name} [(idx i64)] (-> (slice u8))", "  (cond"]
    for idx, value in enumerate(values):
        lines.append(f'    (= idx {idx}) "{coil_escape(value)}"')
    lines.append('    ""))')
    return "\n".join(lines)


canonical_rows = []
for canonical, _, aliases, _, _ in TOPICS:
    canonical_rows.append((canonical, canonical))
    canonical_rows.extend((alias, canonical) for alias in aliases)

topic_rows = [(canonical, topic_text(fragments)) for canonical, _, _, _, fragments in TOPICS]
description_rows = [(canonical, description) for canonical, description, _, _, _ in TOPICS]
search_rows = [
    (canonical, " ".join([canonical, *aliases, keywords, description]))
    for canonical, description, aliases, keywords, _ in TOPICS
]
fragment_rows = {}
topic_fragment_rows = []
for canonical, _, _, _, fragments in TOPICS:
    keys = []
    for start_name, end_name in fragments:
        key = start_name + ("" if end_name is None else " -> " + end_name)
        keys.append(key)
        fragment_rows[key] = topic_text([(start_name, end_name)])
    topic_fragment_rows.append((canonical, "\n".join(keys) + "\n"))

out = (
    "; src/compiler/guide.coil — GENERATED from docs/reference/*.md.\n"
    "; Do not edit by hand; regenerate with: python3 scripts/docs/gen-guide.py\n"
    "(module coil.compiler.guide)\n\n"
    "(defn guide-text [] (-> (slice u8))\n  \"" + coil_escape(GUIDE) + "\")\n\n"
    "(defn guide-toc-text [] (-> (slice u8))\n  \"" + coil_escape(toc) + "\")\n\n"
    + cond_function("guide-canonical-topic", canonical_rows, "") + "\n\n"
    + cond_function("guide-topic-text", topic_rows, "") + "\n\n"
    + cond_function("guide-topic-description", description_rows, "") + "\n\n"
    + cond_function("guide-topic-search-text", search_rows, "") + "\n\n"
    + cond_function("guide-topic-fragment-keys", topic_fragment_rows, "") + "\n\n"
    + cond_function("guide-fragment-text", list(fragment_rows.items()), "") + "\n\n"
    + f"(defn guide-topic-count [] (-> i64) {len(TOPICS)})\n\n"
    + indexed_function("guide-topic-name-at", [row[0] for row in TOPICS]) + "\n\n"
    + "(defn guide-topic-names [] (-> (slice u8))\n  \"" + coil_escape("\n".join(row[0] for row in TOPICS) + "\n") + "\")\n\n"
    "(defn cheatsheet-text [] (-> (slice u8))\n  \"" + coil_escape(CHEATSHEET) + "\")\n"
)
open(os.path.join(ROOT, "src/compiler/guide.coil"), "w").write(out)
print(f"wrote src/compiler/guide.coil ({len(out)} bytes) from docs/reference/*.md")

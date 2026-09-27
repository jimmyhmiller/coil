#!/usr/bin/env python3
"""Generate src/compiler/guide.coil from the language reference Markdown.

`coil guide` and `coil cheatsheet` print embedded copies of their reference
documents. They live in src/compiler/guide.coil as string constants so the
compiled binary is self-contained (works from the global install, no repo
needed). This script keeps them in sync with the Markdown sources.

Run from the repo root after editing docs/reference/LANGUAGE_GUIDE.md, CHEATSHEET.md,
or one of the task guides a topic embeds (PROJECTS, TESTING, DEBUGGING, STATEFUL_JIT,
WASM):
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

# Documents a topic may draw from. The language guide is the default; the others
# are the task guides split out of it.
DOCS = {
    "guide": GUIDE,
    "projects": read("docs/reference/PROJECTS.md"),
    "testing": read("docs/reference/TESTING.md"),
    "debugging": read("docs/reference/DEBUGGING.md"),
    "jit": read("docs/reference/STATEFUL_JIT.md"),
    "wasm": read("docs/reference/WASM.md"),
}

# A topic is one or more fragments. A fragment is (heading, end-heading) in the
# language guide, or (document, None, None) for a whole split-out document. A
# heading fragment ends at the next heading of the same or higher level unless an
# explicit end heading is supplied. Keeping the map here makes aliases and
# descriptions reviewable while all prose remains in the Markdown sources.
TOPICS = [
    ("tour", "one program touching every major feature", ["overview", "start", "getting-started"], "hello example program main first", [("Tour", None)]),
    ("types", "integer, float, bool, character, string and keyword values; casts", ["type", "integers", "numbers", "bool", "literals", "floats", "float", "f64", "cast"], "numeric cast conversion integer literal signed unsigned width NaN f32", [("Values and types", None)]),
    ("control-flow", "let, if, cond, case, when, loops, blocks, scope/defer, destructuring", ["control", "if", "loop", "let", "destructuring", "defer"], "branch while for break continue return case block pattern", [("Bindings and control flow", None)]),
    ("functions", "defn, named arguments, generics, value parameters, fn, fnptr, annotations", ["function", "defn", "fn", "fnptr", "callback", "generics", "annotations"], "parameter arguments generic const keyword inline anonymous lambda", [("Functions", None)]),
    ("structs", "defstruct, construction, .field access, set!, references, computed fields", ["struct", "defstruct", "field", "fields"], "array construction named place layout reference mut zeroed sizeof", [("Structs", None)]),
    ("match", "sum types, exhaustive match, Option, Result and try", ["matching", "sum", "sums", "defsum", "option", "result", "try"], "enum variant variants pattern arm tagged union error", [("Sum types and match", None)]),
    ("traits", "traits, impls, operators, methods, specialization, derive, dyn, Callable", ["trait", "impl", "derive", "dyn", "operators", "operator", "callable", "methods"], "method bound generic protocol implementation display debug eq ord add", [("Traits", None)]),
    ("memory", "allocators, references and pointers, ownership, Drop, Rc/Arc", ["pointer", "pointers", "allocation", "alloc", "ownership", "drop", "allocator"], "mutable mut parameter box arena free lifetime clone rc arc lease", [("Memory and ownership", None)]),
    ("globals", "const, def, and mutable global cells", ["global", "state", "const", "def"], "static var-static mutable constant", [("Globals", None)]),
    ("collections", "slices, arrays, ArrayList, HashMap, iterators and adapters", ["collection", "array", "slice", "hashmap", "arraylist", "iter", "iterator"], "index vector list map iteration filter fold range collect", [("Collections and iteration", None)]),
    ("strings", "printing, formatting, strings and text", ["string", "text", "println", "format", "print"], "utf8 cstring display debug fmt str rune", [("Text and output", None)]),
    ("modules", "module declarations, imports, exports and namespaces", ["module", "import", "imports", "namespace", "stdlib", "library"], "export qualified core namespaces standard", [("Modules", None)]),
    ("comptime", "const/comptime evaluation, macros, reflection, custom derives", ["compile-time", "macro", "macros", "reflection", "defderive"], "code generation expansion quasiquote hygiene meta", [("Compile time", None)]),
    ("metaprograms", "whole-program checkers (lints with fixes) and transforms", ["metaprogram", "checker", "checkers", "transform", "transforms", "lint", "lints"], "dialect whole program rewrite suggest fix", [("Metaprograms: lints and transforms", None)]),
    ("ffi", "extern, cimport, export-c, callbacks and the C ABI", ["extern", "native", "cimport", "c-abi", "export-c"], "foreign C ABI header printf", [("FFI", None)]),
    ("docs", ";;; documentation comments", ["doc", "comments", "documentation"], "code-doc markdown reference", [("Documentation comments", None)]),
    ("tests", "deftest, assertions and a first property test", ["test", "deftest", "assert", "assertions"], "assert-eq defprop", [("Tests", None)]),
    ("metal", "coil.primitive: raw operations, uninitialized storage, SIMD", ["primitive", "primitives", "bits", "unsafe"], "iadd udiv popcount alloc-stack alloc-static load store index tbaa llvm-ir", [("The metal tier", None)]),
    ("gotchas", "common traps, collected", ["gotcha", "reserved", "reserved-names", "mistakes"], "call block type error", [("Gotchas", None)]),
    ("project", "Coil.toml, dependencies, workspaces, linking, artifacts, toolchain updates", ["projects", "build", "run", "manifest", "dependencies", "workspace", "workspaces", "coil.toml", "update"], "package entry link libs native artifacts readers providers hermetic prebuilt unit install", [("projects", None, None)]),
    ("testing", "coil test, suites, property tests and fuzz campaigns", ["test-suites", "suites", "suite", "property", "properties", "prop", "fuzz", "fuzzing"], "runner filter list jobs generator arbitrary shrink seed coverage corpus roots suffixes", [("testing", None, None)]),
    ("debugging", "debug checks, sanitizers, crash reports, debugging allocators", ["debug", "sanitize", "sanitizer", "sanitizers", "debug-checks", "asan"], "address thread memory undefined crash dbgalloc guardalloc tracealloc", [("debugging", None, None)]),
    ("jit", "the REPL and the in-process coil.jit compiler", ["repl", "hot-reload", "stateful-jit"], "session var reload sdk evaluate compile", [("jit", None, None)]),
    ("wasm", "the wasm32 target, exports, host imports and externref", ["wasm32", "webassembly", "browser"], "javascript export import externref", [("wasm", None, None)]),
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


def fragment_key(fragment):
    if len(fragment) == 3:
        return "@" + fragment[0]
    start_name, end_name = fragment
    return start_name + ("" if end_name is None else " -> " + end_name)


def fragment_text(fragment):
    if len(fragment) == 3:
        if fragment[0] not in DOCS:
            raise SystemExit(f"guide topic names unknown document: {fragment[0]}")
        return DOCS[fragment[0]].rstrip()
    start_name, end_name = fragment
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
    return GUIDE[start:end].rstrip()


def topic_text(fragments):
    return "\n\n".join(fragment_text(fragment) for fragment in fragments) + "\n"


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
    for fragment in fragments:
        key = fragment_key(fragment)
        keys.append(key)
        fragment_rows[key] = topic_text([fragment])
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

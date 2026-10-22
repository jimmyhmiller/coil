# Program facts: indexed, answer-sized queries

Status: implemented 2026-10-21.

## The rule

A metaprogram that asks the compiler about the program pays for its answer, never
for the program. The compiler computes each fact once per analysis, files it under
the key it is asked by, and a query is a lookup that returns the stored answer in
place. No query scans the program, and no query copies what it returns.

A lint built on these queries asks questions. It does not walk the program to
rebuild facts the compiler already has.

## Why

`coil.lint.unused` peaked at 40 GB on the compiler. The measured causes, on a
1,000-function program under `COIL_MTRACE=mem`:

| what the metaprogram did | allocated |
|---|---|
| walk every node with `(for e (iter f))` | 8 MiB |
| the same walk with `(get f i)` | 688 B |
| `type-of` on every list node | 19 MiB |
| `meta/reference-binding` on every reference | 7 MiB |
| `(primitive/code-source-references)`, the whole list | 1.4 KB |

and, above all, queries that were filters over the whole program:
`meta/references M` walked every reference of every module to pick out M's, and
`meta/references-through` did that again for each import. Everything a
metaprogram allocates lives until the invocation returns (the expansion arena), so a
lint asking one such question per import held thousands of whole-program copies.
The compiler's own `code-qualify-import` scanned the same way.

## How other compilers do it

- **rustc**: lints and analyses call memoized queries keyed by `DefId` or module
  (`tcx.type_of`, `hir_module_items`, `def_kind`); results are arena-interned and
  handed out by reference. Late lint passes are callbacks from one driver walk.
- **Roslyn**: analyzers get a `SemanticModel` and an indexed find-references
  (`SymbolFinder`); they register for node kinds instead of traversing.
- **clangd**: a symbol index maps each symbol to its references.

The shared shape: the compiler walks once and indexes; tools look up.

## Coil's facts

Built once per analysis when the source view is published (the one walk of the
authored program the view already did), and stored with it:

| query | key | answer |
|---|---|---|
| `meta/references M` | module | its authored references |
| `meta/references-through IMPORT` | module + facade | references that resolved through it |
| `meta/references-to TARGET` | qualified name, or a local's identity | authored references to it, every role |
| `meta/imports M` | module | its authored imports |
| `meta/binders M` | module | its `let` binders: identity, binder form, value |
| `meta/reference-form REF` | occurrence | the form the reference heads: the call, or the match arm |
| `meta/forms-headed M HEAD` | module + head | its forms headed by core syntax (`or`, `if`), or by a name that resolves to nothing |
| `meta/path NODE` / `meta/enclosing NODE` | occurrence | the forms around NODE, outermost first, each with the index toward NODE |

Match patterns are references now, with role `:pattern`, so a variant's
constructions and its matchers are told apart by role, not by walking `match`.

A rule starts from what it is about and asks about that form. The default lint
profile is written this way: field-syntax starts from the calls of `store!`,
`load` and `field`; named-constructor from the constructions of each variant
with three or more fields; modernize's `or` rule from `forms-headed M or`; the
stack-cell rule from each `alloc-stack` and the `let` two steps up its path.

Every authored node answers the checked program's questions — `type-of`,
`resolve-at`, `binding-of` — through the checked node with its span. `type-of`
answers the type a literal or an operation on literals took from its context,
so a rule does not carry context types down a walk. `resolve-at` answers for a
spelling the parser takes as a primitive (`zeroed` is coil.primitive.zeroed),
from the parser's own spelling index.

A role is what the last parse of an occurrence recorded. A macro call is parsed
before it expands, and `(let [x (or a b)] x)` then reads as a call with type
arguments `[x (or a b)]`; the parse of the expansion takes `or` as core syntax
and clears that `:type`.

From the checked program, built on first use:

| query | answer |
|---|---|
| `meta/resolved-uses NAME` | how many checked uses resolve to NAME, generated code included |
| `meta/definition-form NAME` | the authored form that defines NAME (the `defn`, or the macro call that wrote it) |
| `meta/field-uses STRUCT` | the fields of STRUCT the program reads, writes or takes the offset of |
| `meta/cast-structs` | the structs some pointer cast converts to or from |
| `meta/definitions-of-kind KIND` | every definition of that kind (the program's sums, say), from the table of that kind |

Field uses and casts are recorded by the checker as it checks, the way it already
records each local read.

The facts are recorded wherever a checker runs: `coil lint`, and a build whose
program registers a checker (`--use`, `--debug-checks`). A build without one
records nothing.

## The boundary

Iterating `Code` allocated a view node per step (`code-rest`), boxed. `Code`
iterates with a cursor (the list and an index): no allocation. Answers that are
stored lists cross as handles to the stored list.

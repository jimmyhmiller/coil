# Full syntax hygiene migration

**Status: PLANNED — must land atomically.**

Coil's current metaprogramming model is only partially hygienic. Quasiquote
qualifies resolvable call heads, and a post-expansion pass alpha-renames some
macro-introduced `let` binders. Other relationships are still established by
equal symbol spelling. Reader providers, generators, transforms, helper-built
fragments, non-`let` binders, and programmatically constructed symbols do not all
share one lexical-identity rule.

The Brainfuck reader makes the problem concrete: `read-brainfuck` emits bindings
named `cells` and `dp`, while independently evaluated helper templates emit bare
references with those spellings. The fragments connect only after being pasted
together. This is intentional capture, but it is implicit and indistinguishable
from an accidental capture.

This project replaces that mixed model with scope-bearing syntax objects. The
migration is not a compatibility feature. There will be no permanent legacy
mode, spelling-based fallback, or supported half-hygienic endpoint.

## Completion contract

The work is complete only when all of these statements are true:

- Every identifier in `Code` has lexical identity in addition to display text.
- Template-introduced binders cannot capture syntax supplied by a caller.
- Syntax supplied by a caller cannot capture template-introduced references.
- Free identifiers in templates retain their definition-site bindings.
- Reusing an identifier across independently built fragments requires reusing
  the same syntax object (or an explicitly derived identifier), never merely the
  same string.
- Intentional use-site capture requires a conspicuous, searchable primitive.
- Every Coil binding form participates in the same resolver-level hygiene model;
  hygiene is not a collection of macro-specific repair walkers.
- Macros, `meta` generators, before/after-expand transforms, reader providers,
  checker suggestions, `code-read`, builders, and generated declarations obey
  the same identity-preservation rules.
- The standard library, compiler metaprograms, examples, applications,
  experiments, and tests contain no implicit spelling-based capture.
- Negative tests prove both directions of hygiene for every binding form and
  every metaprogram boundary.
- The bootstrap fixpoint and the complete release gate pass after migration.

Anything less is an intermediate development state and must not be merged as the
finished feature.

## Semantic model

Coil will follow the Scheme/Racket rule, with Clojure-style ergonomics where they
do not weaken it.

An identifier consists conceptually of:

```text
Identifier {
    spelling             ; for source and diagnostics
    lexical scopes       ; used for binding equality and resolution
    phase/origin         ; definition site, use site, or generated
    source span          ; source reporting
    expansion provenance ; macro backtraces and generated-code reporting
}
```

Lexical scopes and expansion provenance are separate data. The current
`Sexp.ctxt` is diagnostic expansion lineage and must not be overloaded as the
complete lexical-scope representation.

The core rules are:

1. Syntax read from source starts with its lexical/module context.
2. Syntax written in a template retains the template's definition context.
3. Unquoted or spliced syntax retains its original context.
4. Entering an expansion introduces a fresh scope. Binding forms extend the
   syntax in their lexical region with binding scopes.
5. Resolution compares identifiers and scopes, not strings alone.
6. A fresh identifier can be created once, passed through ordinary Coil values,
   and unquoted into multiple independently built fragments.
7. Converting an unscoped datum/name into use-site syntax is an explicit escape
   hatch and is never the default behavior of `code-symbol`.

An ergonomic `name#` form inside one quasiquote may create and consistently reuse
a fresh identifier in that template. It is shorthand only. Code spanning helper
templates must create an identifier once and pass it explicitly.

## Required public distinctions

The final API must distinguish these operations even if the shipped names differ:

```coil
(primitive/fresh-identifier "dp")
(primitive/datum->syntax prototype "dp") ; explicit context/capture choice
(primitive/syntax->datum identifier)      ; explicit context removal
(primitive/free-identifier=? a b)
(primitive/bound-identifier=? a b)
```

`code-symbol` currently manufactures names for several unrelated purposes. Each
call site must be classified and migrated to one of:

- a fresh local identifier;
- a derived declaration identifier intentionally shared by generated definitions
  and references;
- a definition-site reference;
- a keyword/field/data name that is not a lexical identifier;
- an explicit use-site identifier.

The use-site/context-stripping operations must be rare, noisy in code review, and
accepted by the hygiene audit only with a local annotation explaining the intended
capture protocol.

## Binding-form inventory

The audit and resolver changes must cover at least:

- `let` binders, including `(mut name)` and sequential initializer scope;
- function and method parameters;
- generic/type parameters where they denote lexical type variables;
- `match` payload binders and nested patterns;
- loop/control labels if labels are identifiers rather than data keywords;
- locally generated declarations and all references to them;
- trait method references versus trait/impl method binder positions;
- aliases and names introduced by imports where they participate in generated
  syntax;
- every binder introduced by a macro-defined surface form after that form expands.

The parser and resolver already know the grammar of these positions. The final
implementation must establish hygiene there rather than extending
`hygienize-expansion!` with more syntax-shape guesses.

## Metaprogram-boundary inventory

Every boundary below must preserve syntax identity and receive focused tests:

- ordinary `[Code ...] -> Code` macros;
- helper functions returning `Code` but not themselves invoked as macros;
- variadic macro arguments and `~@` splicing;
- nested macro expansion and macro-generating macros;
- `(meta ...)` top-level generation;
- before-expand transforms and checkers;
- semantic transforms and checker replacements/suggestions;
- reader providers returning an entry program;
- `primitive/code-read` and configurable readers;
- `CodeBuilder`, `code-list-push!`, `code-list-done`, slices, copies, and concat;
- serialization, promotion, and native metaprogram-engine boundaries;
- compiler bootstrap and bundled-source reconstruction.

Copying or building containers must preserve identifier identity. Deep copying a
syntax tree may create new tree nodes, but it must not silently turn identifiers
into unrelated datums or new bindings.

## Audit: finding every migration site

Text search is a seed, not the authoritative audit. The current repository has a
large and heterogeneous surface:

| area | candidate Code-related definitions | files | quasiquote lines | `gensym` | `code-symbol` |
|---|---:|---:|---:|---:|---:|
| `src/stdlib` | 549 | 47 | 2,060 | 23 | 39 |
| `src/apps` | 482 | 15 | 2,075 | 33 | 3 |
| `src/experiments` | 56 | 5 | 201 | 7 | 3 |
| `src/examples` | 39 | 6 | 172 | 2 | 0 |
| `tests` | 274 | 67 | 945 | 5 | 1 |

These are deliberately conservative grep-derived counts recorded at planning time;
they include false positives such as dialect-level Scheme quasiquote and ordinary
functions that merely inspect `Code`. They also cannot detect implicit linkage
between equal spellings in separate templates. A compiler audit is required.

### Audit output

Add a temporary development command (or mandatory compiler diagnostic mode) that
emits one machine-readable record for every identifier constructed or transported
by a metaprogram:

```text
file, span, producer, phase, spelling, identifier-origin,
binding/reference/data position, target-binding, explicit-context-operation
```

It must classify, not merely list:

- template-introduced binders;
- template references resolved at definition site;
- syntax originating at a use site through unquote/splice;
- generated fresh identifiers;
- identifiers assembled by `code-symbol` or related string operations;
- same-spelling binder/reference pairs that currently connect without shared
  syntax identity;
- unresolved generated references;
- context removal or use-site-context introduction.

The audit must fail closed: an identifier in a syntactic identifier position with
unknown provenance is an error, not an ignored record.

### Tracked migration manifest

Check in the audit output as a migration manifest grouped by subsystem. Every
record must end in one of these resolved states:

- `definition-site-reference`
- `fresh-local`
- `shared-generated-identifier`
- `preserved-use-site-syntax`
- `non-identifier-data`
- `explicit-intentional-capture` (with justification and focused test)

The final gate regenerates the manifest and requires no unclassified or stale
records. The manifest is removed only if the permanent compiler gate can prove the
same property directly on every build.

## Atomic implementation plan

The following are development checkpoints, not separately supported language
modes. The final merge/release includes all of them.

### 1. Freeze the semantics with failing tests

- Add capture tests for both directions: introduced binder versus spliced
  reference, and use-site binder versus template free reference.
- Cover every binding form and metaprogram boundary listed above.
- Add cross-helper tests where equal spelling must *not* connect.
- Add tests where reuse of one identifier object across helpers *does* connect.
- Add explicit-capture tests proving that the escape hatch works only when used.
- Add printing/diagnostic tests so generated names remain understandable without
  exposing unstable internal scope IDs as source syntax.

### 2. Introduce identifier and scope representation

- Extend `Sexp` symbols (or introduce a symbol payload) with lexical identity.
- Keep source span, node identity, and expansion provenance intact and separate.
- Define deterministic scope allocation so bootstrap output remains reproducible.
- Preserve scopes through all constructors, copies, builders, views, promotion,
  metahost calls, and serialization paths.
- Update canonical dumps with an opt-in scope display suitable for hygiene tests;
  normal source rendering should retain readable spellings.

### 3. Make the resolver scope-aware

- Bind and resolve locals using syntax identity/scope sets.
- Bind and resolve definition-site globals without quasiquote call-head rewriting.
- Handle trait methods, imports, core auto-referral, aliases, and declaration
  positions under the same identifier rules.
- Preserve the current checker-level `binding-of` API, now backed by the canonical
  scope-aware resolution rather than spelling lookup.

### 4. Replace quasiquote semantics

- Template identifiers acquire definition context.
- Unquote and splice preserve input syntax context.
- Template-introduced binders receive fresh scopes automatically.
- Add `name#` only as syntax sugar for a fresh identifier local to one template.
- Remove call-head-only qualification as the source of hygiene once equivalent
  scope-aware resolution is proven.
- Remove the span-based `let` alpha-renaming pass once all tests use the canonical
  model.

### 5. Cover every metaprogram engine and phase

- Apply the same syntax rules to macros, metas, transforms, reader providers, and
  checker replacements.
- Ensure setup compilers and reader-provider isolation retain definition contexts.
- Verify native/Wasm metaprogram engines and promotion boundaries preserve scopes.
- Ensure `code-read` produces source-context syntax, not implicitly capturing
  template or caller contexts.

### 6. Run the audit and migrate all repository code

Migrate in this order so foundational macros expose downstream assumptions early:

1. compiler prelude and core control macros;
2. standard-library macros and derive systems;
3. standard-library generators and platform metas;
4. reader providers, beginning with Brainfuck;
5. transforms and checker suggestions;
6. property-testing generators;
7. Scheme dialect and other application-level compilers;
8. experiments and examples;
9. test-only metaprograms and negative fixtures;
10. compiler-internal metaprogram fixtures and snapshots.

For each subsystem:

- classify every generated binder/reference/data identifier;
- create shared identifiers once and pass them through helpers;
- replace string-equality linkage with shared identifier objects;
- replace accidental capture with hygienic references;
- mark and justify any deliberate context introduction;
- add a focused test before marking the manifest entries resolved.

### 7. Delete the old behavior

- Remove `hygienize-expansion!` and its span/source heuristic.
- Remove bare-name fallback for generated identifier references.
- Remove any temporary compatibility switches.
- Make unknown/unscoped generated identifiers a hard compiler error.
- Update the language guide and metaprogram examples so none teach manual or
  implicit capture as normal practice.

### 8. Prove completion

- Hygiene matrix: every binder form × every metaprogram boundary × both capture
  directions.
- Definition-site free-reference tests across modules, imports, core, traits, and
  local shadowing.
- Cross-template shared-identifier and same-spelling-nonidentity tests.
- Explicit-capture positive and missing-escape negative tests.
- Audit manifest has zero unclassified records.
- All existing focused metaprogram, Scheme, reader, transform, and hygiene suites
  pass with updated intentional results.
- Run the bounded compiler gate repeatedly against one candidate.
- Run all snapshot stages once, review the complete mismatch set, and refresh all
  intentional changes together.
- Run `python3 scripts/dev.py build full` once for final release verification.
- Rebootstrap and require the fixpoint.

## Brainfuck acceptance example

The migrated reader must create state identifiers once:

```coil
(let [cells-id (primitive/fresh-identifier "cells")
      dp-id (primitive/fresh-identifier "dp")
      forms (bf-compile-seq context source 0 false 0 cells-id dp-id)]
  `(let [~cells-id ...
         (mut ~dp-id) 0]
     ~@forms))
```

`bf-command` and loop compilation receive and unquote those identifiers. Command
locals such as `cell` and `c` are fresh per emitted scope. The `:program` control
label must either become an identity-bearing generated label or be explicitly
documented and typed as non-lexical keyword data; it must not remain an ambiguous
string-like protocol.

Acceptance tests must demonstrate that another generated `dp`, `cells`, `cell`,
`c`, or `program` with the same printed spelling cannot alter the reader output's
binding graph.

## Non-goals

- Preserving accidental capture for source compatibility.
- Treating `gensym` discipline alone as full hygiene.
- Expanding the current span heuristic to recognize more binder shapes.
- Declaring the migration complete because the existing suite remains green.
- Hiding intentional capture behind a neutral helper name or automatic fallback.

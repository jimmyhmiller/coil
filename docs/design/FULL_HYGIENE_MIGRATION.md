# Full syntax hygiene migration

**Status: IMPLEMENTATION IN PROGRESS — the semantic migration, the boundary
matrix, and the full release gate are green; the seeds need one re-bless from a
committed tree.**

Scope identity is distinct from diagnostic expansion context; dynamic quasiquote
allocates one scope and preserves unquoted syntax; locals, parameters, match
payloads, and type variables lower to scope-aware resolver keys; definition-module
identity is recorded independently of source IDs; and the public identifier API is
available. The span-based alpha-renamer, call-head qualification, and trait-binder
re-baring walker are deleted. Compiler, standard library, Brainfuck reader,
Scheme dialect, applications, experiments, and test metaprograms have all been
migrated. The tracked audit reports zero unclassified sites, every snapshot stage
passes, and the self-hosted compiler reaches an LLVM object fixpoint.

Every boundary in the inventory below now has both-direction coverage, run on
both metaprogram engines, and no diagnostic prints an internal resolver key.

Both native seeds have been rebuilt (`scripts/compiler/refresh-seed.sh both`),
because the committed ones predated `primitive/fresh-identifier` and could not
compile this tree at all — `python3 scripts/dev.py test all` reaches the LLVM
fixpoint from the committed seed again, with no `STAGE0`. What is left is
bookkeeping the gate is right to insist on: the seeds were blessed from an
uncommitted tree, so their `SEED_VERSION` stamps name a commit that does not
contain the source they were built from and `gate-seed-provenance.sh` rejects
them. Re-run the refresh once this work is committed and that resolves to a bare
hash.

Before this migration, Coil's metaprogramming model was only partially hygienic. Quasiquote
qualifies resolvable call heads, and a post-expansion pass alpha-renames some
macro-introduced `let` binders. Other relationships were established by equal
symbol spelling. Reader providers, generators, transforms, helper-built fragments,
non-`let` binders, and programmatically constructed symbols did not all
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

Loop/control labels are deliberately outside this inventory's lexical-identifier
set: Coil spells them as keywords (`:label`) and `split-label` carries them as
protocol data. They are compared in the loop stack, never resolved as symbols.
The Brainfuck reader's `:program` label follows that same explicit keyword-data
protocol.

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
  (a suggestion is the only boundary whose output becomes source TEXT — see
  "Flattening syntax back to text" below);
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

## Migrating existing metaprograms

Almost nothing needs migrating, because almost everything the new rule changed
only WIDENS what resolves — a bare type name, a trait in a bound, a supertrait,
an alias-qualified name — each of which used to be a compile error. Code that
compiled before still compiles.

Exactly one pattern can go the other way: a template naming a module through an
alias its own file never declares. That used to borrow the caller's alias table
and worked whenever every caller happened to pick the same nickname for the same
module. Now it resolves where it was written, so the file has to import what it
names. The repair is one line, and `scripts/hygiene-alias-scan.py` finds every
occurrence.

Scanned at migration time: `src` and `tests` report one site, and it is a false
positive of a kind the scanner cannot detect — `modernize.coil`'s
`mz-ambient-replacement` builds a `primitive/suggest` replacement, which becomes
TEXT in the reader's file, so its `alloc/` is deliberately the reader's alias and
is never resolved in `coil.lint.modernize` at all. Six Coil projects outside this
repository (`jim-backend`, `TheCount`, `coil-conventions`, `coil-mlir`, an agent
harness, and a design sketch) report zero.

The two standard-library modules that DID have the problem — `coil.prop.derive`
and `coil.prop.stateful`, above — are the only real instances the migration
turned up, and both were one import each.

## Every spelling a template can use now resolves the same way

`.claude/worktrees/swift-interop/experiments/macro-hygiene` reported that of the
four ways a template can name something, only two worked. A bare function name
resolved in the defining module (real referential transparency, module-private
names included). A bare TYPE name did not resolve at all, and an ALIAS-qualified
name was re-resolved against the CALL site — where a file-local nickname means
nothing, or, worse, means something else.

The report was right, and its proposed fix — resolve alias-qualified symbols
through the defining module's alias table, matching what the bare case already
does — is what scope-aware resolution does. All four spellings now behave
identically:

| in a template | before | now |
|---|---|---|
| bare function name | resolves in the defining module | same |
| bare type name | **no** | resolves in the defining module |
| alias-qualified (either) | **re-resolved at the call site** | resolves in the defining module |
| fully qualified (either) | resolves | same |

`definition_site_alias.coil` and `definition_site_type.coil` pin all three of the
repaired spellings adversarially: the caller binds the same alias to a different
module exporting the same function, keeps a competing `Box` in bare scope, and
rebinds the provider's own `tg` alias to a decoy `Tag`. That distinguishes "it
worked" from "it worked for the right reason" — on the pre-migration compiler the
alias fixture exits 12, having silently called the caller's decoy rather than
erroring, and the bare type reports `unknown type 'Box'`.

Both fixtures also check that their decoys are live, since an adversarial test
whose adversary has fallen out of scope is a tautology. The alias fixture's
answer is `5 + (999 - 962)`, so the provider's `st/str-len` and the caller's must
both resolve as intended; the type fixture writes the decoys' `other` field,
which exists on neither real type.

The everyday consequence is that `primitive/…` in a template — an alias-qualified
reference, in nearly every macro in the tree — is load-bearing rather than
lucky.

## Positions that took the spelling instead of the identifier

Three positions were never migrated off `sx-sval`, so they matched by display
text while everything around them matched by identity. Each was found by running
a fixture that existed and that no gate ran.

- **`impl`'s trait name** (`parse-impl` used `sym-of`). A `deftrait` emitted by a
  template was invisible to the `impl` emitted beside it.
- **A trait's type parameters, `Self` included** (`parse-deftrait` used
  `sym-of`), while the method signatures that refer to them keep their identity —
  so the two sides could not match: `method 'm': needs a Self (Self) parameter`.
- **A generated declaration's home module.** A template in module A can generate
  a declaration that lands in module B: the resolver key names A, the
  declaration is indexed under B. `resolve-scoped-source` looked only in A.

`lexical-sym-of` is `sym-of` for a position that names a binding rather than a
piece of data. `tests/compiler/hygiene/lib9.coil` / `user9.coil` is the case that
exercises all three at once, and it is now gated.

## Templates must import what they name

Two standard-library modules named things their own module could not see, and
got away with it only while resolution fell back to the use site:
`coil.prop.derive` names `Arbitrary`/`arbitrary` without importing
`coil.prop.arbitrary`, and `coil.prop.stateful` expands into `(defprop …)`
without importing `coil.prop`. A free identifier in a template resolves at its
DEFINITION site, so both now import what they name. `coil.prop` is imported as
`:use [defprop]` rather than `:use *`, because it re-exports a `Source` that
`coil.prop.stateful` already has from `coil.prop.source`.

`__mode` joined `__src` as a published property-body protocol name for the same
reason: `defprop` binds it and `defprop-stateful` reads it, and those are two
templates in two modules, so they connect only through an explicit
`syntax->datum` / `datum->syntax` pair.

## `quote` is syntax, not a spelling

`'name` is metaprogram-authored syntax exactly as a quasiquote literal is, and
carries the same lexical identity: one fresh introduction per evaluation, stamped
with the metaprogram's definition module.

It did not, and that was the migration's last spelling-based back door. Plain
quote aliased its registry node, leaving the identifier in the SOURCE scope
(`hyg` 0) where it bound by spelling — so a template writing `~'tmp` around
caller syntax captured the caller's `tmp`, and two independently evaluated
`'name`s connected to each other. The source audit could not see it, because `'`
is not one of the identifier-producing primitives it tracks; nothing in the tree
used it that way, so nothing failed.

Quoted DATA is unaffected. `sexp-eq` (and so `code-eq`) compares tag and spelling
and never lexical identity, so `(code-eq node 'inc)` answers exactly as before;
only the binding graph changed. The stamp is a copy, never a mutation of the
shared registry node.

Pinned by `tests/compiler/hygiene/quote_identity.coil` (one quoted identifier
reused, caller left alone, exits 42) and `quote_capture.coil` (two independent
evaluations must not connect), on both engines.

## `name#` was not needed

The plan proposed `name#` as sugar for a fresh identifier local to one template.
It is not implemented, and full hygiene is why: a template identifier already
gets a fresh scope per expansion, so `tmp#` and `tmp` behave identically and the
sugar would only add a second way to spell the default. Nothing in the contract
depends on it.

## Flattening syntax back to text

Every other boundary preserves identity because the syntax objects survive it.
A checker `suggest`ion does not: `coil lint --fix` writes the replacement into
the author's file, and a file has spellings, not scopes. A rule that wraps the
author's code in its own `(let [tmp 1] …)` therefore captured their `tmp`, and
the rewritten file still compiled — the failure mode a source-rewriting tool
must not have. Using `primitive/fresh-identifier` did not help, because the
renderer emitted the base spelling either way.

The renderer now disambiguates. Which collisions can actually capture anything
is answered from the type-checker's binding map rather than from binder shapes:
only an identifier transported out of the author's program that the checker
resolved to a LOCAL is capturable, so only a spelling shared with one of those
is renamed. The author's syntax always keeps its text; each rule-introduced
identity, keyed by its scope, becomes `name__N` in first-appearance order.
Heads, globals and qualified names collide harmlessly and keep their spelling,
which is what leaves `cond`-shaped rewrites byte-identical.

The capturable spellings are collected at `suggest` time, before the replacement
is copied out of the metaprogram's arena: owning a tree renumbers its nodes, and
the binding map is keyed by node id.

## What the audit could not tell you

Two blind spots, both found the hard way:

- **The audit tracks identifier PRODUCERS, not consumers.** It enumerates
  `fresh-identifier`/`datum->syntax`/`syntax->datum`/`code-symbol`/`gensym` call
  sites and can say every one is classified. It cannot see a parser position that
  drops identity on the floor, and it never looked at `'` at all. Every real
  defect found in this migration was invisible to it.
- **A fixture that no gate runs is not a test.** 28 of the hygiene fixtures --
  including the whole trait-method matrix, whose expected results are written
  down in the directory's README -- were run by nothing, and one of them had been
  silently failing. They are all gated now, and the gate checks their printed
  output, not just an exit code.

`scripts/tests/prop.sh` had a third version of the same problem: it read its
compiler from `$COIL` and ignored a path argument, so `prop.sh <candidate>`
reported on whatever `coil` was installed. It now takes the argument.

## Known limits of the audit tooling

`coil dump-hygiene` parses its input as ordinary Coil, so it cannot audit syntax
produced by a `--use` reader provider — pointed at a `.bf` file it reports a
parse error rather than the reader's output. The runtime enforcement is
unaffected (a real build of that file resolves under the same rules), and the
Brainfuck acceptance probe below covers the property behaviourally, but the
machine-readable audit has a blind spot at that one boundary.

## Diagnostics never print a resolver key

The parser lowers binders and references to `$scope<N>@<module>$<name>`. Those
numbers are deterministic within one compilation and meaningless outside it, and
they reached messages embedded in longer names — a generated function reported
as `mymod.$scope7@mymod$helper`, a generic parameter as `$scope93@mymod$T`.
`diag-display-msg` normalizes the rendered text at the single place every
diagnostic is written, so a new message cannot forget to do it. Gated over the
fixtures that produce generated declarations.

## Not a boundary: a `meta`-generated macro

`(meta …)` can emit a `defn` with a `Code` signature, but a call to it resolves
as an ordinary function call and is never staged as a macro: the macro-name set
is collected from the loaded surface forms before any generator runs. This
predates the migration — the committed seed rejects the same program — so it is
recorded here rather than fixed as part of it. The supported half, a macro whose
expansion expands another macro, is covered by
`tests/compiler/hygiene/nested_macro_expansion_identity.coil`.

## Brainfuck acceptance, checked

The reader creates `cells` and `dp` once with `primitive/fresh-identifier` and
threads them through `bf-command`/`bf-compile-seq`; `putchar`, `getchar` and
`main` are `datum->syntax context` because they belong to the target module.

The acceptance property the section below asks for is now a test rather than a
claim. `tests/compiler/reader_metaprograms/bf_collide.coil` is a before-expand
transform that injects `(const cells 111)`, `(const dp 222)` and `(const cell
333)` into the very module the reader emitted; `hello.bf` still prints
`Hello World!` under it. `bf_collide_live.coil` runs first and exits 42 only if
those consts really landed, so a probe that silently stopped injecting cannot
make the acceptance check pass vacuously. Both are in
`scripts/tests/reader-metaprograms.sh`.

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

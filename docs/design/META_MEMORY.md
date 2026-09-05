# Metaprogram memory: the expansion-arena contract

Status: **SHIPPED** — all six phases are landed (2026-08-16); this document is
now the record of the design plus what each phase turned out to be. Phase
commits: `7ec494e` (phase 0, the scope fix), `f9cf84f` (metering), `0e69c3d`
(lint + sweep), `ef7c512` (arena), `6502bca` (builder split), `c0150b2`
(views), and the phase-6 commit (defaults on). The design sections below are
kept as originally written — including the budget, which was later cut (see
the deviations).

Deviations from the plan below, and why:

- **The builder/resplice rules remain warn-only.** Their linear rewrite changes
  ownership and result construction across a whole helper, which a local
  suggestion cannot express honestly. The canonical read-only `(Code, index,
  count)` tail-recursive walker now has a safe autofix: it preserves the
  signature and replaces the body with iteration over an O(1) `code-slice`
  view. Less regular recursion still warns. The original sweep was done as code
  changes (with emit-ir-verified byte-identical expansion output), and the lint
  keeps the idioms out.
- **Metering needed no counting shim**: the scratch arena grew a monotonic
  `total` counter, so phase 1 was a subtraction and phase 6 had nothing to
  delete.
- **`code-list-done` (op 62)** joined the builder API: freezing by unquote
  alone couldn't serve helpers whose results are *read* (walked with
  `code-nth`) before splicing. Identity at runtime; the type is the point.
- **Views keep `sx-info` blind**: a `KView` reports NULL items through the
  compiler-plane accessor funnel, so any view leaking past the promotion
  boundary fails loudly instead of silently reading the parent list at the
  wrong offset. Only the code-op layer (interpreter ops, metahost callbacks,
  `sexp-eq`, splice, codelib mirrors) reads views, through `code-node-*`.
- **One accepted sharp edge**: pushing onto a builder after freezing it can
  reallocate the parent items array out from under views taken of the frozen
  list — within one expansion only (the arena bounds it), and
  `COIL_META_ARENA=poison` makes it loud. A truly affine builder would need
  linear types.
- **The expansion budget was built, then removed by decision.** Phase 6
  shipped a 64 MiB default cap raisable by a source-level
  `(meta-budget NAME MIB)` declaration, enforced at the code-op and mh-a
  chokepoints. Jimmy cut it the same day: three innocent metaprograms (the
  brainfuck reader, the unused-code checker, the Scheme dialect) immediately
  needed declarations merely for scaling with their input — ceremony taxing
  legitimate work — while the arena already bounds what one expansion can
  hold live and `COIL_MTRACE=mem` already makes any surprise attributable.
  No `meta-budget` form exists in the language.
- **Bootstrap seeds**: op 62+ made the committed seeds stale (they predate
  the ops the swept stdlib now uses); `scripts/compiler/refresh-seed.sh` on
  each supported host is the standing fix, per that script's own discipline.

Measured after phase 6 (Linux x86-64, 20,000-op Brainfuck through the reader):
1.6 GB peak / 2.1 s — vs 27.1 GB / 6.4 s before phase 0. A 20,000-step
`code-rest` recursion runs at the compiler's ~0.5 GB baseline (was ~13 GB of
tail copies). Whole-compiler `coil check` with the arena on: 1.23 GB / 1.15 s
(from 1.35 GB / 1.51 s).

## The problem, measured (2026-08-16, Linux x86-64)

Compiling raw Brainfuck through the reader metaprogram (`coil check prog.bf
--use reader.fixture.brainfuck`) with n flat `+`/`-` operations:

| n ops  | peak RSS before | after `7ec494e` |
|-------:|----------------:|----------------:|
|  1,000 |          860 MB |          821 MB |
|  4,000 |         1.94 GB |          910 MB |
| 20,000 |         27.1 GB |         1.45 GB |

Attribution, established by experiment:

1. The reader itself was already linear (it uses `code-list-new`/`code-list-push!`).
2. The **pre-expanded equivalent program** — the exact Coil the reader emits,
   written to a file by hand, no metaprogram anywhere — cost the *same* 27.3 GB
   in plain `coil check` at 20k forms.
3. Deleting only the `(scope :program …)` wrapper from that file dropped it to
   1.28 GB, linear.

So the blowup was one stdlib macro. `scope`'s helpers used the two idioms our
Code API makes look natural and cheap:

- `scope-escape-list` recursed with `(primitive/code-rest forms)`. `code-rest`
  is not cdr: it allocates a fresh list and copies every remaining element.
  Walking an n-form body this way copies n²/2 Sexps.
- `scope-mains` accumulated with `` `(~@acc ~f) ``: quasiquote re-splices the
  whole accumulator to append one element. Another n²/2.

A `Sexp` is 64 bytes; 2 × (20,000²/2) × 64 B ≈ 26 GB, plus ~1.3 GB of linear
cost and a ~460 MB compiler baseline ≈ the 27 GB observed. Every byte came from
`malloc-allocator` and none was ever freed, so **peak RSS equals total churn,
not live data**.

The macro is fixed, but three structural facts remain and will reproduce this
in the next metaprogram someone writes:

1. **The API hides asymptotics.** The natural recursive style (car/cdr
   recursion, accumulate-by-splice) is quadratic; the linear style (builders,
   index loops) is the obscure one.
2. **There is no lifetime boundary.** Reader scratch, expansion intermediates,
   interpreter values, and native-metaprogram handles all come from one global
   allocator that is never reset.
3. **Ownership is unknowable, so reclamation is impossible even in principle.**
   Children are stored by value inside the parent's `ArrayList` (nothing can
   share a tail; every extraction copies), yet the interpreter's
   `code-list-push!` (op 61) mutates shared structure in place, the quote
   registry aliases the compiler's own AST nodes, and native `code-nth` mallocs
   a fresh box per element touched. Aliased, mutated, and copied nodes are
   indistinguishable, so nothing *could* be freed safely. "Leak everything" is
   currently load-bearing.

## Principles

Deliberately **not** a GC and **not** refcounting — both hide the cost and move
the fix away from the author. Instead:

- **The author owns their working set.** A metaprogram's memory is bounded by
  what it holds live at once, not by its allocation history. If it exceeds its
  budget, the fix is always local to that metaprogram.
- **Costs are visible in names.** No operation silently copies an unbounded
  amount. Anything O(n) says so (`code-copy`, `code-concat`); everything else
  is O(1).
- **Failures are attributable.** An out-of-budget expansion names the
  metaprogram, the byte count, the call-site span, and the idioms that usually
  cause it. Never a mystery RSS number.

## The contract: borrow, build, promote

Every metaprogram invocation runs against an **expansion arena** (the
malloc-overflow bump arena that already exists in `coil.alloc` — `aro-*` —
whose top-block `ar-resize` path makes builder growth a pointer bump).

- **Borrow.** Inputs — argument `Code` values, quote-registry nodes
  (`mp-quoted`), anything reached through `code-nth` — are compiler-owned,
  immutable views, valid for the duration of the invocation only.
- **Build.** Everything the metaprogram creates comes from its arena:
  quasiquote results, `code-mk-*`, gensyms, string builders. Builders
  (`code-list-new`) are the only mutable code values, and mutating borrowed
  structure is impossible (the op that did it is removed — see API changes).
- **Promote.** Exactly one value survives: the returned `Code`. The engine
  deep-copies it — structure *and* string payloads — into the caller's
  allocator, then resets the arena. Everything else is gone.

Cross-invocation state remains possible but explicit: `primitive/alloc-static` (or
malloc) inside the metaprogram is the author's own memory, visible in their
source, untouched by the arena. That is the whole escape hatch; there is no
implicit way for scratch to outlive an expansion.

Nested expansion composes for free: `expand-macro` already takes an allocator
parameter from its caller, so "promote into `a`" naturally targets the parent
expansion's arena, and the outermost call promotes into the compiler heap.

## API changes

| operation | today | after |
|---|---|---|
| `code-nth`, `code-count`, predicates | O(1); native path mallocs a handle box per call, never freed | unchanged semantics; boxes come from the arena |
| `code-rest` | **O(n) copy** | **O(1) view** of the parent's items (see Views) |
| `code-slice c lo hi` | — | new, O(1) view |
| `code-copy c` | — | new, the only deep copy, named as one |
| `code-concat a b` | — | new, explicit O(n+m) build into the arena |
| `code-list-new` / `push!` / `done` | returns a disguised `KList`; interp op 61 pushes into shared `sx-items` in place | a distinct **builder**: its own checker type, its own CtVal arm / handle tag; `push!` only accepts builders; unquoting a builder freezes it (today's implicit-`done` idiom keeps working) |
| quasiquote / `~@` | lowers to `qq-new`/`qq-push`/`qq-splice`; allocates from global malloc | same surface and lowering; allocates from the arena; `~@` of a view flattens into the result builder — the single irreducible copy |
| in-place push on plain lists | possible (op 61) | removed; builders only |

The builder becoming a distinct static type is a small breaking change:
today the checker types `code-list-new`'s result as `code` (both branches of an
`if` mixing it with `code` currently typecheck). Known users are
`brainfuck_reader.coil` and `control.coil` — the migration sweep is trivial and
the new type turns "pushed onto a frozen list" and "returned a builder from a
non-tail position" into compile errors.

## Views

Add a view arm to the reader node:

```
(KView [(items (ptr (ArrayList Sexp))) (off i64) (len i64)])
```

`code-rest`/`code-slice` return views over the parent's item array — no copy,
immutable by the borrow rule. Views are **metaprogram-execution-only**: promote
flattens them to `KList`, so the parser, checker, and codegen never see
`KView` (assert this at the promote boundary). The accessor funnel
(`sx-len`/`sx-at`/`sx-items`) becomes view-aware; code that pattern-matches
`KList` directly is compiler-internal and unaffected by the invariant above.

This is what makes cdr-style recursion legitimate again instead of merely
forbidden: after phase 5, the `code-rest` lint below retires to style advice.

## Engine changes (anchor points)

- `expander.coil:701 expand-macro` — the one place `CtCtx.a` is set. Create the
  arena here, store it in `cx.a`, run `finish-macro`, then promote the `Ok`
  result via `meta-copy-sexp` (`metaengine.coil:425`, extended to copy
  `KSym`/`KStr`/`KKw`/`KCStr` payload bytes — today it copies structure but
  aliases the string slices) and destroy the arena. `Err` diags must copy their
  message strings out for the same reason.
- `metahost.coil` — every hardcoded `(malloc-allocator)` in the `mh-*` ABI
  (`mh-qq-new`, `mh-box-sexp`, `mh-buf`, the `code-nth` box, …) becomes
  `(load (field (mh-cx) a))`. `mh-cx` already exists; this is mechanical.
- `comptime.coil code-op` — already allocates from `(field cx a)`; comes along
  for free.
- `codelib.coil` — the ordinary-function vocabulary takes its allocator from
  the same meta context instead of calling `malloc-allocator` directly.
- Fold/transform/checker/read-provider sites — all route through `expand-macro`
  or set up their own `CtCtx` (`comptime.coil` fold pass); each gets the same
  arena-per-evaluation treatment.
- wasm engine — instance linear memory is already an isolated region whose
  results are serialized out at the boundary; align its accounting
  (`memory.grow` pages) with the budget, nothing else changes.
- Compiled-metaprogram cache — the ABI change (allocator-aware vtable) bumps
  the metashim hash, so `~/.cache/coil/metaprog` entries regenerate; no manual
  invalidation.

## Soundness audit (what promote-and-reset must not dangle)

1. **String payloads** — copied by the extended `meta-copy-sexp` (copy always;
   range-checking which slices are arena-backed isn't worth the fragility).
2. **Diagnostics** — `Err` results and collected `primitive/report` diags carry
   arena strings; copy at the boundary.
3. **Checker fixes** — `cop-record-fix` stores rewrite text; copy at record
   time.
4. **Metaprogram statics** — allowed by design (author-owned; the explicit
   escape hatch).
5. **Debug mode** — `COIL_META_ARENA=poison` fills the arena with `0xDD` on
   reset so any missed alias fails loudly, not heisenbug-ly. `guardalloc`
   exists for deeper hunts.

## Budgets and attribution

The arena knows its own byte count (bump offset + overflow blocks), so
per-expansion accounting is a subtraction, and enforcement is one compare in
the allocation path.

- **Default budget:** 64 MiB per expansion (to be tuned with phase-1 data — a
  linear stdlib macro should sit under 1 MiB even on huge inputs).
- **Raising it is a source-level declaration**, parsed by the loader alongside
  `transform`/`reader-provider` registrations:

  ```
  (meta-budget my-big-generator (mib 512))
  ```

  A memory-hungry metaprogram is thereby a *reviewable line of code*, not a
  runtime surprise.
- **Exceeding it is a located error** built from machinery that already exists
  (`mtrace-current` names the running metaprogram; `locate-macro-err` pins the
  call site):

  ```
  error: metaprogram 'coil.control.scope' exceeded its 64 MiB expansion budget
         (allocated 12.4 GiB) expanding the form at prog.bf:1:1
    note: common causes: (primitive/code-rest …) recursion, `(~@acc …)
          accumulation; see docs/design/META_MEMORY.md
  ```

- **`COIL_MTRACE=mem`** — mtrace grows a level: `enter`/`leave` lines gain
  `bytes=` and a sorted per-metaprogram peak table prints at exit. Straight to
  stderr, per mtrace's charter.

## Lint + fix

New checker module `src/stdlib/lints/meta.coil`, registered as
`coil.lint.meta`, following the `ifcombine`/`match_lint` pattern (report +
`record-fix`, comment-carrying forms downgrade to advice, runs under
`coil lint` and `verify`):

- **`meta/code-rest-recursion`** — inside any defn with a `Code` parameter,
  flag `(primitive/code-rest X)` passed as an argument in a recursive call.
  The fix is the mechanical transform applied to `scope-escape-list` by hand:
  add a `(start i64)` parameter, pass `X` + `(iadd start 1)`, rewrite
  `(code-nth X 0)` → `(code-nth X start)` and the emptiness guard to a bounds
  compare. Because it changes the signature (all callers in the module must be
  rewritten together), ship it under `--diff` as an assisted fix; shapes it
  can't prove downgrade to advice. Retires to style advice after phase 5 makes
  `code-rest` O(1).
- **`meta/splice-accum`** — flag a template `` `(~@A …) `` / `` `(… ~@A) ``
  where `A` is a parameter that receives, at a recursive call site of the same
  function, a template that splices `A` again — the grow-by-resplice
  signature. The canonical accumulate shape (single accumulator, tail
  append/prepend, returned at the base case) gets the builder rewrite
  (`code-list-new` + `push!` + loop) under `--diff`; anything else is advice.

Known offenders to sweep in phase 2: `prop_derive.coil` (7 accumulate-by-splice
walkers — small n today, latent), the remaining `code-rest` recursions in
`control.coil` (`thread-first`/`thread-last` and friends — macro-argument n,
harmless, but fix for idiom hygiene), and whatever the lint finds that grep
didn't.

**Regression teeth (phase 1):** a gate-cli test generates a flat 8,000-form
`scope` body and runs `coil check` under `ulimit -v` 3 GiB. A quadratic
regression OOMs the gate; the linear implementation passes with headroom.

## Migration phases

Each phase lands separately, gated by the usual discipline (fixpoint
rebootstrap, gate all, gate-cli, arm64, scheme oracle where relevant).
Ordering rationale: observability before policy (pick the budget number from
real data), lints before semantics changes (fix authored code while behavior
is frozen), arena before the API break (it needs no source changes), views
last (broadest representation blast radius).

1. **Metering, zero semantic change.** Wrap the allocator handed to
   `expand-macro` in a counting shim; `COIL_MTRACE=mem`; the ulimit teeth
   test. Run the gates + scheme suite with tracing and record per-metaprogram
   peaks — this data sets the default budget.
2. **Lints + stdlib sweep.** Land `coil.lint.meta`, run it over `src/stdlib`
   and `src/compiler`, apply the fixes, wire into `verify`.
3. **Arena behind `COIL_META_ARENA=1`** (+ `poison` mode). Promote with string
   copy; diag/fix copy-out; run the full gates under the flag on all three
   engine paths (native, wasm, interp fallback).
4. **Builder type split.** Distinct checker type + CtVal arm + handle tag;
   remove in-place push on plain lists; sweep the two known users.
5. **Views.** `KView`, O(1) `code-rest`, `code-slice`/`code-copy`/
   `code-concat`; parser op table + all three engines + guide; promote
   flattens; oracle snapshots refresh.
6. **Defaults on.** Arena always, budget enforced (with `meta-budget`
   declarations where phase-1 data says they're needed), counting shim
   deleted, `LANGUAGE_GUIDE`/guide.coil updated, DECISIONS.md entry recorded.

## Acceptance criteria

- The 20k-op Brainfuck case pays the compiler baseline plus O(result AST):
  under ~800 MB peak, and expansion-attributable memory under ~50 MB.
- Every budget failure names the metaprogram, the bytes, and the call site.
- No silent copies remain in the `code-*` vocabulary: every O(n) op has copy
  or concat in its name.
- Gates green on both hosts, including the wasm fallback engine.

## Open questions

- The default budget number (pick from phase-1 data, not from taste).
- Whether whole-program transforms/checkers get a larger default than macros
  (they legitimately hold the module list; probably yes, e.g. 256 MiB).
- Whether `code-rest` keeps its name when it becomes a view, or is renamed
  (`code-tail`?) to break silently-recompiled assumptions loudly. Leaning:
  keep the name — the new behavior is strictly better and semantics-identical
  for readers.
- Whether budget overflow is an error from day one of phase 6 or a one-release
  warning first.

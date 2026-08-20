# Staged metacompilation

> The Scheme dialect this document uses as its guest language — every
> `src/apps/scheme/…`, `coil.scheme.…`, and `tests/scheme/…` path below —
> now lives in the **coil-experiments** repository. The `(stage MARKER …)`
> protocol it describes is a Coil feature and is still here.

Status: IMPLEMENTED on branch `staged-metacompilation` (2026-08-17), M1–M5.
The generic `(stage MARKER …)` protocol, the code-opaque/syntax-object bridge,
procedural `define-syntax` (datum-level, recursive, macro-defining-macros), and
`syntax-case`/`#'`/`with-syntax` (fixed patterns; ellipsis and fenders report
clean errors) are all landed and gated by
`scripts/compiler/oracle/gate-staged-meta.sh` under the native engine,
`COIL_META_INTERP=1`, and `COIL_META_ARENA=poison`, with the self-host
fixpoint byte-identical. Deviations from this plan discovered during
implementation are recorded in the commit messages on that branch — most
notably: the per-increment disposable compile arena is deferred (the engine
image shares mono/interp structure with the checked graph — the branch's
"premature freeing created dangling registries" trap, reproduced and then
avoided by allocating stage compilation from the durable allocator);
`ml-quoted` now deep-copies the quote registry as root-cause hardening; and
engine setup runs inside the `SemMapsSnap` window because a stage program's
nodes are fresh, unlike `stage-one-macro!`'s shared closure bodies.

The goal: a transform can define code that **runs at expansion time**, in-process,
during the same compilation — the mechanism that makes procedural Scheme macros
(`define-syntax` + `lambda`) work in the Coil Scheme dialect, with transformer
output re-entering the dialect's own lowering ("language resumption").

This is the third run at staged computation. The first two are documented
autopsies; this plan is written against them and against two things that have
landed since and change the ground truth:

- **`coil run` on code→code programs** (`64e2df9`, `docs/design/RUN_METAPROGRAMS.md`)
  proved the winning pattern: enter *above* the promotion boundary, add zero
  execution machinery, let `expand-macro` + lazy staging do everything.
- **META_MEMORY** (`docs/design/META_MEMORY.md`, all six phases shipped)
  resolved the exact entanglement that killed the branch implementation:
  semantic state (engine entries, quote registries — global stage-box) is now
  structurally separated from memory ownership (per-expansion arenas,
  borrow/build/promote, disposable generation arenas).

## Prior art and its verdicts

| Experiment | Where | Verdict |
|---|---|---|
| `(stage MARKER …)` protocol | `feat/scheme-continuation-pass`, dossier `docs/landing/06-staged-metaprograms.md`, commits `15b5f52`…`b929f97` | **Worked. Never rejected.** Five passing generic fixture families; Scheme procedural `syntax-case` ran on it. Stalled on entanglement, not semantics. Classified "land independently as a series"; session prompts `05a`–`05e` exist. Instruction: **reconstruct, don't copy.** |
| `coil run --meta` + `coil.meta.runtime` + `jit_x64` | same branch | "Incomplete experiment — do not port." Superseded by `64e2df9`. Lesson: the hard part is the authoritative `CtCtx`; a reduced runtime satisfies the ABI and is wrong about every question a metaprogram asks. |
| Scheme `syntax-case` **emulation** | removed in `dd61a3e` | Replaced by native staged procedural syntax (`b07bcb0`: `phase.coil`, `syntax.coil`, dialect rewrite). "Do not land both models." |

What main deliberately does **not** have, and this plan must not silently
break: registrations are pre-scanned literal top-level forms
(`expander.coil:3663` — "a macro/transform cannot retroactively generate a
before-expand registration"); `(meta …)` output goes to strict resolve+check,
never back into expansion; the composition surface for staged *output* is a
pipe or file (`coil run a.coil | coil run b.coil`). The stage protocol is a
new, distinct thing with its own semantics — **not** a relaxation of any of
those rules.

## Design laws

Derived from the retrospectives; violations are how the last two attempts died.

1. **Enter above the promotion boundary.** Phase entries are invoked only via
   `expand-macro` (`expander.coil:758`) — arena, `ct-own-sexp` promotion,
   `ct-own-str` diag ownership, poison mode, mtrace, arity, real `CtCtx`, all
   for free. Phase programs are compiled with the same
   resolve→closure→check→`meta-engine-setup` path `stage-one-macro!` uses.
   `meta-engine-setup` is already additive (existing entries win; each `MEEntry`
   carries its own build's quote registry). **No new execution machinery, no
   second Code runtime, no dependency on `jit_x64.coil`.**
2. **Authoritative `CtCtx` everywhere.** Phase programs are ordinary Coil,
   checked by the real checker, running against the real semantic maps.
3. **Fresh-marker capability, not name inference.** A `Code -> Code` function
   name cannot identify a staged request (same spelling may be runtime data;
   quoted syntax must stay data). The marker is a gensym the transform mints —
   an unforgeable capability.
4. **Generic Coil fixtures define the semantics; Scheme only demonstrates.**
   (Dossier, verbatim: "do not use Scheme as the semantic definition.")
5. **Memory separation stays separated.** Phase-program *compilation* owns a
   disposable generation arena (the `stage3-round` pattern,
   `expander.coil:2359`; branch measured 49.3 MiB reclaimed per stage).
   Engine entries and quote registries live in the global stage-box
   (`expander.coil:713`). Request results promote via `ct-own-sexp`. No
   budgets — the budget was built and removed by decision; do not reintroduce.
6. **Parity is a gate, not an aspiration.** Every fixture runs under the
   native engine, `COIL_META_INTERP=1`, and `COIL_META_ARENA=poison` from the
   first commit. (The branch proved host-native only; interpreter/wasm
   behavior was an explicitly named gap.)

## Layer 1 — the generic `(stage MARKER …)` protocol

### Surface

A **before-expand transform** may include, among its returned forms:

```coil
(stage MARKER IMPORT… DECL…)      ; declare a phase-program increment
(MARKER ENTRY ARG…)               ; request: run staged ENTRY on ARG… here
```

`MARKER` is a symbol the transform gensym'd. The `stage` form binds it as a
stage capability for the rest of the compilation. `ENTRY` names a Code-signed
`defn` declared in this or an earlier `stage` form. `ARG…` are forms, handed
to the entry as borrowed `Code` exactly like macro arguments.

### Semantics (the five, from the dossier)

1. **Isolation.** `stage` declarations are split out of the program before
   resolve/check. They compile as their own program — declared imports plus
   all previously declared stage forms of this compilation — and **never
   enter the runtime program**. A generated phase function need not exist in
   any loaded source file.
2. **Cumulative state.** Stage N's program includes stages 1…N−1's
   declarations; entries accumulate additively in the engine. Redefining a
   name already declared by an earlier stage is a **hard located error** —
   "cumulative" must not mean accidental shadowing. (Decision D1 below.)
3. **Round behavior.** Serviced inside the before-expand fixpoint
   (`run-before-expand`, `expander.coil:3556`). Each round:
   run transforms → split new `stage` declarations out of their output →
   compile + install the increment → expand marked requests
   (outermost-first, matching the tower rule at `expander.coil:1616`) →
   splice results (`splice-do-into!` convention: a `(do …)` result is a form
   sequence) → next round. Fixpoint = no transform changed anything, no new
   declarations, no pending requests.
4. **Language resumption.** Spliced results are ordinary forms; the next
   round's transforms see them. A Scheme transformer returning Scheme syntax
   is re-lowered by the dialect. This is why staging cannot be a pipeline
   post-pass.
5. **Cross-module routing.** The marker/entry table is compilation-scoped
   (a static, the `checker-reg-box` pattern). A request appearing in module B
   against a marker minted by module A's transform resolves.

### Implementation shape on main

- **Recognizers** in `expander.coil`: `stage-declaration?`; requests are
  recognized by head-symbol lookup in the compilation-scoped `StageTable`,
  skipping quote contexts (markers are gensyms, so collision is already
  practically impossible; skip-quotes makes it airtight).
- **Compile + install**: build module records for the cumulative phase
  program; run the same path `stage-one-macro!` runs — tolerant resolve,
  `closure-funcs-pruned`/`closure-subprogram-pruned`, `check-program`
  bracketed by `SemMapsSnap` save/restore (`comptime.coil:1789` — the
  staging-mid-run map-wipe hazard is known and already solved), additive
  `meta-engine-setup` — inside a disposable `ScratchArena` generation.
  Compilation is **eager at declaration time**: the lazy-staging measurement
  (eager 2.7× slower cold) was about speculatively staging *every* qual in a
  program; a `stage` declaration is an explicit request to compile a small
  program, and eager compilation puts errors at the declaration site
  deterministically. (The branch did the same.)
- **Invoke**: one `expand-macro` per request, `CtCtx` from the phase
  program's entry module. Diagnostics locate at the request's span.
- **Source attribution** (a named gap on the branch): declarations and
  requests are stamped by the transform machinery that already stamps
  generated forms (`append-module-forms!`/`ModRep`, `expander.coil:3327`), so
  a failing phase check or a transformer `error` points into the file the
  author wrote.
- **Bounding**: a request's result may contain new `stage` declarations and
  new requests (stage-emits-stage); each layer consumes a round. Raise the
  before-expand fixpoint cap from 16 to 64 for rounds that made stage
  progress, matching the tower's cap (Decision D2).

### What Layer 1 does *not* do

- No change to the registration pre-scan. `stage` is not a registration and
  cannot create one.
- No servicing of stage forms in `(meta …)` output, macro output, or semantic
  transforms (v1 scope: before-expand only — that's where dialects live and
  where resumption is meaningful; it is also exactly what the dossier's
  fixtures exercise).
- No engine changes. `metaengine.coil`/`metahost.coil`/`metalower.coil`
  untouched, same as the runner.

### Fixtures (reconstruct the five families as the spec)

`tests/metaprogramming/compile-and-run/`:
`generated_stage` (entry that exists in no source file), `isolated_stage`
(phase code never reaches the runtime program; a phase-only import doesn't
link), `multiround_stage` (second stage's entry doesn't exist until the first
stage's native result has returned), `duplicate_stage` (redefinition is a
located error), `cross_module_stage`. Plus one new family the branch lacked:
`resume_stage` — a request result containing forms the registering transform
must transform again (the generic pin for language resumption).

## Layer 2 — the Scheme phase runtime and the syntax bridge

Two branch modules are close to right and should be reconstructed nearly
as-is (they are import lists and a small value wrapper, not expander code):

- **`coil.scheme.phase`** (branch `src/apps/scheme/phase.coil`): re-exports
  the Scheme runtime (core, closure, derived, derived2, numeric, stdproc,
  port, value, heap, symbol, syntax, forms) for phase programs. Deliberately
  excludes the reader, dialect, lint, and lowering metaprograms — phase
  source has already been lowered before its program compiles.
- **`coil.scheme.syntax`** (branch `src/apps/scheme/syntax.coil`): syntax
  objects — tagged Vals whose payload retains the exact compiler `Code` node
  (source location + identity). `syntax-object-from-code`,
  `syntax-object-code`, `syntax->list`, `syntax-code->datum` /
  `datum->syntax`-side reification, vectors and strings included.

One small compiler prerequisite: **`code-opaque` / `code-from-opaque`**
(Code ↔ i64 handle) exist only on the branch. Add them to main through the
normal op-table process (`codeop-of` in `parser.coil`, `code-op` dispatch in
`comptime.coil`) so both engines serve them identically. Note the stdlib
two-step build if any stdlib code uses the new ops before the compiler that
knows them is installed.

**Arena audit — new since the branch.** The branch's syntax objects are
malloc'd outside the Scheme heap and point into compiler-owned Code. Under
the now-default expansion arena that is safe **within one invocation**
(the transformer runs entirely inside one `expand-macro` call; borrowed Code
is valid for the invocation) — and a use-after-reset if a syntax object is
stashed in phase-level static state across invocations. Rules:

1. The output path (`datum->syntax` reification) builds Code from the
   invocation's `CtCtx.a` — the arena — and returns it; promotion deep-copies
   it out, string payloads included. Views never escape (promotion flattens
   `KView`; already enforced).
2. Storing a syntax object in a phase static is documented as
   undefined-after-return, and a poison-mode fixture proves the failure is
   loud (`COIL_META_ARENA=poison` fills freed arenas with `0xDD`).
3. Coil Code has proper lists only. Improper (dotted) transformer output is a
   located error in v1, not a silent truncation. (The branch's linked-Code
   representation change is classified do-not-port; do not resurrect it for
   this.)

## Layer 3 — procedural `define-syntax` in the dialect

### Surface (v1 target — the branch's, which is Chez's)

```scheme
(define-syntax answer
  (lambda (form)
    (datum->syntax form 42)))

(define-syntax procedural-first
  (lambda (form)
    (syntax-case form ()
      ((_ value) #'value))))
```

`define-syntax` whose value is a `lambda` (not a `syntax-rules` spec) is a
procedural transformer. Existing `syntax-rules` handling is untouched — the
Code-level interpreter in `dialect.coil`/`numeric.coil` stays the
`syntax-rules` implementation (it is verified against R5RS and fast); the
staged path is purely additive.

### Mechanics

`dia--syntax-forms` (`dialect.coil:1264`) learns the second shape. For a
procedural transformer the dialect:

1. Lowers the transformer source through **its own passes as functions**
   (they already are: `fm/scheme-forms-mods`, `lam/lambda-lift-module-visible`,
   `rt/rooting-mods`, the `dia--` let/set/internal walkers) into plain Coil
   defns.
2. Wraps them with a Code-signed entry:
   `(defn $stx-NAME [(form Code)] (-> Code) …)` — body:
   `syntax-object-from-code` → apply the compiled transformer closure →
   reify the result Val back to Code.
3. Emits `(stage MARKER (import "coil.scheme.phase" :use *) <defns>)` — one
   marker per module, minted once.
4. Rewrites each use `(NAME …)` into the request `(MARKER $stx-NAME (NAME …))`
   — the whole use form is the argument, matching `(_ value)` patterns.
5. Leaves the rest to Layer 1: the request expands between fixpoint rounds,
   the result re-enters the dialect (resumption), so transformer output may
   be arbitrary Scheme — including further `define-syntax`.

The dialect transform is already re-entrant over partially-expanded programs
(the fixpoint + provenance-aware lint requirements forced that), which is the
property resumption needs.

### Phase-visible bindings (v1 rule, deliberately narrow)

A transformer body may use: the phase library, internal `define`s inside its
own `lambda` (branch case `10b`), and transformers declared earlier in the
file (cumulative state). It may **not** silently see the module's runtime
`define`s — R5RS needs no cross-phase sharing, implicit phasing is a tar pit,
and an explicit `(define-for-syntax …)` / `(begin-for-syntax …)` surface is a
clean v2 addition (Decision D4).

### `syntax-case` (v1.5)

`syntax-case`, `#'` (syntax), and `with-syntax` compile *inside the
transformer body* into phase code driven by a Val-level pattern matcher — and
that matcher **already exists**: the runtime `syntax-rules` machinery
(`srval-match`/`srval-expand`, `eval.coil:1495-1978`) operates on tagged Vals
with a rename/alias hygiene environment. Extract it into a module both
`eval.coil` and `phase.coil` import. Fenders and full mark-based hygiene are
v2; v1.5 pins the branch's three cases (`10-procedural-syntax.scm`,
`10a-syntax-case-match.scm`, `10b-procedural-internal-defs.scm`).

Hygiene v1 is honest, not fake: transformer-introduced identifiers get
gensym renaming (the dialect's existing registration-time discipline), and
`datum->syntax` is the deliberate capture escape hatch — the same practical
model the compile-time `syntax-rules` path uses today. Mark-carrying syntax
objects (the `mark` field is already in the branch layout) are the v2 road to
full syntax-case hygiene.

## Layer 4 — gates, memory, oracle

- **`scripts/compiler/oracle/gate-staged-meta.sh`**: the six generic fixture
  families; a `coil run` agreement check (a phase program's entry invoked via
  `coil run phase.coil input` behaves identically to its staged invocation —
  the in-process and inter-process staging stories must not drift); all under
  native / `COIL_META_INTERP=1` / `COIL_META_ARENA=poison`.
- **Memory fixtures**: `COIL_MTRACE=mem` attribution per stage; a plateau
  assertion in the spirit of the branch's measurement (compiler live memory
  must not grow per stage once increments release their generation arenas);
  the poison fixture for stale syntax objects in phase statics.
- **Scheme cases**: reconstruct `10`/`10a`/`10b` + dialect deftests
  (`dialect_test.coil` pattern — remember `assert-eq` is neutralized inside
  the dialect; use `check`/`check-host`). **Oracle caveat**: `syntax-case` is
  not R5RS and Chibi doesn't speak it, so the three-way voting harness cannot
  bless these — they are in-tree blessed expectations, stated as such. Only
  cases all three oracles accept go through `tests/scheme/run.py`.
- **Linux discipline**: never `refresh` the four macOS IR oracle dumps from
  Linux; CI is macOS-only, so run the Linux rebootstrap
  (`rebootstrap-linux.sh` + STAGE0) before calling any milestone done.

## Milestones

Each lands green on its own; later ones never block earlier ones.

- **M1** — `code-opaque`/`code-from-opaque` ops; `StageTable` + recognizers;
  single-stage `generated_stage` fixture end-to-end (declare → compile →
  install → request → splice).
- **M2** — cumulative + multiround + duplicate-error + cross-module +
  resume fixtures; the fixpoint-cap change; parity + poison + mtrace gates;
  `gate-staged-meta.sh`.
- **M3** — `coil.scheme.phase` + `coil.scheme.syntax` on main; bridge
  round-trip tests (branch `scheme_syntax_object*.coil` fixtures as models);
  the arena-audit fixtures.
- **M4** — dialect procedural `define-syntax` v1 (datum-level transformers,
  internal defines, cumulative transformers); cases `10`/`10b`.
- **M5** — `syntax-case`/`#'`/`with-syntax` over the extracted `srval`
  matcher; case `10a`.
- **M6** — docs: METAPROGRAMS.md "Staged metaprograms" section (the worked
  example modeled on the branch's `docs/sprout-staging.md`, as
  RUN_METAPROGRAMS.md already prescribes), DECISIONS.md entry, R5RS_STATUS
  update.

## Known traps (all previously paid for)

- `check-program` resets the S0–S3 maps; any staging during a live invocation
  must be `SemMapsSnap`-bracketed (`comptime.coil:1789`). Layer 1's
  compile-at-declaration happens *between* invocations, but request handling
  that triggers lazy staging mid-run inherits the existing bracket.
- Source ids come from the `srccount` counter, never the sources-array length
  — wrong ids silently empty every span-keyed side table.
- Input/generated forms need real source registration before expansion or
  `code-file`-keyed markers (the `.scm` marker) silently fail
  (`code-preregister-inputs!` precedent, `driver.coil:4953`).
- `MEEntry` quote registries are per-build; cumulative installs create
  several registries — already supported, but tests must cover a request
  whose entry quotes syntax from an *earlier* increment.
- Freezing/views sharp edge: pushing to a builder after `code-list-done` can
  invalidate views; bounded per-expansion by the arena, loud under poison.
- Two-step stdlib build for new ops; per-push compiled-engine overhead
  ~240 B (size fixtures accordingly).
- Lint warnings print to stderr; don't write vacuous `2>/dev/null` greps in
  gates.

## Decisions needed (D1–D5)

1. **D1 — redefinition across stages**: hard error (recommended) vs
  last-wins shadowing. Recommendation: error; revisit only with a real use
  case in hand.
2. **D2 — bounding**: share the raised 64-round before-expand cap
  (recommended, matches the tower and keeps one number) vs a separate stage
  cap.
3. **D3 — v1 emitters**: before-expand transforms only (recommended) vs
  also letting ordinary macro output carry stage forms.
4. **D4 — cross-phase sharing surface**: none in v1 (recommended), with
  `define-for-syntax`/`begin-for-syntax` as the explicit v2 surface vs
  implicit availability of prior runtime defines.
5. **D5 — hygiene ladder**: v1 gensym-renaming + `datum->syntax` escape
  hatch, v2 mark-carrying syntax objects (recommended) vs blocking v1 on full
  marks.

## Landing on main: what the merge changed, and one thing it did not fix

This work was written before `4d58e5d Full syntax hygiene: scope-bearing syntax
objects` and merged after it. Three things had to change to make it work on the
hygiene model, and one known gap survives.

### A `(stage MARKER FORM…)` body is source, not a template

Referential hygiene resolves a symbol in transform output against the
*transform's* module. That is right for guest syntax and wrong for a stage body,
which is a separate compilation unit with its own imports whose entry names are a
protocol that request sites name by string. Both directions broke:
`(defn pick-entry …)` was registered as
`staged_pick_test.$scope47@staged_pick$pick-entry`, so it matched no request and
the stage looked like it declared no entry at all
("stage: expected a declared [Code …] -> Code entry"); and a call to one of the
stage's own imports (`syntax-object-from-code`, from `coil.scheme.phase`)
resolved against the transform module, which never imported it, and failed as
undefined. `split-stage-declarations!` now strips context over the stage body
(`stage-datum-sexp` in `expander.coil`) — the same state `syntax->datum` gives one
identifier, which is what unscoped-datum linkage checking accepts.

### Scheme's `datum->syntax` has to carry real context

`datum-code` built identifiers with `primitive/code-symbol` and carried a `proto`
it never used, with a note saying the context-carrying constructor "is not on main
yet". It is: `primitive/datum->syntax` (op 67). Until that was wired, every
identifier a procedural transformer produced reached the guest unscoped and the
linkage check rejected it — "unscoped generated identifier 't'".

### The gate did not run, twice over

`gate-staged-meta.sh` used a bare `"${env[@]}"` under `set -u`, which is an
unbound-variable error for an EMPTY array in bash 3.2 — the bash macOS ships. The
gate died on its first mode before testing anything. It was also referenced from
nowhere: not `dev.py`, not CI. It is now `dev.py test meta-entries` (alongside
`gate-run-meta.sh`, which had the same problem) and a step in the `full` CI job.

`rebootstrap-linux.sh` was *not* given the battery back. The branch proposed
restoring the whole Linux gate battery there; `58b6e68` had removed it on
purpose, and that decision stands — both bootstraps prove the fixpoint and
nothing else. The two metaprogram gates run against the already-built compiler in
CI instead.

### Known gap: a template binder loses to a same-named guest global

A procedural template that introduces a binder is not fully hygienic against a
guest top-level of the same name. Minimal repro:

```scheme
(define-syntax f
  (lambda (form)
    (syntax-case form ()
      ((_ e) #'(let ((t e)) (if t t 99))))))
(define t 'outer)
(display (f 5))     ; prints outer; should print 5
```

Remove the `(define t 'outer)` and it prints 99 correctly, so the binding itself
works; it is specifically a guest global of the same name that wins. The
`syntax-rules` path does not have this bug — the same shape through
`(define-syntax f (syntax-rules () ((_ e) (let ((t e)) …))))` prints 5 — so it is
the procedural `#'` template path, where every template identifier takes the
USE-SITE form as its `datum->syntax` prototype and therefore shares identity with
guest names. `tests/scheme/dialect/proc_syntax_ellipsis.scm` does not catch it:
its `my-or2` case reaches the right answer through the recursive clause either
way. This is D5's v2 (mark-carrying syntax objects), not a merge regression.

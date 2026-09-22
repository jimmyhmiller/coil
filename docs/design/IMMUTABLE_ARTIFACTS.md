# Immutable artifacts and persistent revisions

Status: **Phase 0 done; the semantic side tables, sealed-closure artifacts, whole-snapshot
protection, compiler states as values and the stale set have landed (2026-09-20, released).
The flat accumulated `Program` is the remaining structural work.** Architecture revised
2026-09-19 (see "The goal").
Written 2026-09-19 against
`feature/live-whole-program` at `d88428e`. It continues the path sketched in
live-poc-coil's `docs/INCREMENTAL_COMPILER_BOUNDARIES.md` ("Revision storage")
and `docs/COMPILER_RETENTION.md`, and supersedes the "not yet a persistent
query database" caveats in `docs/reference/STATEFUL_JIT.md`.

Line numbers below refer to that commit.

## The goal

Mechanism in the compiler, policy outside it.

The compiler should not know that hot code loading exists. It should expose
low-level operations over data structures that make hot code loading — or a
REPL, a language server, a notebook, a test runner that reuses checked code —
something a library or metaprogram can build, without the compiler's help and
without copying the compiler's state to do it.

That is not where things are today. `coil.jit` (`jit_api.coil`) is a thin facade;
the hot-reload policy itself is inside the compiler: 64 `repl-session-*`,
`compiler-revision-*`, `compiler-joint-*` and `compiler-retain-*` functions in
`driver.coil`, 15 `code-session-*` functions in `comptime.coil`, and the parser
itself recognises `:jit/retain` and `:jit/root`. Prepare, publish, finalize,
abort, what is retained across edits, what retires, when native generations are
reclaimed — all compiler internals.

**It is in there because the data is mutable.** Nobody outside the compiler can
safely hold two versions of a mutable pointer graph that lives in a scratch arena;
only the compiler has the generated visitor that knows how to copy it. So the
copying and the baked-in policy are one problem, not two. Make the data immutable
and both go: holding an old version is holding a value, and what to do with it is
the holder's business.

An earlier draft of this document got this wrong: it made the data immutable but
kept `Revision`, `Txn`, publish/abort, retirement and dependency queries as
compiler concepts. They are policy. They are described below as what a client
builds, not as compiler layers.

## The problem, stated by its mechanism

A retained JIT session keeps an *accepted* compiler state and runs every
submission as a *candidate* against it. Accepted state today is an ordinary
mutable pointer graph: `ArrayList`s, `HashMap`s whose values are positions in
those lists, side maps keyed by a global node id, and fifteen rebindable
unit-state cells. It lives in whichever arena built it.

Two facts about that graph force two whole-program copies per edit:

1. **The candidate must extend containers the parent owns.** `push!` on a parent
   list would write into the parent (snapshot lists are packed `cap = len`, so it
   would also realloc inside the parent's arena). So *prepare* copies the parent
   into fresh candidate containers.
2. **The candidate arena holds scratch and results together.** It must be freed,
   and the parent snapshot it borrows from must be freed too. So *publish*
   relocates everything that survives into a new packed snapshot.

Both are proportional to the session, not the edit, and the first one is paid by
rejected candidates too.

### Copy sites, ranked (static reading; estimates, not measurements)

| # | Site | When | What moves |
|---|---|---|---|
| 1 | `compiler-revision-publish-snapshot!` + `graph-finish!` (`driver.coil:21252`, `retained_graph.coil:209`) | every accept | two full typed traversals, weak-table pruning, relocation of all retained metadata, one `fix` per node |
| 2 | `sem-maps-inherit!` (`comptime.coil:2952`) | every candidate, plus twice in retain-meta | every live type/binding/resolution entry re-inserted one at a time |
| 3 | `compiler-revision-retain-meta!` (`driver.coil:20977`) | every accept | boxes `LS`/`Program`/`Cx`/workspace, unions 10 definition lists, rebuilds `sigs`/`sigidx`, merges declaration tables |
| 4 | `compiler-revision-prune-joint!` (`driver.coil:22113`) | every accept | per-round `Program` copies + type-reference walk, then rebuilds funcs, sigs, structs, sums, impls and all three impl indexes |
| 5 | front-end inheritance: `monomorphize-reusing` replay (`mono.coil:2777-2810`), `semantic-inherit-program!` (`resolve.coil:5720`), `semantic-inherit-resolution!` (`5075`, copies every string), `semantic-inherit-declarations!` (`5457`), `check-inherit-signatures!` (`check.coil:15890`) | every candidate | every parent declaration, by value |
| 6 | `ls-inherit!` (`loader.coil:730`), `MEEntry` copy (`driver.coil:19116`) | every candidate | 12 list headers, imports/exports one level deeper |
| 7 | `code-session-stage-monomorphs!` + `sexp-own-into` (`comptime.coil:3815`, `1054`) | every accept | whole monomorph report rebuilt as `Sexp` and deep-copied; accepted `Code` re-scanned as graph roots |
| 8 | native symbol copies (`driver.coil:18995`, `jit_llvm.coil:220`) | every generation | every `JitSym` and its name |

Only source payloads (`retained_source.coil`) and checked function bodies
(`retained_heap.coil`) are shared between revisions today. Those two are the
pattern; this plan generalises them until the snapshot graph is empty and sites
1–7 are deleted rather than optimised.

### Baseline (measured 2026-09-19, `d88428e`, arm64 macOS)

`scripts/tests/jit-session-memory.py` passes on a candidate built from this commit.
Its `replace` scenario — resubmitting the identical one-line `(defn value [] (-> i64) 42)`
into a session holding nothing but core and the prelude — reports a steady
**8,047,232 retained bytes relocated on every accept**, against 2,901,874 bytes
of shared body storage.

`COIL_TRACE=1` spans for the same workload, steady-state median per edit:

| Span | ms |
|---|---|
| `jit.publish.snapshot` (total) | 83 |
| — `jit.snapshot.mark` | 28 |
| — `jit.snapshot.rescan` | 28 |
| — `jit.snapshot.copy` | 24 |
| `jit.publish.retain` | 17 |
| `jit.prepare` | 7 |
| expansion, resolve, check, codegen, link combined | ≈ 5 |

So roughly 100 ms of a 110 ms edit is retention and relocation, in the smallest
session there can be, and that part grows with the session. The numbers this
plan has to move are the first four rows.

### Progress against the baseline

Same workload and machine as the baseline; steady-state median per edit.

| Step | relocated per edit | `publish.snapshot` | `publish.retain` | `prepare` |
|---|---|---|---|---|
| baseline | 8,047,232 B | 83 ms | 17 ms | 7 ms |
| application side tables as a persistent `SemBase` (`sem_base.coil`) | 3,303,720 B | 55 ms | 17 ms | 6 ms |
| sealed bodies held as artifacts, not walked into (`retained_heap.coil` `Artifact`) | 3,303,720 B | 28 ms | 17 ms | 6 ms |
| declaration closures sealed; unchanged runs of records held as **chunk artifacts**; each pass does only its own work | 1,872,632 B | 19 ms | 17 ms | 5 ms |
| one sealed block per publication; the native program no longer re-made per edit | 1,895,148 B | **8 ms** | 13 ms | 5 ms |

With plain definitions (no `coil.repl` Var policy, so nothing is ever a retirement
candidate) `publish.retain` is 2 ms, not 17: joint liveness analysis now returns at
once when its candidate set is empty. Under the Var policy every redefinition
declares a `:jit/retain false` implementation, so the analysis still reads every
program to a fixed point; making that proportional needs recorded references
(`deps`), not a better scan.

A sealed body is now an `Artifact`: it owns its blocks and remembers the node,
source, context and scope ids found in it, recorded once from the sealed copy. A
later graph that meets its root holds the artifact and marks those ids instead of
descending, which took the mark and rescan passes from 20 ms to 6 ms each. What is
left of the snapshot is mostly `snapshot.copy` (15 ms): the declaration records and
the flat containers over them, which the accumulated flat `Program` forces every
edit to rebuild and relocate.

**The flat program, without rewriting its 750 consumers.** The accumulated `Program`
is flat arrays that every edit rebuilds, so every accepted record used to be visited
again on every publication. The walker is cheap per record (~0.2 µs); the cost was the
count. Now every accepted declaration's closure is sealed, and an array of declaration
records is walked in runs of 64: a run whose records are spelled, field by field,
exactly like a run sealed before is held as one **chunk artifact** and skipped whole
(`SEALED_RECORDS` in the generator; `graph-chunk-held?` / `graph-record-chunk!`). The
spelling is generated per type and contains addresses, never padding, so equal
spelling means equal pointers, all of which lead into storage the chunk holds. Per
edit about 17,500 records are held in ~330 chunks and ~26 runs are re-recorded — the
tails of the arrays the edit touched. Chunks are reference counted like everything
else, so the body-storage plateaus stay exact.

Two things measured and rejected, recorded so they are not retried blind: chunking the
slots of the name → position tables (their values are list positions, so one removal
renumbers every later entry and hashing scatters those across the table: 177 chunks
re-recorded per edit), and chunking runs shorter than 8 (a submitted form is hundreds
of tiny nested lists). The tables did get **borrowed keys** — each key is the name held
by the record it indexes — which removed an allocation per function per rebuild.

Each pass now does only what it is for: the first answers "what is live" and records no
ranges, visits or chunk notes; the second lays the pruned graph out and marks no ids
(`graph-liveness-only!`, `graph-layout-only!`). Mark 7 → 3 ms, rescan 7 → 5 ms.

**A profile, not a guess, found the next one.** `sample` on a 400-edit loop showed
`graph-range!`, `graph-address` and the page-index lookups at ~15% of all time: every
sealed range was its own block — tens of thousands, some forty to a 4 KB page — and
"which block holds this address" walks a page's chain, for every range, visit and
pointer fixed. Everything a publication seals now goes into **one block**, laid out
like the snapshot beside it (`allocate-packed-block!`). Blocks: ~28,000 → 4. Snapshot
17 → 8 ms, and `retain` 18 → 13 because the same lookups ran under it. Protection now
costs a mapping per publication, not per range, so `jit-session-memory.py` passes with
`COIL_JIT_PROTECT=1` as well.

Packing has a price, and the memory gate caught it: one long-lived function pins the
whole block it was sealed in, so anything *transient* sealed beside it is retained
with it. Two things were being re-made and re-sealed on every edit, and both were
real waste independent of packing:

- `monomorphize-reusing` re-created the native program wholesale: a newly allocated
  empty body list for every carried-over function, and every concrete struct and sum
  re-specialised into fresh field lists that overwrote identical definitions. It now
  reuses the empty body a declaration already has and keeps a prior definition when
  the re-specialised one says nothing new (`mono-struct-already?`,
  `mono-sum-already?`). Records sealed per edit: 831 → 22.
- `semantic-inherit-resolution!` copies every resolution entry's strings into fresh
  storage for every candidate, so a run of them is never spelled the same twice. Those
  two record kinds are left unsealed until inheriting stops copying them.

With both, sealed storage grows 1.2 KB per added function (19.5 KB before the fixes),
and the plateaus are exact again — from the third submission rather than the first,
since a block goes when both the next state and the facade one behind it let go.

What is left of the 8 ms: mark 2, rescan 1, copy 2, recording new artifacts ~2, pruning
~1. The two-pass shape itself is next: the first pass exists only so weak tables can be
pruned before layout.

The first step moves the *application's* type, binding and resolution entries out
of the snapshot: a finished compilation's entries are promoted into a base derived
from the one it read through (`compiler-revision-promote-maps!`), the snapshot
carries empty maps and a pointer, and the next compilation reads through instead of
calling `sem-maps-inherit!` over everything. Peak RSS in the `accepted` scenario
fell from 391 MB to 259 MB. Still listed, and so still walked, relocated and
re-inherited every edit: the meta environment's entries, which after each accept
are the previous facade's (`compiler-revision-retain-meta!` installs the facade as
the next `meta_environment`). Pruning still iterates the base against the
snapshot's `live-nids`; that scan goes when the walk does.

### The small probe hid the scaling; a 2,000-definition probe shows it (2026-09-20)

The baseline workload accumulates almost nothing of its own: the accepted program is
the prelude plus `coil.repl`, about 800 functions. Per edit it now costs ~19.5 ms end
to end (25 ms at the start of the day), from three changes a profile pointed at:

- **The liveness closure asked its two questions by scanning.** "Is this callee a
  program function" scanned the name list per call site, and "which function is it"
  scanned the function list per reached function. `FnNames` (`comptime.coil`) carries a
  hash index with each first-function position. Retain 13 → 10 ms.
- **The joint fixpoint ran a confirming round on every edit.** A round whose only
  change came from its first step has already run every later step against the final
  state, and that step's closure is transitive, so the second round can only repeat
  the first. Under the Var policy something is rescued on every edit. Retain 10 → 6 ms.
- **Map keys were hashed a byte at a time** (FNV-1a over forty-byte qualified names).
  `str-hash` keeps FNV because its values are written down (cache directory names,
  replay seeds); `str-key-hash` is never stored and now takes eight bytes a step. The
  profile share barely moved, which says the cost is the cache miss on the key, not the
  arithmetic: the real fix is fewer rebuilt maps, not a faster hash.

Then the probe that should have existed from the start: **2,000 accepted user
functions, edit one** (`replace-big`). Per edit, before any of today's constant work:
prepare 38 ms, native 28 (link 21), retain 21, **snapshot 99** — about 190 ms, so
publication still scales with the program. A census of one edit there: 170k records
walked, 66k of them `Expr` under `Const`. Under the Var policy a retained definition
*is* a constant whose value is an expression tree, and nothing treated constants the
way functions are treated:

- `setup-consts` re-checked **every** constant on every edit and replaced each
  runtime constant's value with the newly elaborated tree, so no two states shared a
  constant and the checker did O(program) typing per edit. Its lookup `const-find`
  was a scan, which made that setup quadratic. Now: `Cx.constidx`, and a constant
  handed back unchanged (same value node id, `ConstEntry.source_nid`) keeps the
  parent's checked entry, exactly as an accepted function keeps its body.
- `mono-consts` resolved every runtime constant again into new storage; it now keeps
  the prior native record when the checked node is the same.
- Since an accepted constant is no longer re-checked, it has to be findable when what
  it reads changes: constants are recorded as readers in the `DepBase` and reported
  in the stale set (`jit_env_stale.coil` covers it).
- `Const` and `ConstEntry` are sealed records (chunk kinds 15, 16).

With those: prepare 44 → 29 ms. What still re-spelled every constant on every edit
turned out to be **mono**: `mono-ownership-context` built a whole new checker context
per edit with no accepted state to read from, so it typed all 2,002 constants a second
time and — because setting up replaces a runtime constant's value in place — rewrote
the *checked* program's records while doing it. It is now handed the state the program
was checked on (`monomorphize-reusing … accepted`). `check.constants-accepted` under
`COIL_TRACE` shows every pass accepting all of them. Snapshot 59 → 35 ms.

The rest of that probe's cost, in the order it was removed:

- **Linking (22 ms → <1).** For every undefined symbol the loader asked `dlsym` first
  and only then the session's own definitions, and resolved those through a flat list
  rebuilt from every live image per load. The session now keeps a hashed
  `JitNamespace` (`jit.coil`), consulted before the process, extended when an image is
  added and dropped when one is freed (it borrows the images' names).
- **`merge-consts` / `merge-externs`** scanned the growing output per entry; `Out`
  indexes both by name.
- **The name → position tables** (`checked_functions`, `sigidx`, `constidx`) were 22k
  of the 43k records a publication touched. They borrow their keys from the records
  they index, so nothing is found by walking them: their slot arrays are now entered
  as one node and the keys re-pointed on copy (`graph-name-index!`,
  `BORROWED_NAME_INDEXES` in the generator). **They are not persistent maps, and
  cannot usefully be:** their values are positions in lists that are rebuilt with the
  submission first, so every inherited position moves on every edit and a persistent
  map would share nothing. Sharing them needs a stable value — name → declaration —
  which is the declaration-index step below, not a change of container.
- The snapshot graph's visited-table hash used an address's low bits, which alignment
  zeroes; it now mixes and folds.

| `replace-big` (2,000 accepted definitions) | before | now |
|---|---|---|
| prepare | 38 ms | 17 ms |
| native (codegen + link) | 28 ms | 7 ms |
| retain | 21 ms | 19 ms |
| snapshot | 99 ms | 29 ms |
| **per edit** | **~190 ms** | **~72 ms** |

The small probe: 25 → ~17 ms per edit, snapshot 7 ms.

**What is still O(program) per edit**, measured on that probe, largest first: `retain`
(19 ms — the joint liveness closure and type-reference walk over every program, then
list rebuilds by the prune passes), `prepare` (17 ms — `setup-sigs` for every function,
the resolver's merges, stage-3 rounds over the whole definition table), the snapshot's
remaining walk (8k `Sexp`, of which 34 chunks are re-recorded per edit, and 4.5k
resolver entries whose strings `semantic-inherit-resolution!` copies per candidate),
and codegen's `g-register-sigs!` over every signature. Each wants the treatment the
constants got: recognize what the accepted state already established and take it,
rather than recompute it. The structural end state is unchanged — declarations in
persistent indexes keyed by name, read through by every phase — and is the only thing
that makes the name tables above shareable.

### Accepted state is immutable, and now that is checked

`COIL_JIT_PROTECT=1` covers the whole published snapshot, not only sealed bodies:
the snapshot is allocated from a page-backed allocator (`PageAllocator` in
`retained_heap.coil`) and sealed read-only at the end of publication. All 31
`jit-static-session.py` fixtures, plus `jit-source-graph`, `jit-single-form` and
`codegen-session`, pass with it on. So nothing those exercise writes into accepted
metadata after it is published: the in-place writers the mutation audit listed
(check setup, `build-param-env`, `TaggedForm` repair, slot recycling) all land on a
candidate's own copies. That is the property an `Env` value needs — a compile that
cannot disturb the state it was given — and it is now a gate rather than a reading
of the code. (`jit-session-memory.py` is not run protected: a page per block is
what its RSS ceiling exists to catch.)

### Compiler states as values: the first piece of the API

`coil.jit` now has `JitEnv` (`jit_api.coil`; `repl-session-env-*` in `driver.coil`):

```
(jit-env-empty)                      ; the state with nothing in it
(jit-env-check session base source)  ; -> a new state, or an invalid one + jit-diagnostic
(jit-env-current session)            ; a hold on the state the session itself serves
(jit-env-retain session env) (jit-env-release! session env)
(jit-env-defines? session env name) (jit-env-live-function allocator session env name)
```

`jit-env-check` builds on *any* held state and writes neither it nor the state the
session serves, so several are alive at once. `jit_env_values.coil` holds a base and
two different edits of it, checks that a failing edit changes nothing, chains twelve
more, and releases everything in an unrelated order — with the whole accepted state
sealed read-only. A `CompilerRevision` is now reference counted
(`compiler-revision-retain!`/`-release!`); "current" is just the hold the session
keeps. This is the live checker's entire need from the compiler.

Deliberately not there yet, each a hard error rather than a silent gap:
checked-only sessions only (a state that owns native code cannot be branched —
symbol resolution is per session); source that stages session Code state is
refused (that state is one per session, not one per value); a failed check returns
no state, where the design wants the state *with* the failure recorded in it.
Underneath, a check still pays the snapshot: what changed is who may hold the
result, not yet what it costs to make.

### The stale set

Measured 2026-09-20: checking `(defn area [(w i64)] …)` against a state where
`area` takes two arguments and `unit` calls `(area 1 1)` succeeds, and the result
still contains the now-ill-typed `unit`. Accepted bodies are passed through
unchecked (`ls-accepted-function?`), and nothing records what they read. The live
POC compensates outside the compiler by rescanning syntax for names.

The compiler's part is to *report*, not to act:

1. **A dependency index per state**, persistent like `SemBase`: for each accepted
   function, the functions it calls and the nominal types it mentions, recorded once
   when it is accepted (`collect-calls`, `type_references`), held in both directions
   so replacing a definition removes its old edges in O(its edges).
2. **`jit-env-check` reports the stale set**: accepted definitions, not redefined by
   this check, that read a definition whose *interface* this check changed — a
   function whose signature differs from the base's, a struct or sum whose shape
   differs. A body-only edit changes no interface and stales nothing.
3. The client re-checks what it chooses by submitting that definition's source
   again (`jit-env-definition-source`); the compiler does not decide when.

**Landed.** `dep_index.coil` holds the edges as a persistent `DepBase`, owned by the
revision like `SemBase`. `compiler-revision-promote-deps!` records what each of a
compilation's new functions reads (`type-refs/func!`), drops the edges of whatever
it retired, compares each redefined function, struct and sum with the base's, and
stores the readers of what changed. `jit-env-stale-count` / `jit-env-stale-name`
report them and `jit-env-definition-source` returns a definition's own text to check
again. `jit_env_stale.coil`: a body edit stales nothing; narrowing `area` reports
exactly `unit` and `box-area`, not their callers; re-checking `unit` then fails for
the right reason; repairing both leaves nothing stale; a function that stopped
reading `area` is left alone when it changes again; reshaping `Box` stales only what
mentions `Box`. Bounded functions are conservatively always "changed" when redefined.

Building it exposed a **bug in retained sessions that predates this work**: a
function redefined with a different signature kept its *old* signature, so callers
with the old arity were accepted and callers with the new one refused.
`check-inherit-signatures!` gave every same-named signature the parent's, including
for names the candidate redefines; it now does so only for functions the candidate
inherited. Regression: `jit_redefined_signature.coil`; filed in `coil-bugs`.

**The client exists.** `tests/compiler/features/jit_live_checker.coil` is a live
checker written only against `coil.jit`: submit an edit, adopt the new state,
re-check what it reports stale (and what those re-checks stale in turn), keep a list
of what is broken. An edit that does not check leaves the state alone; narrowing
`area` re-checks its two readers and marks both broken without touching their
callers; restoring the signature repairs one and breaks the other. Every decision in
that sentence is the client's. It also gives the clearest measurement so far: with
`COIL_TRACE=1` a check that *fails* — so publishes nothing — takes **3–4 ms**, and one
that succeeds takes **~30 ms**. The compile is already fast; what is left is
publication.

Not covered by this first cut, and reported as such rather than guessed at: macro
bodies (a changed macro stales everything it expanded, which needs expansion reads
recorded), constants that mention constants, impl availability, and negative
lookups (a new definition that changes what an old name resolves to).

### Release verification (2026-09-20)

`python3 scripts/dev.py build full` passes — stage1, stage2, LLVM fixed point on
independently emitted stage2/stage3 objects — and the result is installed globally.
It needed an explicit `STAGE0`: the committed seed (2026-09-07) cannot parse the
`(const Name Keyword)` value parameters the parent branch added, which the
bootstrap reports as "native stage0 unavailable or stale". The seeds want refreshing
on whichever branch lands first (`scripts/compiler/refresh-seed.sh`, after the source
commit; the Linux pair needs a Linux host).

Gates on the installed compiler: `modernize-fast`, `cli` (**green** — its one
standing failure is fixed, see below), `generated`, `runtime` 80/0, `snapshots`,
`metaprogramming`, `interpreter`, and `meta`'s engine comparison. Still red, and not
from this work: `meta`'s interpreted-runtime half, which times out building
`simd.coil` under `COIL_META_INTERP=1`.

Two compiler bugs that predate this branch were fixed because they stood in its way:
a redefined function kept its old signature (`check-inherit-signatures!`), and no
deriver or reflection op accepted a type spelled through an import alias
(`(derive Serialize s/Shape)` — the comptime context knew only the metaprogram's own
imports). Both are in `coil-bugs` and need porting if this branch does not land first.

### What is still walked, and the next two slices

After the `SemBase` step a census of one edit shows 72,088 records walked (171k
before), with no side-table records among them. The rest, by share: `Expr` 20%,
name strings 10%, `Type` 8%, `ArrayList Expr` 7%, `(slice u8) → i64` index entries
6% (`sigidx`, `checked_functions`, …), `Param`, `Sexp`, `Func`, `Extern`, `Sig`.

*(Slice 1 below has landed — see "Progress against the baseline". Slice 2 is what remains.)*

1. **Stop walking into frozen bodies** (≈35% of records: `Expr`, its lists, `Bind`,
   `Quasi`, body `Type`s). They are no longer copied, but the walker still descends
   every accepted body on every edit, for two reasons: to list the blocks the new
   snapshot must own, and to mark node ids live for pruning. Make a frozen body an
   artifact that owns its blocks and records its node ids once, when it is frozen.
   The snapshot then owns artifacts (one count per function, not one per block),
   and a body's entries leave the `SemBase` when its artifact dies rather than by
   failing a liveness scan. This needs the same treatment for retained syntax
   (`TaggedForm` trees), because a liveness scan that no longer sees body ids can no
   longer be the rule for anything.
2. **Declarations in persistent indexes** (`Func` headers, `Sig`, `Extern`,
   `StructDef`, `ImplDef`, their `Param`/`Type`/name storage, and the position
   indexes over them — most of the remainder, and all of `publish.retain`'s 17 ms,
   which is list unions and index rebuilds). This is Phase 2/3 proper: `Cx.sigs` and
   the `Program` sections stop being lists addressed by position.

   Scoped 2026-09-20: even the smallest container, `externs`, has ~45 consumers on
   the session path and most *iterate the whole list* with their own meaning
   (resolve's merge and definition-name tables, mono's aliasing, metalower, the
   comptime closure, the driver's root names). So this is not a per-container patch.
   It is Phase 1 as planned: one read interface (`env-*`: look up by name, enumerate)
   that every phase goes through, introduced mechanically with the gates as the
   contract, *then* a persistent representation behind it. The pattern to copy is
   `SemBase`: a pass records into its own mutable containers and reads through to a
   persistent base on a miss; a finished compile promotes only what it added. What
   that buys is measured: a check that publishes nothing costs 3–4 ms today.

## What the audit says is actually mutated

The whole compiler does not need to become functional. The mutation audit sorts
structures into three groups:

- **Already fresh-output.** `check-func` builds a new `Func`; mono builds new
  nodes; `Type` is never mutated in place; `raw_prog`/`raw_form` are pristine
  clones. Cross-declaration references are already *by qualified name*, not by
  pointer — there is no interner and no declaration pointer in an `Expr`.
- **Destructive, but only on its own scratch.** `qualify-*` rewrites `ep.kind`
  in place (`resolve.coil:2591` and ~1,200 lines of siblings), and ownership
  elaboration rewrites the freshly checked body (`check.coil:14425`…`15495`).
  Both operate on a clone or a fresh tree. They can stay destructive forever;
  they just need a seal after them.
- **Writes that reach accepted or shared data.** These are the real defects and
  the full list is short:
  - check setup pushes `inline` into the caller's `annotation_defs`
    (`check.coil:3330`), pushes trait annotations into impl method lists (`2305`),
    and overwrites a runtime `Const`'s `value`/`ty` (`3004`);
  - `build-param-env` writes `bid`/`owned_type` onto the *input* `Param`s (`3410`);
  - `fold-program` walks inherited bodies (`comptime.coil:7436`), and
    `cte-wrap-divisor!` edits a live shared body and restores it
    (`comptime_eval.coil:204-229`);
  - `semantic-freshen-nids!` rewrites `nid` through `Sexp` trees that alias
    macro arguments (`resolve.coil:186`, `expander.coil:741-753`);
  - `TaggedForm` `form_id`/`revision`/`cached_shape` repair, and
    `ResolvedRevision` `qualified`/`strict`/`prog` replacement
    (`resolve.coil:5137-5145`);
  - loader `sources`/`expansions` overwrite recycled slots (`loader.coil:802`, `863`).

Two structural habits also have to go, because they make sharing unsafe even
where nobody writes:

- **Index values are list positions.** `Cx.sigidx`, the three impl indexes, and
  `checked_functions` map a key to an offset in a growable list. Removing or
  replacing one entry means rebuilding the list and every index over it, which is
  most of copy sites 3 and 4.
- **Identity is an address.** `ls-accepted-function?` (`loader.coil:763`),
  `parent-trait?`/`parent-impl?` (`resolve.coil:5613`), and `frozen-roots`
  recognise accepted data by `.body` / `.methods` pointer equality. That works
  only because those pointers are never relocated, and it is why bodies had to be
  frozen first.

## Architecture

Three things in the compiler, all mechanism: sealed immutable storage, identity
that is not an address, and an immutable `Env` value with a small API over it.
Everything about versions, sessions and retention is a client.

```
  client (a library, a metaprogram, coil.jit, a language server …)      POLICY
    holds Env values · decides what to keep, swap, forget, reclaim
  ─────────────────────────────────────────────────────────────────────────────
  compiler API                                                          MECHANISM
    compile : (ref Env) × forms  →  Ok (Env′, outputs) | Err diagnostics
    read    : look up / enumerate declarations, signatures, checked bodies
    without : (ref Env) × DefId  →  Env′
    emit    : (ref Env) × roots  →  image + the DefIds it contains
                  │
                  │  inside one compile call only: scratch arena + overlay,
                  │  then seal — none of it visible to the caller
                  ▼
  Env = persistent indexes (DefId → sealed artifact), Clone O(1), Drop releases
                  ▼
  artifact heap: refcounted, nonmoving, sealed blocks (generalised retained_heap)
```

### Layer 0 — the artifact heap

Generalise `retained_heap.coil`. An **artifact** is one sealed block holding a
closed pointer graph plus a small header:

```
(defstruct Artifact                ; sketch
  [(references i64) (stage i64) (def DefId) (fingerprint Fingerprint)
   (block (ptr heap/Block)) (root (ptr u8))
   (owns (slice (ptr Artifact)))   ; sub-artifacts it points into (a DAG)
   (deps (slice Dep))])            ; what it *read*; see Layer 3
```

**Sealing** is a copy of one artifact's closure out of the call's scratch into a
right-sized block, with interior pointers fixed up. The generated typed visitor
(`scripts/compiler/gen-retained-snapshot.py`) already does exactly this for the
whole graph and for frozen bodies; it becomes "seal this root" instead of
"relocate the world". The copy is proportional to the artifact, i.e. to the edit,
and it compacts: scratch garbage never enters the heap. (Building directly into
a leased region would avoid the copy but retain every intermediate allocation —
the same leak as keeping the candidate arena.)

The generator's existing closure check ("a frozen closure never reaches loader,
check, resolve, metaengine or interp types", script lines 236-250) becomes a
per-stage schema: each artifact stage declares which types its closure may
contain, and generation fails on anything else.

### Layer 1 — identity

Nothing durable is identified by an address.

- **`DefId`**: an interned `(kind, qualified name)` — for impls,
  `(trait, self-type key, associated-type selection key)` using the checker's real
  substitution (`impl-associated-bindings`), as `COMPILER_RETENTION.md` requires.
  The interner is a session-lifetime append-only table. Names are already the
  compiler's cross-reference currency, so this adds an integer, not a concept.
- **`Fingerprint`**: a hash of the artifact's pointer-free canonical form.
  `digest.coil` (SHA-256) and `artifact_wire.coil` (pointer-free encoding of
  `Sexp`) exist. Equal fingerprint ⇒ equivalent result ⇒ propagation stops.
- **Mono instances** keep their existing structural key (`name__typekey…`,
  `mono.coil:346`) with `MonoOrigin` as provenance.
- **Node ids stay global; the side tables become persistent maps.** `Expr.nid` /
  `Sexp.nid` is a global counter, and the checker's type, binding and resolution
  maps are unit-global tables keyed by it. A census of one steady-state edit shows
  those three tables and their hash indexes are **about 58% of every record the
  snapshot walks and relocates** (≈99k of 171k), and `sem-maps-inherit!` re-inserts
  all of them per candidate. They become `PMap nid → entry` held by the `Env`, with
  a mutable overlay during a compile; a candidate reads through to the accepted map
  instead of copying it.

  An earlier draft (and a decision taken on its recommendation) made nids
  artifact-local with the tables inside each checked body. The audit killed it:
  metaprogram reflection (`type-of`, `binding-of`, `code-decl`,
  `comptime.coil:2817-3441`) looks up an arbitrary `Code` handle's nid with no
  function context; lint and `join-source-nodes!` key on `Sexp` nids of raw forms
  that no function owns; metalower and fold read nodes in consts, impls and asserts;
  mono instances *share* their generic origin's nids on purpose
  (`mono.coil:2139`); and generated names embed nids (`$borrow.temp.<nid>`,
  `$qqscope<nid>`). Global ids with a persistent map keep every one of those working.

  Entries die with the syntax that carries their nid. After `semantic-freshen-nids!`
  a form revision occupies a contiguous pre-order nid range, so retiring a form can
  name its entries without a program-wide liveness walk; until the snapshot walk is
  gone, its existing `live-nids` marking is reused to prune.

### Layer 2 — `Env`, an immutable value

An **`Env`** is everything the compiler knows after compiling some forms: persistent
indexes (`coil.pmap`/`coil.pvec`, nodes in the artifact heap) from `DefId` to sealed
artifacts. It is an ordinary owner: `clone` shares it in O(1), `Drop` releases it,
and releasing walks only what that value uniquely owned. The compiler attaches no
meaning to having two of them. "Accepted", "candidate", "revision" and "session"
are words a client may use for the `Env` values it happens to be holding.

**Artifacts refer to other artifacts by `DefId`, resolved through an `Env` — never
by pointer.** Owned pointers (`owns`) form a DAG. This is what makes plain
reference counts sufficient: mutually recursive functions, a type and its impls,
`impl method → self type → impl availability` — none is a *pointer* cycle, because
each edge goes through the index. It also means the same sealed body can sit in
two `Env`s that resolve its callees differently, which is exactly what a client
replacing one function needs.

Impl selection indexes become `trait key → persistent list of impl DefId`. Dropping
an impl is removing a key; nothing is rebuilt (most of copy site 4).

### Layer 3 — the API

```
(compile  env forms options)  →  Compiled        ; new Env + diagnostics + outputs + stale set
(recheck  env defs options)   →  Compiled        ; re-run a stage for definitions already in env
(emit     env roots target)   →  Image           ; code + symbols + the DefIds inside

(env-sig env def) (env-struct …) (env-impls-for …) (env-checked-body …) (env-defs env)
(env-diagnostics env)         ; DefId → diagnostics, an index like any other
(env-dependents env def stage); who recorded a read of this
(env-diff old new)            ; what changed, skipping every shared subtree
(env-without env def)         →  Env
```

- **`compile` always returns an `Env`.** Accepting or rejecting a result is policy,
  so the compiler does not decide it. A definition whose body fails to check is
  recorded as a failed artifact carrying its diagnostics, its signature still
  available to everyone else; the statement-level recovery the checker already has
  (`recover_statements`, `recovered_diags`) is what makes that useful. A reloader
  looks at the diagnostics and keeps the old `Env`; a checker keeps the new one.
- **Checking and emitting are separate calls.** Checking never monomorphises or
  generates code. (Today's `jit-checked-session-new` is this distinction, expressed
  as a kind of session.)
- **`compile` never touches its input.** It works in a scratch arena with a mutable
  overlay per index ("overlay, else the input `Env`"), seals what it produced, and
  returns a new `Env` sharing everything else. The scratch and the overlay are locals
  of the call. There is no prepare/publish/abort: a caller that does not want the
  result does not keep it. Rejection cannot damage anything by construction.
- **Phases read through `env-*` lookups** instead of reaching into `(.sigs cx)` /
  `(.checked parent)` / `(.imports s)`. That single indirection deletes every
  `*-inherit*` pass (copy sites 2, 5, 6): nothing is copied forward because the
  input is simply visible. The 158 `unit-allocator` sites become trivially correct:
  that allocator is always the call's scratch; only `seal` allocates in the heap.
- **Ahead-of-time compilation is the same path** with an empty input `Env`, and it
  never needs to seal: every lookup hits the overlay, which is the mutable `HashMap`
  it is today. The HAMT is never on the batch compiler's hot path.
- **`emit` reports what it contains** (`DefId`s, symbols, what it imports). Loading
  it, patching call sites, keeping old code alive for running frames, reclaiming it:
  the client's, in a library. The compiler does not know an image is ever replaced.
- **Artifacts carry what they read** (`deps`: `(DefId, stage, fingerprint seen)`,
  including negative lookups — a name that was absent, a candidate set for an impl
  or an import). Sealing an artifact also maintains the reverse index behind
  `env-dependents`, at a cost proportional to that artifact's own reads. Every
  result reports its **stale set**: definitions whose recorded reads no longer match
  this `Env`. The compiler records and reports; it never re-checks on its own
  initiative. This replaces `ls-accepted-function?`'s pointer-equality test, which
  is policy hiding in the checker.
- **`recheck` takes the definitions the caller names**, re-runs the stage against
  this `Env` from the expanded form the `Env` already holds, and returns a new `Env`.
  The caller chooses how many per call, so the work is interruptible and
  prioritisable without the compiler knowing about either.
- **`env-diff` is the general tool for derived state.** Two `Env`s share every node
  an edit did not touch, so a diff that skips pointer-equal subtrees costs what the
  edit cost. Any index a client wants to keep — diagnostics per file, a symbol
  table, its own notion of what is loaded — is maintained from diffs, and the
  compiler needs no hook for it.

### What a client builds

Hot reload, in full, against that API:

```
(defstruct Live [(current Env) (loaded (PMap DefId Image)) …])

(defn submit! [(live (mut Live)) (forms …)] (-> …)
  (let [compiled (compile (field live current) forms options)]
    (if (has-errors? compiled)
        (report compiled)                                ; its policy: reject. Nothing to undo
        (let [image (emit (.env compiled) (changed compiled) target)]
          (swap-entry-points! live image)                ; the client's runtime
          (set! (.current live) (.env compiled))))))     ; old Env dropped here —
                                                         ; unless something else holds it
```

Every behaviour the compiler implements today falls out of holding values:

| Today, inside the compiler | As a client |
|---|---|
| prepare / publish / finalize / abort | call `compile`; keep the result or don't |
| rejected edit leaves accepted state intact | the input `Env` was never writable; rejecting is not keeping the result |
| previous snapshot kept alive for a lease | keep the old `Env` value until the frame returns |
| `:jit/retain false`, submission-only types, joint retirement | `env-without` the keys you decide are dead; `deps` tells you what reaches what |
| native generations, tokens, reclaim | a runtime library over `Image`s |
| `code-session-*` accepted `Code` state | a value the client keeps next to its `Env` |
| incremental "skip unchanged" | read `deps` + fingerprints; a library, optional |

### A second client: a live checker

Keep a compiler running, edit, and know within a keystroke's budget whether the
whole program still type checks. It is a harder test of the API than hot reload,
and it changed the API above in four places:

1. **A reloader rejects on error; a checker must not.** It needs an `Env` that
   contains the broken definition, so everything else can still be checked against
   its signature. Hence `compile` always returns an `Env`, and rejection is the
   reloader's decision.
2. **A reloader can check only what was submitted; a checker cannot.** Change `f`'s
   signature and every unedited caller is now wrong. Hence `deps`, the stale set
   and `env-dependents` are core, not the optional last phase an earlier draft made
   them.
3. **Nobody resubmits the callers.** Their expanded forms are already in the `Env`.
   Hence `recheck`.
4. **It wants to be interrupted.** A new edit arrives mid-recheck. Because `compile`
   and `recheck` never write their input, abandoning work is dropping a value, and
   because `recheck` takes a caller-sized slice, there is always a near point to
   stop at.

```
(defn on-edit! [(c (mut Checker)) (forms …)] (-> …)
  (let [compiled (compile (field c env) forms check-only)]
    (set! (.env c) (.env compiled))                      ; keep it, errors and all
    (set! (.queue c) (prioritise (.stale compiled) (.open-files c)))))

(defn on-idle! [(c (mut Checker))] (-> …)                 ; a few definitions at a time
  (let [compiled (recheck (field c env) (take 8 (.queue c)) check-only)]
    (set! (.env c) (.env compiled))
    (enqueue! c (.stale compiled))                        ; rarely non-empty; see below
    (publish-diagnostics! c (env-diff …))))
```

What stays outside: eager or lazy, which definitions first, debouncing, mapping
files to definitions (a form that vanished from a file is an `env-without`), and
how diagnostics are shown.

Two properties of Coil keep this cheap, and are worth protecting:

- **Signatures are written, not inferred.** A function body reads the signatures,
  types, traits, impls and constants it uses, and nothing reads a body. So a body
  edit with an unchanged signature stales nothing, and a signature edit stales its
  readers and stops — the fingerprint of each reader's *own* signature is
  unchanged. Invalidation is one hop, except through macros (a changed macro
  re-expands its users, whose output may differ) and constants that mention
  constants. The stale set handles those by being recomputed on each result.
- **The semantic tables are part of the `Env`.** "What is the type of this
  expression" is a read of a persistent map, valid for as long as the client holds
  that `Env`, and the same read metaprogram reflection already performs.

Whole-program metaprograms (lints, transforms) read everything and so are stale
after every edit. The compiler reports that honestly; when to run them is the
client's call.

The measured baseline says this is within reach: parse, expand, resolve and check
for a one-function edit total about 5 ms today. The other 100 ms is the copying.

`coil.jit` keeps its public surface and becomes the first such client. The
`:jit/*` annotations become ordinary annotations that client reads.

### Artifact stages

| Stage | Key | Owns | Replaces |
|---|---|---|---|
| Source | payload identity | text, line table | *(exists: `retained_source`)* |
| ParsedForm | `FormId` + text fingerprint | `Sexp` with local nids | `TaggedForm.form`, `raw_form` |
| ExpandedForm | ParsedForm + macros read | expansion output, hygiene/provenance records | `tagged-rewrite!` results, `expansions` slots |
| ModuleEnv | module name | imports, exports, aliases, type/value refs | `LS.imports/exports`, resolution registries, `res-own-name` copies |
| ResolvedForm | ExpandedForm + lookups read | qualified program fragment | `ResolvedRevision.prog` and its flags |
| Decl | `DefId` | sig / struct / sum / trait / impl / const / extern record | `Cx` lists + position indexes, `Program` sections |
| CheckedBody | `DefId` | `Func`, body, type/bind/res tables | `checked`, `checked_functions`, `SemMapsSnap` |
| MonoInstance | structural key | specialised `Func`, `MonoOrigin`, trait uses | native `Program`, `mono_origins`, the monomorph report |
| MetaEntry | name | `MEEntry` + resource lease | `MetaEngine` entries, `compiler-resources` |
| Code value | session handle | `Sexp` | `CodeSessionState.accepted*`, `sexp-own-into` |
| NativeImage | generation | image + symbol map | *(exists: generation tokens)* |

`ResolvedForm` is the one the audit rated "high difficulty". It is not: the
destructive qualifier already runs on a clone of `raw_prog`. Clone → qualify →
seal, keyed by the lookups it actually performed, is the existing algorithm with
the cache key fixed (the boundary audit already notes syntax revision alone is an
insufficient key).

### Enforcement

Coil cannot express stored immutability: references cannot be struct fields and
`(ptr T)` has no const variant. Three mechanisms instead:

1. **Encapsulation.** Artifact and index types are opaque outside their module;
   only read accessors are exported.
2. **Page protection in the gate.** Under a debug flag the heap allocates blocks
   page-aligned and `mprotect`s them read-only after seal. A stray write is a
   fault with a stack trace at the offending store, not a corrupted session three
   edits later. `test generated` runs with it on. This is the migration's main
   safety net and is cheap because blocks are already page-indexed.
3. **Generator schema checks**, as in Layer 0.

### Invariants

1. Nothing reachable from an `Env` points into a compile call's scratch arena.
2. `seal` is the only producer of artifacts; an artifact is never written after it.
3. Artifacts reference each other by `DefId` through an `Env`, or by an owned
   DAG pointer listed in `owns`. No pointer cycles.
4. `compile` never writes its input `Env`. Phases read it only through `env-*`.
5. Identity is `DefId`/fingerprint, never an address.
6. `unit-allocator` is the call's scratch.
7. The compiler has no notion of session, revision, acceptance, retention or
   reload. If a change needs one of those words in `src/compiler`, it belongs in a
   client.

## Migration

One boundary at a time; each phase deletes a ranked copy site and lands with its
own gate. Until the last phase the existing snapshot survives as a shrinking
"legacy blob" artifact owned by the `Env`, so the tree is always shippable.

**Phase 0 — instruments and building blocks.** No behaviour change.

| Item | State |
|---|---|
| Baseline: bytes and ms per edit, gate green | done — see "Baseline" above |
| `coil.pmap`, `coil.pvec` (stdlib, public) | done — model-tested against `HashMap`/`ArrayList`, forced hash collisions, three-level growth and collapse, leak-checked allocator, clone/drop balance of owned values, path-copy allocation bound |
| Page-protection checking mode for sealed blocks | done — `COIL_JIT_PROTECT=1`; `retained_heap` gives each block its own pages and `seal-all!` makes them read-only after the last fixup |
| Counters and timing | done for publication: `retained-bytes`, `artifacts-held/-recorded/-roots` in `COIL_JIT_TRACE`; `jit.retain.*`, `jit.snapshot.*`, `jit.env.check` spans in `COIL_TRACE`. The prepare side has no byte counter yet |
| `pm-diff`: structural diff of two `PMap`s that skips shared subtrees (what `env-diff` is built on) | done — checked against a brute-force model under a real hash, total collisions, and a shallow hash that forces the lone-pair-against-subtree cases; a one-key diff of a 50,000-entry map examines at most two paths |
| `DefId` interner | not started — names are still the key everywhere (`SemBase` keys by node id, `DepBase` by qualified name), which has been enough so far |
| Heap generalised from bodies to arbitrary sealed roots | done — `Artifact` in `retained_heap.coil`, sealed per registered pointer field (`ARTIFACT_FIELDS` in the generator); bodies and parameter lists use it |
| Session code moved out of `driver.coil` | deferred: `feature/live-whole-program` is being edited concurrently and a 4k-line move would conflict with every commit there; do it as the first step of Phase 1, coordinated |

**What protection found on its first run.** The `replace` probe died with SIGBUS
in `fold-expr`. Its `EQuasi` arm copied the template to the stack, folded it, and
stored an identical `EQuasi` back into the node — a no-op write, since
`fold-quasi` only ever recurses through pointers — and the guard that lets
`fold-program` skip already-folded accepted bodies (`fold-needed?`) answered `true`
for every quasiquote. So every accepted function containing a quasiquote, which is
every macro in core and the prelude, was re-walked *and written* on every edit.
Fixed: the store is gone and the guard asks `fold-quasi-needed?`, which is true
only where an unquoted expression needs folding. This is the mutation audit's
"`fold-program` walks inherited bodies" item, located by a fault instead of by
reading.

The full `jit-static-session.py` list then found a second writer of the same
shape: `ml-quoted` (`metalower.coil`) stamped the hygiene module onto the quoted
form *inside the function being lowered* and then deep-copied it. It now stamps
the copy. With both fixed, all 31 fixtures pass with protection on, and the gate
now sets `COIL_JIT_PROTECT=1` itself, so the next such write fails the gate at the
offending store. Protection covers frozen checked bodies only — the one artifact
kind that exists — so the audit's other items (check setup, `build-param-env`,
`cte-wrap-divisor!`, nid freshening, `TaggedForm` repair) remain open until the
data they touch is sealed too; each later phase inherits this net as it seals more.

**Phase 1 — `Env` and the `env-*` read interface.** Mechanical: define `Env` as
a wrapper over today's containers and route every read of inherited state through
`env-*`, still backed by the old containers. Largest diff, zero semantic change;
the full gate ladder is the contract. Its first step is moving the session code
out of `driver.coil` into its own files, coordinated with `feature/live-whole-program`.

**Phase 2 — signatures and checked bodies.** `DefId → Sig`, `DefId → CheckedBody`
as persistent indexes, after the semantic side tables (the first slice, because
they are the majority of what is copied). Fix
`build-param-env`, `fold-program`, `cte-wrap-divisor!`. Deletes
`check-inherit-signatures!`, `ls-accept-checked!` rebuilds, `SemMapsSnap`,
`sem-maps-inherit!`, the nid-liveness pass. **Gate** (from the boundary audit): a
same-signature body edit creates one artifact and O(log n) index nodes, relocates
nothing, leaves every old address intact on rejection, and plateaus over 1,000
replacements — counting publication *and* the next prepare.

**Phase 3 — declarations and impl indexes.** Structs, sums, traits, impls,
consts, externs, aliases; position-valued indexes become `DefId`-valued. Fix the
check-setup writes. Deletes the list unions in `retain-meta`, the index rebuilds
in `prune-joint`, `semantic-inherit-program!`, `semantic-inherit-declarations!`,
and the `.methods` pointer comparisons.

**Phase 4 — loader, expansion, resolution.** `ModuleEnv`, `ParsedForm`,
`ExpandedForm`, `ResolvedForm`; `SemanticWorkspace` entries become artifacts and
its indexes become the compile call's overlay. Fix `TaggedForm` repair and slot recycling.
Deletes `ls-inherit!`, `semantic-inherit-resolution!`, `res-own-name`.

**Phase 5 — mono, meta, Code, native; then evict the policy.** `monomorphize-reusing`
reads the input `Env` instead of replaying it; the monomorph report is derived on
demand; `MEEntry` becomes an artifact; `emit` returns an `Image` that names its
contents. The snapshot graph is now empty: delete
`compiler-revision-publish-snapshot!`, the relocation half of `retained_graph.coil`
and `retain-meta`. Then the move this whole plan is for: `repl-session-*`,
`compiler-revision-*`, joint retirement, generation leases and `code-session-*`
leave `src/compiler` and are rebuilt in the `coil.jit` library on `compile`/`emit`,
with the existing JIT fixtures as the contract. The parser stops knowing `:jit/*`.

**Phase 6 — `recheck`, the stale set, `env-dependents`, `env-diff`.** `deps` are
recorded from Phase 2 on, as each stage is sealed; this phase makes them complete
(negative lookups, impl candidate sets, macro reads) and exposes them. Acceptance
is the live checker built as a client: a signature edit in a large program reports
exactly its readers as stale, a body edit reports none, and work per edit is
proportional to the definitions re-checked.

Fixtures every phase keeps green: the `jit-static-session.py` list (notably
`retained_heap`, `jit_source_sharing`, `jit_body_sharing`, `jit_impl_lifetime`,
`jit_type_lifetime`, `jit_metadata_lifetime`, `jit_monomorph_report_lifetime`,
`jit_retire_declarations`), `jit-session-memory.py`, `jit-source-graph.py`,
`jit-single-form.py`, plus modernize-fast and the self-host fixed point. The
numeric bounds in `jit-session-memory.py` (`retained-bytes` drift ≤ 64, body
growth < 4096/step) describe the snapshot allocator and will need restating in
terms of artifact and index bytes — restated, not loosened.

## Alternatives considered

### Retain follow-up (2026-09-21)

The macro facade produced by `compiler-revision-retain-meta!` is already the union
of the application and macro checked programs. Joint liveness used to analyze both
the application program and that union, visiting every application definition
twice, even though the two owned programs still have to be pruned separately.
Reachability now analyzes only the union while candidate discovery, impl ownership,
and pruning continue to inspect both loaders.

On 27 edits of the 2,000-definition `replace-big` probe, median
`jit.retain.joint-analyze` fell from 14 to 13 ms, `jit.retain.prune-joint` from 19
to 17 ms, and total `jit.publish.retain` from 25 to 24 ms. This removes one
redundant whole-program walk; the remaining pass is still O(program), so the
persistent declaration/dependency indexes above remain the structural fix.

### Callable signatures become the first persistent declaration index (2026-09-21)

Accepted callable signatures now live in a refcounted persistent map
(`sig_base.coil`) keyed by name. A candidate builds only the signatures whose
checked function body is not the exact accepted body, reads inherited entries
through the base, and promotes its overlay after joint pruning. Retired names are
removed before promotion. The accepted `function_abis` list is no longer retained:
it is a transient compatibility report materialized from the base for codegen and
live IR, then cleared from every checked/native snapshot root.

The persistent entries own deep copies of all nested types, bounds and names.
Candidate materialization also deep-copies an entry because checked expressions may
retain pointers into its types. The application and macro facade share the same
published base; failing to publish it through the facade made later accepted macros
lose core callables, which `jit-single-form.py` now exercises through the existing
no-reexpansion case.

On 27 edits after one submission defining 2,000 functions, median
`frontend.check.setup` is now below the timer's 1 ms resolution and
`jit.retain.promote-sigs` is 0 ms. End-to-end remains about 56 ms: prepare 15 ms,
native 7 ms, retain 13 ms, snapshot 21 ms. This removes the signature setup walk
and roughly 16 ms from the previous ~72 ms result, but it deliberately does not
claim the `<16 ms` target: resolution/stage-3 work, joint liveness/pruning, and the
remaining snapshot graph are still proportional to the accepted program.

### Resolution registries become a persistent overlay (2026-09-21)

The accepted `(module, raw) -> qualified` type and value registries and the
`source -> module` registry now live in a refcounted persistent base. A candidate
records only its own qualification results in the existing mutable lists and
looks through to the base on a miss. After the snapshot liveness pass has used
those lists to mark hygiene scopes, publication promotes the overlay, applies
retirements, and empties the lists before relocation. Rejected candidates never
write the accepted base, and held revisions continue to share unchanged HAMT
nodes.

On the same 2,000-definition probe, the snapshot median fell from 21 ms to
19 ms. Resolution copying is gone, but the loader graph still walks the accepted
syntax and declaration structures, so this is a structural checkpoint rather
than the end-to-end target.

Joint liveness also now stops after transitive function closure when there are no
submission-only nominal types. In that common value-replacement case no type
candidate or conditional impl can be rescued, so the former whole-program type
reference walk could not change the result. This reduced median
`jit.retain.prune-joint` from about 9 ms to about 5 ms on the probe.

- **Undo log over the mutable graph.** Cheap rejection, but every mutation and
  dependency must be logged correctly forever, and an old revision pinned by a
  native lease still needs a stable view — which is a snapshot again.
- **One arena per revision, never relocated.** Removes copy site 1 immediately
  but retains scratch and every historical program; memory grows with edit count.
- **Persistent structures everywhere, including phase internals.** Pays HAMT cost
  on the batch compiler's hot paths and rewrites `qualify-*` and ownership
  elaboration for no benefit: they already mutate only their own scratch.
- **Tracing collection of accepted state.** Handles pointer cycles, but is a
  whole-graph pass at some cadence — the cost being removed. ID-linked artifacts
  make it unnecessary for memory; liveness is handled incrementally in Phase 6.

## Risks

- **Phase 1 is wide.** Every accepted-state read site changes. Mitigation: it is
  behaviour-preserving, so the existing gates fully specify it.
- **Shared nids are legitimate** (template atoms re-emitted by `mh-quoted`, mono
  instances, tower and lint copies), and the maps are latest-wins. Accepted entries
  must therefore never be overwritten by a candidate that is later dropped — which
  the overlay guarantees — but two accepted artifacts can still contend for one nid,
  exactly as today.
- **By-value record copies alias inner lists** (`Func` copies share `params`;
  mono's output `Program` aliases the input's `externs`/`traits`/`impls`). Seal
  must copy or reference-by-artifact at every such edge; the generator schema
  check is what finds the ones we miss.
- **The process-peak ceiling (768 MiB) is a separate problem.** 1.37 GB is in the
  candidate arena before any snapshot work. This plan removes copying and the
  scan/relocate scratch; it does not by itself shrink first-compile scratch.

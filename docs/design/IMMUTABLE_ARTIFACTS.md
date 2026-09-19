# Immutable artifacts and persistent revisions

Status: **Phase 0 in progress.** Written 2026-09-19 against
`feature/live-whole-program` at `d88428e`. It continues the path sketched in
live-poc-coil's `docs/INCREMENTAL_COMPILER_BOUNDARIES.md` ("Revision storage")
and `docs/COMPILER_RETENTION.md`, and supersedes the "not yet a persistent
query database" caveats in `docs/reference/STATEFUL_JIT.md`.

Line numbers below refer to that commit.

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

Four layers. Each is small; the refactor is mostly *moving existing data behind
them*, one boundary at a time.

```
  jit_api            prepare ──► Txn ──► publish = pointer swap     abort = free scratch
                                  │
  phases (read/load/expand/       │  read:  db-* lookups   (overlay, then base)
  resolve/check/mono)             │  write: txn scratch + overlay only
                                  ▼
  ┌──────────────────────────── Txn (mutable, private) ───────────────────────────┐
  │ scratch arena · overlay maps (DefId → new artifact | tombstone) · unit cells   │
  └───────────────┬───────────────────────────────────────────────────────────────┘
                  │ seal (the only door)                       base ▼ (read-only)
  ┌───────────────▼──────────── Revision (immutable, refcounted) ─────────────────┐
  │ persistent indexes:  DefId → Decl · DefId → CheckedBody · impl keys → Impl    │
  │                      module → ModuleEnv · FormId → Parsed/Expanded/Resolved   │
  │                      instance key → MonoInstance · meta entries · Code values │
  └───────────────┬───────────────────────────────────────────────────────────────┘
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

**Sealing** is a copy of one artifact's closure out of txn scratch into a
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
- **Node ids become artifact-local** (decided 2026-09-19, over keeping global
  nids in a persistent map). `Expr.nid`/`Sexp.nid` is currently a global
  counter carried across revisions as `next-nid`, and the checker's type, binding
  and resolution maps are unit-global tables keyed by it. Make `nid` a dense index
  assigned at seal, and move those three tables *into the checked-body artifact*
  as arrays. This deletes `SemMapsSnap`, `sem-maps-inherit!` (copy site 2),
  pass-1 "live nid" marking and the weak-map prune between snapshot passes, and
  `semantic-freshen-nids!` — a sealed copy of a macro result gets its own
  numbering, so aliased argument nodes are never renumbered in place.

### Layer 2 — revisions and persistent indexes

A **`Revision`** is an immutable, refcounted record of index roots. Indexes are
persistent maps (HAMT over `i64` keys) and persistent vectors whose nodes live in
the artifact heap and are individually refcounted; values are artifact pointers.
A new revision is the old one plus O(log n) path copies per changed key.
Releasing a revision walks only nodes it uniquely owns.

**Artifacts refer to other artifacts by `DefId`, resolved through the revision's
index — never by pointer.** Owned pointers (`owns`) form a DAG (a checked body
owns its source payload; a mono instance owns nothing it did not build). This is
the point that makes plain reference counts sufficient: mutually recursive
functions, a type and its impls, `impl method → self type → impl availability` —
none of these is a *pointer* cycle, because each edge goes through the index.
The cycle problem in `COMPILER_RETENTION.md` is real, but it is a question of
**which keys stay in the index** (semantic liveness), not of memory ownership.
Separating those two is what removes the fixpoint-and-rebuild from publication;
see Layer 3.

Impl selection indexes become `trait key → persistent list of impl DefId`.
Retiring an impl removes a key; nothing is rebuilt (most of copy site 4).

Stdlib has `Rc`/`Arc`, `AllocatorLease`, `leased_region`; it has **no**
persistent collection. `coil.pmap`/`coil.pvec` are written as public stdlib
modules (decided 2026-09-19), with property tests against
`HashMap`/`ArrayList` as the model.

### Layer 3 — the transaction

A **`Txn`** is the only mutable thing: a scratch arena, the unit-state cells, and
one mutable overlay per index (`DefId → new artifact | tombstone`). Phases stop
reaching into `(.sigs cx)` / `(.checked parent)` / `(.imports s)` and call a read
interface:

```
db-sig  db-struct  db-sum  db-trait  db-impls-for  db-const  db-extern
db-module-env  db-parsed  db-resolved  db-checked-body  db-mono-instance
```

Each is "overlay, else base". That single indirection deletes every
`*-inherit*` pass (copy sites 2, 5, 6): nothing is copied forward because nothing
needs to be — the base is simply visible. Rejected candidates stop paying for the
size of the session.

- **prepare**: make a `Txn` on `current`. Run phases. Results go to scratch and
  the overlay.
- **publish**: seal the overlay's artifacts, apply the overlay to the persistent
  indexes, swap `current`, release the old revision. No finalize step; nothing the
  next prepare must wait for.
- **abort**: free the scratch arena. Accepted state was never touched, by
  construction rather than by care.

The rule for the 158 `unit-allocator` call sites becomes trivial: it is *always*
txn scratch. Only `seal` allocates in the artifact heap.

Ahead-of-time compilation is the same code path with an empty base, and it never
seals: every lookup hits the overlay, which is the mutable `HashMap` it is today.
The HAMT is never on the batch compiler's hot path.

Each artifact records what it read (`deps`: `(DefId, stage, fingerprint seen)`,
including negative lookups). That gives demand validation — an old artifact is
admitted into a new revision iff its recorded reads have the same fingerprints in
the txn's view — and replaces `ls-accepted-function?`'s pointer-equality test,
which says nothing about whether a callee's signature changed. It also gives
retirement its edges: conditional impl ownership and joint liveness run over
recorded `deps` incrementally instead of scanning programs to a fixpoint at
publication.

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

1. Nothing reachable from a `Revision` points into a txn arena.
2. `seal` is the only producer of artifacts; an artifact is never written after it.
3. Artifacts reference each other by `DefId` through the index, or by an owned
   DAG pointer listed in `owns`. No pointer cycles.
4. Phases read accepted state only through `db-*` and never hold a base container.
5. Identity is `DefId`/fingerprint, never an address.
6. `unit-allocator` is txn scratch.
7. Publish is a pointer swap. No deferred maintenance.

## Migration

One boundary at a time; each phase deletes a ranked copy site and lands with its
own gate. Until the last phase the existing snapshot survives as a shrinking
"legacy blob" artifact owned by the `Revision`, so the tree is always shippable.

**Phase 0 — instruments and building blocks.** No behaviour change.
- Counters for bytes copied at prepare and at publish, per edit, through the
  existing `COIL_JIT_TRACE`; assert them in `jit-session-memory.py`. Measure the
  baseline first, including self-host build time (the batch path must not regress).
- `pmap`/`pvec` with property tests; `DefId` interner; heap generalised from
  bodies to arbitrary sealed roots; page-protection debug mode.
- Move session code out of the 22k-line `driver.coil` into `revision.coil`,
  `txn.coil`, `artifact.coil`.

**Phase 1 — `Revision`/`Txn` skeleton and the `db-*` interface.** Mechanical:
route every accepted-state read through `db-*`, still backed by the old
containers. Largest diff, zero semantic change; the full gate ladder is the
contract.

**Phase 2 — signatures and checked bodies.** `DefId → Sig`, `DefId → CheckedBody`
as persistent indexes; then nid localisation and per-body semantic tables. Fix
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
its indexes become txn overlay. Fix `TaggedForm` repair and slot recycling.
Deletes `ls-inherit!`, `semantic-inherit-resolution!`, `res-own-name`.

**Phase 5 — mono, meta, Code, native.** `monomorphize-reusing` reads the base
instead of replaying it; the monomorph report is derived on demand; accepted
`Code` and `MEEntry` become artifacts; symbol tables are sealed per image. The
snapshot graph is now empty: delete `compiler-revision-publish-snapshot!`, the
relocation half of `retained_graph.coil`, `retain-meta`, and
`jit-finalize-published!`'s work. The generator remains as sealer and verifier.

**Phase 6 — dependency records and incremental retirement.** `deps` with
fingerprints and negative lookups; demand validation replaces
`ls-accepted-function?`; joint liveness runs over recorded edges in bounded
slices. If slices run off-thread, index refcounts become `Arc`.

Fixtures every phase keeps green: the `jit-static-session.py` list (notably
`retained_heap`, `jit_source_sharing`, `jit_body_sharing`, `jit_impl_lifetime`,
`jit_type_lifetime`, `jit_metadata_lifetime`, `jit_monomorph_report_lifetime`,
`jit_retire_declarations`), `jit-session-memory.py`, `jit-source-graph.py`,
`jit-single-form.py`, plus modernize-fast and the self-host fixed point. The
numeric bounds in `jit-session-memory.py` (`retained-bytes` drift ≤ 64, body
growth < 4096/step) describe the snapshot allocator and will need restating in
terms of artifact and index bytes — restated, not loosened.

## Alternatives considered

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
- **Nid localisation touches hygiene and diagnostics.** Anything that treats `nid`
  as globally unique (provenance, scope pruning, `SynthKey`) needs auditing before
  Phase 2b; `SynthKey` is per-function scratch and can keep raw pointers.
- **By-value record copies alias inner lists** (`Func` copies share `params`;
  mono's output `Program` aliases the input's `externs`/`traits`/`impls`). Seal
  must copy or reference-by-artifact at every such edge; the generator schema
  check is what finds the ones we miss.
- **The process-peak ceiling (768 MiB) is a separate problem.** 1.37 GB is in the
  candidate arena before any snapshot work. This plan removes copying and the
  scan/relocate scratch; it does not by itself shrink first-compile scratch.

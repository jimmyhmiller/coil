# Immutable artifacts and persistent revisions

Status: **Phase 0 in progress; architecture revised 2026-09-19** (see "The goal").
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
| Counters for bytes copied at prepare and publish, asserted in `jit-session-memory.py` | not started (`retained-bytes` already reports the publish side) |
| `pm-diff`: structural diff of two `PMap`s that skips shared subtrees (what `env-diff` is built on) | done — checked against a brute-force model under a real hash, total collisions, and a shallow hash that forces the lone-pair-against-subtree cases; a one-key diff of a 50,000-entry map examines at most two paths |
| `DefId` interner | not started |
| Heap generalised from bodies to arbitrary sealed roots | not started |
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

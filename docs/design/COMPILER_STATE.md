# Compiler state that is trivial to keep, copy and save

Status: in progress (steps 0–2 done, step 3's cut done; its deletions, and steps 4–6, remain). Written 2026-10-28.

## The problem

A REPL or `coil.jit` session grows by 17–32 MB per accepted submission and never
gives any of it back. Sixteen one-line submissions take a session from 251 to 694 MB.

Each submission compiles in its own arena. When it is accepted, the next
submission's state is built by copying only the outer records of the previous
state. Their insides keep pointing into the arena that created them:

- `ls-inherit!` (`loader.coil`) copies the loader's lists, and `ls-function`
  walks `LS.parent` into older revisions.
- `merge-funcs` (`resolve.coil`) copies `Func` records by value. Their names,
  parameter lists, types and bodies stay where they were allocated: 4,814 of 4,817
  records point into the setup arena.
- `sem-maps-inherit!` (`comptime.coil`) re-inserts every inherited type, binding
  and resolution entry on every check.
- `CompilerRevision.parent` (`driver.coil`) is held on purpose, because this
  revision's state points into the parent's arena.

So every arena is reachable from the newest state and none can be freed. The
type system cannot tell a pointer into "my" arena from one into an ancestor's,
so freeing one early is unsafe.

The retained snapshot deleted in `0c91bb93` made room by relocating survivors out
of each arena with a generated visitor. That is the approach this plan rules out.

A submission really needs to keep a few kilobytes: the new declarations, their
signatures and types, their names, and the node facts that reflection reads.
The machine code (about 32 KB) already lives outside the arena, owned by the JIT
runner.

## Requirements

1. **Keeping, copying and saving compiler state is trivial.** No hand-written walker,
   no generated visitor, no relocation pass, no ID remapping on load. Whatever does
   it comes from the language's own derive mechanism, as `Clone` and `Serialize` do.
2. **Time stays low.** A one-line submission stays near today's ~20 ms, and the plan
   ends with time proportional to the edit, not the program. Recompiling the program
   from source each time, as the rewrite's REPL does (1.9 s per submission), is
   not acceptable.
3. **Memory is flat.** A session that accepts N submissions holds the state those
   submissions declared, plus their code, and nothing else.
4. **The compiler keeps building itself** at every step, with FAST green and, where a
   step is meant to preserve behaviour, the pipeline differential at `0 differ`.

## The model

### Two kinds of memory

- **Scratch** belongs to one compile call: syntax trees, the expander's state, the
  checker context, checked bodies of ordinary functions, monomorphization, LLVM and
  tpde state. It is the compile's arena, freed in full when the compile returns.
- **The `Env`** is the session's persistent compiler state. It is one value, owned
  by its holder (the REPL session, a `coil.jit` session, a saved file), in memory
  allocated by and for the `Env` alone. Nothing in it points into scratch, and
  nothing in it points into another `Env`.

### Persistent types derive `Persist`

Every type stored in an `Env` derives `Persist`, a new derive alongside `Clone`,
`Serialize` and `Deserialize`. For a type T it generates:

- `persist-clone [(x (ref T)) (a (dyn Allocator))] (-> T)`: a deep copy into A;
- `Serialize` and `Deserialize` impls, through `coil.serde` (msgpack for saving),
  added in step 4 where saving needs them.

What makes this the whole mechanism is how `Persist` treats fields:

| Field type | Treated as | `persist-clone` |
|---|---|---|
| integers, floats, bool, enums | values | copied |
| `(slice u8)`, `(slice T)` | owned by the record | new allocation in A, contents copied |
| `(ptr T)` | an owned box | new T in A, deep-copied |
| `ArrayList T`, `HashMap K V`, `Option T`, sums, structs | owned values | element-wise `persist-clone` |
| `(ptr i8)`, `dyn`, `fnptr`, `Rc`, `Arc`, allocators | **refused** | the derive is a compile error |

So **the derive is the enforcement**: a persistent record cannot hold an opaque
pointer, a function pointer or a shared reference, because it would not compile.

A field that belongs to the computation that built a record rather than to the
record (a memo, a lazily parsed body's resolve context) is declared so with
`(derive (Persist (field NAME (skip))) T)`: the copy holds it zeroed. The accept
path is responsible for anything such a field would have produced (step 3 forces
a kept function's lazy body before copying it).

Persistent data must be **trees**. Records refer to other declarations **by
qualified name or ID**, never by pointer. Coil's declarations already do this: a
type names its struct, a call names its function. A shared subtree (for example,
the same `Type` reached from two places) is simply duplicated by the copy. That is
correct because types are values; interning them is a later optimization, not a
requirement. A cycle would make `persist-clone` loop, so debug builds
(`--debug-checks`) keep a visited set and stop at the first repeat with the field
path.

### What an accept does

The `Env`'s tables only grow. A compile records each table's length when it
starts. When the submission is accepted, the records it appended (in scratch) are
`persist-clone`d into the `Env`'s memory, and the scratch arena is freed. Cost:
proportional to what the submission declared, kilobytes and microseconds.

- **Reject:** nothing was copied, so freeing scratch is the whole rollback.
- **Redefinition:** `coil.repl`'s policy (a new `Var` value for a same-signature
  `defn`) appends a new record that shadows the old one. The compiler still never
  replaces code (AGENTS.md "Live code").
- **Copy a session:** `persist-clone` of the whole `Env`.
- **Save and load:** derived `Serialize` / `Deserialize` of the whole `Env`. A save
  is tied to the toolchain that wrote it, keyed like compile-time units (toolchain
  digest).

### What reads the `Env`

The next compile reads `Env` records in place: lists and maps whose headers are
copied into the compile's working structures but whose contents stay in `Env`
memory, valid as long as the `Env` lives. This is today's sharing, but pointing at
memory that outlives every arena instead of at an ancestor arena. Nothing reads
through a parent link, because there is none.

### What is not in the `Env`

- **Machine code.** JIT images and their symbols belong to the client
  (`coil.jit`, `coil.repl`), as they already do in the native runner. Saving
  machine code means saving object bytes, separately.
- **Metaprogram images.** Loaded images (`MEEntry.fp`, `registry`, `interpcx`) are
  process state. The `Env` keeps what identifies an image (name, symbol, module
  bytes or compile-time unit key); the client keeps loaded handles keyed by that.
- **Checked bodies of ordinary functions.** Their code is emitted; nothing reads the
  body again.

## What goes in the `Env`

The persistent part of today's state, field by field. Everything not listed is
scratch.

| Today | Persistent part | Notes |
|---|---|---|
| `LS` (`loader.coil`) | `loaded`, `readpaths`, `readmods`, `imports`, `exports`, `primitive_defs`, `primitive_aliases`, `sources` (text and line starts), `expansions`, `namespace_names`, `namespace_paths`, `entry_module`, `hygiene_imports`, `core_declared_modules`, `retained_forms`, `indexed_paths` | `parent`, `checked`, `semantic_maps`, `checker_context`, `resolution_state`, `meta_environment`, `code_session_state`, `semantic_workspace`, `host_stage` go away or become scratch |
| `Program` (`ast.coil`) | `structs`, `sums`, `externs`, `consts`, `traits`, `impls`, `aliases`, `exports`, `annotation_defs`, `conventions`, `function_abis`, `retirements`, `retired_functions`, `unit_exports` | `funcs`: signatures always; bodies only for generic, inline and compile-time functions (see Decisions). `metas`, `asserts`, `mono_*`: scratch |
| `Func` | name, type params, bounds, cc, annotations, params, ret, positions, `declared`; body when kept | `lazy (ptr i8)` becomes data: the form's source range, re-parsed on demand |
| `AstUnitState` | `type_refs`, `value_refs`, `core_providers`, `core_declarations`, `source_modules`, `declaration_aliases`, `scope_at`, `shadow_calls`, `source_facts`, `source_import_origins` | `resolution_parent` goes away; depth counters and trace flags are per-compile |
| semantic maps (`SemMapsSnap`) | type, binding and resolution facts for **retained** nodes | facts for scratch nodes stay in scratch |
| `MetaEngine` | per entry: `name`, `symbol`, `modbytes` | `fp`, `registry`, `interpcx`: client-owned loaded state |
| `CompilerRevision` | `next-node-id`, `next-form`, `next-gensym`, `next-elaboration`, entry name and symbol, result type | `parent`, `unit`, `loader`, `native`: gone or scratch |

Node IDs stay global: the counter lives in the `Env` and is never reset. Reflection
looks node IDs up without function context, monomorphized instances share their
origin's IDs, and generated names embed them, so they must not repeat.

## Steps

Each step builds the candidate, passes FAST, and passes the macOS and Linux
fixpoints and the x64 host gate before it merges. Steps marked
*behaviour-preserving* must also show `0 differ` in
`scripts/tests/pipeline-differential.py`. Struct layouts shared with staged
metaprograms (`LS`, `Program`, `Func`, `AstUnitState`) change with a seed refresh in
the same series (`refresh-seed.sh all` plus the Linux pair).

### Step 0 — fix the duplicate impl methods, and measure

- `retained-impl-methods!` (`check.coil`) re-adds the 468 inherited impl methods on
  every submission although `copy-funcs` already copied them. Function records grow
  1,068 → 1,538 → … → 4,817 with 1,073 distinct names. Skip the ones already
  present. *Behaviour-preserving.* ~30 lines. Done: 30 submissions went from
  +48 MB and +3.3 ms per submission to +22.6 MB and +0.18 ms.
- Add `scripts/tests/repl-growth.py`: 200 alternating `defn` and call submissions
  through `coil repl`. It records RSS and wall time per submission, reports the
  slope of each, and fails only on what the current step claims (from step 3 on,
  RSS slope under 100 KB per submission). It runs in FAST if it fits the budget,
  otherwise in COMPREHENSIVE. ~150 lines.

### Step 1 — the `Persist` derive (stdlib)

- New module `coil.persist`: the `Persist` trait, impls for scalars, slices,
  `ArrayList`, `HashMap` (any `Persist` key), `Option`, `Result`, and `(ptr T)`
  as an owned box; the derive for structs and sums, generated through the same
  reflection `coil.derive` and `coil.serde.derive` use. The refusals in the table
  above are located compile errors naming the field.
- The debug-build cycle guard, and `(field NAME (skip))`.
- Tests: `tests/stdlib/persist_test.coil` copies recursive sums and every owning
  container and checks the copy shares no memory with the original (it overwrites
  every value of the original, then reads the copy); `cli/check` checks each
  refusal's diagnostic and `cli/debug-checks` the cycle guard.
- Done: `src/stdlib/persist.coil` is 324 lines, the suite 142. Serialization moved
  to step 4, where saving first needs it.

### Step 2 — derive `Persist` on the compiler's records

- Add `(derive Persist …)` to `Type`, `Param`, `Field`, `Variant`, `Bound`,
  `BoundTrait`, `Annotation` and the `Expr`/`ExprKind` tree they reach, `StructDef`,
  `SumDef`, `Extern`, `Const`, `TraitMethod`, `TraitDef`, `ImplKind`, `ImplDef`,
  `ExportC`, `AliasDef`, `Retirement`, `AnnotationDef`, `Convention`, the loader's
  `ImpEntry`, `ExpEntry`, `Source`, `Expansion`, `PrimitiveDef`, `PrimitiveAlias`,
  `RetainedForm`, and the `AstUnitState` registry entries.
- Every refusal the derive reports is a real finding: an opaque pointer that must
  become data. Known ones: `Func.lazy (ptr i8)` becomes the form's source range,
  `MEEntry`'s loaded fields move out of the entry. Each is fixed in this step.
- Nothing calls the derived functions yet. *Behaviour-preserving.* Seed refresh.
- Done. The derive copies an enumeration (a sum whose variants carry nothing)
  as a value, so `CodeOp`'s operation sums and `NativeCc` need no impl of their
  own. `Func.lazy` is `(field lazy (skip))`: a lazy body belongs to the resolve
  that left it unparsed. Only Persist's layout-free impls were added, so no seed
  refresh was needed beyond the one that taught stage zero `coil.persist`.

### Step 3 — the `Env`, and the cut

**What was built** (`src/compiler/frontend/env.coil`):

- `Env` holds one `LS` (the loader lists both layers read), an `AcceptedLayer`
  for the application and one for the metaprogram environment (functions index,
  checked `Program`, signatures, constants, live semantic maps, declaration
  table), the resolution registries, the metaprogram entries (each naming its
  build's quasiquote registry by index, `registries`), the native program as
  declarations only, and the identity counters.
- A compile reads an `Env` through `env-view`: an `LS`, `Cx` and `AstUnitState`
  whose fields point into the `Env` and whose own parent links are null, so every
  existing reader of "the state this builds on" works unchanged, one level deep.
- Accept builds the flat accepted state (`env-of`: the revision's lists, its
  checker's signatures and constants over the base's, its maps' live entries, the
  registries merged) and copies it out (`env-hold`). Then the unit is left: its
  arena and every resource except the executable images and interpreters its
  metaprograms were loaded as, which become the session's.
- Envs live in pools. An `Env` built on another goes into its pool with
  `persist-clone-sharing`, which reuses every record the base already has there,
  so an accept copies what is new plus the list buffers that changed. Once a pool
  is twice the size of its last full copy, the next `Env` is copied whole into a
  new pool and the old pool is freed with its last `Env`.
- An interpreter context owns an arena holding a copy of the program it
  interprets (it compiles functions from it lazily).

**Leaks found on the way**, each predating this work and each per submission:
the arm64 runner took its codegen scratch from the session's allocator, which
under `coil repl` is a bump arena (~1.3 MB a submission); the expander's
top-level form pool kept its newest 256 KB segment past the unit; the terminal
read each input from the process arena.

**Measured** (`repl-growth.py`, one-line `defn` and call submissions, macOS arm64):

| | main before step 0 | now |
|---|---|---|
| RSS after 30 submissions | 1,337 MB (+48 MB a submission) | 71 MB |
| RSS after 200 submissions | (not run: it would pass 9 GB) | 95–115 MB |
| what grows per submission | the whole arena (17–32 MB) | `Env` ~33 KB, JIT code and its bookkeeping ~64 KB |
| median submission | 15 ms | 21–23 ms |
| accept (`jit.accept.env`) | — | 4–5 ms, 9 ms on a compaction |

The resident-size slope `repl-growth.py` reports (~200 KB/submission over 400)
includes the pool's compaction sawtooth; the `Env`'s own size after each
compaction grows 33 KB per submission, and the rest is the JIT's code.

**What remains of step 3:**

- Time. Accept still copies every list buffer of the flat state (the maps' history
  alone is ~50k entries). Making the compile's tables extend the `Env`'s (a check
  that records only new facts over the `Env`'s maps instead of copying them first,
  `sem-maps-inherit!`) removes most of it, and is the same change step 5 needs.
- The deletions. The `Env` replaced the revision chain (`CompilerRevision.parent`,
  `holds`, `accepted-ast`, `accepted-engine`, retain/release), but the frontend
  still builds each compile's working state by copying the `Env` view (the
  `merge-*` copiers, `semantic-inherit-program!`, `sem-maps-inherit!`, the
  depth-one parent fallbacks). Those go when the compile reads the `Env` in place.
  `src/compiler` is net +660 lines after the cut (env.coil is 593 of them); the
  −1,000 target is not met yet.
- The gate bound in FAST (`repl-growth.py` reports only).

- Define `Env` as one struct holding the persistent fields of the table above,
  deriving `Persist`. Each table records its length when a compile starts.
- Accept: `persist-clone` what the compile appended into the `Env`'s memory, then
  leave the unit (freeing its arena).
- The next compile builds its working `LS`, `Program`, `AstUnitState` and semantic
  maps by copying headers whose contents point into the `Env`, never into another
  compile's arena.
- Delete: `CompilerRevision.parent` and its retain/release, `LS.parent` and the
  `ls-function` parent walk, `AstUnitState.resolution_parent`, `prior_cx`,
  `sem-maps-inherit!`/`-under!` (facts are read from the `Env`), and the
  `merge-*` shallow copies of inherited records.
- Branching (`jit-env-check`, `parent-override`) clones the `Env`.
- Delete everything in "What gets deleted" for the loader, resolver, checker,
  comptime, ast, metaengine and driver rows, in the same series.
- Gate: `repl-growth.py` shows an RSS slope under 100 KB per submission and no
  per-submission time increase against step 0; `src/compiler` is at least 1,000
  lines smaller than before step 1. *Behaviour-preserving.* Seed refresh.
- This is the step that fixes the bug. It is also the largest: roughly 1–2k lines
  added and 2.5–4k removed across the loader, resolver, checker, metaengine and
  driver.

**A compile builds on the Env by prefix** (built after the cut):

- A compile's program is the Env's records followed by its own: the resolver
  copies the accepted program's lists in front of the submission's in one bulk
  copy each (`out-extend!`), with no per-record merging.
- The checker reads the prefix from the Env's checker tables, not by registering
  it again. An accepted layer keeps the structs, sums, variants, traits, trait
  methods and impls its checker registered, with the three impl indexes; a check
  whose program begins with the accepted program byte for byte
  (`setup-base-prefix?`) sets `base_tables`, registers only what follows, and its
  lookups (`struct-find`, `cx-impl-bucket`, `cx-method`, …) read its own tables,
  then the base's. Impl positions are local to each table and offset at lookup,
  so a layer's positions never move. A compile that retires or shadows an
  accepted record changes the prefix and is set up whole, as before; so is a
  metaprogram environment read over its application, whose program mixes the two.
- Accept appends. When the Env built on is held only by the session and shares
  nothing (`env-exclusive?`), each list the compile extended (program lists,
  loader lists, checker tables and indexes, signatures and constants, the
  declarations of a module that declared more, the resolution registries, the
  native program) gets only what the compile added, copied into the Env's pool;
  a list the compile changed otherwise is copied whole. The native program keeps
  only what mono reads of it (functions as declarations, structs, sums, constants,
  instance origins), indexed by name; a compile that retires rebuilds it, since
  appending cannot remove.

Measured, 200 one-line `coil repl` submissions: median 12.3 → 8.2 ms with no
slope over the session; accept copies ~135 KB a submission into the pool (was
~680 KB and growing with the session), flat.

What the pool carves per accept, by site (`COIL_MEMORY_SITES=env.pool` over a
window with no compaction; `memory.env.pool.carved` per accept), then went:

| Copied whole every accept | Fix |
|---|---|
| the declaration table's spine, both layers | kept when the compile lists the prior modules first, in order |
| the import and export tables: a compile copies every module's lists before adding to them | compared by records; an entry that only gained some is appended to |
| the metaprogram entries and quasiquote registries | unchanged positions stay (`env-list-replacing`) |
| mono's tables: it set up the runtime program, whose impl list lost the impls of compile-time types from the middle | set up over the checked program, which keeps the prefix |
| the metaprogram environment: every round read the shim (`metashim.coil`) again, and its fresh records sat after the closure's, so the closure check could not build on the environment's tables and the layer was rebuilt | each shim import, struct, extern and function is added only when the program or the environment lacks it; a closure's filtered inherent impl matches the environment's by its methods (`setup-same-impl?`) |

142 → 32 KB carved per accept (median), 200 submissions without a
compaction; resident slope 142 → 72 KB per submission, 32 KB of it JIT pages
(an image is at least a code and a data page). Under `COIL_TRACE`, a check that
cannot build on its base says why (`check.base-miss.structs`, `…impls`, …).

### Measuring memory

Memory is named by whoever holds it, never inferred from resident size:

- `coil.memory` accounts: an account is an allocator that counts what is live
  through it (bytes, peak, blocks), in a tree under `account-root`. The compiler
  gives each use of scratch its own (`large-pages/compiler-scratch-for NAME`:
  `unit.revision`, `unit.command`, `env.pool`, `code.session`, `jit.metadata`, …),
  and JIT pages are charged to `jit.images`. The report's `unaccounted` line is the
  resident size less every account.
- Sites: `COIL_MEMORY_SITES=NAME,…` (or `all`) charges each block to the stack
  that allocated it, and the report lists the `COIL_MEMORY_SITES_TOP` (8) largest; an arena observing an account (`ScratchArena::observe!`)
  charges every allocation it carves, exactly, through mark rewinds and resets.
- `persist-footprint`: what a value owns by field path, from the Persist derive.
- `coil repl`'s `:memory` prints the tree and the compiler state's footprint;
  under `COIL_TRACE` each accept counts every account (`memory.<name>`) and
  `memory.env.owned`, and `repl-growth.py` reports the slope of each and bounds
  the compiler state's with `--max-env-slope-kb`.

What it found on the first pass, each a per-submission leak or copy:

| Found | Per submission, before | Fix |
|---|---|---|
| the `<metashim>` source text registered again by every compile, kept in the `Env` | 19.5 KB kept | registered once (`ls-source-named`) |
| arenas reset every transaction (Code session state), per JIT generation, per LLVM run, the reader cache and the project manifest took segments from the session's own arena, which keeps what is freed into it | 33 KB in `unit.command` | their segments come from accounted large pages |
| every JIT image defined fresh storage, and an initializer, for every `def` the session had accepted (mono reused the accepted constant as a definition), so each image imported every `--impl` and `Var` | 79 KB in `jit.metadata`, plus code | the reused constant is a declaration |

200-submission REPL session afterwards: resident slope 137 → 50 KB per
submission (32 KB of it JIT pages: an image is at least one code and one data
page), the compiler state 14 KB.

### Step 3b — a compile reads the Env in place

The prefix design (above) reads the Env through fallbacks: a checker looks in its
own tables, then in `prior_cx`'s; the loader walks `LS.parent`; the resolution
registries fall back through `resolution_parent`; the semantic maps through a
base. Each lookup had the fallback added by hand, so a consumer that enumerates a
table directly sees only the compile's own records. That is how a self-containing
type crashed the REPL (review of 2026-10-29). The fallbacks are also most of what
step 3 was to delete. This step replaces them.

**The mechanism: tables a compile extends without touching the Env's.** The Env's
tables become persistent maps and vectors whose nodes live in the Env's pool. A
compile's checker, loader and registries start as the Env's tables themselves (a
header copy, O(1)) and register into them: an edit copies the path from the root
to the changed node into the compile's arena and leaves the Env's nodes as they
were. Lookups are one level. Accept is `persist-clone-sharing` of the compile's
tables into the pool, which copies exactly the nodes the compile made and shares
the rest. The per-table append and copy code in `env.coil` goes with the
fallbacks.

`coil.pmap`/`coil.pvec` do not fit as they are: their nodes are reference counted,
so a compile sharing the Env's nodes would write their counts (an accepted Env is
never written), and they free nodes one by one,
where the Env's live in an arena. The tables use an arena form instead, as
Clojure's transients do: each node carries the tag of the edit session that made
it, and a session edits in place only the nodes it made; anything else is copied
into its allocator. Nothing is counted or freed; a compile's arena goes with the
compile, and the pool keeps what accept copied.

Stages, each gated (FAST, the JIT suites, `build full`, x64) and pushed:

1. `coil.amap` / `coil.avec` in the stdlib: arena persistent map and vector, with
   session tags, `Persist` (sharing what the pool owns), and tests.
2. The checker's tables (signatures, constants, structs, sums, variants, traits,
   trait methods, impls and their three indexes) become them. Deleted: `prior_cx`,
   `base_tables`, joined buckets, impl position offsets, `setup-base-miss`, the
   `retained-impl?` path, and `env-tables-over` with its helpers. A retirement
   removes from the tables, so it no longer sets the checker up whole.
3. The loader's function index (`checked_functions`) and the `LS.parent` walks.
4. The resolution registries (`resolution_parent`) and the semantic maps' base.
5. Accept: the Env is the compile's tables, cloned with sharing. Deleted: the
   `env-*-over` family, `env-list-replacing`, the declarations and imports
   mergers, and the prefix test.

Done so far: stage 1 (`dfca46a0`) and stage 2. A check's tables are `AVec`/`AMap`
under its own edit tag; a check with a base starts from the base's signatures and
constants always, and from its types, traits and impls when the program begins
with the base's records (`setup-from-base!`); a retirement removes the names from
the indexes it begins with (`setup-forget-retired!`). Lookups are one level, so a
consumer that enumerates a table sees all of it. Deleted: `prior_cx`, the joined
buckets, impl position offsets, retirement masking (`cx-base-visible?`,
`cx-impl-retired?`), `env-tables-over` and its six helpers, the linear struct, sum,
trait and variant scans (now indexed), and the write-only `static_consts`. A record
a check changes through a lookup is copied into its own nodes first
(`cx-sig-own!`). The accepted layer holds the checker's tables as they are.
Pipeline differential against stage 1: 208 dumps, 0 differ. `coil repl`, 200
submissions: 8.4 ms median, 33 KB carved and 12 KB kept per accept, as before.
src/compiler net −100 lines.

### Step 3c — persistent tables for everything the Env holds

Stage 2 showed the mechanism works. A compile still reads the Env through
hand-written two-level lookups everywhere but the checker (`LS.parent`,
`resolution_parent`, the semantic maps' base), and the program and loader lists are
copied into every compile and appended back by ~550 lines of `env.coil`. This step
puts every table the Env holds on `coil.avec`/`coil.amap`, so a compile starts
from the Env's tables as they are and accept is one sharing copy.

**Evidence.**

- *How others do it* (survey, sources in the session scratchpad): OCaml keeps every
  table of its typing environment a persistent tree and swaps the toplevel's env
  per phrase; Clojure's transients edit only the nodes carrying their edit token
  (what `coil.avec`/`coil.amap` do); Lean 4's `SMap` paired a flat `HashMap` for a
  very large imported set with a persistent map for local additions; Roslyn's
  scripting walks the chain of previous submissions on every lookup, under a
  "TODO: optimize lookup". The layered chain is the pattern to avoid; persistent
  structures throughout are the plain answer, and Lean's staging is an
  optimization for an imported set far bigger than ours.
- *What persistent tables cost* (`tables_bench`, arena-backed): `coil.amap` is
  built as Clojure's `PersistentHashMap` (bitmap nodes of up to 16 slots, full
  nodes of 32 children past that, collision nodes; owned bitmap nodes grow in place
  with room to spare). Against `HashMap`, at 10k entries: insert 24 vs 10 ns, get
  5 vs 4 ns; string keys insert 56 vs 35 ns, get 23 vs 22 ns. At 1M: insert 60 vs
  17 ns, get 45 vs 16 ns. Extending a shared 10k-entry map by 100: 19 µs and 71 KB,
  against 883 µs and 1 MB to copy a `HashMap`. Vectors: push 7 vs 3 ns, random get
  9 vs 4 ns at 1M.
- *Node layout* (measured in stage B): with entries stored in the slots, a node's
  size follows K and V, so a map of 574k node ids to `Type`-sized values took
  195 MB against `HashMap`'s 95 MB. Most of it was the single-entry bitmap nodes
  under full nodes and the slots that hold only a child. A slot is now one word,
  as an element of Clojure's node arrays is one reference: an entry's address,
  or a child's with the low bit set, and the slots follow the header in the
  node's one allocation. Entries are never changed (a new value is a new entry),
  so copied nodes share them. The same map takes 86 MB and inserts 30% faster.
  Extending a shared 10k-entry map by 100 now copies 34 KB, down from 71 KB.
- *What the hot paths are* (`sample` of `coil check src/compiler/main.coil`, 723
  active samples): semantic-map inserts and gets ~7%, the one table near a million
  entries; a linear scan of trait methods (`methods-has`) ~6%, introduced by stage
  2's conversion, which wants an index. At the measured ratios the semantic maps
  cost a few percent of check, a small part of a build.
- *What the Env is*: the first Env (the library a session starts with) owns
  ~16 MB; each one-line submission adds ~12 KB.
- *What goes*: in `env.coil`, 547 of 1,356 lines exist to append in place or copy
  (the `env-*-over` family, imports/exports/declarations mergers, `env-keyed-*`,
  `env-refs-next!`, `env-source-modules-next!`, the in-place half of
  `env-native-next!`, `env-entry-modules`, `env-maps-over!`, `EnvTarget.extend`,
  `env-exclusive?`); in the resolver, `semantic-inherit-program!` and the merge
  copiers' inheritance use; in the loader, `ls-inherit!` and its list copiers; in
  the checker, the prefix tests (`setup-base-miss`, `setup-impls-prefix?`,
  `setup-same-impl?`); the registries' `resolution_parent` readers; the semantic
  maps' over/under base.
- *Conversion size*: `Program`'s lists are read at ~1,400 sites in 34 files, ~420 of
  them on lines touching storage (`data`, `slice`, `box-al`, sorting). `AVec` gains
  `ArrayList`'s surface (`elem`, `len`, `push!`, `get`, `set!`, iteration, carrying
  its allocator as `ArrayList` does) so most sites compile as they are.

**Stages**, each with a pipeline differential against the stage before, FAST, the
JIT suites, `build full`, nollvm and x64, and a measured line count:

- A. `coil.amap` as Clojure's hash trie (done here); `AVec` with `ArrayList`'s
  surface and an allocator; a trait-method index in the checker.
- B. The semantic maps on `AMap`. Each map (types, bindings, resolutions) is an
  `AMap` keyed by node id: a record is a `set!`, a lookup a `get`. A check's maps
  begin as the maps of the state it builds on, under a fresh edit tag
  (`sem-maps-begin!`), so they are complete and one level; the one other source
  is the application's maps beneath a metaprogram environment viewed over it (the
  environment's checks record only what the application's do not answer).
  Saving and restoring (tower retries, context switches) copy three headers and
  retag the live maps, so nothing saved is edited afterwards. The Env keeps a
  compile's maps as they are, and accept's sharing copy copies the nodes the
  compile made. Deleted: the history lists and the positions into them
  (`sem-snapshot-entry-live?`, `snap-*-at`'s scans, the dead `type-map-mark`/
  `type-map-reinstate!`), the `over` half of `SemBase`, `sem-bid-raise!`,
  `env-live-maps` and its filtering, `env-maps-over!`, `env-maps-add!` and its
  put helpers, `combine-sem-maps`' rebuild, and the reservation by function count.
  Measured against stage A: `coil check src/compiler/main.coil` peaks at 2325 MB,
  down from 2353 MB, and takes ~6% more user time (2.60 s vs 2.44 s, best of five
  runs). The 606k type records are scattered trie inserts where they used to be
  flat-table inserts. A one-line REPL submission takes the same time (7.7 ms) and
  carves 43 KB of the pool against 34 KB: each new record copies its path.
- C. `Program`'s lists on `AVec`; `semantic-inherit-program!`'s copying and the
  checker's prefix tests deleted: a compile's program is the Env's, extended.
  Re-planned from a profile of a session at 1,000+ definitions. The cost was
  passes that walk everything accepted, so those went first; the copies they
  walk mattered less:
  - Declarations: see D below.
  - The table diff between a compile's two views (the strict resolve and the
    macro context): it now looks only past the leaves the lists share
    (`avec-shared-prefix`). The metaprogram view no longer re-adds its shim
    module's 38 names every compile.
  - Compile-time units: their positions are renumbered only when their sources
    moved.
  - Constants: an accepted one is not ordered or validated again.
  - Compile-time code (`code-phase-funcs`): the Env keeps the accepted
    functions' classification, and a compile walks only the functions it adds.
  - Export validation: no longer quadratic.
  - Constant lengths: only records past the inherited prefix are walked.

  1,000 definitions in one session: 39.8 s before, 20–22 s after (this machine is
  shared, and runs vary by that much). What still grows per compile is hash
  tables built over every name (`prog-fn-names`, the function index, the impl
  check's `present` set, phase classification's `queued`) and the copies of the
  inherited lists. Each would be a persistent index carried on the Env, as the
  declaration table is. That is the rest of this stage, together with the list
  conversion. Measured at 1,000 definitions: about 15% of a submission.
- D. The loader's lists, declarations, imports/exports, registries and the native
  program; the rest of "What goes" deleted; accept is one sharing copy.
  Done first, because a profile put it first: the declaration table. A REPL
  submission over ~600 definitions spent ~70% of its time rebuilding it. The
  parent's catalog came in as one pseudo-form per module and was merged into
  fresh lists, every module was re-indexed, and every name was hashed to diff
  against the last resolve. The table is now an `AVec` of entries whose name
  lists are `AVec`s and whose index is an `AMap`. A compile's table is the
  parent's under a fresh tag, with the compile's own declarations added and
  indexed as they go. An entry is retagged the first time it is added to; a
  submission's alias replaces an inherited pair in place. Two resolves of a view
  compare the tables of their own forms. The whole tables are compared only when
  names are retired or the last resolve was another view's (a metaprogram
  context shares the compile's workspace). Accept stores the table as it is, and
  the Env's copy shares the parent's nodes. Deleted: the pseudo-forms,
  `TBox`/`table-getc`/`merge-defs!`, `defs-index-build!` and the scan fallback
  (`built`), and `env-declarations-over` with its six helpers. 1,000 definitions
  in one session: 26.5 s, down from 39.8 s. A small `AVec` now has a small tail
  (4, doubling to 32), since per-form declaration lists hold a name or two.
- E. Under the JIT gate, the pool's memory below its last compaction is
  `mprotect`ed read-only, so a store into accepted state faults at the store.

Expected: −900 to −1,100 lines in `src/compiler`; ahead-of-time check a few
percent slower (the semantic maps), measured at stage B; a REPL accept copies
only what the submission made.

### Step 4 — save and load

- `(derive Persist T)` also derives `Serialize` and `Deserialize` through
  `coil.serde`, reusing its impls for leaves; `(ptr T)` fields are boxes, and the
  `HashMap` serde impl, which today handles only `(slice u8)` keys, is generalized.
- `coil.jit` gains `jit-env-save` and `jit-env-load` (derived msgpack of the
  `Env`, with the toolchain digest in a header; a mismatched digest is a clear error).
- Tests: save → load → save is byte-identical; a session loaded from a file accepts
  further submissions that use its earlier definitions; a mismatched toolchain is
  refused. ~300 lines.
- Done, differently from the first bullet. Saving is part of the `Persist`
  derive, not of `coil.serde`: `persist-write` and `persist-read` walk the same
  fields `persist-into` does, writing each in declaration order with no names or
  types, so the bytes are tied to the build that wrote them (which the header's
  toolchain digest already requires). It is faster than a self-describing format
  and needs no second derive on every compiler type. A map is written as its
  slot table, tombstones included, so a loaded map is the same table and saves
  the same bytes; an enumeration as its variant's position (its bytes include
  padding). The derive's `persist-read` takes a `(ref Self)` only to choose the
  impl and returns the value: trait dispatch reads a `(ptr X)` argument as the
  `(ptr T)` impl, so an out-pointer cannot name its own type.
- `jit-env-save` / `jit-env-load` (`env-save` / `env-load` in `env.coil`):
  `coil saved compiler state 2`, the toolchain digest, the target and the hash of
  the bytes that follow (an Env is read by position through its indexes, so bytes
  that parse but were altered are refused), then the
  `Env`. Its metaprogram entries are not saved: they name code the saving process
  loaded (the library's macros among them, in every state), and a compile on the
  loaded state stages each one it calls again from the definition the state
  keeps. Measured: 200 checked submissions save to 8.6 MB in 4 ms and load in
  9 ms. Tests: `tests/stdlib/persist_test.coil` (round trip, a map with removed
  entries, cut and padded bytes refused) and `tests/jit/env_values.coil` (two
  edits of one base, save → load → save identical, a check against the loaded
  state, a macro defined before the save used after the load, foreign and
  damaged bytes refused).

### Step 5 — time proportional to the edit

Today each submission runs two full resolve+check passes over the whole
accumulated program (`install-transform-model!` and the real check), about 10 MB
and 9 MB of scratch.

- Run one check pass, not two: the transform model reuses the real check's result,
  or is built only when a transform is registered.
- Check only the new forms against the `Env`'s declarations, plus the accepted forms
  whose dependencies changed (the compiler's dependency queries already answer
  "what depends on this"). Accepted, unaffected declarations are never re-checked.
- Gate: `repl-growth.py` shows flat time per submission over 200 submissions.

### Step 6 — measure, then decide on interning

With the `Env` in place, measure its size per submission and the cost of
duplicated `Type` subtrees. If they matter, intern names and types into tables
inside the `Env` (IDs, not pointers), as the rewrite does. If they do not, stop.

## What gets deleted

Removing code is a goal of this plan, not a side effect. The inheritance machinery
exists only because later state points into earlier arenas; once the `Env` owns
what persists, all of it goes. Measured on main `eb6b3493`:

| Where | What | Lines today | Fate |
|---|---|---|---|
| `loader.coil` | `ls-inherit!`, the `LS.parent` walk in `ls-function` and other readers (35 sites), `retained_inherited`, `meta_environment`, `checker_context`, `semantic_maps`, `checked_functions` fields and their plumbing | ~70 in named defs, plus field plumbing | deleted |
| `resolve.coil` | `semantic-inherit-program!`, `semantic-inherit-declarations!`, `semantic-merge-submission!`'s redefinition check over the chain, and the inheritance use of the `merge-*` copiers. Not `merge-into`, `merge-defs!` or `semantic-freshen-node-ids!`: they serve every resolve (`funcs`, `structs`, `sums`, `externs`, `consts`, `unretired-consts`, `traits`, `impls`, `exports`, `aliases`, `asserts`, `metas`, `convs`, `annotation-defs`) | ~330 | deleted |
| `resolve.coil` | the rest of the `semantic-*` layer (49 defs, 1,443 lines): the parts that exist to carry state between revisions | part of 1,443 | deleted or reduced to reads of the `Env`; what serves lint's semantic model stays |
| `check.coil` | `retained-impl?`, `retained-impl-methods!`, `setup-retained-sigs`' accepted-signature skip, `prior_cx` (7 sites). Not `copy-funcs` or `inherit-trait-method-annotations!`: both serve every check, not inheritance | ~150 | deleted |
| `comptime.coil` | `sem-maps-inherit!`, `sem-maps-inherit-under!`, `SemMapsSnap` save/restore by value (10 defs) | ~135 | deleted; facts are read from the `Env` |
| `ast.coil` | `AstUnitState.resolution_parent` and its four readers | ~40 | deleted |
| `metaengine.coil` | `MetaEngine.inherited`, `meta-engine-forget-inherited!`, per-candidate `MEEntry` copying | ~60 | deleted |
| `driver.coil` | `CompilerRevision.parent`, `holds`, `accepted-ast`, `accepted-engine`, `compiler-revision-retain!`/`-release!` (done), `compiler-revision-enter!`'s copying of providers and engine entries, the hide-entry/hide-declaration bookkeeping that exists because old state stays reachable | a large part of the 1,570 lines of revision and session code | deleted; what remains is a session holding an `Env` |
| `expander.coil` | the second full resolve+check per submission (`install-transform-model!` when no transform is registered), `merge-checked-read-programs` | ~300 with the pass it drives | deleted in step 5 |

What is added: the `Persist` derive in the stdlib (~1,200 lines with its tests, and
reusable by any program) and the `Env` type with its accept and read paths (well
under the inheritance code it replaces).

**Target:** the compiler (`src/compiler`, excluding the vendored tpde package) is
net smaller after step 3, by at least 1,000 lines, and smaller again after step 5.
Every step's commit message reports lines added and removed in `src/compiler`, so
the trend is visible as it happens. A step that adds a parallel path must delete
the path it replaces in the same series; no step leaves both.

## Sizes

| Step | Added | Removed | Risk |
|---|---|---|---|
| 0 | ~200 (mostly the growth test) | ~20 | low |
| 1 | ~1,200 in the stdlib (with tests) | — | medium: generic derive over sums and containers |
| 2 | ~600 plus fixes for each refusal | the opaque fields it replaces | medium: finds every opaque pointer |
| 3 | 1–2k | 2.5–4k | high: every reader of inherited state |
| 4 | ~300 | — | low |
| 5 | 1–2k | the second check pass and the full re-check | high: incremental checking |
| 6 | depends on measurements | | |

## Decisions

1. **Bodies of generic, inline and compile-time functions: keep them in the `Env`
   as checked trees, or as source re-checked on use?** Recommendation: keep them
   as trees (deep-copied once at accept). That keeps instantiating an earlier generic
   as fast as today. Source-only costs a re-check per use.
2. **Saved `Env` versus the compile-time unit format.** Units are a hand-built form
   of saved compiler state (interface source plus objects). Recommendation: after
   step 4, make a unit an `Env` saved for that module, and retire the interface
   re-expansion. Decide then, with measurements.
3. **Cycle guard in release builds?** Recommendation: debug builds only; the trees
   are built by the compiler, and a cycle there is a compiler bug the debug gate
   finds.
4. **Edit-proportional checking (step 5) is part of the plan, not optional.**
   Recommendation: yes; without it, time per submission keeps growing with the
   program even though memory is flat.

## What this plan does not do

- No snapshot, relocation or generated visitor. `persist-clone` is a derived
  function over a type, written once in the stdlib, like `Clone` and `Serialize`.
- No change to the language's live-code policy: the compiler and JIT still never
  replace code; `coil.repl` stays the policy.
- No new compiler-owned annotation: `Persist` is a library derive, so an older
  compiler bootstrapping a candidate accepts it.

## Evidence

- Arena sizes per submission, the function-record counts, the pinning structures
  and the 16-submission RSS/time figures were measured on main `904d8869` and
  `e5e2a4fe` (2026-10-28); the reviews are in the session scratchpad
  (`repl-memory-review.md`, `memory-model/report.md`).
- `coil.serde` already derives `Serialize`/`Deserialize` for structs and sums, with
  `(ptr T)` fields as boxes and impls for slices, `Option`, `ArrayList` and
  string-keyed `HashMap` (`src/stdlib/serde.coil`, `serde_derive.coil`).
- Derived `Clone` today copies `ptr` and slice fields shallowly
  (`src/stdlib/derive.coil`), which is why `Persist` is a separate derive.

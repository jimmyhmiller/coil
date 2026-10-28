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

### Step 4 — save and load

- `(derive Persist T)` also derives `Serialize` and `Deserialize` through
  `coil.serde`, reusing its impls for leaves; `(ptr T)` fields are boxes, and the
  `HashMap` serde impl, which today handles only `(slice u8)` keys, is generalized.
- `coil.jit` gains `jit-env-save` and `jit-env-load` (derived msgpack of the
  `Env`, with the toolchain digest in a header; a mismatched digest is a clear error).
- Tests: save → load → save is byte-identical; a session loaded from a file accepts
  further submissions that use its earlier definitions; a mismatched toolchain is
  refused. ~300 lines.

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

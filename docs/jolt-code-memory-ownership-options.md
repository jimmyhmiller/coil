# Persistent `Code`: locations, lifetimes, and ownership options

## Purpose

This document describes where compile-time `Code` can live in Coil, what owns
each representation, how values cross lifetime boundaries, and what would be
required to make those boundaries safe and memory-bounded.

It evaluates four designs:

1. automatic reference counting (ARC);
2. disciplined arenas with explicit generations;
3. garbage collection (GC);
4. manual ownership and destruction.

The immediate stress case is compiling Jolt's Scheme runtime. The design is not
Scheme-specific: macros, transforms, checkers, staged phase programs,
`comptime`, and future compiler-hosted languages all use the same machinery.

The companion problem report,
[`jolt-persistent-code-memory-problem.md`](jolt-persistent-code-memory-problem.md),
contains reproduction commands and historical measurements. This document is
the ownership/design analysis.

## Executive summary

`Code` is persistent by default and supports an explicit destructive-consumption
mode; it is not a managed heap. A `Code` value can share list tails and subtrees, while the referenced
storage belongs to allocators whose lifetimes are managed elsewhere. The
metaprogram boundary currently restores simple ownership by deep-copying the
entire returned graph into the caller's allocator.

That policy is safe but expensive. A transform that changes 64 forms and returns
a 6,000-form program copies the entire live result. Repeating that operation
turns incremental work into repeated whole-program copying.

The experiments also established that “the returned syntax tree” is not the
complete root set. `Code` and related allocations can survive through phase
registries, quote registries, staged compiler state, expansion caches, and
module/index side tables. Reclaiming a temporary arena after tracing only the
returned `TaggedForm` graph caused dangling `Code` handles. Merely checking that
the returned tree contains no nursery pointer was insufficient.

The current implementation direction is **explicit compiler-owned arenas with
named lifetime boundaries**, not a tracing heap:

- each metaprogram invocation owns disposable scratch;
- a returned value is copied once into its caller's result arena;
- successive syntax programs use rotating generations;
- an isolated stage compilation owns a disposable loader/resolver/checker arena;
- a compiled engine image owns its code, entry names, and quote registry;
- the final compiler arena holds cumulative source and bodyless callable
  signatures, not transient checked programs.

This is manual memory management at coarse ownership boundaries, with `defer`/
bulk close rather than per-node destruction. Metaprogram authors still write
ordinary programs: ownership is enforced by the compiler host and engine APIs.
A tracing heap remains an option only if measured live-set behavior eventually
shows that explicit phase boundaries cannot bound memory.

The staged Sprout experiment validates the approach. Moving each stage's
loader/resolver/checker graph into a disposable arena and making engine images
self-owning changed global-live memory across desugar/fold/lower from roughly
329/379/429 MiB to 303/319/319 MiB. Each stage compiler now releases a measured
49.3 MiB arena after preserving only its explicit outputs. See
[`sprout-staging.md`](sprout-staging.md).

## The value and storage model

### `Sexp` and `Code`

At compile time, `Code` is represented by `Sexp`.

`Sexp` is a by-value tagged record. Its payload may be:

- an immediate integer, float, or nil;
- a borrowed byte slice for a symbol, keyword, string, or C string;
- a pointer to an `SexpPair`;
- a pointer to an `ArrayList Sexp` for a vector.

An `SexpPair` contains:

- a by-value head `Sexp`;
- a by-value tail `Sexp`;
- an optional lazily-created flattened-list cache;
- an allocator pointer used for that cache and identifying the pair's immediate
  allocation owner.

The pair's allocator does **not** imply ownership of every transitive child.
A newly allocated pair may point at a tail allocated by an older arena. An atom
copied by value may retain a byte slice owned by a different arena and carries
no allocator field of its own.

### Persistence

List operations preserve identity where possible:

- `code-cdr` returns an existing tail;
- `code-cons` allocates one new pair and may retain an existing tail;
- quasiquote may construct a new spine while reusing unquoted values;
- vectors and compatibility flattening can introduce additional buffers.

This is structural persistence, not lifetime management. Sharing a pointer does
not retain the allocator that owns it.

### Mutability

The default semantic `Code` graph is persistent. A transform may instead use
`code-set-car!`, `code-set-nth!`, and `code-prepend!` while consuming an exclusive
root, then mark that transfer with `code-consume!`. Returning the same root without
that explicit marker retains safe copy-out semantics because compiler indexes may
still alias it. There are also mutable implementation details:

- an `SexpPair` may lazily cache a flattened view;
- `ArrayList` storage grows and owns a separate data buffer;
- compiler side tables may cache pointers, names, contexts, or registries;
- metaprogram engine entries are replaced as staging produces newer images.

Any memory design must include these objects or strictly separate them from the
immutable graph.

## Places where `Code` and related storage can live

### 1. Source and loader storage

Parsed source forms normally live in the compilation's root allocator. Atom
slices may refer to copied source bytes or storage created by the reader.

Expected lifetime: the whole compilation, unless the loader is redesigned to
own source units independently.

Typical roots:

- `LS.out` and loaded module forms;
- source registry entries;
- imports, exports, and module names;
- parser and resolver products that retain source syntax.

### 2. Definition-time expansion tower

`expand-stage3` uses a long-lived tower arena plus per-round work arenas. Failed
rounds can be released. A successful checked staging context may be retained by
`StageBox` because later lazy staging still needs it.

Expected lifetime:

- failed work generation: one recovery attempt;
- successful syntax tower: until stage expansion finishes;
- installed checked context: until replaced or the compilation ends.

Important roots:

- `StageBox.checked`;
- staged syntax and original metaprogram forms;
- imports, exports, and definition-name sets;
- lazy-staging context and qualified entry names;
- generated engine entries and their registries.

The retained checked context is why a local “free the successful work arena”
optimization is incorrect.

### 3. Native metaprogram invocation arena

Every native invocation creates a `ScratchArena`. The metaprogram's `CtCtx`
allocates temporary pairs, vectors, boxes, quasiquote builders, and atom bytes
there. Input `Sexp` values are boxed shallowly, so they may still reference the
caller's graph.

Expected lifetime: one entry invocation.

Today, a successful call uses `me-copy-result` to evacuate the complete returned
graph into the caller's allocator, verifies that no pointer into the invocation
arena remains, and closes the arena.

This is a small copying collector with one explicit root—the return value—but it
does not preserve sharing with the input generation.

### 4. Interpreter, Wasm, JIT, and native engine images

`MEEntry` values can own or refer to:

- a native `dlopen` handle and function pointer;
- a Wasm module byte buffer;
- a persistent interpreter context;
- a JIT image;
- a copied quasiquote registry;
- a retained arena for non-native engine data.

Expected lifetime: while any installed entry from that image remains reachable.
Replacing the last entry from an old image permits unloading its handle or
closing its owner arena.

These are roots even when no current transform result refers to them.

### 5. Quasiquote and syntax registries

Metalowering produces registries of quoted `Sexp` pointers. Installed entries
index those registries at runtime. Registry trees are copied into stable engine
storage because the checked program that produced them may be temporary.

Expected lifetime: at least as long as the corresponding engine entry or image.

### 6. Before-expand generations

`run-before-expand` uses two scratch generations. A changed result is built in
the generation not holding the current input. Once accepted, the predecessor
generation can be reset because native transform results are currently deep,
owning copies.

Expected lifetime: current round or next round.

The two-generation scheme bounds obsolete complete results, but each round may
simultaneously hold:

- the old complete program;
- grouped module wrappers for the input;
- the invocation's temporary graph;
- the new complete program;
- structural comparison and indexing data.

### 7. Streaming transform state

The experimental stream protocol separates a stable source from compact cursor
state and batches of emitted module fragments. It avoids returning the already
emitted prefix from every metaprogram step.

Expected lifetime:

- source: the whole stream;
- state: until the next step;
- emitted fragment: the rest of compilation after acceptance;
- invocation temporaries: one stream step.

The source, accumulated destination, and step state must not accidentally share
an arena that is treated as disposable. Conversely, putting all three in one
monotonic arena retains obsolete state and input wrappers.

### 8. Ordinary expansion and checked ASTs

After before-expand convergence, `Code` is parsed into AST nodes. Some checked
programs still contain compile-time-only functions, quoted forms, and nominal
types whose fields mention `Code`. These definitions may be required by a phase
program even though they are not valid runtime layouts.

Expected lifetime: through checking, metaprogram execution, and any later
compiler query that uses the checked model.

Dropping every nominal that transitively mentions `Code` is unsafe: the compiler
or a phase program may still execute a helper whose ABI depends on it. Eagerly
laying out every nominal is also wrong because unreachable metaprogram-only
types are not runtime data. Runtime cleanup therefore needs real function/type
reachability, not a syntactic `contains Code` filter.

### 9. Flattened compatibility views

Consumers calling `sx-items` on a persistent pair may create a flat
`ArrayList Sexp` cache owned by the pair's recorded allocator.

Expected lifetime: the pair's lifetime.

A collector must either trace this cache or treat it as recomputable weak data
and discard it during copying. The latter is preferable.

### 10. Diagnostics and error paths

Diagnostics can contain borrowed slices produced by code operations. Some error
paths deliberately keep an invocation arena alive because `Diag` does not yet
have a complete owning-copy operation.

Expected lifetime: until the diagnostic is rendered.

This is a separate root class and must not be omitted from a collector merely
because successful invocations do not need it.

### 11. Global and process-lifetime boxes

Several subsystems use static boxes: the metaprogram engine, stage state,
warning/suggestion stores, semantic reflection state, build callbacks, and
main-thread service state.

Expected lifetime: process-wide storage whose individual contents may have a
shorter logical lifetime.

Static storage is not automatically a valid owner for pointers into resettable
arenas. Every pointer stored there must either be copied, retained through a
managed owner, or cleared before reclamation.

## Lifetime boundaries

The important boundaries are:

```text
source/root compiler storage
    -> staging/recovery generation
    -> installed phase-program image and registries
    -> invocation scratch
    -> returned transform generation
    -> next transform generation
    -> ordinary AST / checked program
    -> runtime-only monomorphized program
```

At each arrow, one of four things must happen:

1. the destination makes an owning transitive copy;
2. the destination retains the source owner;
3. both objects are managed by a collector with registered roots;
4. the programmer proves and manually enforces a shorter borrow.

The current system primarily chooses option 1. Its safety comes from copying;
its memory problem comes from copying too much and too often.

## Required invariants, independent of design

Any successful design must provide all of these:

1. No pointer or byte slice outlives its storage owner.
2. Returning a shared input suffix is safe without metaprogram cooperation.
3. Temporary quasiquote/matcher trees are reclaimable after an invocation.
4. Superseded transform generations are reclaimable.
5. Phase registries and installed images keep their syntax alive.
6. Diagnostics keep borrowed data alive or own a copy.
7. Flattened caches never extend a graph's logical lifetime.
8. Cycles in side tables cannot permanently retain an otherwise-dead program.
9. Runtime codegen sees only reachable runtime layouts; live `Code` reaching
   runtime remains a hard compiler error.
10. Ownership behavior is identical across native, JIT, interpreter, and Wasm
    metaprogram engines.
11. Metaprogram authors do not need to know which allocator owns their input.
12. Peak memory is bounded by live data plus a documented collection overhead,
    rather than by the number of transform rounds.

## Option 1: automatic reference counting

### Possible design

Replace pair/vector/atom backing storage with heap objects carrying a reference
count. Every `Code` edge retains its target; replacing or destroying an edge
releases it. Atom bytes require their own reference-counted backing object or an
interned/static representation. `Sexp` copies must perform retains, and every
scope/container destruction must perform releases.

An arena-level variant can reference-count whole generations. A generation
records dependencies on older generations whenever one of its nodes borrows an
older node or atom. Releasing the last root recursively releases dependencies.

### Advantages

- deterministic reclamation;
- naturally preserves persistent sharing;
- no tracing pause;
- explicit image/registry ownership fits `MEEntry` replacement;
- arena-level ARC can make retains relatively infrequent.

### Problems

- `Sexp` is copied by value throughout the compiler. Coil does not currently
  insert copy constructors/destructors, so node ARC would require pervasive
  explicit retain/release operations and would be easy to get wrong.
- Atom slices do not identify their owners. ARC requires changing atom
  representation or copying all atom bytes.
- Pair flattening caches create additional owned edges.
- Side-table cycles require weak references or a cycle collector.
- Arena ARC is coarse. One symbol borrowed from an old generation retains that
  entire generation.
- Incremental transforms naturally create predecessor chains. Without periodic
  compaction, arena ARC can retain every generation even though only a small
  suffix from each is live.
- Atomic counts would be unnecessary overhead in the currently serialized
  engine; non-atomic counts still require strict thread handoff rules.

### What must change

- introduce `CodeNode`/`CodeBytes` heap objects or generation handles;
- define copy/drop semantics for `Sexp` and all containing types;
- audit every `store!`, `al-push!`, return, match extraction, and static box;
- define weak handling for caches and lookup tables;
- add cycle tests and cross-thread ownership rules;
- add periodic compaction if using arena-level counts.

### Assessment

Node ARC is not recommended without first adding language-level managed
copy/drop semantics. Arena ARC is viable as part of a hybrid design, but not as
the sole reclamation mechanism.

## Option 2: proper arena setup

### Possible design

Give each phase an explicit arena topology:

- permanent compilation arena;
- staging arena;
- one invocation nursery per metaprogram call;
- current and next transform semispaces;
- stable engine/image arena;
- diagnostic arena;
- runtime AST/mono arena.

Every API states whether a value is borrowed, returned in the caller's arena,
or installed into a longer-lived owner. Cross-arena results are copied exactly
once. No structural sharing crosses an arena boundary unless the older arena is
retained explicitly.

### Advantages

- matches Coil's existing allocator style;
- bump allocation is fast and cache-friendly;
- bulk destruction is simple and deterministic;
- no per-node metadata or retain traffic;
- failures can discard complete work generations cheaply;
- easiest model to inspect in traces.

### Problems

- a pure arena cannot reclaim garbage inside a live generation;
- persistent sharing across generations is either forbidden or retains a whole
  predecessor arena;
- “copy once” is only true if all persistent roots and caches use the correct
  destination allocator;
- the experiments showed that `expand-macro`'s allocator currently serves both
  result allocation and persistent side-table allocation. Treating it as a
  disposable nursery caused dangling handles even after the returned tree was
  verified clean;
- streaming source and destination in the same arena retains both complete
  graphs; putting them in separate arenas requires an explicit lifetime link;
- large discarded intermediates inside one invocation remain until invocation
  completion.

### What must change

- split allocator parameters by role: `temporary`, `result`, `engine`,
  `diagnostic`, and `compiler-root`;
- prohibit persistent side tables from allocating through a temporary/result
  allocator;
- make escape verification cover all registered roots, not only return values;
- document every function returning `Code` as borrowed or owned;
- reset flattened caches when moving graphs;
- retain or copy diagnostics before releasing a work arena.

### Assessment

This is the smallest coherent improvement and should be done even if GC or ARC
is later added. By itself it remains vulnerable to large live graphs and
cross-generation sharing. It is best used as the allocation substrate for GC.

## Option 3: tracing garbage collection

### Possible design

Create a metaprogram heap that owns all `Code`-reachable storage. Allocation
still occurs in bump-allocated generations. The heap registers roots from every
compiler subsystem. Collection traces pairs, vectors, atom backing objects, and
side-table objects. A copying collector moves live data into a compact
generation and discards old arenas wholesale.

Two useful collection levels are possible:

1. **Invocation collection:** evacuate the returned result and any newly
   installed roots from the invocation nursery.
2. **Transform-generation collection:** compact the current authoritative
   program, engine roots, and stage roots after a threshold or phase boundary.

### Root set

At minimum:

- current `TaggedForm` lists and module names;
- before-expand stream source, state, and accumulated output;
- `StageBox` checked program, syntax, imports, exports, and markers;
- every installed `MEEntry` and quote registry;
- interpreter/JIT/Wasm retained contexts where they contain host pointers;
- warning, suggestion, diagnostic, and error-path values;
- semantic reflection tables containing syntax;
- active invocation arguments and return slots;
- active worker/main-thread service call structures;
- any global cache permitted to retain `Sexp` or atom slices.

### Traceable object model

The cleanest implementation gives all non-immediate `Code` payloads a managed
header:

- pair node;
- vector node and element buffer;
- atom byte object;
- optional weak flattened cache.

Headers contain a mark/forwarding word and kind. `Sexp` continues to be a small
value referencing these objects. During copying collection, forwarding pointers
preserve sharing and avoid duplicate copies.

### Advantages

- metaprogram authors need no ownership operations;
- cycles are naturally handled;
- precisely reclaims discarded match/quasiquote trees;
- preserves sharing within the live graph;
- copying compaction breaks long arena dependency chains;
- memory can be bounded by a collection threshold and live-set size;
- all engines can share one host-side lifetime model.

### Problems

- every persistent root must be registered correctly;
- raw pointers into movable objects must be eliminated, pinned, or updated;
- worker-thread calls require a safepoint/stop-the-world protocol, even if only
  one metaprogram runs at a time;
- atom representation must change because a bare slice cannot be traced back to
  its owner;
- checked AST and compiler side tables may contain embedded `Sexp` pointers and
  need tracing descriptors or explicit root callbacks;
- foreign code must not retain unregistered raw `Code` handles across calls.

### Suggested collection policy

- nursery collection after every metaprogram call;
- generation collection when allocated bytes exceed roughly 2x the last live
  size, with an absolute cap configurable for diagnostics;
- unconditional compaction at the end of stage expansion and before ordinary
  runtime expansion;
- weakly drop all flattened caches during collection;
- report allocated, live, copied, promoted, and reclaimed bytes in `COIL_MTRACE`.

### Assessment

This matches the desired user model, but it carries substantially more root,
pointer-update, and safepoint machinery than the current evidence justifies.
Keep it as a fallback if disciplined phase arenas fail to bound a measured
workload.

## Option 4: proper manual memory management

### Possible design

Give `Code` explicit operations such as:

- `code-clone(allocator, value)`;
- `code-destroy(value)`;
- `code-borrow(value)`;
- `code-move(value)`;
- explicit owner handles for atoms, pairs, vectors, and registries.

Every API documents ownership transfer. Metaprograms must clone borrowed input
before storing or returning it, release temporary trees, and preserve owners for
shared children.

### Advantages

- no collector runtime;
- deterministic and potentially minimal memory;
- ownership costs are visible;
- suitable for narrow FFI boundaries and engine-image handles.

### Problems

- fundamentally conflicts with the current ergonomic `Code` API;
- every quasiquote, splice, list operation, container copy, and early return
  becomes an ownership obligation;
- macros can compose arbitrary library code, making ownership contracts viral;
- shared persistent graphs require counts or unique-ownership proofs anyway;
- errors and non-local exits make cleanup difficult;
- atom slices remain a separate ownership hazard;
- one missed release leaks, while one premature release corrupts the compiler;
- it pushes compiler implementation details onto all metaprogram authors.

### Assessment

Manual management is appropriate for coarse external resources (`dlopen`
handles, files, native buffers) and for carefully bounded compiler internals. It
is not appropriate as the public lifetime model for `Code`.

## Comparison

| Property | Node ARC | Arena setup | Tracing GC | Manual |
|---|---:|---:|---:|---:|
| Transparent to metaprograms | Mostly | Yes, if APIs copy | Yes | No |
| Preserves sharing cheaply | Yes | Only within arena | Yes | Difficult |
| Handles cycles | No | N/A / retains arena | Yes | Only by discipline |
| Reclaims intra-invocation garbage | Incrementally | At phase end | Yes | If explicitly freed |
| Bounds generation chains | Not alone | By copying | Yes | By discipline |
| Requires atom representation change | Yes | Not necessarily | Yes | Usually |
| Requires complete root audit | Moderate | High | High | High |
| Per-node runtime overhead | High | Low | Moderate | Low |
| Failure mode | leaks/UAF from count bugs | leaks/UAF from arena escape | missed-root UAF | leaks/UAF everywhere |
| Fit for current Coil | Weak | Good substrate | Best end state | Poor public model |

## Lessons from the experiments

### Deep-copying only the return value is safe but expensive

`me-copy-result` correctly produces an owning graph and closes invocation
scratch. It is effectively a one-root copying collection. It loses sharing with
the input, so small edits still copy the whole result.

### Persistent list structure alone does not solve lifetime

Sharing an unchanged tail inside a metaprogram reduces construction work, but
the boundary copy duplicates it. Preserving the pointer without retaining or
tracing its owner would create a dangling reference.

### A monotonic “persistent” arena retains superseded prefixes

Reusing destination-owned pairs reduced copying but grew by roughly 112 MiB per
round in one experiment. Persistence without reclamation merely changes where
the garbage accumulates.

### Compact cursors reduce traversal, not ownership cost

The reverse-prefix/pending-suffix cursor improved early rounds, but the complete
cursor graph still crossed the ownership boundary each time and eventually
consumed several GiB.

### Streaming is not the ownership model

Returning only new fragments plus compact state is valuable. It does not by
itself define where the pinned source, fragment destination, state, registries,
or compiler caches live. It should not be required by the metaprogram interface:
an ordinary whole-program `Code -> Code` stage is the baseline. A future
incremental API is justified only by a measured algorithmic need and must use
the same explicit arena boundaries.

The experimental `before-expand-stream` request/reply protocol and Scheme's
syntax cursor have now been removed. Scheme syntax expansion is an ordinary
whole-program transform, followed by explicit whole-program lowering stages.
The dialect returns an unchanged lowered program to establish the compiler's
structural fixpoint.

### A returned-tree escape check is not a complete collector

An experimental nursery copied/verified every returned `TaggedForm` and module
name before closing. Jolt still later received invalid `Code`. Another variant
failed when an escaped pair attempted to allocate through the now-closed arena.
The missing roots were outside the returned graph, demonstrating that allocator
roles and global side roots must be separated before collection.

### Syntactic deletion of `Code` nominals is unsafe

Deleting every struct/sum containing `Code` allowed some small programs to reach
codegen, but corrupted phase-program ABIs. A helper can mention such a nominal
indirectly even when its top-level signature does not contain literal `TCode`.

### Eager layout is not reachability

The layout engine currently encounters metaprogram-only nominal types because
monomorphization seeds broad sets of concrete definitions. Simply skipping
“unlayoutable” types while still emitting dependent functions can also corrupt
the compiler. Runtime cleanup must begin from emitted roots and traverse both
function and type dependencies.

### Bootstrap provenance matters

A byte-identical stage-2/stage-3 fixpoint proves reproduction, not semantic
correctness of stage-0. An unsafe compiler can reproduce the same unsafe
compiler. Experiments must rebuild from a known-good pre-experiment stage-0 and
disable or isolate the metaprogram image cache.

## Recommended architecture

### Phase 1: make allocator roles explicit

Introduce an engine-owned context containing:

```text
MetaHeap
  permanent/image generation
  active invocation nursery
  current transform generation
  root registry
  weak-cache registry
  diagnostic roots
```

Replace ambiguous allocator parameters at metaprogram boundaries with an
explicit context or separately named allocators. Persistent tables may allocate
only from the heap/image allocator. Invocation constructors allocate only from
the nursery.

### Phase 2: enumerate and register roots

Each subsystem supplies a trace callback or explicit root slots. Static boxes
must register and unregister their current contents. Engine entry replacement
must update roots before releasing the old image.

Add a debug mode that poisons collected arenas and validates every `Code`
operation against the heap registry.

### Phase 3: managed object representation

Move pairs, vectors, and atom bytes to traceable objects. Keep source/static
atoms distinguishable and non-moving. Treat flattened caches as weak,
recomputable objects.

### Phase 4: nursery collection

After an invocation:

1. stop the worker at the existing join boundary;
2. add its return slot and installed side roots to the root set;
3. copy/forward live nursery objects;
4. update roots;
5. release the nursery arena;
6. verify that no registered root points into released storage.

### Phase 5: generation compaction

When transform allocation exceeds the live-size threshold, trace all engine and
compiler roots into a fresh generation. This collapses persistent predecessor
chains. Release every unreferenced old generation as one operation.

### Phase 6: runtime reachability

Before runtime codegen, compute a real closure from runtime entry/export roots:

- functions called or referenced by function pointer;
- constants and static data used by those functions;
- structs/sums appearing in signatures or expression operations;
- transitive nominal field/variant types;
- trait/vtable dependencies.

Only this closure is monomorphized or laid out. Encountering `Code` in that live
closure remains an error with a dependency path explaining why it is live.

## Testing requirements

### Ownership correctness

- return an unchanged input tree;
- return a new prefix sharing an input tail;
- extract an input symbol and place it in a new pair;
- share one subtree from multiple parents;
- create vectors containing shared pairs;
- populate and then discard flattened caches;
- store syntax in a phase registry after the producing call returns;
- replace an engine image while another entry from the old image remains;
- render a diagnostic after its invocation failed;
- exercise native, JIT, interpreter, and Wasm engines.

### Collection behavior

- allocate large discarded matcher/quasiquote trees and verify they are
  reclaimed after the call;
- run hundreds of bounded transform steps and verify peak memory is independent
  of step count for a fixed live result;
- force compaction with shared predecessor generations;
- verify cycles in side tables do not retain dead syntax;
- poison released arenas and run all metaprogram tests.

### Runtime reachability

- an unreachable struct containing `Code` must not reach layout;
- a reachable runtime dependency containing `Code` must produce a diagnostic;
- a phase-program helper indirectly using a `Code` container must remain live
  while that phase image executes;
- compiler self-hosting must retain its required host-side `Sexp` machinery.

### End-to-end acceptance

The work is complete only when all of the following hold:

1. the self-hosted compiler reaches a byte-identical fixpoint from a known-good
   stage-0;
2. the bounded modernization gate passes;
3. compiler runtime, C ABI, and encoder gates pass;
4. all Scheme dialect tests pass;
5. unchanged Jolt `host/chez/rt.ss` builds successfully;
6. `/usr/bin/time -v` and `COIL_MTRACE` show a bounded, explained peak;
7. the produced Jolt runtime executes a real lexical closure;
8. the same test succeeds with metaprogram caching disabled and from a clean
   cache, preventing a stale image from masking ownership defects.

## Recommendation

Adopt **tracing GC over explicit arena generations**.

The arena work is not an alternative to GC; it is the mechanism that makes a
collector fast and makes reclamation observable. A small amount of coarse ARC
can still manage engine images and arena handles, while files, dylib handles,
and other external resources remain manually managed. The `Code` graph itself
should have one automatic tracing model.

In short:

- GC for `Code`, atom storage, and syntax graphs;
- arenas for allocation and bulk reclamation;
- coarse reference counts for non-cyclic engine/image ownership;
- manual cleanup only for external resources;
- reachability-based pruning for the transition from metaprogram program to
  runtime program.

This division keeps metaprogram code simple, makes ownership a compiler concern,
and addresses both correctness and the repeated-copy memory curve observed in
Jolt.

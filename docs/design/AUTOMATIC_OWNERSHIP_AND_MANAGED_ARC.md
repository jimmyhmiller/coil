# Automatic Ownership and Allocator-Aware `Arc`

**Status:** ownership and allocator-aware `Rc`/`Arc` substrate implemented. The
superseded managed-declaration dialect has been removed.

**Correction:** The earlier managed-declaration surface did not provide the
requested ML-style transparent ARC experience and is no longer part of Coil. The
definitive replacement requirements live in
[`TRANSPARENT_AUTOMATIC_ARC.md`](TRANSPARENT_AUTOMATIC_ARC.md). The ownership,
cleanup, allocator-lease, and `Arc` machinery in this document remains substrate
for that work.

## Goal

Add an opt-in ownership layer to Coil that supports all three of these styles in
one program:

1. existing explicit allocation and freeing;
2. move-only values with deterministic automatic destruction;
3. a transparent whole-program transform that presents ML-like automatic memory
   management while using allocator-aware `Rc`/`Arc` owners underneath.

The design must not impose destructors, hidden allocation, or reference counting
on existing values. It must not silently use a global allocator when an owner was
created from another allocator. It must preserve Coil's raw-pointer and FFI
facilities and compose with the existing lexical `scope`/`defer` mechanism.

## Non-goals

- Replacing explicit memory management or raw pointers.
- Making every scalar or value struct heap allocated.
- A tracing garbage collector.
- Reclaiming arbitrary strong reference cycles in the first implementation.
- Inferring Rust's complete lifetime system before `Arc` is useful.
- Special-casing a type named `Arc` in the compiler.

## 1. User model

Coil will have three explicit levels of memory management:

| Level | Allocation | Sharing | Cleanup |
|---|---|---|---|
| Raw/manual Coil | Explicit allocator API | Raw pointers and borrowed views | Explicit `free`/`destroy` or `defer` |
| Owned Coil | Library owner types | Move by default; explicit `clone` | Compiler-generated `Drop` |
| Managed Coil | Metaprogram rewrites managed objects | Clone insertion and later last-use optimization | The same compiler-generated `Drop` |

Existing code remains in the first level until a type explicitly opts into the
ownership layer.

### 1.1 Opt-in destruction

Introduce compiler-known traits with ordinary trait syntax:

```coil
(deftrait Drop [Self]
  (drop [(self (mut Self))] (-> void)))

(deftrait Clone [Self]
  (clone [(self (ref Self))] (-> Self)))

(deftrait Copy [Self])
```

The compiler recognizes the semantics of these traits, but their implementations
remain ordinary inspectable Coil definitions. A type is:

- **copyable** when it has `Copy` and needs no ownership transfer;
- **affine** when it has `Drop`, or structurally contains a value that needs drop;
- **ordinary legacy/manual** when neither rule applies.

`Drop` is opt-in. Integers, floats, booleans, raw pointers, slices, function
pointers, and existing structs do not acquire cleanup merely because this feature
exists. In particular, a raw pointer never implies ownership.

The compiler computes `needs-drop?(T)` structurally. A struct, active sum payload,
array, or generic instance containing a droppable value receives generated drop
glue. Fields and array elements are dropped in reverse initialization order.

### 1.2 Moves and clones

Binding, passing, returning, and storing an affine value transfers ownership.
Using the source after a transfer is an error. Sharing is explicit in owned Coil:

```coil
(let [a (arc-new-in allocator value)
      b (clone a)]
  (use b)
  (use a))
```

There is no implicit bitwise copy of `Arc`. `clone` increments the appropriate
reference count. Moving an `Arc` changes no count.

The first checker may conservatively reject partial moves out of aggregates.
Partial moves can be added only with place/projection-aware state and drop flags.

## 2. Allocator ownership

Automatic cleanup must return storage to the allocator that created it. The
current `(dyn Allocator)` is explicitly borrowed and copyable; it does not extend
the allocator implementation's lifetime. Saving one inside an escaping owner is
therefore not a safe general solution.

### 2.1 `AllocatorLease`

Add an owned, move-aware, cloneable allocator capability, tentatively named
`AllocatorLease`. A type-erased representation is conceptually:

```coil
(defstruct AllocatorLease
  [(state (ptr i8))
   (vtable (ptr AllocatorLeaseVTable))])
```

Its operations include allocation/deallocation plus cloning and dropping the
lease. A live lease guarantees that the allocator state remains valid. A borrowed
`(dyn Allocator)` remains the cheap interface for scoped calls; an
`AllocatorLease` is required when an allocation owner may escape the allocator's
lexical scope.

The API must make this distinction type-visible:

```coil
(arc-new-in lease value)                 ; safe, retains allocator lifetime
(arc-new-with-borrowed allocator value) ; absent, or explicitly unsafe/scoped
```

Concrete generic owners such as `(ArcIn T A)` may retain allocator capability
`A` without dynamic dispatch. The ordinary `(Arc T)` may use a type-erased lease
for a stable public type.

### 2.2 Allocator categories

- **Malloc/process-lifetime:** can provide a trivial stable lease.
- **Owned regions:** require a new leased-region owner. Existing forceful
  `region-close!` semantics must not silently change.
- **Scratch/arena:** cannot generally back escaping `Arc`s because reset invalidates
  all pointers. Reject it as a general lease, or expose a separate scope-bounded
  owner whose values cannot escape the arena scope.
- **Nested allocators:** an allocator lease retains its parent lease, so allocator
  destruction naturally occurs after all dependent allocations are gone.

## 3. `Rc`, `Arc`, and weak ownership

Implement reference counting as standard-library types over the ownership
substrate, not as compiler-known special cases.

`Rc<T>` uses non-atomic counts and is not thread-safe. `Arc<T>` uses atomics. Both
have strong and weak counts so the allocation remains present while weak handles
exist after `T` has been destroyed.

Conceptually, an allocation contains:

```text
control block
├── strong count
├── weak count
├── value-live state
├── allocator lease
└── T
```

Required operations include:

- `new-in`, `clone`, borrowed access;
- strong/weak count inspection for diagnostics;
- `downgrade` and `upgrade`;
- `get-mut` only when uniqueness is established;
- `into-raw`/`from-raw` as explicitly unsafe ownership escapes;
- `try-unwrap`/`into-inner` where sound;
- `Drop` for strong and weak handles.

### 3.1 Last-strong and last-weak ordering

On the last strong release:

1. acquire the synchronization required to observe preceding writes;
2. drop `T` exactly once;
3. release the implicit weak reference held while strong owners exist.

On the last weak release:

1. move the allocator lease out of the control block;
2. deallocate the control block with that lease;
3. drop the moved-out lease.

The lease cannot be read after freeing the block that stored it. The atomic memory
ordering must be designed and tested rather than inferred from the current
sequentially-consistent primitives. The first correct implementation may use
sequential consistency; weaker orderings are a measured follow-up.

### 3.2 Contained value and allocator choice

Dropping `T` invokes `T`'s generated drop glue before the control block is freed.
`T` may itself own allocations from other allocators; each nested owner carries
its own allocator capability. The allocator used for the `Arc` control block need
not be the allocator used by resources inside `T`.

## 4. Move checking and drop elaboration

The compiler needs a general ownership pass. It must key local state by canonical
binding identity, not source spelling. Existing checked `binding-of` identities
provide the foundation.

### 4.1 State tracked

At minimum, each affine local has these states:

```text
uninitialized -> initialized -> moved or dropped
```

The analysis must join states across `if`/`match`, handle loop backedges, and
distinguish a borrow from ownership-consuming use. Later partial-move support adds
state for field/index projections and conditional drop flags.

### 4.2 Cleanup edges

Drop elaboration inserts cleanup on every edge leaving a lexical scope:

- normal fallthrough;
- `break` and `continue`;
- `return-from` after macro expansion;
- function return;
- replacement of an initialized affine mutable place;
- the active path through `if` and `match`.

Cleanups run in reverse initialization order. A value moved out on an edge is not
dropped on that edge. Generated aggregate drop glue recursively destroys only
initialized fields and the active sum payload.

Add an explicit checked/lowered cleanup representation rather than duplicating
control-flow logic independently in every backend. LLVM, x64, AArch64, Wasm, and
the interpreter must consume the same elaborated semantics.

## 5. Interaction with `scope` and `defer`

The existing `scope`/`defer` implementation is a lexical macro over labeled
`block`/`break`. It emits direct defers in LIFO order and rejects control transfers
that would silently skip them. It remains useful for action-oriented cleanup and
manual resources.

`Drop` is intrinsic to an owning value; `defer` is an explicit action selected by
the programmer. They compose by ordinary lexical nesting:

```coil
(scope :request
  (defer (restore-terminal-mode))
  (let [connection (open-owned-connection)
        state (arc-new-in lease initial-state)]
    ...))
```

The inner owned values drop in reverse initialization order when their `let`
ends; the enclosing scope then performs its defers according to the current macro
semantics.

It is an error in program logic to manually free or defer-release a value that is
also automatically dropped. Provide deliberate escape hatches:

- `ManuallyDrop<T>` suppresses automatic drop while preserving storage;
- `forget` consumes an owner without running its destructor;
- `take!` moves a value out and leaves a known empty/uninitialized state;
- raw conversions transfer responsibility explicitly.

Lints should diagnose obvious double-management patterns, but soundness must come
from ownership APIs and move checking rather than lint alone.

## 6. Transparent ARC metaprogram

The replacement is a compilation-unit transform over ordinary Coil source. Its
design, source contract, allocator rules, and acceptance criteria are maintained
in [`TRANSPARENT_AUTOMATIC_ARC.md`](TRANSPARENT_AUTOMATIC_ARC.md).

### 6.1 Conservative first elaboration

Correctness does not depend on last-use optimization. Initially:

- a local retains its owner until scope exit;
- passing/storing the same owner elsewhere inserts `clone`;
- borrow-only operations do not clone;
- return or explicit `move` transfers ownership;
- the ordinary move checker validates the transformed program;
- ordinary drop elaboration releases every remaining owner.

A later ownership optimization can replace a final clone with a move and remove
balanced retain/release pairs.

### 6.2 Required compiler phase

Today's phases are insufficient for a fully correct automatic ownership
transform. Before-expansion transforms lack semantic type/binding information;
semantic transforms run after authoritative typechecking. Once affine checking
exists, apparent repeated use would be rejected before a late transform could
insert clones.

Add an ownership-elaboration transform phase:

```text
read and expand
    -> resolve and ordinary type synthesis
    -> ownership-elaboration transforms
    -> authoritative re-resolution/typecheck
    -> move/borrow checking
    -> drop elaboration
    -> mono/codegen
```

This phase sees stable binding identities and inferred types but runs before
ownership errors are finalized. Its output is rechecked; the transform is never
trusted for soundness.

Managed ARC remains opt-in by module, declaration, or lexical scope. Public ABI,
FFI, and ordinary/managed boundaries require explicit owner, borrow, clone, adopt,
or raw conversion semantics.

### 6.3 Cycles

Strong cycles leak by design in the first release. `weak` fields and explicit
`Weak<T>` are the cycle-breaking mechanism. Diagnostics may identify obvious
strong self-cycles, but no initial claim of general cycle collection is made.

## 7. Implementation sequence

Each phase has an independently useful deliverable and must pass the focused gate
before the next phase begins.

### Phase 0: freeze semantics in tests and design fixtures

- Add compile-only fixtures spelling the intended `Copy`/move/`Drop` behavior.
- Add negative fixtures for use-after-move, double move, invalid branch joins,
  and borrowed allocator escape.
- Add control-flow fixtures covering `let`, `if`, `match`, loops, labeled exits,
  and macro-expanded `scope`/`defer`.
- Decide whether ordinary legacy aggregates without `Drop` retain their current
  view/copy behavior; this plan says yes.

### Phase 1: type properties and traits

- Define compiler-known `Copy`, `Clone`, and `Drop` identities in `coil.core`.
- Add structural `needs-drop?` and `is-copy?` queries after generic substitution.
- Reject contradictory or unsafe implementations.
- Add derive support for `Clone` and, where meaningful, `Copy`; aggregate `Drop`
  glue is compiler-generated rather than derived source boilerplate.

### Phase 2: affine move checker

- Track whole-binding move state using canonical binding IDs.
- Cover parameters, lets, calls, returns, constructors, stores, `if`, `match`, and
  loops.
- Start by rejecting partial moves and ambiguous loop-carried ownership.
- Produce source-located diagnostics naming the original move and invalid reuse.

### Phase 3: cleanup IR and drop elaboration

- Add a checked cleanup representation shared by all backends/interpreter.
- Insert reverse-order drops on every scope exit and before overwrite.
- Generate recursive drop glue for structs, sums, arrays, and generic instances.
- Add `ManuallyDrop`, `forget`, and `take!` with precise semantics.
- Verify no drops are duplicated or skipped by labeled control flow.

### Phase 4: allocator leases

- Specify the concrete `AllocatorLease` ABI and object-safety requirements.
- Implement a process-lifetime malloc lease without changing ordinary allocator
  APIs.
- Implement typed/type-erased lease conversion and parent-lease retention.
- Add a separate leased-region owner; do not alter existing force-close Region.
- Explicitly reject unsupported scratch allocator escape.

### Phase 5: explicit `Rc`/`Arc`/`Weak`

- Implement `Rc<T>` first to validate ownership and allocator plumbing without
  concurrency.
- Implement `WeakRc<T>`, last-strong value destruction, and last-weak allocation
  destruction.
- Implement `Arc<T>`/`Weak<T>` using current seq_cst atomics.
- Add concurrency stress tests and sanitizer tests before weakening atomics.
- Test nested values whose payload and control block use different allocators.

### Phase 6: ownership-elaboration metaprogram phase

- Split ordinary type synthesis from final affine validation.
- Expose checked types and binding identities to the new phase.
- Re-resolve and authoritatively recheck transform output.
- Add phase-order and fixpoint guards so transforms cannot observe stale semantic
  facts.

### Phase 7: transparent ARC transform

- Lower ordinary payloads, constructors, fields, weak handles, and boundaries.
- Insert conservative retains and releases; rely on move checking and drop
  elaboration for soundness.
- Apply to every user module in the configured compilation unit.

### Phase 8: optimization and ergonomics

- Last-use clone-to-move optimization.
- Retain/release pair elimination.
- Uniqueness-aware mutable access and allocation reuse where profitable.
- Better diagnostics for cycles, accidental atomic sharing, and allocator mismatch.
- Consider a scope-bounded arena owner separately from freely escaping `Arc`.

## 8. Verification strategy

During compiler development, build one candidate and repeatedly run:

```sh
python3 scripts/dev.py test modernize-fast --compiler <candidate>
```

Use focused unit/feature tests for each phase. Do not run `build full` while
iterating. After focused tests and the fast gate pass, run the repository's
all-stage snapshot audit, refresh all intentional cross-cutting snapshot changes
in one operation, and finally run one full release verification as directed by
`AGENTS.md`.

Required test families:

- compile-pass/compile-fail move-state matrices;
- exact destructor order and exactly-once counters;
- every control-flow exit, including nested labeled exits and `scope` macros;
- generic and recursive aggregate drop glue;
- allocator provenance and allocator-lifetime failures;
- strong/weak lifecycle transitions;
- multithreaded `Arc` clone/drop/upgrade races under thread/address sanitizers;
- FFI/raw conversion round trips;
- managed-transform semantic and diagnostic snapshots;
- compatibility corpus proving unchanged behavior for non-opted-in code.

No phase is complete based only on LLVM behavior: the interpreter and every
maintained backend must either implement the cleanup representation or reject it
explicitly until they do.

## 9. Decisions made by this plan

- Automatic destruction is opt-in and structural, not universal.
- Raw pointers remain non-owning and manually managed.
- `Arc` is a library type built on general move/drop semantics.
- Every escaping owner retains the allocator that created its storage through an
  owned allocator lease.
- Existing borrowed `(dyn Allocator)` is not silently promoted to an owned lease.
- Existing `scope`/`defer` remains and composes lexically with automatic drops.
- Managed ARC is an opt-in typed metaprogram, not the default Coil semantics.
- Managed ARC uses explicit lexical/declaration allocator selection, not a mutable
  global allocator.
- The managed transform is checked, not trusted, and requires a new phase before
  affine validation.
- Strong cycles require weak handles in the first release.

## 10. Implemented decisions and remaining boundaries

- `Drop.drop` returns `void`. `Copy` may be written or derived, but the compiler
  rejects implementations for types that need drop and requires appropriate
  generic `Copy` bounds.
- `AllocatorLease` stores borrowed allocator dispatch plus retained lease state
  and clone/drop callbacks. Safe escaping construction is provided for malloc and
  leased regions; arbitrary construction is explicitly unsafe.
- `Rc` is thread-confined. `Arc` uses sequentially consistent atomics for the
  initial correctness implementation. Moving an `Arc` between threads is sound
  only when its allocator lease and callbacks are themselves thread-safe; Coil
  does not yet have a `Send`-like trait with which to prove this statically.
- `rc-borrow`, `arc-borrow`, and generated managed borrows return non-owning
  pointers. They must not outlive the strong owner. The affine checker prevents
  accidental owner duplication but is not a general reference-lifetime checker,
  so storing or returning these pointers remains an explicitly borrowed/manual
  boundary.
- Managed declarations lower to `Arc`, making their sharing mode explicit and
  consistently safe for atomic reference counts. Allocator thread-safety remains
  the lease provider's responsibility as described above.
- Strong cycles are not collected. Weak fields and handles are the supported
  cycle-breaking mechanism.

Phase 8 may reduce conservative clones and improve diagnostics. It must preserve
the already implemented architecture: opt-in ownership, allocator-carrying
owners, and checked automatic ARC elaboration.

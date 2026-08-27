# Transparent Automatic ARC

**Status:** definitive implementation target.

## Implementation status

The implementation is in progress. The current transform handles transparent
`ArrayList` allocation, ordinary and generic structs, sums and recursive values,
aliases, recursive destruction, and closure records/environments. Closure calls
borrow an affine callable receiver; environments retain captures; call-local
capture bindings retain independently; and final closure release recursively
destroys the environment and captured values. The closure behavior and lifetime
fixtures pass under AddressSanitizer with leak detection.

The feature is not complete until every acceptance criterion below passes.
Strings, complete control-flow ownership, weak references, declared manual/FFI
boundaries, configurable allocator provenance tests, all maintained backends,
snapshot coverage, and final self-host verification remain open.

## Objective

Coil shall provide a whole-program metaprogram mode that gives ordinary Coil
source ML-style automatic memory management backed by allocator-aware reference
counting. Enabling the transform may happen through the compiler command line or
one transform import. Program declarations and expressions shall contain no ARC,
allocator, ownership, or managed-object ceremony.

The model follows the transparent-GC prototypes in `coil-experiments`:
`transparent-gc/gcauto.coil` and `mini-scheme/gcauto2.coil`. Those transforms
rewrite representation and insert collector operations beneath ordinary source.
This transform inserts allocation, retain, release, and destruction operations.

## Source contract

Code under transparent ARC uses ordinary definitions, constructors, bindings,
collections, calls, mutation, closures, returns, and pattern matching:

```coil
(defstruct Person
  [(name String)
   (friends (ArrayList Person))])

(defn make-person [(name String)] (-> Person)
  (let [friends (al-new [Person])]
    (Person :name name :friends friends)))
```

The author shall not write any of the following for routine ownership:

- `Arc`, `Rc`, `Clone`, `Drop`, or explicit `clone` calls;
- `defmanaged`, `managed-new`, or `managed-scope`;
- allocator parameters or allocator arguments at allocation sites;
- retain, release, root, free, or destructor calls;
- pointer wrappers introduced only to satisfy the memory manager.

The transform activation is configuration, not a lexical ownership boundary. It
applies to every user module in the selected compilation unit. Imported runtime,
FFI, and explicitly manual modules use declared boundary rules.

## Semantic model

### Values and heap objects

The compiler keeps immediate and profitable fixed-size values unboxed. Examples
include integers, floats, booleans, enums without managed payloads, and compiler-
proven value aggregates.

When a value requires heap storage, the transform allocates it and represents all
ordinary references to that object as managed references. This includes:

- dynamically sized collection buffers and strings;
- closures and captured environments;
- recursive values and values whose representation requires indirection;
- aggregates selected for heap representation by the transform;
- heap-owning standard-library values nested inside structs, sums, arrays, or
  other collections.

The source-level type remains the type the author wrote. `Arc<T>` and control-block
types exist only in lowered code.

### Automatic ownership operations

The transform uses checked types, canonical binding identities, and control-flow
information to insert ownership operations:

- construction or allocation creates one strong reference;
- duplication into another live location retains the object;
- a proven last use transfers the reference without changing its count;
- overwrite and loss of liveness release the old reference;
- returns, arguments, fields, collection elements, closure captures, globals,
  branch joins, match bindings, loops, and labeled exits receive the same rules;
- the last strong release destroys the payload recursively and exactly once;
- the last weak release frees the control block.

Conservative retains are acceptable in the first correct implementation.
Missing retains, premature releases, leaks caused by omitted releases, and
source-visible ownership work are not acceptable.

### Allocators

The compiler selects a default `AllocatorLease` for the transformed program and
threads it through lowered allocation paths. User code does not pass that lease.
Every control block retains the lease that allocated it. The final release frees
storage through that lease and then releases the lease.

The initial mode may use the process-lifetime malloc lease as its configured
default. Compiler configuration may select another safe lease provider. The
implementation shall not consult a mutable global current allocator and shall not
free an object through an allocator other than its recorded origin.

### Mutation, sharing, and cycles

Aliases observe shared mutable heap objects. Reference-count operations preserve
that identity. Value types retain value semantics even when their nested storage
uses managed references.

Strong cycles retain their allocations. A separate explicit weak-reference API
breaks cycles. Ordinary acyclic programs require no weak annotations.

### Manual and FFI boundaries

Transparent ARC must coexist with existing manual Coil. A boundary declaration
states whether an imported or exported value is borrowed, transferred, retained,
or unmanaged. Raw pointers never acquire ownership by inference. The transform
shall diagnose an unknown ownership boundary instead of guessing.

## Required architecture

The obsolete managed-declaration public model has been removed from
`coil.arc.auto`; the implementation is a whole-program ownership transform. It shall reuse the
existing allocator leases, `Arc` control-block lifecycle, affine analysis, cleanup
IR, and ownership-elaboration phase where they fit.

The transform needs these passes:

1. Collect user modules and exclude the transform runtime and declared manual
   boundary modules.
2. Classify types and operations as immediate, value-with-managed-members, or
   managed heap reference.
3. Compute the transitive allocation effects of functions.
4. Rewrite heap-producing types, constructors, collection operations, closures,
   signatures, and storage locations.
5. A-normalize expressions so each managed temporary has a stable binding.
6. Insert retains, moves, releases, recursive destruction, and allocator plumbing
   across every control-flow edge.
7. Re-resolve and authoritatively typecheck the transformed program.
8. Run affine/drop validation over lowered ownership values before mono and
   backend code generation.

The transform must be idempotent or reject repeated application with a clear
diagnostic. Generated bindings must use hygienic identities and must not write
compiler gensym spellings such as `$g123i` into authored source files or user
diagnostics.

## Definitive acceptance criteria

The feature is complete only when all criteria below pass.

### Source transparency

1. A representative application creates structs, sums, strings, `ArrayList`s,
   nested collections, closures, and recursive values without spelling an
   allocator, `Arc`, `Rc`, `clone`, `Drop`, `defmanaged`, `managed-new`, or
   `managed-scope`.
2. The application enables transparent ARC only through compiler configuration or
   one transform import. Removing that activation leaves the rest of its source
   text unchanged.
3. Public function signatures and user-visible diagnostics show source-level
   types rather than lowered `Arc` wrappers.

### Correctness

4. Copies, stores, arguments, returns, captures, branch joins, loops, mutation,
   and pattern matching keep every live object alive and release every dead
   reference.
5. Acyclic stress programs finish with zero live control blocks and zero live
   allocator leases.
6. Payload destructors run once, in deterministic recursive order, on the final
   strong release.
7. Nested allocations return to their recorded allocator. Tests use distinct
   counting allocators and fail on cross-allocator deallocation.
8. Weak upgrade succeeds while a strong reference exists and fails after the last
   strong release. Weak handles do not keep payloads alive.
9. Closure environments retain captures and release them when the final closure
   reference dies. Tail-recursive allocating programs keep bounded live counts.
10. Explicit manual and FFI boundaries pass ownership according to their declared
    contracts; unknown boundaries produce compile-time diagnostics.

### Coverage and compatibility

11. LLVM, the interpreter, arm64, x64, and Wasm consume the same lowered ownership
    semantics. A backend may not silently omit a retain, release, or destructor.
12. AddressSanitizer reports no leaks, use-after-free, or double-free in the
    transparent ARC corpus. ThreadSanitizer reports no count races in the atomic
    sharing corpus.
13. Existing manual Coil compiles and behaves as before when the transform is not
    enabled.
14. Snapshot tests show the source-to-lowered transformation and prove that final
    affine checking runs after it.
15. The self-host compiler reaches its stage-2/stage-3 fixed point with the
    transform implementation present.

## Rejected substitute designs

The following do not satisfy this document:

- requiring managed declarations or managed lexical scopes;
- asking users to choose `Arc<T>` or call `clone` in routine code;
- supporting only one nominated payload type;
- rewriting constructors while leaving collections, closures, or function
  boundaries manual;
- using a global allocator or losing allocator provenance;
- treating deterministic `Drop` for explicit owners as transparent ARC;
- passing a demo while leaking references on loops, branches, or captures.

## Delivery sequence

1. Replace the current surface tests with source-transparency fixtures modeled on
   the transparent-GC programs.
2. Implement general managed-type and allocation-effect classification.
3. Lower standard heap producers, starting with strings and `ArrayList`, then
   structs, sums, recursive values, and closures.
4. Insert ownership operations across expressions and control flow.
5. Add allocator provenance, weak-reference, boundary, and cycle tests.
6. Complete interpreter and maintained backend coverage.
7. Run focused gates, the cross-stage snapshot audit, sanitizer suites, runtime
   corpora, and one final full self-host verification.

Optimization follows correctness. Retain/release cancellation, last-use transfer,
stack promotion, and representation specialization may reduce overhead after the
acceptance corpus proves the unoptimized semantics.

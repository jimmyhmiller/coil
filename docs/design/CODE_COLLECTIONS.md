# Code as a Collection

## Status

Implemented. This document records the design and its boundaries.

## Problem

Coil has one language at runtime and compile time, but metaprograms have looked as
though they use a second collection library. Runtime code uses `len`, `get`,
`push!`, `iter`, and `next`; syntax code uses `primitive/code-count`,
`primitive/code-nth`, `primitive/code-list-push!`, and hand-written index loops.
The distinction is representationally important but ergonomically too broad:

- a finished `Code` list or vector is an immutable sequence of child `Code` values;
- a `CodeBuilder` is an append-only collection under construction;
- neither participated in the collection traits that already describe those exact
  capabilities;
- generic-looking metaprogram walks therefore duplicated indexed recursion and
  code-specific push loops;
- moving values between ordinary collections and generated code required rewriting
  the traversal even when the element type was already `Code`.

The previous memory work fixed the dangerous representation facts: inputs are
borrowed, builders allocate in an invocation arena, views are O(1), and exactly the
returned syntax is promoted. This design must preserve those facts. Ergonomics is
not a reason to make syntax mutable again or to hide an unbounded copy.

## Existing constraints

### The useful machinery already exists

`coil.core` defines capability traits rather than a monolithic `Collection`:

| Capability | Method | Meaning |
|---|---|---|
| `Len` | `len` | finite count |
| `Get [K E]` | `get` | indexed/keyed lookup |
| `Set [K E]` | `set!` | replacement through a mutable receiver |
| `Push [E]` | `push!` | append/insert through a mutable receiver |
| `Pop [E]` | `pop!` | remove one item |
| `Iterable [It]` | `iter` | mint independent traversal state |
| `Iterator [Item]` | `next` | yield `Option Item` |

The non-`Self` trait parameters are associated types determined by an impl. Slices,
`ArrayList`, and `HashMap` already implement the relevant subsets. This is the right
model: capabilities expose what a representation can safely do instead of asserting
that every collection is growable, indexable, or owning.

### Code has a stronger lifetime contract

The metaprogram contract is borrow, build, promote:

1. argument and quote-registry `Code` is borrowed and immutable for one invocation;
2. newly constructed syntax and builder storage belongs to that invocation's arena;
3. only the returned finished `Code` is deep-promoted across the boundary.

`code-rest` and `code-slice` are immutable O(1) views. `code-copy` and
`code-concat` are the named copying operations. Identifier hygiene is syntax-object
identity, so collection operations must transport the original children rather than
recreate them from spelling.

### Fixed arrays are not length-generic today

An array's length is part of its type, `(array T N)`, but Coil has type generics and
no const/value generics. An impl can target `(array T 4)` but cannot express one impl
for every `N`. Array literals borrow as slices where a `(slice T)` is expected, and
fixed array places can be walked explicitly with `(over array length)`. Adding
compiler-synthesized trait impls or const generics solely for this feature would be a
large and unrelated language change.

### Associated-type equality is not expressible

A generic function can require `(I Iterator)` or `(C Push)`, but it cannot state
that `<I as Iterator>::Item` equals `<C as Push>::E`. That prevents a fully generic
`extend` function even though a concrete `next` value can plainly be passed to a
concrete `push!`. A macro can emit those calls at an ordinary runtime use site, but
is not a general solution: staged macro expansion does not retain every compile-time
trait impl in every generated program. Concrete loops remain type-safe and reliable.

## Decision

### 1. Finished Code is an immutable collection

`Code` implements:

- `Len` via a list/vector shape check followed by `primitive/code-count`;
- `Get [i64 Code]` via `primitive/code-nth`;
- `Iterable [Code]`;
- `Code: Iterator [Code]` when held as mutable traversal state.

The iterator is the remaining immutable `Code` view. `iter` copies the handle; `next`
reads its first child and replaces the mutable iterator handle with `code-rest`, an
O(1) view. It allocates no backing collection, does not flatten views, and performs no
string conversion. Independent handles therefore have independent cursors while all
children retain their identity. List, vector, and view order is the reader order. A
scalar has zero collection children; the impl checks its shape before calling the
strict list/vector-only `code-count` primitive. Using Code itself also avoids defining
a runtime-layout struct containing the comptime-only Code type.

This means ordinary read-only collection code can use syntax directly:

```coil
(empty? form)
(get form 0)
(for child (iter form)
  (inspect child))
```

### 2. CodeBuilder is an append sink, not a collection view

`CodeBuilder` implements `Push [Code]`. The impl adapts the trait's `(mut Self)`
receiver to the builder's arena-owned opaque handle and delegates to
`primitive/code-list-push!`.

It intentionally does **not** implement `Len`, `Get`, `Set`, `Pop`, or `Iterable`.
Reading while building would expose mutable arena storage and weaken the simple
freeze boundary. Replacing or removing children is not required for linear code
construction and would make builder aliases observably mutable in more ways.

The explicit freeze remains:

```coil
(let [(mut out) (primitive/code-list-new)]
  (push! (mut out) `first)
  (push! (mut out) `second)
  (primitive/code-list-done (load out)))
```

Keeping `code-list-done` explicit avoids inventing a one-implementation `Finish`
trait and keeps the type-changing ownership boundary visible in source.

### 3. Concrete Code collection helpers cover the common copy

`code-extend!` walks finished `Code` through `Iterator` and appends each child through
`Push`, returning the builder. `code-collect` creates a builder, extends it, and freezes
the result. Both preserve order and syntax identity:

```coil
(let [out (primitive/code-list-new)]
  (primitive/code-list-done (code-extend! out form)))

(code-collect (primitive/code-slice form 1 (len form)))
```

These helpers are concrete by design. Coil cannot yet express the associated-type
equality required to prove that an arbitrary iterator's `Item` equals an arbitrary
sink's `Push.E`, and macro expansion is not a sound substitute across staged trait
environments. Ordinary concrete loops still use the same vocabulary for every
collection: `(for item (iter source) (push! (mut destination) item))`.

## Why this representation

There remains one syntax representation: reader `Sexp` plus hygiene/provenance
metadata, exposed through opaque `Code` handles. The collection traits are views of
capabilities, not conversion to a generic boxed list. Consequently:

- parser and expander ownership do not change;
- no collection elements are boxed again;
- `Code` views remain views;
- hygiene identity survives every operation;
- compiled metaprograms retain the same ABI;
- existing primitive APIs remain source compatible;
- the linear builder path stays the natural path.

### Compiler phase boundary

Trait dispatch synthesizes wrappers whose mutable receiver is represented as a
pointer to `Code` or `CodeBuilder`. Those wrappers and the new impl methods are
compile-time-only just like ordinary Code-signed helper functions. The compiler's
post-check runtime cleanup therefore recognizes Code through direct, reference, and
pointer types and removes both the functions and their impl records before runtime
monomorphization.

That filtering belongs in `drop-code-funcs`, not in `monomorphize` itself.
Monomorphization is also used to build metaprogram dylibs and interpreter modules;
those paths still need the Code impl records to resolve `len`, `get`, `iter`, `next`,
and `push!`. Keeping the checked program intact through staged expansion also lets a
later expansion in the same compilation resolve the same impls. Only the final
runtime boundary discards them.

The compiled metaprogram engines add one more representation boundary: metalowering
erases both opaque handles to `(ptr i8)`. Direct calls have already been named from
the source `Code`/`CodeBuilder` type, while a generic trait call is named later from
the lowered pointer type. Metalowering therefore retains the source-named method and
publishes an alias under the lowered impl key, including methods reachable only via
generic dispatch. It also recomputes the impl's dispatch index key after lowering.
Because both opaque types erase to the same pointer, a future pair of same-trait impls
whose lowered names collide is rejected deterministically instead of selecting by
impl order.

## Alternatives considered

### Replace Code with `ArrayList Code`

Rejected. `ArrayList` is homogeneous owning storage, while syntax nodes are tagged,
carry source and hygiene metadata, can be scalar, and may be borrowed views. It would
either lose metadata or require a second wrapper around every node. It would also put
allocator ownership in user code and undermine invocation-arena promotion.

### Make Code itself mutable and implement Push

Rejected. This recreates the aliasing problem the memory design removed. Inputs,
children reached through `get`, and O(1) views can share backing storage. Mutation
would require uniqueness tracking, copying, GC/refcounts, or unsound aliases. The
separate builder type makes illegal states unrepresentable at checking time.

### Make CodeBuilder fully list-like

Rejected. `len` alone could be safe, but `get`/iteration would expose children whose
positions and backing allocation can change on push. A partial read API also invites
algorithms that inspect and repeatedly rebuild the accumulator. Freeze is cheap and
is the clear transition to a stable immutable value.

### Add a monolithic Collection trait

Rejected. Slices cannot push, maps are keyed rather than indexed, iterators have no
length, and builders cannot read. A large trait would force dummy operations or many
near-duplicate variants. Existing capability traits compose more accurately.

### Iterator adapters and dynamic iterator objects

Rejected for this increment. Closure-carrying `map`/`filter` adapters need a coherent
callable/lifetime design, and dynamic iterator trait objects are not object-safe under
the current `(mut Self)`/associated-item protocol. Macros can provide eager algorithms
later without changing this representation. Neither is necessary to make Code use the
existing protocol.

### Compiler-magical array trait forwarding

Rejected. Trying slice impls when an array receiver has no impl sounds convenient,
but it changes trait selection and coercion globally, creates precedence questions for
direct array impls, and hides a borrow/spill. Const generics or an explicit standard
array-view API should solve arrays comprehensively. Today use a slice where a generic
Iterable is needed, or `(for-in [x (over array N)] ...)` when `N` is explicit.

### A generic `extend!`

Deferred until associated-type equality constraints exist. Without a way to connect
the iterator item and destination item types, a generic function fails to type check
or needs an unsafe cast. A macro appears to defer that proof to concrete type checking,
but staged expansion prunes compile-time impls and makes the result phase-dependent.
The shipped concrete `code-extend!` is predictable in both metaprogram engines.

## Complexity and safety

For `n` children:

- `len`: O(1);
- `get`: O(1);
- iterator creation: O(1);
- full iteration: O(n), O(1) iterator state;
- `code-extend!`/`code-collect`: O(n) plus the builder's normal growth cost;
- freezing a builder: the existing O(1) handle transition;
- promotion: unchanged deep O(size of returned syntax) boundary copy.

The usual source invalidation rules still apply. In particular, do not grow an
`ArrayList` while walking an iterator over that same list's borrowed slice. `Code` is
immutable, so its iterator has no corresponding mutation hazard.

## Compatibility

The design is additive. Existing `primitive/code-*`, `al-*`, slice, map, and iterator
APIs remain unchanged. Existing metaprograms can migrate one loop at a time. A project
that already defines an applicable `Len`, `Get`, `Iterable`, or `Push` impl for the
builtin Code types will now receive the normal duplicate-impl diagnostic rather than
silent selection; such impls were necessarily local workarounds for the missing core
capability.

## Validation criteria

1. `len`, `get`, and `iter` work on list, vector, scalar, and O(1) Code views.
2. Iterator exhaustion is stable and independent iterators have independent cursors.
3. Children transported through iteration retain identifier identity and bind
   correctly in generated code.
4. `push!`, `code-extend!`, and `code-collect` build Code in source order and freeze
   through the existing primitive.
5. A normal `iter`/`push!` loop copies a slice into an `ArrayList`.
6. Reading or iterating a `CodeBuilder`, and pushing into finished `Code`, remain
   compile-time errors.
7. Metaprogram poison-arena tests, focused compiler tests, and the bounded
   `modernize-fast` gate pass with a freshly built candidate.

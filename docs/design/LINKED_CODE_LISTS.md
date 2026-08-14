# Linked `Code` Lists

Status: proposed; implementation should begin in a fresh session from the
checkpoint on `feat/scheme-continuation-pass`.

## Why revisit the representation?

Coil's compile-time `Code` is an opaque view of the reader's `Sexp`. A list is
currently represented as a boxed `ArrayList<Sexp>`. Indexed inspection is cheap,
but persistent construction is not: metaprograms can only rebuild a list through
quasiquote and splicing.

A common walker therefore looks innocent but is quadratic:

```coil
(defn walk [(xs Code) (i i64) (n i64)] (-> Code)
  (if (>= i n) `()
    `(~(rewrite (primitive/code-nth xs i))
      ~@(walk xs (+ i 1) n))))
```

At every return, `~@` copies the complete suffix. Jolt exposed this at realistic
scale: a Scheme transform reached more than 8,000 top-level forms and one native
metaprogram invocation grew beyond 20 GiB. Instrumentation ruled out one bad
source form, runaway recursive depth, host callback retention, and result
copy-out. Individual forms were small; repeated suffix construction was the
problem. Balanced range construction improved individual passes from O(n^2) to
O(n log n), but many stateful Scheme passes have the same shape and cannot all be
cleanly expressed as balanced maps.

This is not fundamentally a Jolt compatibility issue. It is a mismatch between
Lisp-shaped metaprogramming and an array-only syntax construction API.

## Proposed model

Keep `Code` immutable and representation-safe, but represent list-shaped syntax
as persistent linked pairs:

```text
SexpKind
  KInt / KFloat / KSym / KKw / KStr / KCStr
  KNil
  KPair(head, tail)
  KVec(ArrayList<Sexp>)
```

The actual recursive payload must use pointers or a separately allocated pair:

```coil
(defstruct SexpPair [(head Sexp) (tail Sexp)])

(defsum SexpKind
  ...
  (KNil)
  (KPair [(pair (ptr SexpPair))])
  (KVec [(items (ptr (ArrayList Sexp)))]))
```

Vectors remain contiguous. The typed compiler AST also remains array-oriented;
only reader/expander/metaprogram syntax changes representation.

Every `Sexp` continues to carry its existing source span, hygiene context, and
stable node identity. A tail is itself an `Sexp`, so improper lists are natural:

```text
(a b c)   = Pair(a, Pair(b, Pair(c, Nil)))
(a b . c) = Pair(a, Pair(b, c))
```

This directly supports Chez/R6RS dotted formals and data without a side-channel
encoding.

## Public metaprogram API

The representation remains opaque. The behavioral API becomes complete:

```coil
primitive/code-null? : Code -> bool
primitive/code-pair? : Code -> bool
primitive/code-car   : Code -> Code
primitive/code-cdr   : Code -> Code
primitive/code-cons  : Code Code -> Code
```

Metadata-aware construction needs an explicit form as well:

```coil
primitive/code-cons-like : Code Code Code -> Code
primitive/code-nil-like  : Code -> Code
```

`code-cons-like prototype head tail` takes source/hygiene authorship from the
prototype. The convenience `code-cons` should have one documented policy, but
compiler-quality transforms should normally use the explicit form.

Keep compatibility operations:

```coil
primitive/code-list?
primitive/code-count
primitive/code-nth
primitive/code-rest
```

They become derived spine walks. They are slower, but positional syntax forms
are normally short. Module-scale code must migrate to `car`/`cdr` traversal.

## List and sequence traits

Do not make every `Code` pretend to be a collection: atoms are Code too. Define
ordinary traits around values that can provide a sequence view:

```coil
(deftrait Sequence [S E]
  (empty? [(xs S)] (-> bool))
  (first [(xs S)] (-> E))
  (rest [(xs S)] (-> S)))

(deftrait PersistentSequence [S E]
  (prepend [(x E) (xs S)] (-> S)))
```

Implement these for a checked Code-list view, or initially provide the primitive
operations directly and introduce the trait after the representation is stable.
`nth`, `length`, `reverse`, folds, and maps should be library definitions in
terms of this small spine interface.

## Pattern matching

Representation-level matching should become possible first:

```coil
(match (primitive/code-uncons form)
  (None [] ...)
  (Some [head tail] ...))
```

The ergonomic destination is syntax-pattern matching:

```coil
(code-match form
  (`(define ~name ~value) ...)
  (`(lambda (~@params) ~@body) ...)
  (_ ...))
```

Do not couple the initial storage migration to the full syntax-pattern feature.
`null?`, `pair?`, `car`, `cdr`, and `cons` are sufficient to establish correctness
and linear construction.

## Lint and fix migration

Build the final API over the current array representation first, then migrate
source before changing storage.

Safe automatic fixes:

```text
(primitive/code-nth x 0)                  -> (primitive/code-car x)
(primitive/code-rest x)                   -> (primitive/code-cdr x)
list? + count == 0                        -> code-null?
list? + count > 0                         -> code-pair?
```

The new lint must also diagnose recursive syntax suffix splicing:

```text
recursive-code-splice: recursive ~@ copies an expanding suffix and is O(n^2);
accumulate with code-cons and reverse, or walk with code-car/code-cdr
```

Only fix the simple one-input/one-output case automatically. Diagnose but do not
rewrite stateful, filtering, computed-index, vector-compatible, or one-to-many
walkers until their intent is proven.

Retain `code-nth` for genuinely positional destructuring. The goal is not to
ban it; the goal is to prevent indexed traversal of long linked sequences.

## Staged implementation

Each phase should be its own reviewable commit and leave the compiler usable.

1. **API on current storage**
   Add and test `code-null?`, `code-pair?`, `code-car`, `code-cdr`, `code-cons`,
   and metadata-aware variants while `KList(ArrayList)` still exists.

2. **Lint plus conservative fix**
   Add fixtures for every safe rewrite and negative fixtures proving positional,
   vector, and stateful cases are left alone. Run the fixer over compiler and
   Scheme metaprogram sources.

3. **Migrate large walkers**
   Convert module-scale walks to tail traversal and reverse accumulation. Add a
   synthetic 10k-form fixture that proves linear-ish allocation/time growth.

4. **Introduce `KNil` and `KPair` internally**
   Teach equality, dumping, source stamping, cloning, ownership verification,
   parser consumption, and metaprogram callbacks. During bootstrap, support both
   old and new list representations if necessary.

5. **Reader and quasiquote switch**
   Emit linked lists from the reader, implement dotted-list reading, and lower
   quasiquote through pair construction. Keep vectors array-backed.

6. **Remove legacy `KList`**
   Only after all snapshot stages, CLI/runtime gates, and bootstrap fixpoint are
   green under linked syntax.

7. **Add structural syntax patterns**
   Treat this as a follow-up ergonomic feature, not a prerequisite for storage.

## Invariants to test

- `cons`, `car`, and `cdr` preserve head/tail node identity.
- New outer nodes receive the documented source and lexical context.
- Input syntax is immutable; constructing a result cannot mutate aliases.
- Proper and improper lists print/read round-trip.
- Vectors remain distinct from lists.
- `code-count` rejects or explicitly handles improper lists.
- `code-nth` retains its current bounds/type diagnostics.
- Native metaprogram results contain no pointers into invocation scratch memory.
- Quasiquote and nested splicing preserve order, context, and identity.
- The compiler reaches a byte-identical stage2/stage3 bootstrap fixpoint.

## Proof that it solves the original problem

Do not call the migration successful merely because unit tests pass. Record these
before/after measurements using unchanged Jolt sources:

```sh
cd .coil/jolt-coil/jolt
COIL_NAMESPACE_ROOTS=/home/jimmyhmiller/Documents/Code/coil \
  /usr/bin/time -v <candidate> build host/chez/rt.ss \
  --use coil.r6rs.exceptions --meta-opt=0 -o /tmp/jolt-rt-coil
```

Acceptance for the representation work:

1. The Scheme pipeline passes the former 8k-form quadratic construction point.
2. Peak RSS is bounded and scales approximately linearly on generated 1k, 2k,
   4k, and 8k form fixtures.
3. The unchanged real Jolt/Chez sources reach the next genuine compatibility
   diagnostic or complete; no source adapter, evaluator, or Jolt-specific compiler
   case is introduced.
4. Existing Coil metaprograms and snapshots remain behaviorally identical.

## Current checkpoint and debugging tools

The current branch already contains useful temporary observability:

- per-native-metaprogram scratch arenas;
- allocation/segment/peak-reservation counters;
- returned-Sexp arena ownership verification;
- identity-memoized copy-out;
- `COIL_META_ALLOC_TRACE=1` and `COIL_META_ALLOC_ENTRY=...`;
- `COIL_SCHEME_REWRITE_TRACE=1` traversal attribution;
- `COIL_SCHEME_TRACE=1` Scheme pipeline stage attribution.

The x64 compiler bootstraps to a byte-identical stage2/stage3 fixpoint and passes
the corpus. The existing x64 C ABI gate remains red and must not be misreported as
caused by this proposal. The modernize-fast gate also currently exposes an
existing missing inferred-type record in compiled metaprograms. The nested Jolt
checkout is clean and must remain verbatim.

## Non-goals

- Do not add a Scheme evaluator or load-based execution path.
- Do not translate or patch Jolt sources.
- Do not special-case Chez or Jolt in the compiler.
- Do not convert typed AST collections to linked lists.
- Do not convert Scheme vectors to linked lists.
- Do not remove `code-nth`; migrate only traversal patterns where it matters.

The intended outcome is a simpler and more Lisp-native metaprogram model: Code
remains immutable syntax, list-shaped Code becomes a persistent linked list, and
ordinary list algorithms replace compiler-only construction tricks.

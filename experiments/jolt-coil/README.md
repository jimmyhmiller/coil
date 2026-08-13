# Jolt on Coil

This directory contains the first executable bootstrap gate for hosting
[Jolt](https://github.com/jolt-lang/jolt) on Coil's Scheme dialect.

The gate starts at the compiler boundary and now covers a small but real
single-threaded expression kernel:

1. a pinned Jolt compiler reads and analyzes the Clojure form `(+ 1 2)`;
2. Jolt's real Scheme backend emits `(jolt-n+ 1 2)`;
3. the emitted form is checked byte-for-byte;
4. a Coil-built Scheme host executes that first form;
5. structurally normalized Jolt output executes fixed-arity and nested lexical
   closures, bindings, conditionals, comparison, and arithmetic;
6. Jolt's emitted vector/`apply` path dynamically invokes a variadic Clojure
   `+` implementation;
7. arbitrary-binding accumulator loops lower to Coil native control flow;
8. core var dispatch provides `str` and `println`, while vector
   `conj`/`count`/`nth` support a collection-processing loop;
9. managed higher-order closures run through `map` and `reduce`, and keyword
   maps support persistent-style `get`/`assoc`;
10. nil/truth/empty-seq semantics, mutable namespace var roots, multi-arity
    functions, and variadic rest functions execute through the same ABI;
11. tagged persistent-style sets support membership, order-independent equality,
    `conj`, and `disj`;
12. a directly compiled Clojure sequence pipeline composes `range`, `filter`,
    `map`, an anonymous function, and `reduce`, returning `165`;
13. the first 393 checked-in Jolt prelude seed forms load as native Coil code,
    install real `clojure.core` vars and macros through `fn`, and invoke seeded
    `zero?`, `destructure`, `defn`, `subvec`, `max-key`, `split-at`, and
    `distinct?` successfully.

The current results are `3`, `42`, `42`, `144`, `6`, `15`, `34`, `sum=15`,
`hello 42`, `10`, `30`, `12`, and the composed application output
`sum=30` / `30`; the semantic and callable gates return `61`, `42`, `42`, and
`42`, `31`, and `165`. The latter cases are
compiled as Coil programs against the Scheme dialect; they do not use Chez at
runtime. Chez is currently only the bootstrap host that runs Jolt's compiler
and produces the Scheme forms being tested.

Run it from the Coil repository root:

```sh
experiments/jolt-coil/check.sh
```

There is also a direct single-form runner:

```sh
experiments/jolt-coil/run-clojure.sh experiments/jolt-coil/m12-application.clj
```

It invokes the pinned Jolt compiler, structurally adapts the emitted Scheme,
builds a temporary module under `.coil/jolt-coil/generated/`, and runs it with
Coil. The `m20-sequence-pipeline.clj` case exercises the directly compiled
collection pipeline.

`run-seed-smoke.sh 393` adapts a prefix of Jolt's checked-in compiler prelude,
strips only the host bootstrap's per-definition recovery guards, compiles the
real seed forms, and invokes a loaded var. The complete Chez seed is about
1.5 MB across 1,163 guarded definitions. Its two seed files reference 156 distinct
`jolt-*` spellings; this adapter currently provides only a subset, so a full
seed load is not yet claimed. Callable maps, Clojure's two-argument `reduce`,
map-entry access, `merge`, `merge-with`, first-class variadic `list`, `pop`, and
variadic `concat` have prototype implementations. They are no longer used to
claim the full native seed frontier. Form 112's `dynamic-wind` now compiles with
the optional continuation dialect and the seed advances through form 393. The
next frontier requires additional Jolt sequence-runtime bindings.

The Jolt checkout is kept under `.coil/jolt-coil/`, which is already build
state rather than vendored source. `JOLT_DIR=/path/to/jolt` can select an
existing checkout. The gate refuses a checkout at a different commit so that
backend drift cannot silently change the experiment.

`COIL_SCHEME=/path/to/scheme-host` selects a Scheme executable that reads one
form from standard input. In a development tree, the gate otherwise uses the
existing `build/examples/mini-scheme` artifact. This fallback matters when the
globally installed compiler predates the checkout's bundled Scheme dialect; it
keeps M0 runnable without pretending that a stale compiler can rebuild current
sources.

## Milestones

- **M0 — compiler boundary (complete):** fixed Clojure form, real Jolt emit,
  one primitive, execution on Coil.
- **M1 — expression kernel (in progress):** arithmetic, fixed-arity and nested
  lexical functions, nonrecursive target-side `letrec`/named-let normalization,
  conditionals, variadic `apply`, vectors, and arbitrary-binding accumulator
  `loop`/`recur` now run through Coil. A reusable core runtime provides
  variadic `str`, `println`, vector `conj`/`count`/`nth`, mutable var roots,
  multi-arity dispatch, variadic rest functions, and sets. Direct compilation also covers a
  `range`/`filter`/`map`/`reduce` pipeline. The native Scheme closure lifter now
  forwards grandparent captures through intermediate closures, which unblocked
  Jolt's `partition-by` seed definition. The adapter also removes redundant
  nested `letrec*` cells after native recur lowering. Remaining: hashing parity and
  broader collection and sequence protocols.
  `m12-application.clj` composes map, reduce, closures,
  keyword maps, string formatting, lookup, and printing in one form.
- **M2 — value kernel:** Jolt nil, symbols, keywords, persistent lists,
  vectors, maps, records, and `hasheq` on Coil.
- **M3 — compiler seed:** load the cross-minted Jolt compiler seed and compile
  forms from inside the Coil-hosted process. The first 393 real prelude forms now
  load and expose callable vars; full prelude and compiler-image loading remain.
- **M4 — single-threaded Jolt:** namespaces, vars, dynamic bindings, exceptions,
  loading, REPL, and the host-neutral conformance corpus. FFI, images, native
  Jolt builds, and concurrency degrade according to Jolt's adapter contract.
- **M5 — native integration:** establish a reproducible emitted-Scheme-to-Coil
  build path and decide whether shared-heap concurrency
  is worth the required collector work.

The immediate implementation targets are the remainder of M1, followed by the
minimum M2 values required by ordinary core-library code. Do not start with
threads or program images: Jolt explicitly permits those capabilities to
degrade, while compiler bootstrap does not.

## Loop lowering

Jolt gives every function body a named `let` target so Clojure `recur` can jump
back to it. `emit-coil-expression.ss` removes that wrapper when it is
nonrecursive. Recursive targets structurally emit Coil mutable slots and native
`loop`/`continue`: every tail `recur` evaluates all next values before storing
any slot, while every ordinary tail value becomes `break`. The tail-control walk
preserves nested `if`, `let`, `let*`, and `begin`, including loops such as
`distinct?` with several terminal exits.

The lowering supports any positive binding count and mixed terminal/recursive
branches. Jolt has already checked that `recur` is in tail position; the adapter
preserves that validated control tree rather than rediscovering a narrower loop
shape.

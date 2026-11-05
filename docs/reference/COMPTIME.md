# Constants and `comptime`

Coil has two metaprogramming systems, macros and metaprograms
([METAPROGRAMS.md](METAPROGRAMS.md)). This page is about two things built on the
first: a value computed while the program compiles, and the constant expressions
that need no computing at all.

## Constants are expressions

`(const NAME VALUE)` names an expression. Each use is a copy of the value, and no
code runs to produce it:

```lisp
(const WORD 8)
(const DIGEST-BYTES (* WORD 4))
(const ORIGIN (Span :sec 5 :nsec 0))
(const HEADER-SIZE (cast i64 (sizeof Header)))
(const FIELDS (primitive/field-count Header))
```

The value may hold literals, other constants, operators on primitive types, casts,
`if`, constructors and array literals, `sizeof` and the other questions about a
type. Because it is an expression of the program, a constant answers for the
target: on wasm32 `HEADER-SIZE` counts 4-byte pointers, whatever machine runs the
compiler. An array length may name a constant whose value is integers and operators.

A value that needs code run says so: a function call is an error, naming the call
and `comptime`.

A `def` is storage laid out when the program links. Its value may hold what a
constant's may, plus addresses (`fnptr-of`, a C string, `alloc-static`).

## `comptime`

`(comptime E)` runs `E` while the program compiles and leaves the literal it comes
to in its place:

```lisp
(defn fib [(n i64)] (-> i64) (if (< n 2) n (+ (fib (- n 1)) (fib (- n 2)))))
(const FIB-20 (comptime (fib 20)))
(defn main [] (-> i64) (comptime (* 6 7)))
```

It is an ordinary macro in `coil.core`, and it has no compiler support of its own:

```lisp
(defn comptime [(value Code)] (-> Code)
  (let [name (primitive/code-hoist value
               `(defn* _ [(unused Code)] (-> Code)
                  (primitive/code-lift ~value)))]
    `(~name 0)))
```

`primitive/code-hoist` adds a definition to the module being expanded, and the
compiler reuses it when the same syntax comes round again. `primitive/code-lift` makes syntax for a
value. The rest is what any macro gets: `E` is compiled and run by the metaprogram
engine, with the whole language at hand (allocation, collections, FFI), and division
by zero is an error located at the divisor.

### What it can make

The result becomes syntax, so it has to have some:

- scalars and strings keep their type: `(comptime (narrow))` of an `i32` is an `i32`;
- a struct, sum or array becomes the construction that rebuilds it, generic
  instances included;
- a pointer, function or other run-time-only value has no literal, and fails where
  it is lifted.

The same goes for `~` in a template, except that a bare scalar takes the type its
context gives it, as a literal does.

### What it sees

`comptime` is a macro, so it runs when macros run:

- **Top-level names only.** It cannot read a local or a generic's parameter. Those
  exist in the code around it, which has not run. `(sizeof T)` in a generic needs no
  `comptime` at all.
- **The machine running the compiler.** `E` is compiled for that machine, so `sizeof`
  inside it, and in anything it calls, answers for the host in a cross build. Ask
  about the target with a constant, or from a macro with `target-arch` and `target-os`.
- **The program before whole-program transforms**, like any macro.
- **No expected type.** Its value's type comes from `E`; write `(comptime (: E T))`
  where inference would have needed the context.

A value that needs itself is an error naming the function that closes the cycle.

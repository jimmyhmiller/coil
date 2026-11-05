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

It is an ordinary macro in `coil.core`. Without anything around it to read, it comes to
this:

```lisp
(defn comptime [(value Code)] (-> Code)
  (let [form `(defn* _ [(unused Code)] (-> Code)
                (primitive/code-lift ~value))
        name (primitive/code-hoist form form)]
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

`E` can use whatever has a value while the program compiles:

```lisp
(const LIMIT 100)

(defn known [] (-> i64)
  (let [base 3
        next (+ base 4)]
    (comptime (fib next))))             ; a `let` a constant could hold: 13

(defn per-instance [T (const N i64)] [] (-> i64)
  (comptime (+ N (cast i64 (sizeof T))))) ; a generic parameter: once per instance
```

- **Top-level definitions**, by the rules any code has: a local of the same name is
  what the name means, not the definition.
- **A `let` around it** whose value is what a constant may hold, or is itself
  `(comptime …)`. `E` gets a copy of it, and of the `let`s it reads.
- **Generic parameters**, types and values, of the function or `impl` around it.
  They have a value once the code is specialized, so `E` runs then, once per instance,
  and an instance nothing uses never runs. Its type comes from checking `E` in the generic.

Everything else about the code around it is still to come: a parameter, a `(mut x)`, a
loop's or a pattern's variable, a `let` computed by calling something. Reading one is an
error naming it. `(let [x (f)] (comptime x))` says to write `(comptime (f))`, if that is
what is meant.

`comptime` is a macro, so it also has what macros have:

- **The machine running the compiler.** `E` is compiled for that machine, so `sizeof`
  inside it, and in anything it calls, answers for the host in a cross build. Ask
  about the target with a constant, or from a macro with `target-arch` and `target-os`.
  `(sizeof T)` in a generic needs no `comptime`, and does answer for the target.
- **The program before whole-program transforms.**
- **No expected type.** Its value's type comes from `E`; write `(comptime (: E T))`
  where inference would have needed the context.

How it finds out what is around it is available to any macro: `primitive/code-call-scope`
lists what is bound at the call, and `primitive/code-specialized-value` leaves a value
for specialization to compute.

A value that needs itself is an error naming the function that closes the cycle.

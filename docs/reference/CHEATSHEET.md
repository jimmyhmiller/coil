# Coil cheatsheet

Coil is a typed, ahead-of-time, Lisp-syntax language. Forms are
`(operation argument...)`; the last expression in a function or `do` is its
value. Use `coil guide` for focused topics or `coil guide --all` for the complete
reference.

Focused reference lookup:

    coil guide tests          # deftest, assert, discovery
    coil guide test-suites    # test roots, suffixes, configuration
    coil guide modules        # module, import, source-roots
    coil guide structs        # fields, zeroed, load/store
    coil guide match          # defsum, variants, exhaustive match
    coil guide operators      # %, arithmetic, comparisons
    coil guide types          # numeric casts
    coil guide floats         # f64 arithmetic and conversion

Run `coil guide` for the complete topic index. Prefer direct topics; combine up
to three when needed. Use `--search` for one or two specific terms rather than a
list of concepts.

## Run and explore

    coil run app.coil                  # build and run
    coil build app.coil -o app         # native executable
    coil check app.coil                # typecheck only
    coil test tests.coil               # run deftest forms
    coil repl
    coil fmt app.coil --write
    coil namespace coil.arraylist      # inspect a library module

## A small program

    (module example)
    (import "coil.alloc" :as alloc)

    (defstruct Point [(x i64) (y i64)])

    (defn distance-squared [(p Point)] (-> i64)
      (+ (* (load (field p x)) (load (field p x)))
         (* (load (field p y)) (load (field p y)))))

    (defn main [] (-> i64)
      (let [p (Point :x 3 :y 4)]
        (println "distance squared: {d}" (distance-squared p))
        0))

## Definitions and types

    (defn add [(a i64) (b i64)] (-> i64) (+ a b))
    (defn id [T] [(x T)] (-> T) x)       ; generic
    (const answer i64 42)
    (defstruct Pair [T] [(left T) (right T)])
    (defsum Option [T] (None) (Some [(value T)]))

Scalars: `bool`, `i8`/`i16`/`i32`/`i64`, `u8`/`u32`/`u64`, `f32`/`f64`.
Compound types: `(ptr T)`, `(slice T)`, `(array T N)`, `(mut T)`.
Strings are UTF-8 `(slice u8)`; `c"text"` is a NUL-terminated `(ptr i8)`.

## Values and control flow

    (let [x 10 (mut total) 0]            ; immutable value + mutable cell
      (store! total (+ (load total) x)))
    (if condition then-value else-value) ; both branches required, same type
    (do effect-a effect-b result)
    (cond test-a value-a test-b value-b :else fallback)
    (loop ... (continue) ... (break result))
    (match value
      (Some [x] x)
      (None [] 0))                       ; exhaustive; (_ fallback) catches rest

There is no `return`; use expression values, or
`(block :done ... (return-from :done value))`.

## Operators

    (+ a b) (- a b) (* a b) (/ a b) (% a b)
    (= a b) (!= a b) (< a b) (<= a b) (> a b) (>= a b)
    (and a b) (or a b) (not a)
    (primitive/cast i64 value)

Clean operators are trait methods. `f64` deliberately has no `=` or `!=`; use
`primitive/fcmp-eq` or `primitive/fcmp-ne` when float equality is intended.

## Structs, sums, and memory

    (let [p (Point :x 10 :y 20)]
      (load (field p x)))                 ; field returns a place
    (let [(mut slot) (Point :x 0 :y 0)]
      (store! slot (Point :x 1 :y 2)))
    (let [item (Some 42)]
      (match item (Some [x] x) (None [] 0)))

`(p Point)` parameters are immutable references, `(p (mut Point))` are mutable
references, and `(p (ptr Point))` are raw pointers. Pass a mutable place as
`(mut place)`. Use initialized mutable locals for frame storage and `alloc/box` or
`alloc/box!` for initialized allocator-owned values. Explicit low-level static
storage is `(primitive/alloc-static T)`.

## Modules, traits, tests, and FFI

    (module my.app)
    (import "coil.io" :use [stdout])
    (import "coil.fmt" :as fmt)
    (export public-name)

    (deftrait Show [Self] (show [(x Self)] (-> i64)))
    (impl Show Point (show [(p Point)] (-> i64) 0))
    (defn use-show [(T Show)] [(x T)] (-> i64) (show x))

    (deftest arithmetic
      (assert-eq (+ 2 2) 4))

    (extern puts :cc c [(ptr i8)] (-> i32))
    (puts c"hello")

## Remember

- Imported files start with `(module name)`; imports name modules, not paths.
- `main` returns an `i64` process exit code.
- Reserve `primitive/alloc-stack` for genuinely unsafe/uninitialized storage; it lasts
  to function exit and must never be placed in a long-running loop.
- `field` and `index` return places; read with `load`, write with `store!`.
- Struct constructors require every named field exactly once.
- `match` is exhaustive, and every `if` branch must have the same type.
- `call` and `block` are reserved names.
- Use `;;` directly above a definition for API documentation; `;` is a comment.

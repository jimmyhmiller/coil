# Coil cheatsheet

Coil is a typed, ahead-of-time compiled language with Lisp syntax. Forms are
`(operation argument…)`, and the last expression of a body is its value.
`coil guide TOPIC` prints one section of the language guide; `coil guide` lists
the topics.

## Commands

```text
coil run app.coil                  # build and run
coil build app.coil -o app         # native executable
coil check app.coil                # typecheck only
coil test tests.coil               # run deftest / defprop
coil lint app.coil --fix           # apply the standard fixes
coil fmt app.coil --write
coil repl
coil namespace coil.arraylist      # a library module's API
```

## A program

```coil
(module example.cheatsheet)
(import "coil.alloc" :use [malloc-allocator])
(import "coil.arraylist" :use [al-new al-free!])

(defstruct Point [(x i64) (y i64)])

(impl Point
  (norm2 [(p Point)] (-> i64) (+ (* (.x p) (.x p)) (* (.y p) (.y p))))
  (shift! [(p (mut Point)) (dx i64)] (-> i64) (set! (.x p) (+ (.x p) dx)) 0))

(defsum Shape (Circle [(r i64)]) (Square [(side i64)]))

(defn area [(s Shape)] (-> i64)
  (match s
    (Circle [r] (* 3 (* r r)))
    (Square [side] (* side side))))

(defn main [] (-> i64)
  (let [(mut p) (Point :x 3 :y 4)
        (mut xs) (al-new [i64] (malloc-allocator))]
    (shift! (mut p) 1)
    (push! (mut xs) (area (Circle 1)))
    (push! (mut xs) (area (Square 2)))
    (for a (iter xs) (println "area {}" a))
    (println "norm2 {}" (norm2 p))
    (al-free! (mut xs))
    0))
```

```output
area 3
area 4
norm2 32
```

## Definitions

```text
(defn add [(a i64) (b i64)] (-> i64) (+ a b))
(defn id [T] [(x T)] (-> T) x)                 ; generic
(defn biggest [(T Ord)] [(a T) (b T)] (-> T) …) ; bounded generic
(defstruct Pair [T] [(left T) (right T)])
(defsum Option [T] (None) (Some [(value T)]))
(deftrait Area [Self] (area [(x Self)] (-> i64)))
(impl Area Point (area [(p Point)] (-> i64) …))
(derive Debug Eq Clone Point)                  ; Debug needs (import "coil.debug" :use *)
(const LIMIT 64)                               ; compile-time
(defn twice [(x Code)] (-> Code) `(+ ~x ~x))    ; a macro: Code -> Code
```

Types: `i8`…`i64`, `u8`…`u64`, `f32`, `f64`, `bool`, `(ptr T)`, `(slice T)`,
`(array T N)`, `(fnptr c [Args…] R)`. Strings are UTF-8 `(slice u8)`; `c"text"`
is a C `(ptr i8)`.

## Expressions

```text
(let [x 10 (mut total) 0] … (set! total (+ total x)))
(if test then else)                  ; both branches, same type
(cond a 1 b 2 :else 3)   (case n 1 "one" 2 "two" "many")
(when test body…)   (unless test body…)
(for x (iter xs) …)   (for i (range 0 n) …)   (while test …)
(block :done … (return-from :done v))
(match v (Some [x] x) (None [] 0))   ; exhaustive; (_ …) catches the rest
(Point :x 1 :y 2)   (.x p)   (set! (.x p) 5)   (Circle 3)
(len xs) (get xs i) (set! (mut xs) i v) (push! (mut xs) v) (pop! (mut xs))
(println "{} {:?}" a b)
(cast i64 f)   (: 200 u8)
```

Parameters: `(p Point)` is an immutable reference, `(p (mut Point))` a mutable
one (pass `(mut place)`), and `(p (ptr Point))` a raw pointer.

## Remember

- A file that is imported starts with `(module name)`. Imports name modules, not
  paths.
- `main` returns an `i64` exit status.
- `f64` has no `=`. There is no unary minus: write `(- 0 x)`.
- `when`, `for` and `while` yield `i64` 0. In a non-`i64` function, end with the
  value.
- `primitive/…` needs `(import "coil.primitive" :as primitive)`.
- `call` and `block` are reserved names.
- `;;;` directly above a definition is its documentation; `;` and `;;` are
  comments.

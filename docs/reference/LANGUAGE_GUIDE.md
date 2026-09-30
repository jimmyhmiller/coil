# The Coil Language

Coil is a low-level, ahead-of-time compiled language with Lisp syntax. It has
structs, sum types with exhaustive `match`, Rust-style traits, explicit
allocators, and a macro system that is ordinary Coil run at compile time. The
compiler is written in Coil.

Each section opens with a program you can run with `coil run FILE.coil`, followed
by the output it prints. `scripts/docs/check-guide-examples.py` compiles and runs
every complete program here; run it after you change an example.

⚠ marks a trap. [Gotchas](#gotchas) collects them all.

Other references:

| Topic | Where |
|---|---|
| Projects, `Coil.toml`, dependencies, workspaces | [PROJECTS.md](PROJECTS.md) · `coil guide project` |
| `coil test`, property tests, fuzzing | [TESTING.md](TESTING.md) · `coil guide testing` |
| Debug checks, sanitizers, debugging allocators | [DEBUGGING.md](DEBUGGING.md) · `coil guide debugging` |
| The REPL and the in-process JIT | [STATEFUL_JIT.md](STATEFUL_JIT.md) · `coil guide jit` |
| WebAssembly | [WASM.md](WASM.md) · `coil guide wasm` |
| Metaprogram details | [METAPROGRAMS.md](METAPROGRAMS.md) |
| One namespace's API | `coil namespace coil.arraylist` |

## Tour

```coil
(module example.tour)
(import "coil.alloc" :use [malloc-allocator])
(import "coil.arraylist" :use [al-new al-free!])

(defstruct Point [(x i64) (y i64)])
(derive Debug Point)

(impl Point
  (manhattan [(p Point)] (-> i64) (+ (abs (.x p)) (abs (.y p)))))

(defn abs [(n i64)] (-> i64) (if (< n 0) (- n) n))

(defsum Shape
  (Circle [(radius i64)])
  (Rect [(width i64) (height i64)]))

(defn area [(s Shape)] (-> i64)
  (match s
    (Circle [r] (* 3 (* r r)))
    (Rect [w h] (* w h))))

(defn main [] (-> i64)
  (let [p (Point :x 3 :y -4)
        (mut areas) (al-new [i64] (malloc-allocator))]
    (push! (mut areas) (area (Circle 2)))
    (push! (mut areas) (area (Rect :width 2 :height 5)))
    (println "{:?} is {} blocks away" p (manhattan p))
    (for a areas (println "area {}" a))
    (al-free! (mut areas))
    0))
```

```output
(Point :x 3 :y -4) is 7 blocks away
area 12
area 10
```

- Every form is `(operation argument…)`. The last expression of a body is its value.
- `main` returns an `i64`, which becomes the process exit status.
- A type follows the name it describes: `(x i64)`, `(-> i64)`.
- `len`, `get` and `push!` are trait methods, and `for` walks anything
  `Iterable`, so they work on any collection that implements them.
- Definitions may appear in any order within a file.

## Values and types

| Type | Examples |
|---|---|
| Signed and unsigned integers of any width: `i8`, `i32`, `i64`, `u8`, `u64`, `i7`… | `42`, `-1`, `0xFF`, `0b1010`, `0o17`, `1_000_000` |
| Floats: `f32`, `f64` | `1.5`, `2e10` |
| `bool` | `true`, `false` |
| Characters (an integer byte value) | `#\a`, `#\space`, `#\newline`, `#\tab`, `#\u41` |
| Strings: `(slice u8)`, UTF-8, static storage | `"hello\n"`, `"\x1f603;"` |
| C strings: `(ptr i8)`, NUL-terminated | `c"hello"` |
| Keywords: `Keyword` | `:fast` |
| `(ptr T)`, `(slice T)`, `(array T N)`, `(fnptr c [Args…] R)` | |

An integer literal takes its width from context. A literal that does not fit its
type is a compile error. `(: EXPR TYPE)` states a type where context doesn't
supply one:

```coil
(module example.values)
(defn main [] (-> i64)
  (let [small (: 200 u8)
        big (cast i64 small)
        ratio (/ (cast f64 big) 3.0)]
    (println "{} {} {}" small big ratio)
    0))
```

```output
200 200 66.666667
```

`(cast T x)` converts between integers, floats and pointers. Between `f64` and an
integer it converts the *number* (truncating); it never reinterprets bits.

⚠ `f64` has no `=`. NaN ≠ NaN, so floats don't implement `Eq`. Compare with
`<`/`>`, or use `primitive/fcmp-eq` for IEEE equality.

`coil.math` has the float functions, for `f32` and `f64` alike: `sqrt`, `abs`,
`floor`, `ceil`, `trunc`, `round` (ties away from zero), `round-even`, `min`, `max`,
`mul-add`, `copysign`, the trigonometric and hyperbolic functions with `atan2`, `exp`,
`exp2`, `log`, `log2`, `log10` and `pow`, and the `f64` constants `pi`, `tau` and `e`:

```coil
(module example.math)
(import "coil.math" :as math)

(defn main [] (-> i64)
  (let [angle (math/atan2 1.0 -1.0)
        side (: 2.0 f32)]
    (println "{} {} {}" (math/sqrt side) (math/floor -2.5) (/ angle math/pi))
    (println "{}" (math/round (* (cast f32 math/tau) 10.0)))
    0))
```

```output
1.414214 -3.0 0.75
63.0
```

`(- x)` negates (the `Neg` trait), and `+ - * /` and the bitwise operators take
any number of operands, folding left: `(+ a b c)` is `(+ (+ a b) c)`.

## Bindings and control flow

```coil
(module example.control)
(defn classify [(n i64)] (-> (slice u8))
  (cond (< n 0) "negative"
        (= n 0) "zero"
        :else "positive"))

(defn main [] (-> i64)
  (let [limit 5
        (mut total) 0]
    (for i (range 0 limit)
      (set! total (+ total i)))
    (println "total={} sign={}" total (classify total))
    (println "{}" (case total 10 "ten" 11 "eleven" "other"))
    (let [found (block :search
                  (for i (range 1 100)
                    (when (= (% i 7) 0) (return-from :search i)))
                  -1)]
      (println "first multiple of 7: {}" found))
    0))
```

```output
total=10 sign=positive
ten
first multiple of 7: 7
```

- `let` binds in sequence. A plain name is immutable; `(mut name)` is a mutable
  cell, written with `(set! name value)`. For plain data (no `Drop`) the cell is a
  copy, even of a parameter or another local: `(let [(mut c) r] …)` never changes
  `r`. To alias a place instead, write it as `(mut place)`.
- `(if test then else)` requires both branches, and they must have the same type.
- `(do a b c)` runs forms in order and yields the last.
- `cond` takes flat test/value pairs; `:else` is always true. `case` compares one
  value against keys with `=`, and a lone final clause is the default.
- `when` evaluates its body if the test holds; `unless` if it fails.
- `for x coll` walks anything `Iterable`, and `(range lo hi)` is half-open. The
  binding may be a pattern: `(for (Point :x x) points …)`.
  `while`, `loop` with `(break value)` and `(continue)`, and labelled
  `(block :name … (return-from :name value))` cover everything else.
- There is no `return`; a function's value is its last expression.

A form whose value nothing uses is a statement, so `when`, loops, and `if` or
`match` arms of different types all work in a `void` function.

`scope` with `defer` runs cleanups in reverse order when the scope exits, including
by `return-from`:

```coil
(module example.scope)
(defn main [] (-> i64)
  (let [(mut log) 1]
    (scope :work
      (defer (set! log (* log 10)))
      (defer (set! log (+ log 2)))
      (return-from :work 0))
    (println "{}" log)
    0))
```

```output
30
```

### Destructuring

`let` bindings and function parameters accept patterns:

```coil
(module example.destructuring)
(defstruct Point [(x i64) (y i64)])

(defn sum-pair [([a b] (slice i64))] (-> i64) (+ a b))

(defn main [] (-> i64)
  (let [[first second & rest] [10 20 30 40]
        (Point :x px) (Point :x 1 :y 2)]
    (println "{} {} {} {}" first second (len rest) px)
    (println "{}" (sum-pair [3 4]))
    0))
```

```output
10 20 2 1
7
```

- `[a b & rest :as all]` matches a prefix of an array, slice or Code list. `&`
  binds the remainder, `:as` binds the whole value, and `_` ignores an element.
- `(Point :x px)` selects any subset of a struct's fields, and patterns nest.
  `(as whole (Point :x x))` names the whole struct.

## Functions

```coil
(module example.functions)
(defn move [(x i64) (dx i64) (scale i64)] (-> i64)
  (+ x (* dx scale)))

(defn largest [(T Ord)] [(a T) (b T)] (-> T)
  (if (> a b) a b))

(defn apply-twice [(f (fnptr c [i64] i64)) (x i64)] (-> i64)
  (f (f x)))

(defn main [] (-> i64)
  (println "{}" (move 1 2 3))
  (println "{}" (move :scale 3 :x 1 :dx 2))
  (println "{} {}" (largest 3 9) (largest 2.5 1.0))
  (println "{}" (apply-twice (fn [n] (* n n)) 3))
  (println "{}" (fold (fn [acc n] (+ acc n)) 0 (map (fn [n] (* n 2)) (range 0 4))))
  0)
```

```output
7
7
9 2.5
81
12
```

- A generic function lists its type parameters before its parameters: `[T]`, or
  `[(T Ord)]` to require a trait. Calls infer type arguments, or you can write
  them: `(largest [i64] 3 9)`.
- Any call may name its arguments, `(move :scale 3 :x 1 :dx 2)`. A call is either
  all positional or all named, and Coil evaluates arguments left to right as
  written.
- `(fn [x] body)` is an anonymous function. Its parameter types come from the
  expected function-pointer type or `Callable` bound. It cannot capture locals; use
  `coil.closure/defclosure` when you need an environment.
- `(fnptr-of name)` takes a named function's address. You call a value of `fnptr`
  type like a function.

### Compile-time value parameters

A type parameter declared `(const N TYPE)` is a value known at compile time: an
integer, `bool` or `Keyword`. It sizes arrays and makes types distinct:

```coil
(module example.quantities)
(defstruct Quantity [(const Unit Keyword)] [(value f64)])

(defn add [(const U Keyword)] [(a (Quantity U)) (b (Quantity U))] (-> (Quantity U))
  (Quantity :value (+ (.value a) (.value b))))

(defn length [T (const N i64)] [(xs (array T N))] (-> i64) N)

(defn main [] (-> i64)
  (let [a (: (Quantity :value 1.5) (Quantity :meters))
        b (: (Quantity :value 2.0) (Quantity :meters))]
    (println "{} {}" (.value (add a b)) (length [1 2 3]))
    0))
```

```output
3.5 3
```

`(Quantity :meters)` and `(Quantity :feet)` are different types, so passing one
where the other is expected is a type error. Type positions don't compute:
`(array T (+ N 1))` is not a type.

### Annotations

Declarations take typed `:key value` annotations between the name and the
parameter list. `defannotation` declares a key and its value type; metaprograms
read them.

```coil
(module example.annotations)
(defsum Route (Get [(path (slice u8))]) (Post [(path (slice u8))]))
(defannotation :http/route Route)

(defn list-users :http/route (Get "/users") [] (-> i64) 0)

(defn square :inline (Always) [(x i64)] (-> i64) (* x x))

(defn main [] (-> i64) (square (list-users)))
```

`:inline` (`Always`, `Hint`, `Never`) is built in. So is `:params`, which names the
parameters of a callable `def`.

## Structs

```coil
(module example.structs)
(defstruct Point [(x i64) (y i64)])
(defstruct Rect [(origin Point) (size Point)])

(defn area [(r Rect)] (-> i64)
  (* (.x (.size r)) (.y (.size r))))

(defn grow! [(r (mut Rect)) (by i64)] (-> void)
  (set! (.x (.size r)) (+ (.x (.size r)) by))
  (set! (.. r size y) (+ (.. r size y) by)))

(defn main [] (-> i64)
  (let [(mut r) (Rect :origin (Point :x 0 :y 0) :size (Point :x 2 :y 3))]
    (grow! (mut r) 1)
    (println "{}" (area r))
    0))
```

```output
12
```

- Construct with `:field value` pairs in any order, giving each field exactly
  once.
- `(.field v)` reads a field, `(.. v a b)` is shorthand for `(.b (.a v))`, and
  `(set! (.field v) x)` writes one. Reading a field of a call result works too;
  writing one is an error, since the temporary would be discarded.
- A parameter's type decides how it passes. `(r Rect)` is an immutable
  reference, so passing a big struct never copies it. `(r (mut Rect))` is a
  mutable reference, and the caller passes `(mut place)`. `(r (ptr Rect))` is a
  raw pointer.
- `[1 2 3]` is an `(array i64 3)`. Where Coil expects a `(slice T)`, it borrows the
  array as one.
- `(zeroed T)`, `(sizeof T)`, `(alignof T)` and `(offsetof T field)` are
  compile-time.

### Computed fields

When a type has no field named `name`, `(.name x)` looks for an impl on the marker
type `(Field X :name)`. You then read and write the computed field like a stored
one:

```coil
(module example.fields)
(defstruct Celsius [(degrees f64)])

(impl FieldGet (Field Celsius :fahrenheit)
  (get-field [(self (Field Celsius :fahrenheit)) (c Celsius)] (-> f64)
    (+ 32.0 (* 1.8 (.degrees c)))))

(impl FieldSet (Field Celsius :fahrenheit)
  (set-field! [(self (Field Celsius :fahrenheit)) (c (mut Celsius)) (f f64)] (-> i64)
    (set! (.degrees c) (/ (- f 32.0) 1.8))
    0))

(defn main [] (-> i64)
  (let [(mut t) (Celsius :degrees 100.0)]
    (println "{}" (.fahrenheit t))
    (set! (.fahrenheit t) 32.0)
    (println "{}" (.degrees t))
    0))
```

```output
212.0
0.0
```

## Sum types and match

```coil
(module example.exprs)
(import "coil.alloc" :as alloc :use [arena-allocator])

(defsum Expr
  (Num [(value i64)])
  (Add [(left (ptr Expr)) (right (ptr Expr))])
  (Negate [(inner (ptr Expr))]))

(defn eval [(e (ptr Expr))] (-> i64)
  (match (load e)
    (Num [n] n)
    (Add [l r] (+ (eval l) (eval r)))
    (Negate [x] (- (eval x)))))

(defn describe [(e Expr)] (-> (slice u8))
  (match e
    (Num [_] "a number")
    (_ "an operation")))

(defn main [] (-> i64)
  (let [a (arena-allocator 1024)
        two (alloc/box! a Expr (Num 2))
        five (alloc/box! a Expr (Num 5))
        sum (Add :left two :right (alloc/box! a Expr (Negate five)))]
    (println "{} is {}" (eval (alloc/box! a Expr sum)) (describe sum))
    0))
```

```output
-3 is an operation
```

- `match` must be exhaustive; a missing variant is a compile error that names it.
  A final `(_ body)` arm covers every variant not already listed.
- Payload fields bind positionally, `(Add [l r] …)`, and each position accepts a
  full pattern, such as `(Located [(Point :x x)] …)`.
- Construct a variant positionally or by name: `(Num 2)`,
  `(Add :left a :right b)`.
- A recursive sum holds its children behind `(ptr …)`.

Use `defsum` for a closed set of shapes: states, messages, syntax trees, errors.
When you add a variant, the compiler flags each `match` that misses it. Use a
struct with an integer `kind` field only when you need a fixed binary layout.

### Option, Result and try

`(Option T)` is `(Some v)` or `(None)`. `(Result T E)` is `(Ok v)` or `(Err e)`.
Both are ambient. Inside `(try …)`, `(try! r)` unwraps an `Ok` or returns the
`Err`, and `(try? o)` does the same for `Option`:

```coil
(module example.parsing)
(import "coil.try" :use [try try!])

(defsum ParseError (Empty) (NotADigit [(at i64)]))

(defn parse [(s (slice u8))] (-> (Result i64 ParseError))
  (if (empty? s)
      (Err (Empty))
      (let [(mut n) 0 (mut bad) -1]
        (for i (range 0 (len s))
          (let [c (get s i)]
            (if (and (>= c #\0) (<= c #\9))
                (set! n (+ (* n 10) (- (cast i64 c) #\0)))
                (when (< bad 0) (set! bad i)))))
        (if (< bad 0) (Ok n) (Err (NotADigit bad))))))

(defn add-strings [(a (slice u8)) (b (slice u8))] (-> (Result i64 ParseError))
  (try (Ok (+ (try! (parse a)) (try! (parse b))))))

(defn show [(r (Result i64 ParseError))] (-> void)
  (match r
    (Ok [v] (println "ok {}" v))
    (Err [(NotADigit [at])] (println "bad digit at {}" at))
    (Err [_] (println "empty"))))

(defn main [] (-> i64)
  (show (add-strings "12" "30"))
  (show (add-strings "12" "3x"))
  (show (add-strings "" "1"))
  0)
```

```output
ok 42
bad digit at 1
empty
```

A nested variant pattern such as `(Err [(NotADigit [at])] …)` matches only when
the inner variant does; otherwise matching moves on to the next arm. `coil.result`
has the combinators: `unwrap-or`, `opt-map`, `res-map`, `map-err`,
`and-then`, `ok-or`, `some?`, `ok?`.

## Traits

```coil
(module example.traits)

(defstruct Vec2 [(x i64) (y i64)])

(impl Add Vec2
  (+ [(a Vec2) (b Vec2)] (-> Vec2)
    (Vec2 :x (+ (.x a) (.x b)) :y (+ (.y a) (.y b)))))

(impl Display Vec2
  (display-fmt [(v Vec2) (f (ptr Formatter))] (-> i64)
    (fmt (formatter-writer f) "<{}, {}>" (.x v) (.y v))
    0))

(deftrait Area [Self]
  (area [(self Self)] (-> i64)))

(impl Area Vec2
  (area [(v Vec2)] (-> i64) (* (.x v) (.y v))))

(defn total-area [(T Area)] [(a T) (b T)] (-> i64)
  (+ (area a) (area b)))

(defn main [] (-> i64)
  (let [a (Vec2 :x 1 :y 2)
        b (Vec2 :x 3 :y 4)]
    (println "{} + {} = {}" a b (+ a b))
    (println "{}" (total-area a b))
    0))
```

```output
<1, 2> + <3, 4> = <4, 6>
14
```

- `(deftrait Name [Self] (method [(self Self) …] (-> R)) …)` declares a trait;
  `(impl Trait Type (method …))` implements it.
- Operators are trait methods. `+ - * / %` are `Add Sub Mul Div Rem`, `=`/`!=` are
  `Eq`, `< <= > >=` are `Ord`, and `& | ^ << >>` are `BitAnd`…`Shr`. An `impl` gives
  your type the operator.
- Collection operations are traits too: `Len` (`len`), `Get` (`get`), `Set`
  (three-argument `set!`), `Push` (`push!`), `Pop` (`pop!`), `Iterable` (`iter`) and
  `Iterator` (`next`). `empty?` works on anything with `Len`.
- `Display` (`{}`) and `Debug` (`{:?}`) are ambient; implement `display-fmt` or
  `debug-fmt`, or `derive Debug`.
- Any type can have an impl, including `(ptr T)`, `(slice T)`, `(array T N)`,
  function pointers, and one specific instance like `(Pair i64 i64)`.

### Methods without a trait

An `impl` with no trait attaches methods to a type. When a method's first
parameter is the type (or a `ptr`/`mut` to it), you pass that value first. Call a
method with no such parameter as `Type::name`:

```coil
(module example.counter)
(defstruct Counter [(count i64) (step i64)])

(impl Counter
  (new [(step i64)] (-> Counter) (Counter :count 0 :step step))
  (tick! [(c (mut Counter))] (-> i64) (set! (.count c) (+ (.count c) (.step c))) (.count c))
  (value [(c Counter)] (-> i64) (.count c)))

(defn main [] (-> i64)
  (let [(mut c) (Counter::new 5)]
    (tick! (mut c))
    (tick! (mut c))
    (println "{}" (value c))
    0))
```

```output
10
```

A method from a trait with the same name is still reachable as `Trait::method`.

### Generic impls, bounds and specialization

```coil
(module example.specialization)
(defstruct Pair [A B] [(first A) (second B)])

(deftrait Describe [Self] (describe [(x Self)] (-> (slice u8))))

(impl [A B] Describe (Pair A B) (describe [(p (Pair A B))] (-> (slice u8)) "a pair"))
(impl Describe (Pair i64 i64) (describe [(p (Pair i64 i64))] (-> (slice u8)) "two integers"))

(impl [(T Eq)] Eq (Pair T T)
  (= [(a (Pair T T)) (b (Pair T T))] (-> bool)
    (and (= (.first a) (.first b)) (= (.second a) (.second b)))))

(defn main [] (-> i64)
  (println "{}" (describe (Pair :first 1 :second true)))
  (println "{}" (describe (Pair :first 1 :second 2)))
  (println "{}" (= (Pair :first 1 :second 2) (Pair :first 1 :second 2)))
  0)
```

```output
a pair
two integers
true
```

- Type parameters go first, `(impl [A B] …)`, and take bounds the same way `defn`
  does: `[(T Eq)]`. Coil checks a bound where code uses the impl.
- When several impls match, the most specific one wins. Coil reports two
  overlapping impls, neither more specific, at the first use of the overlap.
- Bounds can constrain associated types: `[(I (Iterator i64))]` means "an iterator
  whose item is `i64`".
- Method calls see through `ptr` and `mut`, so `(len p)` on a `(ptr (ArrayList T))`
  finds the list's `len`.

⚠ You can't implement a trait for a reference type `(mut T)`. Implement it for `T`.

### Deriving

```coil
(module example.deriving)

(defstruct Point [(x i64) (y i64)])
(derive Debug Eq Hash Clone Point)

(defsum Event
  (Login [(user (slice u8)) (token (slice u8))])
  (Logout [(user (slice u8))]))
(derive (Debug (variant Login (field token (skip)))) Event)

(defn main [] (-> i64)
  (println "{:?} {}" (Point :x 1 :y 2) (= (Point :x 1 :y 2) (Point :x 1 :y 2)))
  (println "{:?}" (Login :user "ada" :token "secret"))
  (println "{:#?}" (Point :x 1 :y 2))
  0)
```

```output
(Point :x 1 :y 2) true
(Login :user "ada")
(Point
  :x 1
  :y 2
)
```

`derive` is a library macro. Each derivable trait registers its own generator, and
you can register one for your own trait; see [Custom derives](#custom-derives).
Derivers ship with `Eq`, `Hash`, `Clone`, `Copy`, `Debug`,
`Arbitrary` (from `coil.prop`) and `Serialize`/`Deserialize` (from `coil.serde`).

### Trait objects

`(dyn Trait)` pairs a pointer with a generated vtable, so one function can accept
values of different types at run time. The trait's methods take `(self (ptr Self))`,
and a `(mut local)` or a `(ptr T)` converts to `(dyn Trait)` wherever one is
expected:

```coil
(module example.speak)

(deftrait Speak [Self] (speak [(self (ptr Self))] (-> (slice u8))))

(defstruct Dog [(age i64)])
(defstruct Cat [(lives i64)])
(impl Speak Dog (speak [(self (ptr Dog))] (-> (slice u8)) "woof"))
(impl Speak Cat (speak [(self (ptr Cat))] (-> (slice u8)) "meow"))

(defn introduce [(animal (dyn Speak))] (-> i64)
  (println "{}" (speak animal))
  0)

(defn main [] (-> i64)
  (let [(mut dog) (Dog :age 3)
        (mut cat) (Cat :lives 9)]
    (introduce (mut dog))
    (introduce (mut cat))
    0))
```

```output
woof
meow
```

An immutable borrow does not convert, because a trait method may write through
its `(ptr Self)`.

### Callable values

A type that implements `Callable` can be called like a function. Dispatch is
static, and the call inlines:

```coil
(module example.callable)
(defstruct Scale [(factor i64)])

(impl Callable Scale
  (call [(self Scale) (x i64)] (-> i64) (* (.factor self) x)))

(defn main [] (-> i64)
  (let [triple (Scale :factor 3)]
    (println "{}" (triple 14))
    0))
```

```output
42
```

`coil.var/Var` is a shared, updatable cell. A `Var` holding a function pointer is
callable; the REPL builds hot reload on it. `coil.closure/defclosure`
generates a callable closure type with a captured environment.

## Memory and ownership

Coil has no garbage collector and no ambient heap. Storage is one of three kinds:

- **Locals.** `(let [(mut x) value] …)` is initialized frame storage.
- **Allocator-owned.** Every allocating API takes a `(dyn Allocator)` argument, so
  the caller chooses the strategy.
- **Static.** `(def name value)` is a module-level global.

```coil
(module example.memory)
(import "coil.alloc" :as alloc :use [malloc-allocator arena-allocator])
(import "coil.arraylist" :use [ArrayList al-new al-free!])

(defstruct Node [(value i64) (next (ptr Node))])

(defn main [] (-> i64)
  (let [heap (malloc-allocator)
        node (alloc/box! heap Node (Node :value 7 :next (cast (ptr Node) 0)))]
    (println "boxed {}" (.value node))
    (alloc/destroy heap node))

  ; An arena frees everything at once when it is released.
  (let [scratch (arena-allocator 4096)
        (mut xs) (al-new [i64] scratch)]
    (push! (mut xs) 1)
    (push! (mut xs) 2)
    (println "{} items" (len xs)))

  (let [(mut ys) (al-new [i64] (malloc-allocator))]
    (push! (mut ys) 3)
    (println "{:?}" (pop! (mut ys)))
    (al-free! (mut ys)))
  0)
```

```output
boxed 7
2 items
(Some 3)
```

| Allocator | Use |
|---|---|
| `(malloc-allocator)` | general purpose, process lifetime |
| `(arena-allocator cap)` | bump allocation, freed together |
| `coil.scratch` | segmented arena with marks and reset, for temporaries |
| `coil.region` | tracks each allocation; closing frees what's left |
| `coil.dbgalloc`, `coil.guardalloc` | leak, double-free and overflow detection ([DEBUGGING.md](DEBUGGING.md)) |

`alloc/box!` allocates one initialized value (it aborts on exhaustion; `alloc/box`
returns an `Option`). The typed APIs are `alloc/alloc`, `alloc/free`,
`alloc/reallocate` and `alloc/destroy`.

⚠ `(ptr T)` is a raw pointer: nothing checks its lifetime. Don't return a pointer
to a local.

### Ownership: Drop and Clone

Most types are plain data. A type that implements `Drop` becomes an **owner**.
Coil destroys an owner exactly once, when it goes out of scope, and assigning or
passing it moves it:

```coil
(module example.files)
(defstruct File [(name (slice u8))])

(impl Drop File
  (drop [(self (mut File))] (-> void)
    (println "closing {}" (.name self))))

(defn consume [(f File)] (-> i64)
  (println "using {}" (.name f))
  0)

(defn main [] (-> i64)
  (let [a (File :name "a.txt")
        b (File :name "b.txt")]
    (consume b)
    (println "end of scope"))
  0)
```

```output
using b.txt
closing b.txt
end of scope
closing a.txt
```

- Using a moved value is a compile error. `(clone x)` duplicates through `Clone`,
  which `derive` can generate.
- Structs, sums and arrays that contain owners get generated drop code, run in
  reverse field order. Drops run on every exit path: fall-through, `break`,
  `return-from`, and reassignment.
- Coil drops a call result that nothing receives at the end of its statement.
- Stores through a raw `(ptr T)` never drop the old value.
- Escape hatches: `(forget x)`, `(manually-drop x)`, `(take! (mut x))`.

`coil.rc` (`Rc`, `WeakRc`) and `coil.arc` (atomic `Arc`, `Weak`) are reference-counted
owners. `coil.pmap` and `coil.pvec` are persistent collections whose `clone` is O(1).
Owners that outlive a lexical allocator take an `AllocatorLease` instead of a
`(dyn Allocator)`, for example `(malloc-allocator-lease)`.

### Globals

```coil
(module example.globals)
(import "coil.var" :use [var-static])

(const TABLE-SIZE 16)
(def greeting "hello")
(def counter (var-static i64 0))

(defn bump! [] (-> i64)
  (set counter (+ (get counter) 1))
  (get counter))

(defn main [] (-> i64)
  (bump!)
  (bump!)
  (println "{} {} {}" greeting TABLE-SIZE (bump!))
  0)
```

```output
hello 16 3
```

`const` is evaluated at compile time and may call any function. `def` is a
module-level binding with static storage; it can't be assigned. For a mutable
global, `def` a `Var` made by `var-static`, then read it with `get` and write it
with `set`.

## Collections and iteration

| Namespace and type | Traits |
|---|---|
| `(slice T)`, `(array T N)` | `Len` `Get` `Set` `Iterable` |
| `coil.arraylist`: `(ArrayList T)` | `Len` `Get` `Set` `Push` `Pop` `Iterable` |
| `coil.hashmap`: `(HashMap K V)` | `Len` `Get` (returns `Option`) `Set` `Iterable` (keys) |
| `coil.fixedlist`: `(FixedList T)`, `(InlineList T N)` | `Len` `Get` `Set` `Push` `Pop` `Iterable` |
| `coil.pvec`: `(PVec T)`, `coil.pmap`: `(PMap K V)` | persistent; `Len` `Clone` `Drop` |

```coil
(module example.collections)
(import "coil.alloc" :use [malloc-allocator])
(import "coil.arraylist" :use [ArrayList al-free!])
(import "coil.hashmap" :use [hm-new-scalar hm-free!])
(import "coil.collect" :use [collect])
(import "coil.iter" :use [Indexed])

(defn even? [(n i64)] (-> bool) (= (% n 2) 0))

(defn main [] (-> i64)
  (let [a (malloc-allocator)
        (mut xs) (collect [(ArrayList i64)] a [5 2 8 1])
        (mut ages) (hm-new-scalar [i64 i64] a)]
    (set! (mut xs) 0 50)
    (println "len={} first={} last={}" (len xs) (get xs 0) (get xs 3))

    (let [evens (count (filter (fn [n] (even? n)) xs))
          total (fold (fn [acc n] (+ acc n)) 0 (take 2 (skip 1 xs)))]
      (println "evens={} total={}" evens total))

    (for (Indexed :index i :value n) (enumerate [10 20])
      (println "{}: {}" i n))

    (set! (mut ages) 7 42)
    (match (get ages 7)
      (Some [age] (println "7 -> {}" age))
      (None [] (println "missing")))

    (al-free! (mut xs))
    (hm-free! (mut ages))
    0))
```

```output
len=4 first=50 last=1
evens=3 total=10
0: 10
1: 20
7 -> 42
```

- Iterator adapters are lazy and never allocate: `map`, `filter`, `take`, `skip`,
  `enumerate` (yielding `.index`/`.value` pairs), `chain`, `zip`, `range`. The
  consumers are `fold`, `count`, `find`, `any?` and `all?`. The function or count
  comes first, as in Clojure.
- `collect` builds an owned collection from an array or slice, with the allocator
  explicit.
- A fixed list never allocates or grows. `(fixed-list storage)` uses a slice you
  provide (from an arena, say); `(inline-list [T N])` holds `N` elements itself, so
  it can be a struct field. `push!` onto a full one aborts in every build.
- `HashMap` keys that are strings need key operations: `(str-keyops)` copies keys
  into the map, while `(str-keyops-borrowed)` borrows them.
- Release an `ArrayList` from a general-purpose allocator with
  `(al-free! (mut xs))`. Remove a map entry with `hm-remove!`.

## Text and output

```coil
(module example.text)
(import "coil.alloc" :use [malloc-allocator])
(import "coil.str" :use [sv string-from-view string-push-view! string-as-view string-view-bytes string-free!])

(defn main [] (-> i64)
  (println "{} {:?} {:x} {}" 42 "quoted" 255 1.5)
  (println "[{:>6}] [{:<6}] [{:06.2}]" "ab" "cd" 3.14159)
  (let [(mut s) (string-from-view (malloc-allocator) (sv "hello"))]
    (string-push-view! (mut s) (sv ", world"))
    (println "{}" (string-view-bytes (string-as-view s)))
    (string-free! (mut s)))
  (println "{}" (= "abc" "abc"))
  0)
```

```output
42 "quoted" ff 1.5
[    ab] [cd    ] [003.14]
hello, world
true
```

- `println`/`print` take a format string. `{}` uses `Display`, `{:?}` compact
  `Debug`, `{:#?}` pretty `Debug`, and `{:x}` hex. A spec can add
  `[[fill]align][+][0][width][.precision]`: `{:>8}`, `{:.2}`, `{:08.3}`.
- A float's `{}` rounds to at most six decimals (`1.5e-7` prints `0.0`); its `{:?}` is
  the shortest text that reads back as the same value (`0.1`, `1.5e-7`,
  `0.30000000000000004`), unless the spec gives a precision.
- `(fmt w "…" args…)` formats to any `(ptr Writer)`, such as `(stdout)`, `(stderr)`,
  a buffer or a file (from `coil.io`).
- A string literal is `(slice u8)`, and byte strings compare with `=`.
- `coil.str` adds validated UTF-8 types. `StringView` is a borrowed view (`(sv "…")`
  for literals, `string-view-from-utf8` for untrusted bytes). `String` is an owned,
  growable buffer. Iterating either yields `Rune`s; `coil.unicode.grapheme` gives
  grapheme clusters.

`println` returns a `Result` carrying any I/O error. As a statement its value is
discarded.

## Modules

```
; src/geometry/shapes.coil
(module myapp.geometry.shapes)
(export Circle area)                          ; optional: default exports everything

(defstruct Circle [(radius f64)])
(defn area [(c Circle)] (-> f64) (* 3.14159 (* (.radius c) (.radius c))))
```

```
; src/main.coil
(module myapp.main)
(import "myapp.geometry.shapes" :as shapes)    ; qualified: shapes/area
(import "coil.arraylist" :use [ArrayList al-new])   ; selected names
(import "coil.hashmap" :use *)                 ; everything
(import "coil.io" :use * :exclude [print])     ; all but these
(import "coil.fmt" :use * :rename [[fmt fmt-to]])
```

- An import names a **namespace**, never a file. Coil indexes every `.coil` file
  under the project's source roots, its dependencies and the standard library.
  The file that declares `(module myapp.geometry.shapes)` is that module wherever it
  lives.
- Prefix every module with your project's name. The standard library is `coil.*`.
- A file that other modules import must start with `(module NAME)`. A single-file
  program can omit it.
- Every module implicitly imports `coil.core` (`Option`, the traits, `println`,
  `when`, `for`…). An explicit `(import "coil.core" …)` replaces that implicit
  import, so you can exclude or shadow core names.

Two modules may declare the same C `extern`. A C symbol is global to the linker,
but a declaration belongs to the module that wrote it: each module's calls are
built against its own prototype, so declarations may differ in integer width
(`mode_t` as `u16` in one module and `i64` in another), as separate C files may. It
is an error only when no single callee could satisfy both: a different register
class (integer vs float vs struct vs pointer), arity, varargs, or calling
convention. On wasm, where an import is typed per symbol, every declaration of a
symbol must agree exactly.

`coil namespaces` lists the standard library, and `coil namespace NAME` prints one
namespace's definitions and docs.

## Compile time

Coil runs ordinary Coil at compile time: the full language, including allocation,
collections and FFI.

```coil
(module example.consteval)
(defn fib [(n i64)] (-> i64) (if (< n 2) n (+ (fib (- n 1)) (fib (- n 2)))))

(const FIB-20 (fib 20))

(defn main [] (-> i64)
  (println "{} {}" FIB-20 (comptime (* 6 7)))
  0)
```

```output
6765 42
```

`const` and `(comptime E)` evaluate once during compilation and embed the result.
The result must be a literal-shaped value: a scalar, string, array, or non-generic
struct or sum. It can't be a pointer.

### Macros

A macro is a function from `Code` to `Code`. Quasiquote builds code: `` `form ``
quotes it, `~x` inserts a value, and `~@xs` splices a list.

```coil
(module example.macros)
(defn swap! [(a Code) (b Code)] (-> Code)
  `(let [tmp ~a]
     (set! ~a ~b)
     (set! ~b tmp)))

(defn repeat [(n Code) & (body Code)] (-> Code)
  `(for _ (range 0 ~n) ~@body))

(defn main [] (-> i64)
  (let [(mut tmp) 1 (mut other) 2]
    (swap! tmp other)
    (println "tmp={} other={}" tmp other)
    (repeat 2 (println "again"))
    0))
```

```output
tmp=2 other=1
again
again
```

- Macros are hygienic. The template's `tmp` is not the caller's `tmp`: names
  resolve where they were written.
- `& (body Code)` collects the remaining arguments as one Code list.
- `Code` is an immutable collection: `(len form)`, `(get form i)` and
  `(for child form …)` walk it, and iterator consumers such as `any?` and `fold`
  accept it. To build a list, push onto a `CodeBuilder` from
  `primitive/code-list-new` and splice it with `~@`.
- `coil dump-hygiene FILE` prints the expanded program with scope information, and
  `--trace-macros` logs each expansion.
- `(meta (generator))` runs a generator and splices the top-level forms it returns.

### Reflection

Inside a macro, `primitive/code-field-count`, `code-field-name`, `code-field-type`,
`code-variant-count`, `code-variant-name` and `code-trait-method-*` describe a type
named by a Code symbol. `derive` is built from them.

### Custom derives

```coil
(module example.derive)
(import "coil.primitive" :as primitive)

(deftrait FieldNames [Self] (field-name [(x Self) (i i64)] (-> (slice u8))))

(defderive FieldNames
  (struct [T]
    (let [(mut arms) (primitive/code-list-new)]
      (for i (range 0 (primitive/code-field-count T))
        (push! (mut arms) `~i)
        (push! (mut arms) `~(primitive/code-str (primitive/code-field-name T i))))
      `(impl FieldNames ~T
         (field-name [(x ~T) (i i64)] (-> (slice u8))
           (case i ~@arms "?"))))))

(defstruct Point [(x i64) (y i64) (z i64)])
(derive FieldNames Point)

(defn main [] (-> i64)
  (let [p (Point :x 1 :y 2 :z 3)]
    (for i (range 0 3) (println "{}" (field-name p i))))
  0)
```

```output
x
y
z
```

Unquoting an ordinary value, as in `` `~i `` or a string, makes it a literal in the
generated code. A `defderive` has a `struct` arm, a `sum` arm, or both, and
deriving for a shape it lacks is an error at the `derive`.

## Metaprograms: lints and transforms

A **checker** is a function over the whole program that reports problems. A
**transform** rewrites the whole program. Both are ordinary Coil functions of type
`[(modules Code)] (-> Code)`, registered at top level. They run whenever a build
loads their module: through an import, through `--use NAME` on the command line,
or through `[metaprograms] use = [...]` in `Coil.toml`.

The program arrives as a list of modules, `((module-name form…) …)`, and includes
the standard library. `coil.meta/user-forms` returns just the forms the user
wrote, and `user-module?` tells a transform which modules to leave alone.

### A lint with an automatic fix

This checker finds three or more nested `if`s and proposes an equivalent `cond`.
`primitive/suggest` reports a warning together with a replacement built from the
author's own nodes. Plain `coil lint` then prints the fix, and `coil lint --fix`
applies it, keeping the original text and comments of every reused node.

```
(module myapp.lint.cond)
(import "coil.primitive" :as primitive)
(import "coil.meta" :use [user-forms])

(defn hand-written-if? [(f Code)] (-> bool)
  (and (primitive/code-list? f)
       (= (len f) 4)
       (= (get f 0) `if)
       (not (primitive/code-macro? f))))    ; not produced by when/cond/case

(defn chain-length [(f Code)] (-> i64)
  (if (hand-written-if? f) (+ 1 (chain-length (get f 3))) 0))

(defn as-cond [(f Code)] (-> Code)
  (let [(mut clauses) (primitive/code-list-new)
        (mut at) f]
    (while (hand-written-if? at)
      (push! (mut clauses) (get at 1))
      (push! (mut clauses) (get at 2))
      (set! at (get at 3)))
    (push! (mut clauses) `:else)
    (push! (mut clauses) at)
    `(cond ~@clauses)))

(defn walk [(f Code)] (-> void)
  (when (>= (chain-length f) 3)
    (primitive/suggest f "three or more nested ifs read better as a cond" (as-cond f)))
  (for child f (walk child)))

(defn nested-ifs [(modules Code)] (-> Code)
  (for form (user-forms modules) (walk form))
  `0)

(checker nested-ifs)
```

```
$ coil lint src/main.coil --use myapp.lint.cond
warning: three or more nested ifs read better as a cond
  --> src/main.coil:3:3
help: try: (cond (= n 1) "one"
                 (= n 2) "two"
                 :else "many")
$ coil lint src/main.coil --use myapp.lint.cond --fix
```

To report without a fix, use `(primitive/warn node msg)`, or
`(primitive/report node msg)` for an error that fails the build. Coil collects
diagnostics, so one run reports all of them.
`(primitive/lint-param "myapp.lint.depth" "3")` reads a
`--lint-param myapp.lint.depth=5` option.

Checkers run after type checking, so they can ask what the compiler decided:

- `(primitive/type-of node)` is the inferred type.
- `(primitive/code-decl call)` is exactly which definition or impl method a call
  resolved to, even among same-named functions in several modules. Pass the whole
  call node, not its head symbol.
- `(primitive/binding-of ref)` identifies a local binding, which distinguishes
  shadowed names.
- `(primitive/code-doc node)` is a definition's `;;;` documentation.

### A transform

This transform defines a tiny dialect: `(inc e)` means `(+ e 1)`. It rebuilds only
the nodes that contain an `inc`. `code-list-like` keeps each rebuilt node's shape,
source location and hygiene. A transform returns the list of modules.

```
(module myapp.inc)
(import "coil.primitive" :as primitive)

(defn inc-call? [(f Code)] (-> bool)
  (and (primitive/code-list? f) (= (len f) 2) (= (get f 0) `inc)))

(defn mentions-inc? [(f Code)] (-> bool)
  (or (inc-call? f) (any? (fn [child] (mentions-inc? child)) f)))

(defn rewrite [(f Code)] (-> Code)
  (cond (inc-call? f) `(+ ~(rewrite (get f 1)) 1)
        (mentions-inc? f)
          (let [(mut kids) (primitive/code-list-new)]
            (for child f (push! (mut kids) (rewrite child)))
            (primitive/code-list-like f `(~@kids)))
        :else f))

(defn desugar-inc [(modules Code)] (-> Code)
  (let [(mut out) (primitive/code-list-new)]
    (for m modules (push! (mut out) (rewrite m)))
    `(~@out)))

(transform desugar-inc)
```

A module that does `(import "myapp.inc")` can now write `(inc (inc 40))`.

Transforms run until the program stops changing, and Coil type-checks the program
again after each round. A transform may receive code that doesn't type-check yet;
that is how `inc` becomes valid. Checkers run afterwards, once.
`:phase before-expand` runs a checker or transform on the source before macro
expansion; see [METAPROGRAMS.md](METAPROGRAMS.md) for phases, `transform-once`, and
the full reflection API.

The bundled lints are in `coil.lint.*`. Plain `coil lint` applies the default
profile (`coil.lint.default`). Add opt-in lints with `--use`, for example
`coil.lint.no-star-imports`, `coil.lint.unused` and `coil.lint.allocator`.

## FFI

```coil
(module example.ffi)

(extern strlen :cc c [(ptr i8)] (-> u64))
(extern qsort :cc c [(ptr i8) u64 u64 (fnptr c [(ptr i64) (ptr i64)] i32)] (-> void))

(defn compare [(a (ptr i64)) (b (ptr i64))] (-> i32)
  (cond (< (load a) (load b)) -1
        (> (load a) (load b)) 1
        :else 0))

(defn main [] (-> i64)
  (let [(mut xs) [5 3 9 1]]
    (qsort (cast (ptr i8) (mut xs)) 4 8 (fnptr-of compare))
    (println "{} {} {} {} / {}" (get xs 0) (get xs 1) (get xs 2) (get xs 3) (strlen c"four"))
    0))
```

```output
1 3 5 9 / 4
```

- `(extern name :cc c [ArgTypes…] (-> R))` declares a C function; `...` marks
  varargs. `:as "symbol"` binds a different linker name.
- Structs and floats cross the C ABI by value in both directions.
- `(cast (ptr T) (mut x))` gives C a raw pointer to a local.
- A Coil function passed to C as a callback is `(fnptr-of f)`. If the callback takes
  a struct by value, also list the function in `(export-c f)`.
- `(export-c [f :as "name"])` makes a Coil function callable from C.
  It defines that C symbol for the whole program, so every `extern` of the same
  symbol, the standard library's included, binds to your function instead of
  libc's, as when C objects are linked and one defines what another declares. The
  function must be something those externs could have called: the same register
  classes and arity (integer widths may differ), and no struct by value.
- `(cimport "header.h" :use [names…])` generates declarations for the listed names
  from a real header, and `coil cimport header.h` prints bindings for a whole
  header.
- `(declare f [(x T)] (-> R))` declares a Coil function compiled in another unit,
  as prebuilt units use.
- Link libraries with `-lNAME`, or in `Coil.toml` ([PROJECTS.md](PROJECTS.md)).

## Documentation comments

```
;;; Parse a decimal integer. Returns `(Err (Empty))` for an empty slice.
(defn parse [(s (slice u8))] (-> (Result i64 ParseError)) …)

;; An ordinary comment; not documentation.
```

A run of `;;;` lines directly above a definition is its documentation. `coil doc
FILE` prints a module's documented API as Markdown, and checkers can read it with
`primitive/code-doc`.

## Tests

```coil
(module example.tests)
(defn clamp [(x i64) (lo i64) (hi i64)] (-> i64)
  (cond (< x lo) lo (> x hi) hi :else x))

(deftest clamp-keeps-values-in-range
  (assert-eq (clamp 5 0 10) 5)
  (assert-eq (clamp -3 0 10) 0)
  (assert (<= (clamp 99 0 10) 10)))
```

`coil test FILE` runs each `deftest` in its own process, so a crash in one test
leaves the others running. In a project, `coil test` with no file finds the test
files from `Coil.toml`.

`defprop` states a property over generated inputs and shrinks any failure to a
minimal counterexample:

```
(import "coil.prop" :use *)

(defprop clamp-stays-in-range [(x i64) (lo i64) (hi i64)]
  (assume (<= lo hi))
  (let [y (clamp x lo hi)] (and (>= y lo) (<= y hi))))
```

[TESTING.md](TESTING.md) covers filters, suites, generators and `coil fuzz`.

## The metal tier

The rest of the language sits on primitive operations in `coil.primitive`. You
rarely need them directly:

```coil
(module example.metal)
(import "coil.primitive" :as primitive)

(defn main [] (-> i64)
  (let [x (: 0b1011_0000 u8)]
    (println "{} {} {}" (primitive/popcount x) (primitive/ctz x) (primitive/udiv (: 200 u8) 3))
    (println "{}" (primitive/imul-overflow? (: 9223372036854775807 i64) 2))
    0))
```

```output
3 4 66
true
```

| Operation | Primitives |
|---|---|
| Integer arithmetic, any width | `iadd isub imul idiv irem`, unsigned `udiv urem`, `iand ior ixor ishl ishr` |
| Comparison | `icmp-eq`… (integers only); `fcmp-eq`… for floats |
| Bits | `clz ctz popcount bswap rotl rotr mulhi` |
| Overflow | `iadd-overflow? isub-overflow? imul-overflow?`; `coil.integer` has `overflowing-add` and friends |
| Places | `load`, `store!`, `field`, `index` (pointer arithmetic) |
| Uninitialized storage | `alloc-stack` (frame lifetime), `alloc-stack-bytes`, `alloc-static` (a global cell, with an optional initializer, `:as "symbol"`, or sparse `:elements`) |
| Aliasing | `alias-load`/`alias-store!` promise type-based non-aliasing (TBAA) |
| Inline IR | `llvm-ir` |
| SIMD | `(vec T N)`, `(mask N)`, and `coil.simd`; see [SIMD.md](SIMD.md) |

`load`, `store!`, `field`, `index`, `cast`, `sizeof`, `alignof`, `offsetof`, `zeroed`,
`fnptr-of` and `call-ptr` are also available without the prefix. Null is
`(cast (ptr T) 0)`, and pointers compare by address with the ordinary operators.

⚠ `alloc-stack` storage lasts until the *function* returns, so calling it in a loop
grows the stack on every iteration. Prefer an initialized `(mut x)` local.

## Gotchas

- `f64` has no `=`; use `primitive/fcmp-eq` for IEEE equality.
- `if` needs both branches, of the same type, when its value is used.
- `cast` between floats and integers converts the value, not the bits.
- `primitive/…` names require `(import "coil.primitive" :as primitive)`.
- You can't implement a trait for `(mut T)`; implement it for `T`.
- `(dyn Trait)` accepts a `(mut local)` or a `(ptr T)`, not an immutable borrow.
- Don't call `alloc-stack` in a loop, and never return a pointer to a local.
- `call` is a built-in form, so no function can be named `call` (except the
  method of a `Callable` impl).

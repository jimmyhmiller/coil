# Testing Coil code

Coil has three kinds of test:

- **Example tests** (`deftest`): hand-picked inputs and assertions.
- **Property tests** (`defprop`): a law checked against generated inputs. A
  failure is shrunk to its smallest counterexample.
- **Fuzz campaigns** (`coil fuzz`): the same properties, driven by coverage
  feedback for as long as you let them run.

## Writing tests

```coil
(module example.math-test)

(defn clamp [(x i64) (lo i64) (hi i64)] (-> i64)
  (cond (< x lo) lo
        (> x hi) hi
        :else x))

(deftest clamp-inside
  (assert-eq (clamp 5 0 10) 5))

(deftest clamp-edges
  (assert-eq (clamp -3 0 10) 0)
  (assert-eq (clamp 42 0 10) 10)
  (assert-ne (clamp 42 0 10) 42)
  (assert (<= (clamp 7 0 10) 10)))
```

`deftest`, `assert`, `assert-eq` and `assert-ne` need no import. A failing
assertion prints the expression and its `file:line`, then aborts. Each test
runs in its own process, so a failure or crash in one test doesn't stop the
others.

## Testing compile errors

A macro that rejects bad input, or an API that should not type-check when
misused, is tested by compiling the bad code and checking the diagnostic.
`assert-compile-error` from `coil.test.compile` takes the text the diagnostics
must contain (a string, or a vector of strings that must all appear) and the
forms that must not compile:

```coil
(module example.compile-error-test)
(import "coil.test.compile" :use [assert-compile-error compile-errors])
(import "coil.result" :use [none?])

(deftest adding-a-string-is-rejected
  (assert-compile-error ["argument 2 to '+'" "has type (slice u8)"]
    (defn total [] (-> i64)
      (+ 1 "two"))))

(deftest a-macro-error-is-the-diagnostic
  (assert-compile-error "error: give it a positive count"
    (import "coil.primitive" :as primitive)
    (defn repeat-count [(n Code)] (-> Code)
      (if (> (primitive/code-int n) 0)
          n
          (do (primitive/report n "give it a positive count") `0)))
    (defn bad [] (-> i64)
      (repeat-count -1))))

(deftest good-code-has-no-errors
  (assert (none? (compile-errors (defn fine [] (-> i64)
                                   1)))))
```

The forms are not part of the test program. They are compiled while the test
runs by the in-process compiler (`coil.jit`, so a test file that imports
`coil.test.compile` links the compiler), as a submission of their own. They see
the standard library and, inside a project, the project's modules, but nothing
of the test file around them, so they carry their own imports. A test can be a
whole module's worth of definitions, such as a macro and its misuse. The forms
are still part of the test file's text, so they must read: an unbalanced
bracket or an unterminated string is an error in the test file itself.

Each form keeps the line and column it has in the test file, and diagnostics
name the test file, so `--> tests/macro_test.coil:14:31` is the place in the
test where the error was found. An expectation is any part of the diagnostic
text: the message, or `"macro_test.coil:14:31"` to pin the location too. Every
located diagnostic of the compile is there, a macro's `primitive/report` as well
as each type error.

A failure prints the expectation and what the compiler said, or that the forms
compiled. `(compile-errors FORM…)` is the same compile as a value:
`(Some text)` with the diagnostics (malloc'd, the caller's to free) when the
forms do not compile, `(None)` when they do.

## Running tests

```sh
coil test math_test.coil                     # every test in the file
coil test math_test.coil --filter clamp      # names containing "clamp"
coil test math_test.coil --filter a --filter b   # repeatable; either matches
coil test math_test.coil --list              # print the selection, run nothing
```

The exit status is 0 only if every selected test passed. A filter that
matches nothing fails with `0 tests matched`.

Inside a project, a bare `coil test` discovers test files instead:

```sh
coil test                  # every file in the default suites
coil test parser           # only files whose path contains "parser"
coil test parser lexer     # files whose path contains either
coil test --list           # what would run, grouped by suite
coil test --jobs 4         # run up to four tests at once
coil test --no-run         # compile and link, run nothing
```

By default, `coil test` looks for `*_test.coil` under `tests/`. All selected
files compile into one test harness, so shared imports build once. A project
with no test files says so (`no test files found`) rather than reporting a
pass, and a path selector that matches no file is an error. Runner options
such as `--filter` and `--cases` work here too and reach every test file. At a
workspace root, `coil test` runs each member's tests in turn and fails if any
member fails.
Tests inherit the project's configuration: dependencies, `[cc]`, `[link]`,
target and metaprograms. `coil check` typechecks the test files as well as the
entry.

## Test suites

Some tests should not run on every `coil test`, because they are slow, cost
money, or need a live service. Put them in a suite marked `default = false`:

```toml
[test.suites.unit]
roots = ["tests"]
suffixes = ["_test.coil"]

[test.suites.integration]
roots = ["tests/integration"]
suffixes = ["_integration.coil"]
default = false
```

```sh
coil test                          # default suites only
coil test --suite integration      # that suite (repeatable)
coil test --suite all              # every suite
coil test --list --suite all       # opt-in suites are marked [opt-in]
```

- A suite runs by default unless it says `default = false`.
- A plain `[test]` section is the suite named `default`. `all` and `default`
  are reserved names.
- Naming a file always runs it, whichever suite claims it. A path selector
  narrows the chosen suites.
- `coil verify` and `coil check` use the default suites only.
- An unknown `--suite`, a duplicate suite, or a missing root is an error.

## Property tests

A property states something that must hold for every input. Coil generates
the inputs, and when the property fails it shrinks the input to the smallest
one that still fails.

```coil
(module example.list-props)
(import "coil.prop" :use *)
(import "coil.arraylist" :use *)

(defn sum [(xs (ArrayList i64))] (-> i64)
  (fold (fn [total x] (+ total x)) 0 xs))

(defprop sum-is-order-independent [(a (ArrayList i64)) (b (ArrayList i64))]
  (= (+ (sum a) (sum b)) (+ (sum b) (sum a))))

(defprop halving-then-doubling [(n i64)]
  (assume (= (% n 2) 0))
  (= (* (/ n 2) 2) n))
```

The body yields a `bool`. `coil test` discovers a `defprop` the same way as a
`deftest`. A failure prints the counterexample and the command that
reproduces it:

```text
FAILED after 27 cases (2 shrinks, 8 shrink calls)

  counterexample:
    xs = (0 0 0)

  reproduce:  coil test tests/list_test.coil --seed 1903151487994059799 --cases 200
```

`coil test` saves counterexamples under `.coil/pbt/` and replays them first on
every later run.

### Where inputs come from

Each argument is generated by its type's `Arbitrary` implementation. Scalars,
`(slice u8)`, `(ArrayList T)` and `(Option T)` have one already. Derive one for
your own structs and sums:

```text
(derive Arbitrary Debug Shape)
```

The runner prints counterexamples with `Debug`. A size budget bounds recursive
sums, and they shrink toward the first-declared variant, so declare the base
case first.

To change how one type is generated, write an impl. The most specific impl
wins, so an impl for `(ArrayList u8)` can produce realistic payloads while
every other list keeps the generic one:

```text
(impl Arbitrary Email
  (arbitrary [(out (mut Email)) (s (ptr Source))] (-> i64) ...))
```

There is no shrinker to write. The runner records every random choice a
generator makes, shrinks by editing that record and regenerating, and so keeps
the generator's invariants in every shrunk value.

### Inside a property body

| Form | Meaning |
|---|---|
| `(assume COND)` | Discard this case if the precondition fails. The runner warns when most cases are discarded; generate valid inputs instead where you can |
| `(classify "label" COND)` | Count how often a condition holds; warns when one label covers nearly every case |
| `(collect "label" EXPR)` | Record a number's min, mean and max over the run; yields EXPR |
| `(target! EXPR)` | Steer generation toward inputs that maximize EXPR |
| `(source)` | The `Source` to draw from by hand: `draw-int!`, `draw-len!`, `bytes`, `string`, …. It works in any function the property calls, too |
| `(note "label" EXPR)` | Show EXPR as `label = …` in a counterexample; yields EXPR |
| `(draw-noted T "label")` | Draw any `Arbitrary` type and note it, in one step |

`(import "coil.prop" :use *)` brings in what writing properties takes: these
forms, `defprop`, `defprop-stateful`, `Arbitrary` and its helpers (`arb`,
`bytes`, `string`, `int-range`, `list-n`, …), and the `draw-…` and `span-…`
operations. Generator values are in `coil.prop.gen`, whose constructors are
plain words (`int`, `map`, `filter`): import it `:as gen`, build with
`(gen/int s 1 100)` or `(gen/list-of s g 1 8)`, and draw with `(draw g s)`. The engine
itself (`coil.prop.source`'s tapes and spans, `coil.prop.runner`) is not
re-exported; import those modules directly to work on it. `defprop` itself needs
nothing else in scope, so `(import "coil.prop" :use [defprop])` is enough for a
property that draws only its arguments.

Values drawn by hand are not arguments, so a report shows them only if you
note them:

```coil
(module example.draw-props)
(import "coil.prop" :use *)

(defprop percentages-stay-in-range [(scale i64)]
  (let [p (note "p" (draw-int! (source) 0 100))]
    (and (>= p 0) (<= p 100))))
```

### Runner options

Pass these with the file name, as `--cases 5000` or `--cases=5000`. Everything
else goes to the build.

| Flag | Default | Meaning |
|---|---|---|
| `--cases N` | 200 | Cases per property |
| `--seed N` | derived from the name | Makes a run reproducible |
| `--size N` | 60 | Size budget for generated values |
| `--shrink N` | 20000 | Limit on shrink attempts |
| `--max-rejects N` | 10 × cases | Discarded cases allowed before giving up |
| `--timeout N` | 60 | Seconds per case before it counts as a hang |
| `--arena BYTES` | 8 MiB | Per-case arena for generated values |
| `--verbose[=N]` | off | More output; `--verbose=1` prints the `classify`/`collect` distribution |
| `--no-fork` | off | Run cases in-process (faster, but a crash ends the run) |

Each case runs in a worker process that records its choices as it makes them,
so the runner can shrink a property that crashes or hangs as well as one that
returns false.

## Fuzz campaigns

`coil fuzz` runs a campaign against each property in a file, for as long as
you allow, instead of a fixed number of cases:

```sh
coil fuzz tests/fuzz/json_fuzz.coil --time 300 --jobs 4 --sanitize=address
```

The program is built with coverage instrumentation. Workers mutate a shared
corpus of inputs, keep each input that reaches new code (or reaches it a new
number of times), and reuse values that failed comparisons were looking for.
Inputs are the generators' recorded choices, so every mutant is still a valid
value of the argument types.

| Option | Meaning |
|---|---|
| `--time SECS` | Length per property (default 60; `0` runs until Ctrl-C, which still prints the report) |
| `-n N` | Stop each worker after N mutated inputs instead |
| `--jobs N` | Workers per property, sharing one corpus |
| `--filter SUBSTR` | Only properties whose name contains SUBSTR |
| `--sanitize=address` | Build with AddressSanitizer; each generated value gets its own allocation, so overruns are caught |
| `--debug-checks` | Build with Coil's runtime checks |
| `--input-timeout SECS` | An input running longer counts as a hang (default 10) |
| `--minimize-corpus` | Keep only corpus entries that add coverage, then stop |
| `--corpus DIR`, `--fuzz-dir DIR` | Use a different corpus or campaign directory |
| `--no-run`, `--keep` | Build the instrumented binary and stop / keep the build directory |

Everything a campaign writes lives under `.coil/fuzz/<property>/`:

- `corpus/`: the inputs; the next campaign resumes from them.
- `coverage.txt`: functions never entered, then reached/total edges for the
  rest. Check it: a target that never gets past its first check passes every
  campaign while testing nothing.
- `worker-<n>.log`: each worker's output.

A finding (false, a crash, a sanitizer report or a hang) is shrunk and saved to
`.coil/pbt/` like any counterexample, so a plain `coil test` replays it from
then on. Fuzzing needs the LLVM toolchain named by `llvm-config --bindir`. The
standard library's own targets are in `tests/fuzz/`.

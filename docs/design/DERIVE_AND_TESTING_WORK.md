# Generic derive, stateful property testing, and the gaps around them

> **Implementation note (2026-08-09):** the name-convention proposal in §1.2–1.4
> below was rejected. The implementation uses an explicit trait-to-deriver
> registry populated by `(register-derive …)`; `(defderive Trait (struct …)
> (sum …))` is syntax sugar that emits ordinary comptime functions and that
> registration. Function names have no dispatch meaning. `(derive Trait… Type)`
> asks the registry for the arm matching the type's struct/sum shape. The older
> text remains here as design history, not as the language contract; see the
> language guide's “Deriving trait implementations” section for the shipped API.

Work items, in the order they should be done. Everything asserted here about
current behaviour was run against `build/bin/coil` (2026-08-09); the failing
cases are reproduced verbatim rather than described.

---

## 1. Generic derive

### 1.1 What exists today

Three modules, twelve entry points, no compiler keyword anywhere — all of them
ordinary comptime `defn`s over the `code-*` reflection builtins.

| Module | Entry points |
|---|---|
| `coil.derive` | `derive-eq`, `derive-hash`, `derive-keyops`, `(derive Eq T)`, `(derive Hash T)` |
| `coil.prop.derive` | `derive-arbitrary`, `derive-arbitrary-sum`, `derive-show`, `derive-show-sum` |
| `coil.serde.derive` | `derive-serialize`, `derive-deserialize`, `derive-serde`, `derive-serde-sum`, `defsum-serde` |

`(derive Trait T)` in `coil.derive` is the only one that looks generic, and it
is not: it is a two-armed `if` over `Eq` and `Hash` that hard-errors on anything
else. Adding a derive today means editing that `if`, which is exactly the
closed-world shape the rest of the language avoids.

`docs/design/PROPERTY_TESTING.md` §4.4 and §9 both specify the derive as
`(derive Arbitrary T)`. The implementation shipped `derive-arbitrary` instead.
So the generic form was always the intent; this closes that gap rather than
inventing a new surface.

### 1.2 The rule: a derive macro is named exactly like the trait

This is what Rust does. `#[derive(Debug)]` dispatches to a macro named `Debug` —
same spelling as the trait, no prefix, no lowercasing, no alias. It works there
because Rust keeps derive macros in their own namespace.

Coil is a Lisp-1, so the question was whether a comptime macro named `Eq` can
coexist with the trait `Eq`, an `(impl Eq Point)`, and `=` dispatch. It can,
including when the macro lives in a different module from the trait and arrives
through `:use *`. Both cases were run and both pass.

That settles the naming question. **No mangling scheme.** An earlier draft of
this proposal suggested `derive-<lowercase>` or `<Trait>-derive`; both are worse
and the first cannot work at all — no mechanical case rule maps `PropShow` onto
`derive-show`, or `Serialize`+`Deserialize` onto `derive-serde`.

### 1.3 The implementation

The entire generic mechanism, and it needs no registry, no table, and no
compiler support:

```lisp
;; `(derive Trait… Type)` — one call per trait, each dispatching to the macro
;; NAMED EXACTLY LIKE THE TRAIT, resolved in the CALLER's scope.
(defn d--calls [(tname Code) (ts Code) (i i64) (n i64)] (-> Code)
  (if (>= i n)
      `()
      `((~(primitive/code-nth ts i) ~tname) ~@(d--calls tname ts (primitive/iadd i 1) n))))

(defn derive [& (args Code)] (-> Code)
  (let [n (primitive/code-count args)]
    (if (< n (cast i64 2))
        (primitive/error "derive: expected (derive Trait… Type)")
        `(do ~@(d--calls (primitive/code-nth args (primitive/isub n 1))
                         args 0 (primitive/isub n 1))))))
```

Type-last keeps `(derive Eq Point)` — the form that exists today — working
unchanged, and `(derive Eq (Box T))` still resolves because the generic target
is still the last argument.

A derive is then just a macro named after its trait:

```lisp
(defn Eq [(tname Code)] (-> Code)
  `(impl Eq ~tname
     (= [(a ~tname) (b ~tname)] (-> bool)
        ~(eq--and tname `a `b 0 (primitive/code-field-count tname)))))
```

Used:

```lisp
(defstruct Point [(x i64) (y i64)])
(derive Eq Hash Point)
```

The head symbol is spliced with a dummy span, so referential hygiene leaves it
alone and it resolves **in the caller's scope**. That gives the same contract as
Rust: to use a derive you import it, and a derive is an ordinary macro anyone
can write. A user's own trait and their own derive, in their own file, work
through the same `derive` with nothing registered anywhere:

```lisp
(deftrait Describe [Self] (describe [(x Self)] (-> i64)))

;; the derive macro. Named `Describe`, exactly like the trait. That is the
;; entire registration protocol: there isn't one.
(defn Describe [(tname Code)] (-> Code)
  `(impl Describe ~tname
     (describe [(x ~tname)] (-> i64)
       (print-str (stdout) ~(primitive/code-str "(" tname))
       ~@(desc--fields tname `x 0 (primitive/code-field-count tname))
       (print-str (stdout) ")\n")
       0)))

(defstruct Point [(x i64) (y i64)])
(derive Eq Hash Describe Point)          ; two stdlib derives + one of mine
```

Verified output: `(Point x=3 y=4)`.

### 1.4 Compiler changes

**① Recursive top-level `do` flattening — REQUIRED, small.**

A live bug, not a hypothetical. A derive that emits more than one form — which
is what `derive-eq`, `derive-serde`, and `derive-keyops` all do — produces
`(do (do (defn…) (impl…)) …)` under any multi-trait `derive`, and:

```
error: unknown top-level form 'do'
note: in expansion of macro `use3.Describe`
note: in expansion of macro `newderive.derive`
```

Three sites splice exactly one level. Make the walk transitive:

- `do-produced` — `src/compiler/expander.coil:3088`
- `unpack-do` — `src/compiler/expander.coil:2825`
- the transform-output splice — `src/compiler/expander.coil:2575`

**② `code-struct?` / `code-sum?` codeops — required to retire the `-sum` suffixes.**

`prop_derive.coil:18-26` explains why struct and sum need separate macro names
today: a macro is `[Code…] (-> Code)`, so everything arrives as syntax, and
`code-field-*` hard-errors on a sum while `code-variant-*` hard-errors on a
struct. `primitive/struct?`/`sum?` exist but are *type* queries — a macro taking
a non-`Code` parameter is not a macro.

Two new entries in `codeop-of` (`parser.coil:740`) and a `cop-` branch returning
`CBool`. `find-struct-flex` (`comptime.coil:2185`) and `find-sum-flex`
(`comptime.coil:2215`) already return the status these need. With it, one
`Arbitrary` macro branches internally and `(derive Arbitrary Tree)` works
whatever `Tree` is — which is most of the point of a user-facing generic derive.

**③ Register `defstruct`/`defsum` from expansion output before expanding siblings
— optional, unlocks definition-site derive.**

Only this makes `(defstruct Point [(x i64)] :derive [Eq Hash])` possible. Today
a macro that emits a type *and* a reflecting derive over it fails:

```
(deftype Point [(x i64) (y i64)] eq hash)
error: comptime: 'Point' is not a struct (primitive/field reflection needs a struct)
```

The expander expands a macro's output to a fixpoint *before* `do-produced`
registers the `defstruct` it emitted, so the sibling derive reflects on nothing.
`defsum-serde` sidesteps this only because it builds its impls from the syntax
it was handed and never reflects.

This is the invasive one — it reorders registration relative to the expansion
fixpoint. Ship ①+② first; treat ③ as a separate decision.

### 1.5 Migration

Small: **~35 call sites across 11 files**, concentrated in
`tests/prop/derive_test.coil` (14), `tests/serde_options_test.coil` (8), and the
other serde tests. `src/examples/` uses no derives at all.

Recommendation: rename the macros to their trait names (`Eq`, `Hash`,
`Arbitrary`, `PropShow`, `Serialize`, `Deserialize`, `KeyOps`) and migrate the
call sites in the same commit. Keeping `derive-eq` as an alias buys backward
compatibility nobody needs at this size and leaves two spellings of one thing in
the guide forever.

Two names do not map onto a trait and should stay as they are, because they are
not derives: `defsum-serde` (defines a type) and `derive-serde` (a bundle of two
traits — `(derive Serialize Deserialize T)` says it better and can replace it).

### 1.6 Bug found while doing this: `derive-hash` emits an unqualified alias

`(derive-hash T)` and `(derive Hash T)` only compile if the *caller* happens to
import `coil.primitive` under the alias `primitive`, because the template emits
`primitive/imul` and `primitive/ixor` literally. The documented usage in
`derive.coil`'s own header — `(import "coil.derive" :use *)` and nothing else —
does not compile:

```
error: in 'hbug.Point-hash': call to undefined function 'primitive/imul'
note: in expansion of macro `coil.derive.derive-hash`
```

`derive-eq` has the same defect on its float path (`primitive/fcmp-eq`).

`prop_derive.coil` already solved this class of problem by emitting canonical
dotted names, but that does not work for primitives — they are compiler
intrinsics resolved by name, not module functions, so `coil.primitive.imul` is
undefined too. The fix is to emit the **ambient prelude operators** instead:
`(* (^ (load h) fh) 1099511628211)`. `BitXor`/`Mul` are prelude traits, so the
generated code then needs no import at all. Verified working.

This should be fixed regardless of whether the generic derive lands.

---

## 2. Stateful (model-based) property testing

### 2.1 What exists

`src/stdlib/prop_stateful.coil`, 630 lines, and it is good. `defprop-stateful`
takes four types and eight named hooks:

```lisp
(defprop-stateful stack-matches-model [Cmd Model Sys Res]
  :init stack-init  :gen stack-gen  :pre stack-pre
  :run  stack-run   :post stack-post :next stack-next
  :inv  stack-inv   :show stack-show)
```

Unknown option keys are a hard error (a typo'd `:inv` would otherwise silently
drop half the property). Command-sequence shrinking — the hard part in every
other implementation of this idea — costs nothing here: each command is wrapped
in its own span, so `pass-delete-spans`, `pass-minimize-choices`, and
`pass-hoist` already do the work, and a failed precondition after a deletion
*skips* rather than rejecting, so shrunk candidates stay legal tests.

`tests/prop/stateful_test.coil` tests it twice over: against a correct stack,
and against two deliberately broken ones where it asserts both that the bug is
found and that the returned sequence is a handful of commands rather than the
forty it tripped over. That is the right test — the shrinking claim is the whole
value proposition and taking it on faith would be the obvious failure.

### 2.2 The actual problem: nobody can find it

It is `:reexport`ed from `coil.prop`, so it is already in scope for every
property file — and it is mentioned **nowhere** in `docs/reference/LANGUAGE_GUIDE.md`.
The guide's property-testing section (lines 832–897) covers `defprop` well and
stops there.

### 2.3 Work items

1. **A guide section.** Lead with the shrinking argument, since that is what
   distinguishes it: the tape edit *is* the sequence edit, so there is no
   shrinker to write and no "re-check every precondition after shrinking" pass.
   Show the stack-vs-`ArrayList` example from the test.

2. **Default `:gen` and `:show` from the derives.** Both hooks are pure
   boilerplate when `Cmd` is a plain sum. Once `(derive Arbitrary PropShow Cmd)`
   exists, `defprop-stateful` can synthesize both when the option is absent —
   each needs a small shim, since `gen` is `(ptr C) (ptr M) (ptr Source)` against
   `Arbitrary`'s `(mut Self) (ptr Source)` (ignore the model), and `show` is
   `(ptr C) (ptr Writer)` against `PropShow`'s `(x Self) (ptr Writer)` (load it).
   This halves the boilerplate of the common case and is the clearest payoff from
   doing the derive work first.

3. **Better error for the pointer-hook footgun.** Every hook must take pointers:
   a struct-typed parameter compiles to `(ref T)`, which does not match the
   `(fnptr c [T] …)` slot. This is called out in the module header, which means
   it is known to bite. The failure surfaces as a type mismatch on a mangled
   `fnptr` type; `defprop-stateful` should catch it and say which hook and what
   the signature must be.

4. **No `:cleanup` hook.** `init` allocates the system out of the case arena, so
   memory is fine, but a system holding a file descriptor, a socket, or a lock
   has nowhere to release it between cases. Worth adding before someone points
   this at something with a resource.

5. **Parallel / linearizability testing** (future, not now). The single-threaded
   driver is the right first thing. Note it as out of scope so nobody assumes it
   is there.

---

## 3. Other gaps found

### 3.1 Guide: property testing and fuzzing

The core section is good — `defprop`, tape-based shrinking, `assume`/`classify`/
`collect`/`prop-target!`/`prop-src`, the fork-and-bisect story for crashes and
hangs, the `coil.io/Writer` gotcha for hand-written `PropShow`. Four defects:

- **The fuzz flag list is wrong.** `LANGUAGE_GUIDE.md:892-895` lists
  `--cases --seed --size --shrink --timeout --target-steps --verbose --no-fork`
  under the coverage-guided-fuzzing heading. Those are `coil test`'s *runner*
  knobs. `coil fuzz` actually takes `-n/--iterations` (default 100000),
  `--cases`, `--seed`, `--no-run`, `--keep`. The runner list separately omits
  `--max-rejects`, `--candidate-timeout`, `--arena`, and `--alloc-tracked` —
  and `--candidate-timeout` is the one the hang demo cannot run without.
- **The failure database is undocumented.** `coil.prop.db` (550 lines) persists
  the shrunk counterexample to `.coil/pbt/<property>/failing` and replays it as
  the run's first phase. `coil fuzz --help` advertises this; the guide never
  mentions `.coil/pbt`. It is user-visible state on disk, currently documented
  only in `tests/prop/demos/README.md`.
- **The module inventory is thin.** `LANGUAGE_GUIDE.md:1007` describes
  `coil.prop` as "`defprop`, the `Arbitrary` trait, tape-based shrinking" and
  never names `coil.prop.stateful`, `.db`, `.cov`, `.gen`, or `.source`, all of
  which it re-exports into the caller's scope.
- **The worked example has no derives.** The guide points at
  `src/examples/property-testing.coil` for a worked example; it contains zero
  derive calls, so a reader following the pointer for "how do I generate my own
  type" finds nothing.

### 3.2 Guide: derive has no section at all

`derive` appears twice in passing (`LANGUAGE_GUIDE.md:623`, and inside the module
list at `:996`). There is no section explaining `derive-eq`/`derive-hash`/
`derive-keyops`, the float restrictions, or the trap that `derive-eq` and
`(derive Eq T)` both emit an `impl Eq` so writing both is a duplicate-impl error.
Worth writing once the generic form lands, so it is written once and correctly.

### 3.3 `PROPERTY_TESTING.md` drift

The design doc documents the derive as `(derive Arbitrary T)` throughout (§4.4,
§9). Landing §1 makes the doc correct rather than needing a rewrite — which is a
mild argument for doing it in that order.

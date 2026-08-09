# Trait methods escape macro hygiene

**Status: FIXED.** Parts 1–3 of the reverted attempt (`78e599e`) are reinstated,
and the binder obstacle of §5 is closed by **re-baring binder heads at the
expansion boundary** (§10). All ten reproductions in `tests/compiler/hygiene/`
pass, the Linux gates (linux-ir 8/8, gate-run 58/58, gate-cli, gate-target-os,
all eight stage gates, coverage) are green, and the bootstrap fixpoint holds.
The Scheme dialect's 125 tests pass **as real assertions** — a probe module that
binds the dialect's `=` and asserts `(assert-eq 1 999)` now fails, where it
passed vacuously before.

Sections 1–9 are the original analysis, kept as history. §10 describes the fix
that landed and the two adjacent bugs it surfaced.

A symbol written in a macro template is supposed to resolve in the *macro's*
namespace. For ordinary functions it does. **For trait methods — `=`, `<`, `+`,
`iter`, and every other operator — it does not: they are resolved at the use site,
so a caller can capture them.**

This is not a Scheme-dialect problem. It is a language-level hole affecting any
library macro that writes an operator, and it silently breaks `coil.assert`.

---

## 1. The failure, in ordinary Coil

```lisp
(module hyguser4)
(import "coil.assert" :use *)

;; An ordinary module defining its own `=`. The language explicitly invites this:
;; "you can define your own Eq without colliding".
(defn = [& (es Code)] (-> Code) `true)

(deftest this-must-fail (assert-eq 1 999))
```

```
test this-must-fail ... ok
test result: ok. 1 passed; 0 failed
```

`(assert-eq 1 999)` **passes**. Every `assert-eq` in that module asserts nothing
and the suite reports green. There is no Scheme here — just a module using a
documented feature.

`assert.coil` is written correctly. It imports only `coil.primitive`, so the `=`
in its template can only mean `coil.core.=`:

```lisp
(defn assert-eq [(x Code) (y Code)] (-> Code)
  `(if (= ~x ~y) 0 (do (assert-fail-cmp "==" …))))
```

The caller's `=` is substituted into it anyway.

**A green test suite that proves nothing is the worst outcome a testing tool can
produce.** Anything asserting with `assert-eq` in a module that defines an
operator is currently unverified.

---

## 2. The mechanism

Two macros, identical in shape. One writes an ordinary function in its template,
the other a trait method. Neither library imports anything redefining the name.

```lisp
(module hyglib)                          (module hyglib2)
(defn eq-check [(x Code) (y Code)]       (defn helper [(a i64)] (-> i64) 42)
  (-> Code) `(if (= ~x ~y) 1 0))         (defn call-helper [] (-> Code) `(helper 0))
```

Each called from a module that shadows the name:

```lisp
(defn = [& (es Code)] (-> Code) `true)   (defn helper [(a i64)] (-> i64) 999)
(eq-check 1 999)   ; => 1  ✗ captured    (call-helper)   ; => 42  ✓ hygienic
```

`dump-expand` shows exactly what happened:

| template symbol | after expansion | hygiene |
|---|---|---|
| `helper` | `"hyglib2.helper"` — qualified to the macro's module | ✅ applied |
| `=` | `"="` — still bare | ❌ skipped |
| `primitive/icmp-eq` | qualified | ✅ applied |

A bare name is resolved later, in whatever scope it lands in. That is the bug: the
trait method is never bound to a namespace at expansion, so it binds dynamically
at the use site.

### 2.1 Root cause, precisely

The chain is:

```
qualify-head  (comptime.coil:3022)
  └─ resolve-in-module  (comptime.coil:2974)
       └─ module-fns-has  ← consults `module_fns`
```

`module_fns` is built by **`all-defn-names`** (`expander.coil:1312`), which walks
every top-level form and collects names via `defn-name-of` — i.e. **only `defn`
names**. Trait methods are declared inside `deftrait` and are never added. So
`resolve-in-module` cannot find `=`, returns `None`, and `qualify-head` leaves the
head bare.

A second, independent gap sits behind it: `resolve-in-module` searches the module's
own defs and its `:use`d imports, but **not `coil.core`**. Core is auto-referred,
not a `:use`, so even with trait methods registered, every *core* operator would
still come back bare.

`resolve.coil:1277` documents the leniency that lets a bare name survive:

```
; `resolve` is deliberately lenient: a name it cannot find passes through UNQUALIFIED
; (bare), because some names resolve later (builtins, coil.core methods).
```

---

## 3. Why the docs disagree with themselves

`NAMESPACING.md` states both rules; for operators they conflict:

> a symbol written in a macro template resolves in the *macro's* namespace (own
> defs + the macro's own `:use`d imports), not the use site

> **Trait methods** | `=`, `show` | name→all declaring traits; **a call picks the
> one in scope**

Both are defensible alone. Together they mean hygiene holds for everything *except*
the names most likely to be redefined.

### 3.1 The distinction that resolves it

Two questions are currently conflated:

| question | should be answered by | currently |
|---|---|---|
| **Which trait does this call name?** | where the code was **written** | use-site scope ❌ |
| **Which impl runs?** | the argument's **type** | argument type ✅ |

The second is what makes `(= my-point other)` find a user's `impl Eq Point`. It
happens in the checker and needs nothing from name resolution. Only the first is
leaking. Fixing it does not weaken operator overloading in any way.

---

## 4. The attempted fix, and what it got right

Committed as `78e599e`, **reverted as `624cc29`**. Three changes, each closing one
link:

1. **`expander.coil`** — a `deftrait`'s method names go into `module_fns`.
   *(root cause)*
2. **`comptime.coil`** — `resolve-in-module` also searches the auto-referred
   `coil.core` tier, using the same `core` Use the resolver reads.
3. **`check.coil`** — a module-qualified head (`coil.core.=`) is recognised as
   naming a trait method, and the module selects among traits declaring it.

Part 3 matters for lexical correctness: without it, a macro's `mine` and a caller's
`mine` were reported *ambiguous* — the same capture bug wearing a diagnostic.

### Results

| test | before | after |
|---|---|---|
| `user.coil` — capture | `1` ✗ | **`0`** ✓ |
| `user4.coil` — `(assert-eq 1 999)` | passed ✗ | **FAILS** ✓ |
| `user5.coil` — competing traits in two modules | — | **`7`** ✓ (macro's wins) |
| `user2.coil` — ordinary fn (control) | `42` | `42` ✓ |
| `user3.coil` — primitive (control) | `0` | `0` ✓ |

`linux gate-run` 58/58. All eight stage gates green after re-blessing four whose
only diff was source-position drift. **Fixpoint held** — the compiler still
reproduced itself byte-identically.

---

## 5. Why it was reverted: the binder case

The full bootstrap surfaced a regression the reproductions did not cover:

```
error: impl coil.core.Eq for hyglib6.P6: missing method '='
```

`derive-eq` (`src/stdlib/derive.coil:58`) emits:

```lisp
(impl Eq ~tname
  (= [(a ~tname) (b ~tname)] (-> bool) …))
```

**That `=` is a binder.** It names the method being *defined*, not a call. Hygiene
qualified it to `coil.core.=`, so the impl declared a method the trait does not
have, and every `derive-eq` / `derive` user stopped compiling.

### 5.1 Why it cannot be patched downstream

Two attempts, both wrong:

- **Match by last segment in `impl-find-method`.** All four impl-lookup sites funnel
  through that one function, so it looked clean. It moved the error deeper: the
  qualified binder is also used to build the impl's internal symbol, producing
  `coil.core.Eq$pa.Val$coil.core` and a fresh "call to undefined function" further
  along. Patching that too would mean chasing a qualified binder through every
  consumer of method names.

- **Skip the qualification for binders inside `qualify-head`.** Not possible as
  written: `qualify-head` receives a head symbol and its sibling list, with **no
  parent context**. It cannot see whether the enclosing form is a call or an
  `impl`, so it has no basis on which to decide.

### 5.2 The real requirement

**Hygiene must distinguish a binding position from a reference.** A method name in
`(impl Trait T (m …))` is a binder and must stay bare; the same symbol in `(m x)`
is a reference and must qualify.

This is the same distinction the Scheme dialect's transform already makes for a
different reason — it copies `defn`'s parameter vector verbatim rather than
rewriting it, because the names there are binders. The difference is that the
transform walks whole forms and can see the shape; `qualify-head` currently cannot.

So the fix needs quasiquote expansion to carry enough positional context to answer
"is this head a binder?" — at minimum for `impl` method positions, and by the same
argument for any future binding form whose binder is a bare symbol in head
position.

---

## 6. A second consequence worth keeping

Once trait methods qualify, **any macro that pattern-matches on head names must
tolerate qualification.** One instance already existed:

`for-in` (`src/stdlib/control.coil`) matched `` `iter `` by bare name. `slice-for`
expands to `(for-in [x (iter s)])`, so with the fix in place `for-in` received
`coil.core.iter`, failed to match, and reported *"unsupported collection"* for a
form the user never wrote.

That was fixed by comparing both spellings (with `code-eq` rather than a string
compare — `control.coil` is deliberately dependency-free, since `coil.str` imports
*it*). The general point stands: any surviving bare-name head match is a latent
break, and only the gates will find them.

---

## 7. Reproductions

In `tests/compiler/hygiene/`. Each is a few lines; the controls matter as much as
the failures.

| pair | tests | expected | on the reverted-in fix |
|---|---|---|---|
| `lib.coil` / `user.coil` | trait method captured | `0` | **`1`** ✗ → fixed |
| `lib2.coil` / `user2.coil` | ordinary fn (control) | `42` | `42` ✓ |
| `lib3.coil` / `user3.coil` | primitive spelling (control) | `0` | `0` ✓ |
| `user4.coil` | `assert-eq 1 999` | must FAIL | **passed** ✗ → fixed |
| `lib5.coil` / `user5.coil` | two modules declare `mine` | `7` (macro's) | ambiguous ✗ → fixed |
| `lib6.coil` / `user6.coil` | `derive-eq` binder | compiles | **broke** ✗ ← the blocker |

`user6.coil` is the one a fix must not break. It passes today and fails under the
reverted attempt, so it discriminates correctly in both directions.

---

## 8. Blast radius

Any library macro whose template writes an operator. `coil.assert` matters most,
because the failure is invisible: the suite goes green.

Once a fix lands, **a sweep is warranted** — any test module that defines an
operator may have been reporting green for nothing. In this repo the Scheme dialect
is the known case (it binds `=`, `<`, `+` as macros), which is how this was found:
a subagent flagged a passing test it did not believe.

Consequently the "125 tests passing" figure previously reported for the Scheme work
is **not evidence**, and has been marked as such. Results obtained by diffing
stdout against the oracle (conformance cases 01 and 09) are unaffected — they never
used `assert-eq`.

---

## 9. What NOT to do

**Do not rewrite `assert.coil` to use `primitive/icmp-eq`.** It makes the symptom
vanish in one line and is tempting for that reason. But `assert.coil` is correct as
written; the fix would leave every other library macro capturable; and it
establishes a convention of avoiding operators inside macros — the opposite of what
a language with operator traits should ask of its users.

**Do not land part of the fix.** Parts 1–3 without binder handling turn a silent
wrong-answer bug into a hard compile error for every `derive` user. That is worse
than the bug: `(assert-eq 1 999)` passing is bad, but a language whose `derive`
does not work is unusable.

---

## 10. The fix that landed

Parts 1–3 reinstated verbatim (`git revert` of `624cc29`), plus a fourth part
answering §5.2's requirement — with a different placement than §5.2 guessed.

### 10.1 Binders are re-bared at the expansion boundary

§5.2 asked quasiquote expansion to carry positional context. It cannot, cheaply:
templates build **bottom-up** — `mh-qualify-head!` fires as each list closes,
before the enclosing `impl` exists — and a method form built by a *helper*
template and spliced in with `~@` qualifies in a different template than the
`impl` that receives it, so no template-local rule can ever see the binder
position (`user7` is that case).

The place that CAN see it is the **expansion boundary**: every macro- or
transform-produced form arrives there fully assembled, exactly once, before
anything consumes a method name. `expander.coil` now walks each spliced
expansion output (`rebare-binders-walk!`, called next to `hygienize-expansion!`
in both `expand-calls` and `tower-expand-call`, and over transform output in
`run-transformers`): for `(impl …)` and `(deftrait …)` forms — recursing through
`do` only, not into quoted data — any method-form head that is a dotted symbol
is restored to its last segment. Positions mirror `parse-impl`/`parse-deftrait`
(including the inherent-impl discrimination via `impl-method-form?`), so the
walker and the parsers cannot disagree about what is a binder. Method names
cannot contain dots, so the last segment is exactly the pre-hygiene spelling.
Method **bodies** are grandchildren and are never touched — their qualified
references are the point of the whole exercise.

This also fixed a bug **older than the trait-method work**: ordinary defn heads
always qualified, so a macro-generated `deftrait` whose method name matched any
defn in the macro's module has been broken all along (`user9`).

### 10.2 Two adjacent bugs the gates caught

**A qualified head is not always a hygiene artifact** (`check.coil`). Part 3
read any dotted head with a method-name tail as a hygiene-qualified trait
method. But the *resolver* also writes dotted heads: inside `coil.io`, the call
to the POSIX extern `read` resolves to `coil.io.read` — and a user program
declaring a trait with a method named `read` made part 3 hijack that extern
call into the trait (`'read' expects 1 args, got 3`, from bundled io.coil).
The guard: a dotted head that `sig-find` resolves to a real function or extern
stays a function reference; only a dotted head that names nothing can be a
hygiene-qualified method. The two never collide — a trait method has no Sig
under its module-qualified spelling. Repro: `user10`; also gate-cli's
`--debug-runtime dyn dispatch` check, which is how it was found.

**Suggestion layout must measure what it prints** (`comptime.coil`). Hygiene
rewrites a template symbol's *sval* while its span still points at the template
source, and `sug-emit!` prints a node's **verbatim source bytes** when it has
them. So `condlint`'s suggested `(cond …)` printed `cond` but laid out
continuation lines under `coil.core.cond` — 10 columns of drift — and clause
pairing (`sug-clause-style?`) stopped matching. `sug-head-display` now measures
the verbatim spelling emission will actually produce. Caught by gate-cli's
"lint --fix result is fmt-clean" check.

### 10.3 The arity-directed fallback (follow-up to 10.2)

The extern-hijack guard left a usability gap in the other direction: with
`:use *` of coil.io in scope, a module's own `(read c)` resolver-qualified to
the 3-arg extern and hard-errored, even though the module's trait declares a
1-arg `read` that obviously fits — and `Read::read` was the only way out.

Resolution now arbitrates by ARITY, deliberately not by type. The function
still wins whenever its arity fits, so no compiling program changes meaning;
only calls that were hard arity errors fall back to the method reading, and
which trait (and whether it is really in scope) is judged by the ordinary
method-resolution path. When NEITHER arity fits, the error names both
candidates and suggests the `Trait::method` spelling. Full type-directed
selection was considered and rejected: it couples name resolution to type
checking and reintroduces "what a name means depends on what you pass it" —
the exact property the tiering rules exist to prevent. Arity is syntactic,
catches the whole POSIX-name collision class (extern and method arities almost
never tie), and where they do tie the explicit spelling is one `::` away.

The fallback applies **only to spellings the resolver qualified**. The
resolver records, per call node id, whether the head was written bare (no
module dot, no alias slash, no `Trait::` — resolve.coil's
implicit-qualification map, same append-only latest-wins shape as comptime's
res-map); the checker consults it before falling back. So `(read c)` may mean
the method, while a hand-written `(coil.io.read c)` or `(io/read c)` named the
function explicitly and stays a hard error (`user13`). Code that never passed
the resolver's rewrite has no entry and defaults to explicit — fallback off,
the conservative pre-fallback behavior.

Also pinned while investigating (`user11`): match-arm pattern heads need NO
binder repair — the checker strips qualifiers when matching variant names and
selects by the matched value's type, so a hygiene-qualified pattern head
behaves exactly like a bare one.

### 10.4 Verification

- `tests/compiler/hygiene/` — twelve pairs, see its README. `user6` (derive
  binder), `user7` (spliced binder + body-reference control), `user8` (library
  trait, competing local trait), `user9` (generated deftrait), `user10`
  (extern-name collision), `user11` (pattern-head tolerance), `user12`
  (arity-directed fallback) discriminate the fix in both directions.
- Linux gates: linux-ir 8/8, gate-run 58/58, gate-cli PASS, gate-target-os PASS,
  stage gates read/ast/load/resolved/checked/expand/mono/x86 all byte-exact
  (no re-blessing needed beyond what `78e599e` had already blessed), coverage
  PASS. Fixpoint: stage2.o ≡ stage3.o.
- The §8 sweep: all eight Scheme-dialect test modules (125 tests) pass under the
  fixed compiler, now as genuine assertions. Oracle case01 output matches
  byte-for-byte. The stdlib bare-head-match audit found only `for-in`'s `iter`,
  already dual-spelling-matched since `78e599e`.

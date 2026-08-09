# Trait methods escape macro hygiene

**Status:** bug report with a reproduction. Not yet fixed.

A symbol written in a macro template is supposed to resolve in the *macro's*
namespace. For ordinary functions it does. **For trait methods — `=`, `<`, `+`,
and every other operator — it does not: they are resolved at the use site, so a
caller can capture them.**

This is not a Scheme-dialect problem. It is a language-level hole that affects any
library macro that writes an operator, and it silently breaks `coil.assert`.

## The failure, in ordinary Coil

```lisp
(module hyguser4)
(import "coil.assert" :use *)
(import "coil.io" :use *)

;; An ordinary module defining its own `=`. The language explicitly invites this:
;; "you can define your own Eq without colliding".
(defn = [& (es Code)] (-> Code) `true)

(deftest this-must-fail (assert-eq 1 999))
```

```
test this-must-fail ... ok
test result: ok. 1 passed; 0 failed
```

`(assert-eq 1 999)` **passes**. Every `assert-eq` in that module asserts nothing,
and the suite reports green. There is no Scheme here — just a module that used a
documented feature.

`assert.coil` is written correctly. It imports only `coil.primitive`, so the `=`
in its template can only mean `coil.core.=`:

```lisp
(defn assert-eq [(x Code) (y Code)] (-> Code)
  `(if (= ~x ~y) 0 (do (assert-fail-cmp "==" …))))
```

The caller's `=` is substituted into it anyway.

## The mechanism, isolated

Two macros, identical in shape. One writes an ordinary function in its template,
the other writes a trait method. Neither library imports anything that redefines
the name.

```lisp
(module hyglib)                          (module hyglib2)
(defn eq-check [(x Code) (y Code)]       (defn helper [(a i64)] (-> i64) 42)
  (-> Code) `(if (= ~x ~y) 1 0))         (defn call-helper [] (-> Code) `(helper 0))
```

Each is called from a module that shadows the name:

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

A bare name is resolved later, in whatever scope it lands in. That is the entire
bug: the trait method is never bound to a namespace at expansion, so it binds
dynamically at the use site.

`resolve.coil` says so directly (line 1277):

```
; `resolve` is deliberately lenient: a name it cannot find passes through UNQUALIFIED
; (bare), because some names resolve later (builtins, coil.core methods).
```

## Why the docs disagree with themselves

`NAMESPACING.md` states both rules, and for operators they conflict:

> a symbol written in a macro template resolves in the *macro's* namespace (own
> defs + the macro's own `:use`d imports), not the use site

> **Trait methods** | `=`, `show` | name→all declaring traits; **a call picks the
> one in scope**

Both are defensible in isolation. Together they mean hygiene holds for everything
*except* the names most likely to be redefined.

## Why "a call picks the one in scope" is the wrong rule for this

The property that rule protects is real and must be kept: when a user writes
`(= a b)` on their own type, it must find their `impl`. But that is **dispatch on
the argument's type**, which happens in the checker and needs no help from name
resolution.

What resolution currently does instead is pick *which `=` name* is meant by
looking at the use site's scope. Those are different questions:

- *Which trait does this call name?* — determined by where the code was WRITTEN.
- *Which impl runs?* — determined by the argument's TYPE, at the call.

Conflating them is what lets a caller's unrelated `=` capture a library's.

## What correct looks like

Resolve the **trait** in the macro's namespace, exactly as ordinary functions are
resolved; keep dispatching on argument type at the use site.

`assert-eq`'s `=` would qualify to `coil.core.=` at expansion, because that is
what is in scope where `assert.coil` was written. A user's `(= my-point other)`
still finds their `impl Eq Point`, because that is chosen by type, not by name.

Concretely: a trait-method symbol in a template should be qualified to
`trait-module.method` at expansion time, and dispatch should key off that
qualified trait rather than a bare name re-resolved downstream.

## Reproductions

All under `/tmp/…/scratchpad/hyg/` at time of writing; each is a few lines and
worth committing as regression tests:

- `lib.coil` / `user.coil` — trait method captured (returns 1, should be 0)
- `lib2.coil` / `user2.coil` — ordinary function NOT captured (returns 42) ✓
- `lib3.coil` / `user3.coil` — primitive spelling NOT captured (returns 0) ✓
- `user4.coil` — `assert-eq 1 999` passes in a module defining `=`

## Blast radius

Any library macro whose template writes an operator. `coil.assert` is the one
that matters most, because the failure is a green test suite that proves nothing —
the worst outcome a testing tool can produce.

It was found because a Scheme dialect binds `=` as a macro, which made every
`assert-eq` in a dialect module vacuous. But the Scheme dialect only *revealed*
it. The bug is in name resolution and predates it.

## What NOT to do

Rewriting `assert.coil` to use `primitive/icmp-eq` makes the symptom go away and
is tempting because it is one line. It should not be done: `assert.coil` is
correct as written, the fix would leave every other library macro capturable, and
it would encourage a convention of avoiding operators inside macros — which is
the opposite of what a language with operator traits should ask of its users.

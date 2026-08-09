# Trait-method macro hygiene — bug report (received, not yet fixed)

**Status:** open. Reported to this session by another Claude session (`remote-coil`) on
2026-08-09, on Jimmy's instruction. Recorded here so it survives; **the fix has not been
attempted.**

**Their artifacts, already pushed to `main`** (not present in the `coil-balance` worktree,
which branched earlier):

- `docs/design/TRAIT_METHOD_HYGIENE.md` — their full write-up
- `tests/compiler/hygiene/` — four reproductions

This file is the report as received, kept so the work is actionable from either branch.

## The bug

A symbol written in a macro template is supposed to resolve in the **macro's** namespace.
For ordinary functions it does. **For trait methods — `=`, `<`, `+`, every operator — it
does not.** They stay bare through resolution and bind at the use site, so the caller
captures them.

## Why it matters: `coil.assert` is silently broken

```clojure
(module m)
(import "coil.assert" :use *)
(defn = [& (es Code)] (-> Code) `true)   ; permitted — "define your own Eq"
(deftest t (assert-eq 1 999))            ; => PASSES
```

Every `assert-eq` in that module asserts nothing and the suite reports green. No Scheme or
dialect machinery involved — an ordinary module using a documented feature.

`assert.coil` is written correctly. It imports only `coil.primitive`, so the `=` in
`` `(if (= ~x ~y) 0 …) `` can only mean `coil.core.=`. The caller's is substituted anyway.

**A green test suite that proves nothing is the worst outcome a testing tool can produce.**

## Mechanism, from `dump-expand`

Two macros of identical shape, neither library importing anything that redefines the name:

| template writes | after expansion | hygienic |
|---|---|---|
| `helper` (ordinary fn) | `"hyglib2.helper"` — qualified to the macro's module | yes |
| `=` (trait method) | `"="` — still bare | **no** |
| `primitive/icmp-eq` | qualified | yes |

A bare name resolves later, wherever it lands. `resolve.coil:1277` documents the leniency
that causes it:

```
; `resolve` is deliberately lenient: a name it cannot find passes through
; UNQUALIFIED (bare), because some names resolve later (builtins, coil.core methods).
```

## The docs contradict themselves

`NAMESPACING.md` states both rules; for operators they conflict:

> a symbol written in a macro template resolves in the *macro's* namespace, not the use site

> **Trait methods** | `=`, `show` | name→all declaring traits; **a call picks the one in scope**

## Their proposed shape (explicitly not attempted by them)

Two questions are currently conflated:

- **Which trait does this call name?** → should be fixed by where the code was WRITTEN.
- **Which impl runs?** → determined by the argument's TYPE, at the call.

The second is what makes `(= my-point other)` find a user's `impl Eq Point`. It must stay;
it happens in the checker and needs nothing from name resolution. The first is what leaks:
resolution picks *which `=` name* is meant from use-site scope.

Proposal: qualify a trait-method symbol to `trait-module.method` at expansion, exactly like
an ordinary function, and let dispatch key off that qualified trait.

They deliberately did not touch `resolve.coil`, preferring a judgement on the shape over a
guess. **Open question for us:** is that the right layer, or is use-site resolution
load-bearing somewhere they didn't see?

## Reproductions (committed on main, worth keeping as regression tests)

| files | expectation |
|---|---|
| `tests/compiler/hygiene/lib.coil` + `user.coil` | trait method captured: gives 1, want 0 |
| `lib2.coil` + `user2.coil` | ordinary fn hygienic: 42 — **control** |
| `lib3.coil` + `user3.coil` | primitive hygienic: 0 — **control** |
| `user4.coil` | `assert-eq 1 999` passes |

The two controls are the important part: hygiene works for everything *except* the names
most likely to be redefined.

## Their argument against the cheap fix

Rewriting `assert.coil` to use `primitive/icmp-eq` makes the symptom vanish in one line.
They argue against it, and the reasoning looks right: `assert.coil` is correct as written,
the one-line change leaves every other library macro capturable, and it establishes a
convention of avoiding operators inside macros — the opposite of what a language with
operator traits should ask of its users.

## Caveat they raised about their own results

The Scheme dialect they are building binds `=` as a macro, which made every `assert-eq` in
a dialect module vacuous. A subagent flagged a passing test it did not believe, and was
right. So their reported "125 tests passing" for the Scheme work is **not evidence**, and
they have said so in the commit. Oracle-diffed conformance results are unaffected
(case01 7/7, case09 13/13) because those diff stdout rather than asserting.

**Follow-up once the fix lands:** sweep for any suite in a module that defines an operator —
it may be reporting green for nothing.

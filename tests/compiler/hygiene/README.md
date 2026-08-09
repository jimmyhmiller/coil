# Trait-method hygiene reproductions

See `docs/design/TRAIT_METHOD_HYGIENE.md` for the full analysis.

A symbol in a macro template resolves in the macro's namespace — except trait
methods, which stay bare and bind at the use site, so a caller captures them.

| pair | tests | expected | today |
|---|---|---|---|
| `lib.coil` / `user.coil` | trait method captured | `0` | **`1`** ✗ |
| `lib2.coil` / `user2.coil` | ordinary fn (control) | `42` | `42` ✓ |
| `lib3.coil` / `user3.coil` | primitive spelling (control) | `0` | `0` ✓ |
| `user4.coil` | `(assert-eq 1 999)` | must FAIL | **passes** ✗ |
| `lib5.coil` / `user5.coil` | two modules declare `mine` | `7` (the macro's) | ambiguous ✗ |
| `lib6.coil` / `user6.coil` | `derive-eq`'s method binder | compiles | compiles ✓ |

The controls are as important as the failures: they show hygiene works for
everything *except* the names most likely to be redefined.

## `arith_widths.coil` — a cross-branch interaction probe, not a hygiene repro

Standalone (no lib/user pair). It exists because two independent changes meet
in the same resolution path and NEITHER branch can test the interaction alone:

- the **arity-directed fallback** for function/trait-method name collisions
- **~80 new `coil.core` trait impls** (`Add`/`Sub`/`Mul`/`Div`/`Rem` for all
  eight integer widths plus `f32`, and the bitwise ops for all widths),
  replacing what used to be `i64`/`f64` only

Multiplying the same-named impls in scope is exactly what makes an
arity-directed fallback pick differently. The question is whether an
unconstrained integer literal still defaults to `i64` instead of going
ambiguous.

It checks that at a **call site** and inside a **macro template**, because
those are different questions: a template symbol resolves in the *macro's*
namespace, which is the whole subject of this directory. Call-site arithmetic
can keep working while the same expression inside a library macro goes
ambiguous.

| tree | output |
|---|---|
| main @ `2170b7a` (before either change) | `3 3 10` |

Any other output is a real interaction regression. It must not be resolved by
weakening the probe.

`user6.coil` is the guard rail. A fix must keep it compiling — the reverted attempt
(`78e599e`) broke it by qualifying the `=` that `derive-eq` emits as a method
BINDER, so the impl declared `coil.core.=` while the trait declares `=`. It
discriminates in both directions: passes today, fails under that attempt.

Run: `coil run <user>.coil`, except `user4.coil` which is `coil test user4.coil`.

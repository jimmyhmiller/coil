# Trait-method hygiene reproductions

See `docs/design/TRAIT_METHOD_HYGIENE.md` for the full analysis.

A symbol in a macro template resolves in the macro's namespace — except trait
methods, which stayed bare and bound at the use site, so a caller could capture
them. The fix qualifies trait-method REFERENCES like every other name, and
re-bares method BINDERS (the heads of method forms under `impl`/`deftrait`) at
the expansion boundary, where the assembled form makes the distinction visible.

| pair | tests | expected |
|---|---|---|
| `lib.coil` / `user.coil` | trait method captured | `0` |
| `lib2.coil` / `user2.coil` | ordinary fn (control) | `42` |
| `lib3.coil` / `user3.coil` | primitive spelling (control) | `0` |
| `user4.coil` | `(assert-eq 1 999)` | must FAIL |
| `lib5.coil` / `user5.coil` | two modules declare `mine` | `7` (the macro's) |
| `lib6.coil` / `user6.coil` | derived `Eq` method binder | compiles, `0` |
| `lib7.coil` / `user7.coil` | `~@`-spliced method binder; body refs stay qualified | `1` |
| `lib8.coil` / `user8.coil` | library-trait binder + reference, competing local trait | `42` |
| `lib9.coil` / `user9.coil` | macro-GENERATED deftrait binder | `21` |
| `user10.coil` | user trait named after a stdlib extern (`read`) | `5` |
| `lib11.coil` / `user11.coil` | template pattern head collides with a defn name | `7 111` |
| `user12.coil` | arity-directed fallback: bare `(read c)` under a `:use *` extern shadow | `5` |
| `user13.coil` | explicit `(coil.io.read c)` — fallback must NOT apply | must FAIL to compile |

The controls are as important as the failures: they show hygiene works without
breaking the positions where a name is being defined rather than used.

`user6.coil` is the guard rail that sank the first attempt (`78e599e`): it
qualified the `=` that `(derive Eq …)` emits as a method BINDER, so the impl declared
`coil.core.=` while the trait declares `=`.

`user7.coil` is the case that rules out any template-local fix: the method form
is built by a helper template and spliced with `~@`, so its head qualified in a
different template than the `impl` that receives it. Only the expansion
boundary sees the assembled form.

`user9.coil` predates the trait-method work entirely: ordinary defn heads always
qualified, so a generated `deftrait` whose method name matched any defn in the
macro's module has been broken all along. Same binder repair fixes it.

`user11.coil` pins down why match-arm pattern heads need NO binder repair: the
checker strips qualifiers when matching variant names and selects by the matched
value's type, so a hygiene-qualified pattern head behaves exactly like a bare
one. Verified both ways — an explicitly qualified `(hyglib11.Ready [] …)`
pattern also matches.

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

Run: `coil run <user>.coil`, except `user4.coil` which is `coil test user4.coil`,
and `user13.coil` which must FAIL to compile (the error must name both the
extern and the trait).

## Full syntax-object migration fixtures

These pin the distinction between automatic hygiene and explicit identity shared
across independently constructed templates:

| fixture | expected after full migration |
|---|---|
| `implicit_cross_template_capture.coil` | must FAIL: independent `state` syntax cannot bind by spelling |
| `explicit_cross_template_identity.coil` | runs with exit status 42: one fresh identifier is reused explicitly |
| `reader_implicit_capture.coil` with `--use hygiene.reader-implicit-capture` | must FAIL for the same reason at the reader-provider boundary |

The first and third intentionally compile before the migration and are therefore
not added to a green gate until the scope-aware resolver lands. They are semantic
red tests, not malformed fixtures.

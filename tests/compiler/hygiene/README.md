# Trait-method hygiene reproductions

See `docs/design/TRAIT_METHOD_HYGIENE.md` for the full analysis.

A symbol in a macro template resolves in the template's definition module.
Historically this directory tested a call-head qualification rewrite plus a
trait-binder “re-baring” repair walker. Full syntax hygiene removed both: syntax
objects now carry lexical scope, parser-known binder/reference positions lower
that identity, and the resolver handles definition-site globals and methods.

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

`user6.coil` is the guard rail that sank the old qualification attempt
(`78e599e`): it rewrote the `=` that `(derive Eq …)` emits as a method binder.
Resolver-level hygiene no longer rewrites binder spelling.

`user7.coil` is the case that rules out any template-local fix: the method form
is built by a helper template and spliced with `~@`. The shared syntax identity
now survives that boundary without inspecting the assembled form's shape.

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
extern and the trait). All of them are checked by
`scripts/compiler/oracle/gate-run-meta.sh`, which compares the printed output
against the table above. Until that was wired up nothing ran this directory, and
`user9` sat broken in the tree: `impl`'s trait name was still resolved by
spelling, so a template-generated `deftrait` was invisible to the `impl`
generated beside it.

## Full syntax-object migration fixtures

These pin the distinction between automatic hygiene and explicit identity shared
across independently constructed templates:

| fixture | expected after full migration |
|---|---|
| `implicit_cross_template_capture.coil` | must FAIL: independent `state` syntax cannot bind by spelling |
| `explicit_cross_template_identity.coil` | runs with exit status 42: one fresh identifier is reused explicitly |
| `reader_implicit_capture.coil` with `--use hygiene.reader-implicit-capture` | must FAIL for the same reason at the reader-provider boundary |
| `implicit_parameter_capture.coil` / `explicit_parameter_identity.coil` | implicit parameter capture fails; explicit identity exits 42 |
| `implicit_match_capture.coil` / `explicit_match_identity.coil` | implicit pattern capture fails; explicit identity exits 42 |
| `implicit_mut_capture.coil` / `explicit_mut_identity.coil` | implicit mutable-local capture fails; explicit identity exits 42 |
| `implicit_sequential_initializer_capture.coil` / `explicit_sequential_initializer_identity.coil` | a later initializer sees only the explicitly shared earlier binder; implicit identity fails |
| `implicit_type_parameter_capture.coil` / `explicit_type_parameter_identity.coil` | implicit generated type-variable linkage fails; explicit identity exits 42 |
| `identifier_api.coil` | named fresh/context-copy/context-strip identity laws; exits 42 |
| `free_identifier_equality.coil` | separate template scopes identify one definition-site global, but remain distinct bound identifiers; exits 42 |
| `explicit_capture_api.coil` | conspicuous caller-context introduction captures intentionally; exits 42 |
| `use_site_binder_cannot_capture.coil` | caller binder cannot capture template free reference; must fail |
| `definition_site_value.coil` | template free value resolves in provider module despite caller shadow; exits 42 |
| `definition_site_import.coil` | template free value resolves through a provider import, including a reexport facade |
| `moduleless_ambient_definition_site.coil` | optional `(module ...)` syntax does not disable ambient macro hygiene |
| `moduleless_local_trait_resolution.coil` | the module-less qualification pass retains local trait definitions; exits 111 |
| `definition_site_trait_method.coil` | template free trait method retains its provider binding; exits 42 |
| `definition_site_alias.coil` | an ALIAS-qualified name in a template resolves through the provider's alias table, even though the caller binds the same alias to a different module exporting the same name; exits 42 (pre-migration: 12, the caller's decoy) |
| `definition_site_type.coil` | bare AND alias-qualified TYPE names in a template resolve in the provider, past a competing `Box` in the caller's bare scope and the same alias `tg` rebound to a decoy; exits 42 (pre-migration: `unknown type 'Box'`) |
| `code_symbol_is_not_identifier.coil` | unscoped datum in an identifier position is a hard diagnostic |
| `implicit_variadic_splice_capture.coil` / `explicit_variadic_splice_identity.coil` | `~@`-spliced caller forms and a variadic template binder stay distinct; the explicit pair exits 42 |
| `nested_macro_expansion_identity.coil` | three same-spelled `tmp`s — caller, outer template, inner template reached through a definition-site free reference — stay distinct; exits 42 |
| `before_expand_transform_capture.coil` / `before_expand_transform_identity.coil` | the earliest producer in the pipeline gets no exemption; the explicit pair exits 42 |
| `semantic_transform_capture.coil` / `semantic_transform_identity.coil` | same, for a `(transform …)` re-read on every fixpoint round |
| `suggestion_capture_rule.coil` + `suggestion_capture_target.coil` | `coil lint --fix` flattens a replacement into source text; the rule's binder is disambiguated and the fixed program still exits 42 |
| `quote_identity.coil` / `quote_capture.coil` | plain `quote` carries the same identity as a quasiquote literal: one reused quoted identifier binds to itself and leaves the caller alone (42); two independent evaluations must not connect |

The last pair is the boundary the others cannot stand in for. Everywhere else
identity survives because the syntax objects survive; a checker suggestion is
written back into the author's file as TEXT, where scope no longer exists, so
the renderer has to spell the difference out. `suggestion_capture_rule.coil`
writes its binder as a bare template literal on purpose — the property has to
hold for the naive rule, not only for one that called `fresh-identifier`.

## Reading the failures

Two things are checked about the *diagnostics*, not the outcomes:

- No message may print an internal resolver key. The parser lowers binders and
  references to `$scope<N>@<module>$<name>`; those numbers are deterministic
  within one compilation and meaningless outside it, and they can reach a message
  embedded in a longer name (a generated function reported as
  `mymod.$scope7@mymod$helper`). `diag-display-msg` normalizes the rendered text
  at the one place every diagnostic is written.
- The same fixtures are run a second time under `COIL_META_INTERP=1`. Identity
  has to be a property of the syntax objects rather than of the engine that
  produced them, and the bytecode interpreter — what a wasm sandbox runs — is a
  different producer from the native metaprogram image.

The two `definition_site_alias`/`definition_site_type` fixtures came from
`experiments/macro-hygiene` on the `swift-interop` worktree, which reported that
of the four spellings a template can use, only bare functions and fully-qualified
names resolved. Both halves carry their own liveness check, because a decoy that
quietly falls out of scope turns an adversarial test into a tautology: the alias
fixture's answer is `5 + (999 - 962)`, so the template's `st/str-len` and the
caller's must BOTH be right, and the type fixture writes the decoys' `other`
field before it does anything else.

`quote_identity.coil` is the one that was silently wrong until it was written.
`'name` used to alias its registry node in the SOURCE scope, so it bound by
spelling — `~'tmp` in a template captured the caller's `tmp`, and the source
audit could not see it because `'` is not an identifier-producing primitive.

## Not a boundary: a `meta`-generated macro

`(meta …)` can emit a `defn` with a `Code` signature, but a call to it is
resolved as an ordinary function call, never staged as a macro: the macro-name
set is collected from the loaded surface forms before any generator runs. That
predates this migration (the committed seed rejects the same program), so there
is no fixture for it here. `nested_macro_expansion_identity.coil` covers the
part that IS supported — a macro whose expansion expands another macro.

All are gated by `scripts/compiler/oracle/gate-run-meta.sh`.

# Typed compile-time generic parameters

Status: planned, not implemented. Step 1 of a two-step feature. Step 2, where
compile-time functions compute types in type positions, gets its own design once
step 1 lands.

## Goal

A generic parameter is a compile-time argument with a declared kind: a type, as
today, or a value of an integer type, `bool` or `Keyword`. The vector-width special
case and the checker's use-based kind guessing are replaced by one uniform feature.

## Current state (as of c48b032)

- Generic parameters are names only (`type_params`). The kind is guessed from use by
  `validate-substitution-kind`. Arguments to generic structs and sums are not checked
  at all (`runtime=false`).
- Integer generics exist only for vector widths: `VectorWidth` (`FixedWidth` /
  `WidthParam`) and `TConstInt`. `(array T N)` is rejected with "const generics are
  not supported". `TArray` lengths are raw `i64`.
- A parameter cannot be used as a value. `vlanes` goes through a primitive instead.
- Known bugs this work fixes:
  - `unify` returns Ok for concrete `TConstInt` mismatches.
  - `type-mentions-name` ignores vector widths, so an impl's width parameter is
    reported as unused.
  - `ty->sexp` and `type->code` render types differently.
  - comptime `inst-node-mangle` disagrees with mono `type-key` for integers.
- Comptime folding runs on generic templates before monomorphization.

## Language

### Declaring

    (defstruct Buffer [T (const N i64)] [(len i64) (items (array T N))])
    (defstruct Quantity [(const Unit Keyword)] [(value f64)])
    (defn [T (const N i64)] sum [(xs (array T N))] (-> T) ...)
    (impl [T (const N i64)] Len (Buffer T N) ...)

- A plain name or `(T Trait...)` is a type parameter, unchanged.
- `(const NAME TYPE)` is a value parameter. `TYPE` is an integer type, `bool` or
  `Keyword`.

### Arguments

- Literals in type position: integers (`4`), `true` / `false`, keywords (`:meters`).
- A keyword in type position is always a `Keyword` constant. The old primitive
  spelling (`:i64`) is removed, and `coil lint --fix` migrates it.
- `(const X)` is always accepted. It is required only when an explicit call argument
  vector contains nothing but constants, since `[16]` is an array literal.

### Rules

- Kinds come from the declaration and are checked in every position: type
  applications, explicit call arguments, inference, impl patterns and
  specialization. A type where a value is declared, or a value where a type is
  declared, is an error.
- Constants are equal when kind and value are equal. `(Quantity :meters)` is one
  type everywhere.
- An integer argument must fit its declared type.
- Constants may appear in `(array T N)`, `(vec T N)`, `(mask N)` and as struct or sum
  arguments.
- Inference binds constants from argument types. Conflicting bindings are errors.
- No arithmetic in type positions in step 1 (`(array T (+ N 1))` is rejected). This
  keeps specialization finite under the existing depth and name-length guards.
- Impl specificity treats a constant as more specific than a parameter:
  `(impl [T] Len (Buffer T 4))` beats `(impl [T (const N i64)] Len (Buffer T N))`.
- In expression position a value parameter evaluates to its value, with its declared
  type. Local bindings shadow it, as with module `const`. A use inside `(comptime ...)`
  in a generic body is an error: the value is not known until specialization.
- Metaprograms see constants rendered as `4`, `true` or `:meters`, through one
  type-to-Code renderer.

## Representation

- `Type` gains an appended arm `(TConst [(value ConstValue)])`, where
  `(defsum ConstValue (ConstInt [(value i64)]) (ConstBool [(value bool)]) (ConstKeyword [(name (slice u8))]))`.
  `TConstInt` is removed after reseeding.
- `Func`, `StructDef`, `SumDef` and `ImplDef` gain an appended
  `(const_params (ptr (ArrayList ConstParam)))`, with
  `(defstruct ConstParam [(name (slice u8)) (ty Type)])`. `type_params` remains the
  ordered list of every parameter name. It is read as names at hundreds of sites, and
  appending keeps previous-stage compilers able to build the new stage.
- Array lengths and vector widths are both a length type: a `TConst` integer or a
  reference to a value parameter. `VectorWidth` is removed.
- `ExprKind` gains an appended `(EConstParam [(name (slice u8))])`. The resolver
  produces it, the checker types it from the declaration, and mono replaces it with a
  literal. No backend sees it.

## Stages

Each stage builds with the current seed, passes the gates and is committed on its own.

1. Parse and represent.
   - Parse `(const N T)` declarations and constant arguments.
   - Add `TConst` and `ConstParam`.
   - Add arms in `type-eq`, `ty-str`, `ty-mangle`, mono `type-key`, qualify, clone,
     layoutdb, the backends and the retained snapshot.
   - Unify the comptime type renderers and fix `inst-node-mangle`.
2. Check kinds from declarations.
   - Per-position kind checks in `validate-app`, explicit call arguments,
     `pat-matches?` and mono `subst-map`.
   - Delete `validate-substitution-kind`.
   - Fix the `unify` constant mismatch and the `type-mentions-name` width bug.
3. Generic lengths.
   - One length representation for arrays and vectors through substitution,
     unification, mono and layout.
   - `(impl [T (const N i64)] Iterable (array T N))` becomes expressible. The existing
     array-to-slice dispatch fallback stays.
4. Value use. `EConstParam` through the resolver, checker, mono and the comptime
   interpreter.
5. Migration and documentation.
   - Rewrite `[T N]` to `[T (const N i64)]` in `simd.coil` (87 uses), `slice.coil`,
     tests and guide examples, with a `coil lint --fix` rule.
   - Migrate the `:i64` type spelling.
   - Update `LANGUAGE_GUIDE.md` (drop "no const generics"), `SIMD.md` and `guide.coil`.
6. Reseed, then remove `TConstInt` and `VectorWidth`.

## Tests

- Integer, bool and keyword parameters on structs, sums, functions and impls.
- Type identity of constant instances across modules.
- Inference from array and vector arguments.
- Errors for:
  - the wrong kind in each position
  - an out-of-range integer
  - conflicting inference
  - arithmetic in a type position
  - a value parameter used inside `comptime`
- Specificity between constant and parameterized impls.
- A value parameter used as an expression.
- `type-of` rendering of constants.
- A generic `Iterable` over `(array T N)`.
- The existing SIMD suite passes after migration.

## Risks

- Bootstrap: new arms and fields are appended, and old ones are removed only after
  reseeding.
- The retained snapshot is regenerated at every stage that changes the AST.
- Comptime runs before specialization, so value parameters are unavailable to
  `comptime` in step 1. Step 2 has to address this.

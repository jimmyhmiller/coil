# Semantic transform output loses definition-site bindings

## Status

Fixed on 2026-08-25. Primitive dispatch now retains the complete hygienic head
through parser dispatch and selects bindings using the identifier's definition
module. Regression coverage lives in
`tests/compiler/hygiene/semantic_transform_primitive{,_provider}.coil`.

## Summary

A semantic transform can construct output with quasiquote in the transform's
module and return that syntax inside another module record. Free identifiers in
the template should retain their definition-site bindings. Instead, at least some
qualified primitive references are later resolved using the target module's import
environment.

This makes otherwise hygienic generated syntax depend on an unrelated alias in the
module being transformed. Adding that alias to the target happens to make the build
pass, but is not an acceptable solution: the generated reference was already bound
at the transform definition site and should not be reinterpreted as target-module
text.

## Reproduction shape

The transform module imports:

```coil
(import "coil.primitive" :as primitive)
```

It returns a module-shaped transform result containing generated forms such as:

```coil
`(defn ~helper [(p (ptr i8))] (-> i64)
   (primitive/cast i64 p))
```

The target module imports the same library differently:

```coil
(import "coil.primitive" :use *)
```

After the semantic transform, strict checking reports:

```text
call to undefined function 'coil.primitive.cast'
```

Equivalent failures occur for `primitive/fnptr-of`, `primitive/sizeof`, and
`primitive/alloc-static`. Injecting `:as primitive` into the target module hides the
failure, demonstrating the accidental dependency on the target's alias table.

## Expected semantics

The behavior promised by `docs/design/FULL_HYGIENE_MIGRATION.md` applies here:

- free identifiers in templates retain definition-site bindings;
- alias-qualified template identifiers resolve through the defining module's alias
  table;
- moving syntax through a `CodeBuilder`, a module-shaped semantic transform, and
  transform fixpoint rounds preserves that identity;
- retagging a returned top-level form with its destination module must change
  ownership/source placement without stripping lexical binding identity.

Fully qualified internal names are not the user-facing workaround. A metaprogram
author should be able to write ordinary resolved Coil references in a template and
have the syntax object carry the binding.

## Confirmed failure boundary

The syntax object still carries its hygiene scope and definition module after the
transform returns. The immediate failure is primitive dispatch, which happens in
the parser before ordinary hygienic name resolution:

- `parser.coil::primitive-dispatch-head` accepts only a string spelling;
- `resolve.coil::primitive-bindings-for` supplies the primitive spellings visible
  from the destination module;
- the parser therefore cannot use the head syntax object's `hyg` and `hmod` to
  select the primitive binding visible at the template's definition site;
- a semantic transform may also receive an already-resolved canonical spelling
  such as `coil.primitive.cast`, while the primitive table indexes source-style
  slash qualification such as `coil.primitive/cast`.

The head is consequently parsed as an ordinary function call. Normal resolution
later preserves the definition-site identity and produces `coil.primitive.cast`,
but by then it is too late to recover the primitive opcode; strict checking reports
that canonical name as an undefined function.

This explains why ordinary definition-site function references can remain hygienic
while `cast`, `fnptr-of`, `sizeof`, `alloc-static`, and other compiler primitives
fail in the same transformed form.

## Suggested implementation direction

Primitive dispatch must consume the identifier syntax object or an already-resolved
primitive identity—not only its display string. A complete implementation should:

1. preserve the primitive declaration/opcode identity in checked `Code` handed to a
   semantic transform, or let the parser resolve a returned head through the syntax
   object's definition module before deciding whether it is primitive;
2. recognize the compiler's canonical resolved representation directly, without
   requiring a target-module alias;
3. keep unscoped authored syntax using the destination module's imports;
4. keep scoped template syntax using the definition module's imports;
5. reject rather than silently capture when the two modules bind the same spelling
   differently.

Simply merging every module's primitive aliases into one spelling table is not
sufficient: collisions need the syntax object's lexical identity to select the
right entry. Likewise, adding an import to the transformed module only hides the
bug and must not be part of the fix.

Additional components worth auditing include:

- semantic transform result promotion in `comptime.coil` / the metaprogram host;
- `parser.coil::primitive-dispatch-head`;
- `resolve.coil::primitive-bindings-for` and its cache;
- module-record unpacking and destination-module tagging;
- `CodeBuilder` ownership and copying;
- the resolver's definition-site handling for alias-qualified identifiers;
- transform fixpoint serialization between rounds.

## Required regression coverage

Add a semantic-transform compile-and-run test with two provider modules that bind
the same alias to different declarations. The transform should emit all of the
following into a target that does not declare the transform's alias:

1. an alias-qualified ordinary function call;
2. an alias-qualified primitive such as `primitive/cast`;
3. a `fnptr-of` reference;
4. `sizeof`, `alignof`, and `offsetof` references;
5. a helper definition assembled through `CodeBuilder`;
6. the same output after at least one transform fixpoint round.

The test must prove that the transform provider's binding wins, not merely that a
same-named target binding makes compilation succeed. It should run through both
metaprogram engines and the self-hosted release gate.

## Resolution

`PrimitiveBinding` records now distinguish ordinary target-module spellings from
definition-module spellings. The resolver lazily materializes only the definition
modules actually carried by hygienic identifiers in a form, using each provider's
own existing import/refer rules. The parser receives the complete head `Sexp` and
uses `sx-hmod` for hygienic primitive dispatch. No alias is injected into the target
and provider/target spelling tables are not merged.

The adversarial regression has a transform provider emit `primitive/cast` and
`primitive/iadd` into a target with no `primitive` alias. It fails on the old
compiler with `undefined function 'coil.primitive.cast'` and exits 42 under both
the native and interpreter metaprogram engines after the fix.

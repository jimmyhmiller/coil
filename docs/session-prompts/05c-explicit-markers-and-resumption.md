# Copy-ready prompt: explicit stage markers and language resumption

```text
Start from `main` after generated and isolated stages have landed. Read and follow
AGENTS.md, then run `coil guide` before writing Coil code.

This is stage-metaprogram milestone 3 of 5. Milestone 1 already introduced the
explicit marker syntax; this milestone completes its recognition semantics and
language resumption. Read:

  git show origin/feat/scheme-continuation-pass:docs/landing/06-staged-metaprograms.md

Inspect research commits `631e712`, `80677d3`, and `4e0f5f0`. Complete the
explicit protocol:

  (stage FRESH-MARKER PHASE-FORM...)
  (FRESH-MARKER entry ARG...)

The marker is the capability identifying executable staged syntax. An unmarked
call with the same entry name is ordinary code. Marker-shaped syntax inside quote
is data. Validate declarations and requests with clear located diagnostics.

After invocation, returned Code must re-enter the next normal expansion/transform
round; it is not assumed to be final Coil. Prove this first with a small generic
language transform. A focused Scheme fixture may be added as a consumer only
after the generic behavior is established.

Do not implement cumulative phase source, cross-module/imported phases, linked
Code lists, runner experiments, Jolt/Chez compatibility, or stage-arena freeing.

Add tests for explicit execution, unmarked non-execution, quoted non-execution,
unknown marker/entry diagnostics, and source-language resumption. Run focused
tests and modernize-fast with one candidate, commit the milestone, and document
the single-round visibility limit left for milestone 4.
```

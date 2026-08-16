# Copy-ready prompt: cross-module and imported phase programs

```text
Start from `main` after cumulative multi-round stages have landed. Read and
follow AGENTS.md, then run `coil guide` before writing Coil code.

This is stage-metaprogram milestone 5 of 5. Read:

  git show origin/feat/scheme-continuation-pass:docs/landing/06-staged-metaprograms.md

Inspect research commits `2884010` and `b929f97`. Implement compilation-scoped
stage routing so a declaration and explicitly marked request may reside in
different modules and need not be adjacent in load order.

Then ensure imports used by a phase program pass through the ordinary expansion
pipeline. A phase helper imported from another module must have the same Coil
macro/language behavior it would have in a normal program; do not compile a
reduced raw subset for phase imports.

Build generic non-Scheme fixtures for both properties. Add diagnostics for an
unavailable cross-module entry, duplicate phase definitions across modules, and
an imported dependency that fails expansion/checking. Preserve all earlier
stage tests.

Do not port Scheme procedural syntax, Jolt/Chez compatibility, linked Code lists,
`coil run --meta`, `coil.meta.runtime`, or arena/generation experiments. If the
research implementation mixes those concerns into the expander, reconstruct the
small generic behavior rather than copying the block.

Run all staged fixtures, relevant load/expand/check snapshots, modernize-fast,
and a self-host stage2/stage3 fixpoint check. Commit a reviewable completion of
the generic staged-metaprogram series and list any remaining engine-platform or
memory-lifetime gaps separately.
```


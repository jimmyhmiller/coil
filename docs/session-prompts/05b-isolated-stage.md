# Copy-ready prompt: isolated compile-time stage

```text
Start from `main` after the generated-stage milestone has landed. Read and follow
AGENTS.md, then run `coil guide` before writing Coil code.

This is stage-metaprogram milestone 2 of 5. Read:

  git show origin/feat/scheme-continuation-pass:docs/landing/06-staged-metaprograms.md

Inspect research commit `2f9662b`, but implement only phase/runtime isolation.
Stage definitions and their private imports/helpers must form a separate phase
program used to compile metaprogram entries. They must never enter the runtime
program, runtime name resolution, emitted IR, or linked object.

Use a generic fixture based on `isolated_stage.coil`. Add negative tests proving
runtime code cannot reference a phase-only definition and inspect emitted output
or symbols to prove isolation. Preserve the milestone-1 generated-stage behavior.

Do not add Scheme language resumption, cumulative multi-round state, cross-module
routing, linked Code lists, direct metaprogram execution, or arena reclamation in
this session. Keep semantic isolation separate from memory-lifetime optimization.

Build one candidate, run focused tests and modernize-fast, commit a narrow
main-ready change, and clearly document the phase-program ownership/lifetime that
is currently retained for correctness and will be revisited separately.
```


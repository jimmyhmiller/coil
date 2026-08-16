# Copy-ready prompt: cumulative multi-round stages

```text
Start from `main` after explicit stage markers and language resumption have landed.
Read and follow AGENTS.md, then run `coil guide` before writing Coil code.

This is stage-metaprogram milestone 4 of 5. Read:

  git show origin/feat/scheme-continuation-pass:docs/landing/06-staged-metaprograms.md

Inspect research commits `4c4ec26` and the multi-round portions of `80677d3`.
Make phase source cumulative within one compilation: a stage introduced in a
later transform round can call helpers introduced in an earlier round. Preserve
explicit marker routing and keep all phase definitions absent from runtime code.

Define binding rules rather than inheriting accidental map behavior. Reintroducing
the same phase definition must produce a clear diagnostic. A later request may
reuse an existing entry without resending its definition. Stage-emits-stage
behavior must remain bounded by the compiler's ordinary transform convergence
limit and a local staged-invocation recursion guard.

Use generic `multiround_stage` and `duplicate_stage` fixtures. Do not implement
cross-module routing/imported phase expansion, Scheme/Jolt compatibility, linked
Code lists, direct runner features, or arena reclamation.

Run all earlier stage fixtures plus focused multi-round/duplicate tests and
modernize-fast using one candidate. Commit the milestone and document exactly
which compiler-owned structures retain cumulative phase state.
```


# Copy-ready prompt: generic reader metaprograms

```text
Start from the latest `main` branch after the character/escape cleanup has landed.
Read and follow AGENTS.md, then run `coil guide` before writing Coil code.

Implement generic compile-time reader metaprograms as described in:

  git show origin/feat/scheme-continuation-pass:docs/landing/02-reader-metaprograms.md

Research provenance is `f25db52` and `97e5b26`. Inspect the implementation for
semantics and failure cases, but reimplement it narrowly on main. Do not merge or
cherry-pick the broad research branch.

Required public behavior:

- a setup module declares `(reader-provider "namespace" function)`;
- the provider is normal compiled Coil with signature `Code -> Code`;
- it receives `(read-context PATH SOURCE KIND)` containing the raw target source;
- it may return one form or `(do FORM...)`;
- it may delegate to configurable `primitive/code-read`;
- normal loading, expansion, checking, compilation, and linking continue after
  the returned Code;
- provider imports bootstrap with Coil's default reader;
- zero providers preserves ordinary Coil reading;
- ambiguous providers diagnose clearly.

Port this against main's current Code/Sexp representation. Do not import linked
Code lists, dotted-pair work, Scheme/Jolt modules, staged procedural syntax,
`coil run --meta`, `coil.meta.runtime`, destructive Code operations, allocation
tracing, or arena experiments.

Add a minimal generic non-Scheme fixture and configurable-s-expression fixture.
Verify public `check`, `build`, and `run` behavior, diagnostics, ordinary `.coil`
parity, and strict bundled-stdlib/out-of-repo operation. Regenerate the embedded
stdlib manifest for any new standard-library module. Use one candidate and the
bounded gate during iteration; run focused reader/load/CLI gates and snapshots.

Commit this as an independently reviewable feature and report exact tests,
remaining policy questions, and any behavior intentionally deferred.
```


# Copy-ready prompt: design universal metaprogram execution

```text
This is a design and audit session, not an implementation or porting session.
Start from the latest `main` branch. Read AGENTS.md and the incomplete experiment
report:

  git show origin/feat/scheme-continuation-pass:docs/landing/07-run-metaprograms-as-programs.md

Also inspect the relevant research branch code and tests, but treat both existing
approaches as incomplete experiments:

- `coil run --meta` demonstrated a constrained fixed-arity `Code... -> Code`
  compiler-hosted subset;
- `coil.meta.runtime` duplicated a partial syntax runtime and did not have the
  full compiler context.

Do not port either implementation. Do not write production code in this session.
Do not introduce processes, compiler services, helper executables, dylib callback
protocols, reduced runtimes, or alternate linking schemes.

Design how Coil can run any existing metaprogram as ordinary compiled Coil while
the full compiler remains available and authoritative. Cover at least:

- macros with call-site arguments and hygiene context;
- reader providers with raw-source/read context;
- whole-program transforms with precise pre/post-transform program state;
- checkers with diagnostics and veto behavior;
- staged entries with phase state;
- fixed, variadic, scalar, aggregate, and Code signatures where meaningful;
- one authoritative Code/reflection/source/target/diagnostic operation surface;
- native x86-64, native arm64, interpreter, and Wasm engine semantics;
- debugger behavior and thread-local compiler context;
- entry/image/quote-registry ownership;
- invocation scratch, returned values, and diagnostic lifetimes;
- CLI UX for selecting an entry and supplying the correct kind of context;
- applying metaprograms to their own source/output;
- parity tests proving direct execution matches compiler-triggered execution.

Produce a design document containing:

1. exact semantics and non-goals;
2. a capability/context model shared by every metaprogram kind;
3. one engine invocation API;
4. ownership and teardown rules;
5. a milestone plan where each increment is independently testable;
6. a matrix of current main capabilities versus required work;
7. risks and rejected alternatives;
8. acceptance tests for the universal claim.

Stop after the design is internally coherent and evidence-backed. Commit only
the design document on a dedicated branch for review before implementation is
authorized.
```


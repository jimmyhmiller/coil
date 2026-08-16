# Porting dossier: run metaprograms as ordinary programs

## Goal

Expose a metaprogram function through the ordinary `coil run` command so it can
be invoked, inspected, profiled, and debugged like other Coil code:

```sh
coil run definitions.coil \
  --meta module.function -- '(one Code argument)'
```

For whole-program transforms:

```sh
coil run input.coil --meta module.transform --program
```

The compiler prints the returned `Code` as parseable source.

The architectural requirement is strict: this uses the full compiler and its
existing in-process metaprogram engine. There is no child process, compiler
service, generated helper executable, shared-library callback protocol, reduced
runtime, or Jolt-specific path.

## Branch provenance

The coherent implementation was checkpointed in `4ab6105`, primarily across:

- `src/compiler/driver.coil`;
- `src/compiler/metaengine.coil`;
- `src/compiler/metahost.coil`;
- `src/compiler/main.coil` / `main_x64.coil`;
- `src/compiler/jit_x64.coil`;
- `src/compiler/interp.coil`;
- `src/compiler/codelib.coil` and comptime lowering;
- `scripts/compiler/oracle/gate-runtime-metaprograms.sh`;
- `tests/metaprogramming/run_meta_*.coil`.

Because this is inside a broad checkpoint, provenance is not a cherry-pick plan.

## User-visible semantics

### Explicit Code arguments

Every shell argument after `--` must parse as exactly one Coil `Code` form.

```sh
coil run file.coil --meta m.identity -- '(hello 42)'
```

An entry currently must have fixed arity, accept only `Code` parameters, and
return `Code`. These are deliberate first-version restrictions and should produce
clear diagnostics.

### `--program`

`--program` supplies the loaded module graph as the first `Code` argument:

```text
((module-name FORM...) ...)
```

The entry module remains data so the transform can inspect the untransformed
program. Imported modules still compile normally in the same invocation to
provide the requested metaprogram and its dependencies. Registered whole-program
transforms must not rewrite the target before the explicit call.

### Entry discovery

If the requested function already has an installed meta-engine entry, reuse it.
Otherwise lazily stage the eligible function using the same closure-building path
used when expansion first encounters a macro. Do not require debug-only
registrations or wrapper functions.

### Result

Invoke through the engine, copy/own the result in caller-controlled memory,
validate that invocation scratch did not escape, print it, then release temporary
state.

## Uniform engine model

The runner dispatches through the same `MEEntry` abstraction used by compiler
metaprograms:

- arm64 Mach-O in-memory object mapping where supported;
- x86-64 ELF in-memory object mapping (`jit_x64.coil`);
- the full checked-`Program` interpreter when selected/required;
- the existing Wasm side-module engine for Wasm targets.

“Run it as a normal program” means the metaprogram is ordinary compiled Coil with
the normal language, libraries, FFI, generics, and debug symbols. `Code` operations
need a real compiler `CtCtx`, so reflection, source locations, imports, diagnostics,
and target configuration agree with compile-time execution.

The x86 JIT maps an already-produced in-memory ELF object, resolves compiler-host
symbols, applies supported relocations, marks text executable, exposes entry
addresses, and owns/unmaps the image. It does not invoke a linker or load a dylib.

## Implementation anatomy

### CLI orchestration (`driver.coil`)

- detect `run FILE --meta QUAL` without entering ordinary executable run;
- parse options and Code arguments;
- load the target and setup imports through the normal frontend;
- construct `--program` data when requested;
- find or lazily stage the qualified entry;
- validate checked signature and arity;
- invoke and print the result;
- expose memory-trace snapshots around load, stage setup, and invocation.

### Engine (`metaengine.coil`, `main*.coil`, `jit_x64.coil`)

- build the same monomorphized metaprogram closure used by expansion;
- install stable `MEEntry` records;
- keep image code, exported names, and quote registries alive together;
- dispatch native/interpreter/Wasm calls through one public runner;
- release replaced images only when no installed entry can reference them.

### Host ABI and context

`metahost.coil` and `codelib.coil` expose the compiler's real Code/reflection
operations. The branch also contains a separate `coil.meta.runtime` experiment
and monomorphizer rewrites that let some syntax-only metaprograms compile as
standalone runtime programs. That is exactly the kind of second/reduced Code
runtime that risks semantic drift, and it is **not required by `coil run
--meta`**. Do not port it as part of this feature. The desired runner uses the
full compiler's authoritative operation table and real `CtCtx`.

## Extraction strategy

This undertaking should be split without compromising the uniform design:

1. Define and test a public engine-level `run Code... -> Code` operation over an
   already-installed `MEEntry`.
2. Make native image ownership explicit for existing arm64 and new x86-64 JITs.
3. Add interpreter parity for the same entry/argument/result contract.
4. Add CLI parsing and explicit-argument mode.
5. Add lazy staging of an otherwise unregistered eligible function.
6. Add `--program` with a precise definition of the target's pre-transform state.
7. Add source/reflection/diagnostic context parity tests.
8. Add invocation scratch and result-escape checks as a separate ownership
   hardening change.
9. Add memory tracing and Sprout examples after the basic runner is stable.

Do not port Scheme/Jolt compatibility, linked `Code` lists, destructive Code
editing, allocation instrumentation, `coil.meta.runtime`, its monomorphizer
redirections, or staged metaprograms merely to make the first runner work.
Staging and direct running should converge on the same engine API, but either
public feature should be testable independently.

## Known gaps and risks

- Current signatures are limited to fixed `Code... -> Code`. Decide later how
  scalars, aggregates, and variadics map to CLI values; do not weaken the first
  contract opportunistically.
- `--program` currently filters the entry module from setup compilation so it
  remains data. Confirm imports cannot indirectly execute its registrations.
- The result-copy boundary is expensive for large programs and is entangled with
  unfinished arena work. Correctness first; document cost honestly.
- Diagnostics may borrow invocation memory. Error-path ownership must be audited
  before scratch is always released.
- JIT relocation support is intentionally finite. Unsupported relocations need a
  diagnostic, never a silent fallback to strange linking.
- Host symbol resolution must be allowlisted/authoritative enough to avoid
  accidental dependence on executable export flags.
- Threaded invocation is used in parts of the engine. Debugger behavior, thread
  local compiler context, and root registration need explicit tests.
- Entry caches can retain old images and quote registries. Replacement and
  teardown rules must be measurable.
- Wasm/interpreter parity is not established merely because a native example
  works.
- The separate `runtime_identity`, `runtime_checker`, and
  `runtime_safe_dialect` fixtures exercise `coil.meta.runtime`; they are not proof
  of the full-compiler runner and should not be copied into its initial gate.
- The branch demonstrated the CLI on focused metaprograms, but full Jolt remained
  incomplete and at roughly 15.7 GB peak compilation RSS. That is not an
  acceptance criterion for this generic runner and must not be represented as
  solved by it.

## Debugging value

This feature is valuable precisely because ordinary tools become applicable:

- run a transform on a literal Code argument and inspect exact output;
- use `--program` to inspect a real loaded graph;
- invoke one stage independently of the full compiler loop;
- set native debugger breakpoints in the metaprogram;
- enable allocator/memory tracing around one invocation;
- apply a metaprogram to its own source or emitted output;
- compare interpreter and native-engine behavior.

These are user-facing capabilities, not temporary Jolt diagnostics.

## Acceptance

- Identity and structured-Code examples print parseable, expected source.
- Missing/wrong arguments and unsupported signatures diagnose cleanly.
- An unregistered eligible function is lazily staged without a wrapper.
- A registered checker/transformer reuses its installed entry.
- `--program` supplies at least one correctly shaped module and does not first
  apply the transform under test.
- Source location, reflection, imports, FFI, and target queries match ordinary
  compile-time execution.
- Native x86-64, native arm64, interpreter, and supported Wasm routes obey the
  same observable contract.
- No process, linker, dylib, or callback fallback appears in code or tests.
- Result ownership survives closing invocation scratch; error diagnostics survive
  their error path.
- Repeated runs do not retain an unbounded chain of engine images or arenas.
- The bounded compiler gate and platform-specific engine gates pass before full
  release verification.

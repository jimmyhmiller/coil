# Running metaprograms

A metaprogram is a Coil function compiled by the full compiler. It is not a
separate executable, service, or reduced runtime. `coil run --meta` exposes the
same in-process entry machinery used by expansion, transforms, and checkers so a
metaprogram can be invoked directly and its returned `Code` inspected.

## Command

```text
coil run definitions.coil --meta module.function -- 'code argument' ...
```

Pass the compiler-loaded program as the first Code argument with `--program`:

```text
coil run input.coil --meta module.transform --program
```

The value is the loaded `((module-name FORM ...) ...)` graph supplied to a
whole-program transform. The entry module is held as `Code`; imported modules
are compiled in the same invocation to provide the requested metaprogram and
its dependencies. Registered whole-program transforms have not rewritten the
target. Additional arguments may follow `--`.

Each argument after `--` must contain exactly one Coil form. The result is
printed as parseable Coil source.

For example:

```text
coil run tests/metaprogramming/safe_dialect.coil \
  --meta safedialect.desugar-inc -- '((inc 41))'
```

prints:

```text
(do (primitive/iadd 41 1))
```

The outer list in the argument is intentional: `desugar-inc` accepts a list of
program forms, so this call passes a one-form program.

## What happens

The command follows the ordinary compiler frontend:

```text
read -> load -> expand/stage -> transforms -> check -> registered checkers
                                                    |
                                                    v
                                    invoke compiled meta entry in-process
```

The invocation uses the entry already installed by `meta-engine-setup`. Engine
selection is entirely in-process: the x86-64 ELF or arm64 Mach-O in-memory object JIT where available, the
full Program interpreter otherwise, or the Wasm side-module runner. There is no
native dylib/linker fallback. `run --meta` does not compile or link a second kind of program. Code
operations use a real `CtCtx` built from the checked `Program`, so reflection,
source information, diagnostics, imports, and target configuration have the
same meaning they have during compilation.

Registered macros, transforms, and checkers reuse their installed entry. An
otherwise-unreferenced eligible `Code -> Code` function is staged on demand by
the same closure builder used for a lazily encountered macro; no debug-only
registration or wrapper is required.

## Ownership

There are three relevant lifetimes:

- The compiler root owns loaded source, checked program state, installed engine
  entries, and their stable quote registries.
- Every metaprogram call owns a disposable invocation arena. Argument boxes,
  quasiquote construction, and Code-operation temporaries live there.
- Ordinarily, the caller owns a returned graph copied out of invocation scratch.
- Returning `primitive/code-consume!` of the exact first argument root opts into
  destructive ownership transfer. Merely returning the same root is not enough:
  compiler indexes may still alias its old contents. In the explicit mode,
  caller-owned nodes remain in place and only newly generated nodes and bytes
  reachable from invocation scratch are evacuated before that arena closes.

Both boundaries are checked. `meta-engine-invoke` verifies that the copied or
adopted result contains no pointer into the invocation arena before closing it. Error
paths retain the invocation arena only where `Diag` still borrows storage; that
remaining ownership issue is documented in
[`jolt-code-memory-ownership-options.md`](jolt-code-memory-ownership-options.md).

This gives us one uniform rule today: compiler state outlives the call,
invocation memory never escapes, and returned code belongs to the caller. A
destructive transform invalidates earlier child views when it calls
`code-set-car!`, `code-set-nth!`, or `code-prepend!`; those operations are for a
consumed program, not shared read-only Code. A transform must finish with
`code-consume!` only after establishing that contract. There is no metaprogram
process boundary.

## Debugging and tests

Because invocation happens in the compiler process, normal native debugging can
break in the metaprogram entry, metalowered helper, metashim operation, or host
Code operation without attaching to another process. Existing allocation traces
remain available through `COIL_META_ALLOC_TRACE=1` and
`COIL_META_ALLOC_ENTRY=<qualified-name>`.

The focused gate is:

```text
scripts/compiler/oracle/gate-runtime-metaprograms.sh <candidate-compiler>
```

It covers identity, a nontrivial recursive transform, and an imported checker.

4. Audit the established metaprogram corpus and add representative invocations
   to the gate.
5. Use Sprout as the worked staging and ownership example.

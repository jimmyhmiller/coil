# `feat/scheme-continuation-pass` main-landing inventory

This document inventories the work preserved through checkpoint `4ab6105` and
organizes it into changes that can eventually be transferred to `main` as
coherent, independently reviewed work.

Nothing in this inventory proposes reverting the research branch. The branch is
the durable integration record. Main-bound changes should be reconstructed or
carefully replayed in separate branches, with focused tests, rather than treating
the checkpoint commits as ready-made cherry-picks.

## Classification

- **Land independently**: conceptually narrow and expected to stand without the
  Jolt/Scheme integration stack.
- **Land after dependency**: useful general work, but its public contract or
  implementation depends on an earlier inventory item.
- **Extract fixes**: the containing work is broad, but individual correctness or
  performance fixes should become small main-bound changes.
- **Research branch**: valuable evidence or an incomplete integration target;
  preserve it here but do not transfer it wholesale yet.
- **Last-mile only**: generated artifacts or CI wiring that belong only after the
  implementation they exercise is accepted.

Readiness records what has been demonstrated on this branch, not a substitute for
running a clean candidate and the repository gates on an extraction branch.

## Landing ledger

| ID | Work | Classification | Readiness | Dependencies / separation work |
|---|---|---|---|---|
| L1 | Terminated Unicode hex escapes and canonical character literals | Land independently | High | Rebuild the small reader/formatter/docs/test slice from `0364fdb`, `e547189`, and `645ddae`; exclude unrelated Scheme compatibility changes. |
| L2 | Compile-time reader metaprograms | Land independently | High conceptually; packaging audit required | Starts at `f25db52` and `97e5b26`. Separate the generic reader-provider protocol from the Scheme reader changes inherited from the broad checkpoint. |
| L3 | Brainfuck reader-metaprogram proof | Land after L2 | High | `b89b693` plus `efef838`; retain raw `.bf` fixtures, bundled provider, direct emitted Coil, unmatched-bracket behavior, and out-of-repo bundled-stdlib coverage. |
| L4 | Host-aware modernization gate | Land independently | High | One-file tooling change in `89242d4`; verify it solves a main-visible gate issue without relying on branch compiler behavior. |
| L5 | Default file build outputs under the build directory | Land independently | Medium/high | Narrow driver/docs change in `24afddb`; verify CLI compatibility and explicit `-o` behavior. |
| L6 | Explicit generated and isolated compile-time stages | Land independently as a series | Medium/high | Commits `15b5f52` through `2884010`. Split protocol, isolation, resumption, multi-round state, explicit markers, and cross-module routing into reviewable steps. Avoid making Scheme procedural macros a prerequisite for the generic stage mechanism. |
| L7 | Imported phase programs compiled through normal expansion | Land after L6 | Medium | `b929f97`; needs a non-Scheme fixture proving imported phase code uses the ordinary compiler and retains the same language semantics. |
| L8 | Directly running metaprograms with `coil run --meta` | Land after core engine ownership is settled | Medium; valuable | Generic CLI and engine work in `4ab6105`. Preserve the uniform in-process compiler/JIT rule. Extract without Chez/Jolt compatibility, allocation instrumentation, or Sprout being mandatory dependencies. |
| L9 | In-memory x86-64 object JIT / uniform metaprogram entry invocation | Land before or with L8 | Medium | `src/compiler/jit_x64.coil` and engine/driver changes are cross-cutting. Needs a precise engine lifetime contract and parity tests against the interpreter; no dylib, callback protocol, or process fallback. |
| L10 | Runtime metaprogram examples and Sprout | Land after L6 and L8 | Medium/high as demonstrations | `src/examples/sprout*.coil`, `tests/metaprogramming/sprout_lowered.coil`, and docs. Separate the simple `--meta` example from staged Sprout so each proves one mechanism. |
| L11 | Persistent linked `Code` lists and proper/improper-list API | Land independently, but cross-cutting | Medium; strong evidence | Design in `6bf3a29`, implementation mostly in `214b405`. Requires reader/parser/formatter/compiler-wide migration, compatibility behavior for `code-count`/`code-nth`, dotted-list tests, scaling tests, and snapshot review. This is general metaprogram infrastructure, not a Scheme-only change. |
| L12 | Explicit destructive `Code` consumption/editing | Land after L11 | Medium | `code-set-car!`, `code-set-nth!`, `code-prepend!`, and `code-consume!` need a standalone ownership contract, alias-invalidating documentation, and focused positive/negative tests. Do not bundle allocation tracing merely because it is the first large user. |
| L13 | Metaprogram invocation arenas, result evacuation, and stage-compilation arenas | Land after L8/L9, informed by L11/L12 | Research-grade implementation with measured promise | Separate invocation scratch, result ownership, rotating program generations, stage compiler scratch, engine image ownership, and diagnostic retention. Each boundary needs an escape check and peak-memory regression. Current Jolt peak proves the full problem is not solved. |
| L14 | Allocation observer and reusable typed/site allocation tracer | Land independently in two layers | Medium | First land the low-overhead observer API and non-allocating recorder; then land the destructive instrumentation transform after L12. Clarify logical allocation traffic versus physical arena ownership. |
| L15 | Compiler memory telemetry and recursive-splice lint | Extract independently | Medium/high | `mtrace`, scratch arena snapshots, and `recursive_code_splice_lint` are useful even before the final ownership design. Avoid snapshot churn unrelated to their output. |
| L16 | Scheme syntax-object identity and native procedural syntax | Land after L6/L7 if Scheme remains a supported target | Medium/incomplete | `5e3faa5` and `b07bcb0`. The syntax identity boundary is generalizable; the complete procedural Scheme layer still has compatibility gaps and should not be presented as complete R6RS/Chez support. |
| L17 | Optional native Scheme continuations and dynamic-wind runtime | Extract as a Scheme feature | Medium | `703ec78` and `290b7d5`. Keep optional module boundaries and dedicated continuation tests. Reconcile deleted/moved legacy evaluator fixtures deliberately. |
| L18 | Scheme load graphs without an evaluator | Extract as a Scheme architecture change | Medium | `fce1bcf`. Valuable simplification, but review deleted `eval` behavior and document precisely what runtime `load` and `eval` remain supported. |
| L19 | General Scheme runtime correctness/performance fixes found by Jolt | Extract fixes one by one | Mixed, many high-value | Includes iterative GC marking/root walks, O(1) global lookup, variadic-rest preservation, variable/procedure redefinition handling, block comments, full-i64-to-bignum lowering, rooted exact comparison intermediates, and iterative large vector/string storage construction. Each needs a minimal regression independent of Jolt. |
| L20 | Chez compatibility surface and FFI shims | Research branch | Low/medium as a whole | `chez.coil`, `ffi.coil`, exception/runtime ports, records, parameters, guards, file/process/thread APIs, and many aliases. Inventory real implementations versus placeholders before extracting any subset. |
| L21 | Full Jolt-on-Coil integration | Research branch | Not complete | The stock Jolt CLI emits a roughly 4 MB flattened Scheme program including its runtime. Coil now compiles farther and exposed real general bugs, but the latest full run still had not completed successfully and compilation was roughly 15.7 GB RSS. Do not land or advertise full support yet. |
| L22 | Jolt memory/ownership reports | Preserve as design evidence | High as documentation of observations; proposals evolving | Keep the problem report distinct from proposed ownership policy. Update measurements only from reproducible runs. These documents can inform L11-L15 without forcing their implementation onto main. |
| L23 | Seed binaries, seed version files, refresh scripts, and CI wiring | Last-mile only | Not independently transferable | Regenerate seeds and add gates only after the corresponding compiler slices are accepted and pass clean bootstrap/fixpoint verification. Never transfer checkpoint seed binaries as evidence that an extraction is correct. |
| L24 | Oracle snapshot changes | Last-mile only | Requires audit | Refresh only stages changed by a deliberate extracted compiler feature. Do not carry the branch's aggregate snapshot delta into unrelated slices. |

### Confirmed incomplete compatibility surfaces

The L20 warning is concrete, not merely caution about test coverage. The current
Chez module deliberately returns fallback or sentinel values for top-level
inspection, interaction environments, thread-context fields, general `eval`,
`compile-file`, boot-file construction, FASL read/write, file mtimes, symbolic
link queries, parent paths, shell/process ports, thread joining, guardians, and
ISO instant formatting. Source annotations are also approximate. These are
useful linkable seams for continued integration, but they must not be transferred
or documented as implemented Chez facilities.

## Reader-metaprogram slice (L1-L3)

This is the clearest first landing candidate.

### Intended public behavior

1. A module can declare a compile-time reader provider.
2. `coil run input.ext --use provider.module` gives the raw input to that
   provider inside the normal compiler.
3. The provider returns ordinary `Code`, after which normal loading, expansion,
   checking, compilation, and linking continue.
4. The provider is a normal compiled Coil metaprogram. There is no evaluator,
   preprocessing executable, process protocol, or runtime interpreter.
5. The provider works from the bundled standard library when the compiler runs
   outside the repository.

### Brainfuck proof

- `src/stdlib/brainfuck.coil` declares the reader provider.
- `src/stdlib/brainfuck_reader.coil` parses raw Brainfuck and emits a complete
  Coil module with direct tape operations and native loops.
- `tests/read_metaprogram/hello.bf` proves output.
- `tests/read_metaprogram/echo.bf` proves input and looping.
- `tests/read_metaprogram/unmatched.bf` proves malformed-source handling.
- `tests/read_metaprogram/README.md` records the user-facing commands.
- `src/compiler/embedded_stdlib.coil` must be regenerated so the provider works
  outside an in-repository namespace scan.

### Extraction hazards

- `f25db52` also touched the Scheme reader and was created after the initial
  broad Scheme/Jolt checkpoint. Those changes are not automatically part of the
  generic reader-provider feature.
- Character-literal cleanup is a sensible prerequisite but should remain its
  own change (L1).
- The final Brainfuck proof should emit Coil directly (`efef838`), not retain the
  earlier runtime opcode interpreter.
- Driver support for nonstandard extensions must be scoped to the selected
  reader provider rather than hard-coding `.bf`.

### Required clean-branch verification

- Run hello and echo through the public CLI.
- Prove the unmatched fixture fails in the documented way.
- Run from outside the repository with strict bundled-stdlib lookup.
- Confirm ordinary `.coil` reading is unchanged.
- Run the bounded compiler gate and the relevant read/load/full snapshots.

## Proposed landing order

The order below minimizes coupling; it is not a promise that every later item is
ready now.

1. L1 character/escape reader cleanup.
2. L4 host-aware modernization gate.
3. L2 generic reader-metaprogram protocol.
4. L3 Brainfuck proof.
5. L5 build-output default, if still desired after independent CLI review.
6. L11 linked `Code` representation and structural list API.
7. L15 memory telemetry and recursive-splice lint.
8. L6 staged metaprogram protocol, split into its internal milestones.
9. L7 imported phase programs.
10. L9 uniform in-process compiled engine ownership.
11. L8 `coil run --meta`.
12. L10 Sprout examples, with simple and staged proofs separated.
13. L12 destructive consumption API.
14. L14 allocation observer, then allocation instrumentation.
15. L13 explicit arena/generation boundaries, one lifetime boundary per change.
16. Individual L19 Scheme correctness fixes as soon as each is isolated; they
    need not wait for the metaprogram sequence when they have no dependency.
17. L16-L18 Scheme architecture/features in independently scoped series.
18. Selected implemented portions of L20 only after placeholder audit.
19. L21 full Jolt integration only after functional and memory acceptance.
20. L23-L24 seeds, CI, and snapshots alongside the exact feature they validate.

## Items that must not be conflated

- Running a metaprogram directly is not the same feature as staging it during
  compilation.
- A compiled in-process engine is not a process or shared-library protocol.
- Persistent linked syntax is not itself an ownership policy.
- Destructive consumption is not ordinary immutable `Code` rewriting.
- Logical allocation attribution is not physical live-memory accounting.
- Scheme correctness fixes are not proof of Chez compatibility.
- Chez compatibility is not proof that full Jolt works.
- A successful Jolt execution would not make a 15.7 GB compiler memory profile
  acceptable.

## Superseded experiments, not landing candidates

Some useful exploration appears in branch history but not in the final tree and
should not be revived as main-bound work:

- The `experiments/jolt-coil` adapter/runtime path introduced in `16346b2` was
  removed by `6bbe779`. The intended integration is ordinary Jolt-emitted Scheme
  through the normal compiler, not a Jolt-specific adapter.
- The first Brainfuck proof included a runtime opcode interpreter. `efef838`
  replaced it with direct Coil generation; only the direct compiler should land.
- Partial `syntax-case` emulation was removed in `dd61a3e` in favor of native
  staged procedural syntax. Do not land both models.
- Resumable/streaming Scheme transform batching was diagnostic scaffolding for a
  memory problem, not the intended ownership model. Main-bound memory work should
  use explicit complete-program generations and documented arena boundaries.
- The compile-and-run shared-library callback demonstrations in the historical
  metaprogram test script are not the architecture for L8/L9. The accepted model
  is the compiler's uniform in-process engine with no process or dylib fallback.

## Historical commit map

- Broad initial Scheme/Jolt state: `16346b2`.
- Optional continuations/load architecture: `703ec78`, `fce1bcf`.
- Reader literals and reader metaprograms: `0364fdb` through `efef838`, excluding
  the unrelated gate commit where appropriate.
- CLI output default: `24afddb`.
- Early Jolt/Chez compatibility: `290b7d5` through `dd61a3e`.
- Generic staged-program series: `15b5f52` through `2884010`.
- Scheme syntax identity/imported phases/procedural syntax: `5e3faa5`,
  `b929f97`, `b07bcb0`.
- Linked-list design and implementation checkpoint: `6bf3a29`, `214b405`.
- Runtime runner, arenas, tracing, Sprout, and later Scheme/Jolt fixes:
  `4ab6105`.

Because three commits are intentionally broad checkpoints, this map is for
provenance—not a cherry-pick plan.

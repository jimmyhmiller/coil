# Game build profiling (2026-09-27)

Work lives on `perf/game-compile-speed`, based on `2aa43656`. The game was
copied into the ignored build directory; its pending changes were not edited.
The workload is game-attempt-1's pending `hmh-foundation` sources at base commit
`3ba62d49d045286ad3928510bb430ec466987919`, with 44 Coil source files.
The ordered source-file path/SHA-256 list hashes to
`049d53e0789b9918321f7c880d9c17cb32ff89469676c2816edc2139699e0f6b`.
Measurements are from an Apple M2 Max (12 logical CPUs), macOS arm64, LLVM 22.1.8.

The user's original build took 10.386 seconds. With validation jobs stopped,
two original-compiler builds took 10.144 and 10.584 seconds. Five verified
self-host compiler builds took 1.369, 1.369, 1.335, 1.336, and 1.335 seconds
(median 1.336 seconds), about 7.8 times faster. These rebuild the program; they
are not executable-cache hits. Default O3, CPU/target selection, LLVM passes,
partition assignment, metaprogram settings, and linker configuration are
unchanged.

**The subsecond target has not been reached.**

## Where the original time went

`COIL_TRACE=1 coil build` showed one object-emission worker taking 9,054 ms,
following 652 ms of optimization. Other workers emitted in roughly 50–90 ms.
A native `sample` profile attributed most active backend samples to
`DAGCombiner::checkMergeStoreCandidatesForDependencies`,
`SDNode::hasPredecessorHelper`, and pointer-set insertion.

The font lookup in `game.play.hud.push-text` loads/spills 128-element arrays
before passing them to the slice getter. Aggregate SSA loads and stores let LLVM
scalarize the whole arrays into thousands of instructions. A whole-module
optimization experiment produced over 1,500 stores in that function. Partitioned
optimization then spent seconds examining dependencies while trying to merge
stores during instruction selection.

## Changes

- Materialize a loaded aggregate with `llvm.memcpy` into its own spill slot.
  This preserves evaluation order and snapshot semantics, including an index
  expression that mutates the source. Source alignment remains conservative;
  copies use the target-aware Coil layout size. Scalar spills retain scalar
  loads and stores.
- Index exact, qualified, and simple function names within each semantic-model
  publication. Preserve first-match and ambiguity behavior. Rebuild when the
  function count grows, and invalidate on model publication, including
  republishing the same address with changed declarations.
- Retain/index non-function declaration records within the same publication,
  rather than allocating and scanning them on every query.
- Inspect Sexp tags and individual payloads directly instead of constructing a
  complete SxInfo record for every single-field query. Code views still return
  a null items pointer.

## Rejected experiments

Cloning/pruning before bitcode serialization cost about 350 ms versus 220 ms for
parse/prune in an isolated C API experiment. Starting workers while later
partitions were parsed caused a segmentation fault, despite separate contexts
and serial parsing, and was reverted. Direct element-load recognition did not
match the game's array-to-slice lowering and was also removed. Neither change
is retained.

## Remaining costs

The verified compiler's traced build spent 702 ms in the frontend/IR-lowering
scope, 72 ms in whole-module inlining, 183 ms preparing LLVM partitions, 296 ms
on the worker critical path, and 88 ms linking. These phase scopes sum to about
1.34 seconds; ordinary untraced builds avoid profiling overhead. Workers have
fallen from 9,713 ms to 296 ms. Further subsecond work must reduce frontend and
partition-preparation costs without weakening compiler behavior or optimization.

## Reproduction and validation

Profile an unchanged game copy with:

```sh
COIL_TRACE=1 /absolute/path/to/coil build
```

Time ordinary builds without COIL_TRACE; check that each invocation succeeds.
For a native sample, launch the build and run `sample PID 5 -file profile.txt`.
The dedicated compiler regressions run with:

```sh
python3 scripts/tests/compile-performance.py build/bin/coil
```

They check snapshot mutation/evaluation order at O0 and O3, bulk-copy IR,
function lookup ambiguity and exact identity, growing and republished models,
non-function declaration invalidation, and all syntax accessor variants.
The regression script is included in the generated gate.

The dedicated regressions also passed against the verified self-host compiler.
The focused modernization gate, full generated/JIT gate, all-stage snapshot
audit, and LLVM fixed-point bootstrap passed. The affected `ir`, `x86`, and `full` snapshots were refreshed
in one all-stage refresh. The verified compiler and its matching library were
installed globally.

The copied game's unit suite has the same result with the original compiler and
the candidate: 36 passed, one failed. `a-mirror-carries-a-gaze-around-the-corner`
fails the visibility assertion at `tests/dungeons_test.coil:205`. This existing
game failure is recorded in the investigation pad; no game source was edited.

Live investigation, phase measurements, and bug reports:
`coil-game-compile-speed`, linked from the `coil`
and `game-attempt-1` project pads.

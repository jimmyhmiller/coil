# Preallocation Phi coalescing — implementation checkpoint

Goal remains whole-bootstrap generation >=5x LLVM O3 and generated compiler
runtime <=1.10x LLVM O3. No performance result is established for this change.

The prepared native pipeline now joins exact-type, same-class, non-overlapping
Phi input/result live ranges before physical allocation, following the pinned
upstream phase. Full hole-aware ranges and sorted constraints are merged;
conflicting fixed requirements reject a union without mutation. Original graph
IDs and definitions survive; aliases share the final split-location index.
Contained COPY/BITCAST reuse excludes these multi-definition groups.

A first pressure run failed three cases with `odd split boundary needs
instruction-specific lowering`. Free allocation could change registers at an
odd definition position. The native allocator now selects partial assignments
using even input boundaries; no emitter guard was weakened. This is distinct
from upstream's still-missing loop-aware optimal split policy.

`tests/phi-coalesce.coil` exhausts 3969 pairs of six-position lifetime sets,
checking exact union, holes, adjacency, overlap rejection and immutability.
It additionally checks conflicting coincident fixed uses, strongest-use merging,
different masks, transitive groups, native-vs-generic split bounds, complete odd
endpoints, and a real scheduled diamond whose overlapping inputs cannot both
join its Phi. The subsequent COPY must remain outside that Phi group.

Native tests use the preserved LLVM-built 88e09ce2 compiler with
`run TEST --debug-checks --sanitize=address` on macOS/arm64.
Passing: phi-coalesce, jit-phi, jit-loop, jit-pressure, jit-switch-pressure,
jit-call-frame, jit-loop-vectorize-stencil, allocation.
Also passing: jit-call-pressure, jit-floating-phi, jit-binary-matrix,
a64-allocate. The initial blanket even-boundary policy failed six call-pressure
cases; explicit sorted call-definition boundaries restore the call emitter's
supported transitions. All four affected suites were rerun and passed after
that correction. The new unit suite checks this exception as well.

Compiler source/candidate 5bc1bad6 integrates standalone 26879ab/88ca6c9.
Candidate build succeeds; quick 9-step gate PASS 52.6 seconds. Full FAST not run.
Compiler committed, not pushed, not installed. Standalone source pushed.

## Compiler-derived verifier comparison

| Median | Before f50de3b8 | Candidate 5bc1bad6 | LLVM O3 |
|---|---:|---:|---:|
| IR-to-machine-code ms |97.7385|103.1985|371.3900|
| Runtime CPU ms |29.118|27.562|9.887|
| Object bytes |101090|97858|41440|

Generation regresses 5.59%; runtime improves 5.35%; object shrinks 3.20%.
Four rotating generation samples and 16 rotating child-CPU samples after excluded
warmups, same unchanged actual-verifier source and LLVM-built opaque caller,
serial/O3/no-debug/cache+library-state off. No competing build/test. This is a
small compiler-derived case, not bootstrap acceptance. Script and raw results
are preserved here; traced candidate object must equal the measured object.

Across all emitted functions, static disassembly instruction counts are
16600 -> 15789 (LLVM 5543), `mov` 1707 -> 1158 (LLVM 763), loads
1971 -> 1924 (LLVM 777), stores 791 -> 761 (LLVM 216), and calls remain
100 (LLVM 40). These are static counts, not dynamic execution or attribution of
all runtime savings. They indicate a remaining broader code-quality gap.

The frozen-source whole-bootstrap diagnostic FAILED in
`coil.compiler.metahost.mh-quoted`: `duplicate parallel-copy destination`.
Partial timings are discarded. Candidate 5bc1bad6 is not bootstrap-ready;
diagnostic graph capture/reduction is in progress. Nothing installed globally;
the full performance goal remains unmet.

## Bootstrap failure reduced and fixed

The failure reproduces from a standalone 425-cell captured `mh-quoted` graph,
including its exact constants, prototypes/string bytes, entry and roots.
`tests/phi-captured-metahost.coil` failed before the correction. The smaller
`tests/jit-phi-call-redefinition.coil` also failed: a third ABI input (x2) and a
one-argument call's result (x0) join a Phi on separate paths. Adjacent lifetimes
in that group generated a false preservation copy x2 -> x0, duplicating the
actual argument copy. A location change at the birth of a new SSA definition
must not carry the old dead value into its result. Matching definitions and
finalized group ownership now suppress that false transfer; COPY/BITCAST reuse
keeps its original lowering. Duplicate-destination checks remain unchanged.

After correction: both regression tests PASS debug/ASAN; small executable graph
checks 1005 selector/input combinations. Call-pressure and a64-allocate suites
rerun PASS. The compiler integration retry is pending. The earlier small timing
belongs to 5bc1bad6, not this corrected candidate.

## Corrected candidate verified and measured

Compiler 6eb62d2e completes the whole-bootstrap diagnostic. All generated hosts
emit the exact seed Stogir object; current generation 12.071326 s versus LLVM
34.363617 s, runtime 36.946802 s versus LLVM 17.395787 s. Same-source prior
backend comparison: generation 11.386598 -> 12.071326 s (6.01% worse), runtime
38.057127 -> 36.946802 s (2.92% better). One diagnostic sample, no acceptance.

Repeated corrected actual-verifier medians (four generation/16 CPU samples after
warmups): before/candidate/LLVM generation 97.391/103.160/369.1665 ms; CPU
28.9565/27.471/9.6995 ms. All three verifier objects exactly match the first
comparison, showing the redefinition fix does not affect this kernel's output.
The full-bootstrap goal remains unmet. Complete evidence is in the Coil
worktree `.worktrees/stogir-phi-preallocation-coalescing`, under
`docs/benchmarks/phi-preallocation-coalescing`.

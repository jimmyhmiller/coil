# Small compiler performance gaps

This checkpoint isolates backend costs using small Coil examples. The target
remains **5× faster IR-to-machine-code generation than LLVM O3, with generated
runtime within 10% on the full compiler**. Small examples are diagnostic inputs,
not substitutes for that workload. Standalone source is e9df256, integrated in
Coil 503735d8; the subsequent SDK namespace-manifest fix is 2bdbfa92.
Timing artifacts retain their measured 503735d8 identity. All timing commands
clear inherited COIL_* variables.

## Local aggregate promotion

[aggregate-local.coil](compiler-small-gaps/aggregate-local.coil)
exports a noinline C ABI kernel accepting two dynamic integers. It constructs
and reads a two-field local aggregate; its runner makes 200 million calls and
checks the resulting integer checksum. The original source is used unchanged
across LLVM, pre-change stogir and current stogir. No source inline attributes
were added to force a favorable result.

The new library pass classifies nonescaping addresses, follows lossless 64-bit
pointer containers, partitions exact nonoverlapping fields, forwards local
stores into loads and removes fully promoted storage. Mixed same-width scalar
views preserve their bits through BITCAST, following upstream ir_mem2ssa.c.
Mixed BOOL views, partial overlap, volatile access, address escapes, exposed
pointer roots and explicit SP manipulation retain memory. Cross-block Phi
promotion remains open. This runs before SCCP, with all CFG/matching/allocation
facts rebuilt afterward; immutable APIs preserve the source graph.

## Small-case measurements

Mac arm64, O3/no debug. Each case has seven rotated warm runtime samples after
an excluded first run; codegen has seven rotated samples after an excluded
warmup. `emit-obj` phase records include native optimization, verification,
selection/allocation, emission and object serialization. LLVM module setup cost
is significant on these tiny programs; do not extrapolate their ratios to the
full compiler. Whole CLI compilation is dominated by other work.

| Case/backend | IR→object median | Runtime median | Kernel instructions/calls |
| --- | ---: | ---: | ---: |
| aggregate-local / llvm | 14.714ms | 172.072ms | 4 / 0 |
| aggregate-local / before | 0.246ms | 403.035ms | 31 / 0 |
| aggregate-local / after | 0.224ms | 174.015ms | 5 / 0 |
| scalar-wrapper / llvm | 33.064ms | 91.916ms | 8 / 0 |
| scalar-wrapper / before | 5.776ms | 118.967ms | 22 / 1 |
| scalar-wrapper / after | 5.682ms | 118.984ms | 22 / 1 |

The aggregate kernel drops from **31 to 5 instructions**, eliminating every
stack allocation, initialization, copy and reload. LLVM uses 4 instructions.
Current aggregate runtime is 1.1% behind LLVM in this batch (another earlier
batch was 7.5% behind); the old backend is about 134% behind in this batch.
These are small-case observations, not full-compiler runtime acceptance.

[scalar-wrapper.coil](compiler-small-gaps/scalar-wrapper.coil)
is an ordinary small helper inside an integer recurrence. It deliberately
retains default helper policy. LLVM inlines it; stogir retains a call and
remains **29.4% slower** in this batch. Proper interprocedural inlining is still
needed; changing this source to Always would hide that gap.

## Assignment verification scaling

The verifier retains all existing validation rules and replaces its pairwise
interference scan with a sparse class index and merged live-range sweep.
The frozen old verifier agrees on 1,200 cases (345 accepted, zero differences).
At 8,192 children with four ranges each, seven alternating runs show a median
**131.603ms →1.440ms** per check, about 91× faster. This is a subpass measurement.
See [algorithm and scaling](../../src/compiler/stogir/docs/ALLOCATION_VERIFICATION.md).

## Periodic full compiler checkpoint

After isolating the improvements, one serial O3/no-debug emit-object command
per backend compiled the complete compiler source with the same LLVM-built
driver. Source and driver hashes are retained; no project builds or tests ran
concurrently. Ambient system load was not controlled. This is **one diagnostic
sample per backend**, not repeated acceptance measurements.

| Backend | IR→object | Whole emit-object command | Object size |
| --- | ---: | ---: | ---: |
| LLVM O3 | 32.758s | 39.038s | 8,259,200 bytes |
| stogir O3 | 19.891s | 26.759s | 13,402,752 bytes |

Stogir is **1.65× faster** in this probe, short of 5×. The previous source's
loaded serial median was 36.531s; source and conditions differ, so that is
historical context rather than a controlled old/new speed ratio. Both complete
compiler emissions succeed. Resulting full-compiler executable runtime has not
been remeasured at this checkpoint.

## Focused validation

- JIT, linked AOT and public O2/O3 paths agree on aggregate arithmetic.
- Escapes, overlap, volatile access, cross-block load boundaries and source
  graph ownership are checked, including integer address containers and signed
  scalar views with negative values. Rooted forwarded loads remain observable.
- Clean-environment ASAN passes the promotion tests and 1,200-case verifier oracle.
- GP/FP/call/switch pressure, mixed register/spill classes, allocation integration,
  SCCP pipeline/rewrite, explicit stack behavior and the stencil vector checks pass.
- Coil's existing native-backends program now also covers local aggregate fields
  and passes LLVM, TPDE and stogir with the expected exit status 42.

Raw samples, hashes, phase logs and assembly are in
[compiler-small-gaps/](compiler-small-gaps/). Temporary Python orchestration is
not shipped as an implementation. The workloads, optimizations and semantic
checks are Coil.

## Remaining control-join gap and delivery

The `aggregate-branch.coil` fixture changes different fields on the two paths of
an if and reads them after the join. Five warm runtime samples per backend show
LLVM at **191.491ms**, stogir at **663.457ms**, or **3.46× slower**. LLVM emits
7 instructions and no memory accesses; stogir emits 33, including 12 memory
accesses. Both checksum checks pass. This isolates the remaining cross-block
SSA/Phi promotion gap; the local promotion stage does not solve it.

The SDK namespace-manifest omission found by off-checkout validation is repaired
in 2bdbfa92. That source passes FAST **49/49 in 223.1s**, with the usual CLI
objects memory warning (1.61GB versus 1.5GB). It is installed globally. Installed
code-section equality, all **134** SDK module byte comparisons, LLVM/TPDE/stogir
object-link-run checks and off-checkout promotion imports/execution pass.
The promotion tests additionally check 1,254 typed scalar-view answers across
O1/O2/O3, including narrow sign bits, signed zero and NaN payloads; ASAN passes.

These changes improve two real costs. The full 5×/within-10% compiler target
remains unmet. Cross-block promotion and interprocedural inlining remain open.

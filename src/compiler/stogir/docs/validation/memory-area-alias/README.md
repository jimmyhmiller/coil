# Bounded address and memory-area alias analysis

The5× IR-generation / within10% runtime whole-bootstrap goal remains unmet.
This checkpoint is correctness evidence; no compiler timing improvement claimed.

Pinned upstream `ir.c:ir_decompose_addr/ir_check_aliasing` supply the reference
algorithm. The new address-alias module decomposes a base, one symbolic index
and bounded numeric displacement. It handles ADD/SUB constants, same-width
BITCAST views, nested index displacements and canonical VADDR/VAR storage identity.
Unknown expressions and exhausted walks remain opaque. Negative named constants
are never interpreted as numeric addresses merely because they carry an ID.

Load forwarding crosses a STORE only when known relative footprints or storage
areas are disjoint. Caller parameters may alias one another, as may differently
named symbols. Raw-SP ALLOCA/AFREE, unknown/numeric/frame-derived pointers and
unknown indexed areas do not prove disjointness. Different fixed function-lifetime
objects and VAR storage need in-bounds accesses of known width, with no symbolic
index, before the area rule applies. These restrictions preserve Coil-specific
raw-stack and exported-symbol-alias behavior. The existing aggregate-call,
volatile, join, register-effect and unknown-effect barriers remain intact.

Same-origin footprint tests use two modular unsigned relative distances, masked
to the pointer width. This handles signed offset extremes and32/64-bit wrap
without signed subtraction overflow. Index identities must match; equal indices
at runtime are not assumed distinct just because their SSA refs differ.

The existing jit-mem2ssa suite adds54,450 signed-footprint comparisons plus6,050
32/64-bit byte-set oracle cases, decomposition and area-domain checks,120 private/
caller native answers and192 indexed native answers (original, explicit forwarding
and full O3 pipeline). Native tests
include intentionally equal caller pointers/indices, both positive and negative
constant offsets, overlapping partial stores, exact side effects and canaries.
Added graph prefixes also pass the library verifier. The existing pure-call,
rooted-observation, symbolic-displacement, mixed-width, branch and memory-policy
regressions remain part of the same run. Host compiler invocation uses LLVM O1,
debug checks and ASAN; generated JIT instructions themselves are not instrumented.

The test emits paired Mach-O objects for private-store, caller-alias, disjoint-
index, unknown-index and partial-store cases. `driver.c` independently simulates
all affected bytes, verifies return values/side effects and checks full output
storage. Both before/after variants link with ordinary C O3 and ASAN C drivers
(20 binaries /256 checked answers);
the generated native instructions themselves are not ASAN-instrumented.

Reproduce from the library checkout:

```
coil run tests/jit-mem2ssa.coil --backend llvm -O1 --no-debug --debug-checks --sanitize=address
cc -O3 docs/validation/memory-area-alias/driver.c /tmp/coil-alias-private-after.o -o /tmp/alias-check
/tmp/alias-check
```

For caller-alias objects use `-DMODE=2`. For indexed objects use `-DINDEXED=1`
and MODE0(disjoint),1(unknown),3(partial). Raw transcripts, C driver and paired
native disassembly live alongside this document. Credits/license remain central.

The predecessor forwarding implementation fails the new positive indexed-load
assertion; its transcript is retained. The new oracle module was present in that
frozen test project, but only the predecessor forwarding implementation was used.
The final numeric-literal fast path and lazy store-only area queries pass the
full memory suite; all10 paired AOT objects remain byte-identical. Five affected
existing debug/ASAN suites also pass (SCCP control, static stack, module execution,
native memory and GP result projections); see regressions.json/transcripts.

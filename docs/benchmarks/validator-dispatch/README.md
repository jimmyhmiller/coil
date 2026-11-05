# Verifier dispatch and native word views

Compiler source/candidate e3295675, standalone source0fc9528 with validation
41f9ea1. Every vendored library source file matches the standalone snapshot.
Credits/licenses remain centralized under src/compiler/stogir. No global install.

One checked opcode mask replaces repeated static validator-family predicates.
Semantic validators and diagnostic ordering remain unchanged. Integer32-bit
BITCAST/TRUNC views follow pinned AArch64 ir_emit_bitcast/ir_emit_trunc: no
same-register instruction, W move for different registers. A TRUNC32 view is
no longer assumed to have cleared high X bits; later extensions still normalize.
No matching operands, liveness edges, optimization-level or inline-budget changes.

Validation: quickPASS37.1s, cli/objectsPASS38.6s, full FAST PASS273.8s. Existing
objects memory warning3.99GB. Standalone13+16 interacting debug/ASAN programs,
165conversion variants and24explicit word-view encoding cases pass. Native
compiler bootstrap output matches the current seed object across all generated
hosts:5ecfd4042feceeb5d7bcdbc7ecd51ceb3b63e3bbf5e1329dc1a058f2cc518a07.

## Whole compiler, same frozen source

| Metric | Prior7944bdfa backend | Current Stogir O3 | LLVM O3 |
|---|---:|---:|---:|
| Seed IR generation s |10.680325|10.314012|33.639417|
| Generated compiler CPU s |34.373839|33.754995|16.470847|
| Generated compiler wall s |34.629850|33.827239|16.552492|
| Compiler object bytes |12540172|12487532|8533864|

Single diagnostic per seed/backend/generated host, no warmup/repetition. Serial,
O3/no-debug, cache/library-state off, matching source/SDK stamps and output
hashes. Other Coil/Node/browser/background activity is captured in process
snapshots; not uncontended performance acceptance or a replacement baseline.
Observed same-source differences: generation-3.43%, generated CPU-1.80%, wall-2.32%.
Goal remains UNMET at3.26152x generation advantage and2.04363x runtime slowdown.
Required on this diagnostic: generation<=6.727883s and runtime<=18.207741s.

## Small verifier controls

Standalone dispatch-only change improved its actual verifier's process-CPU
median27.5565->25.3515ms with one compiler executable (about8%), while generation
91.8575->90.6585ms changed modestly. That source algorithm effect is separate
from changing the compiler's emitter.

Same new verifier source compiled with7944before/fcb88bitcast-only/LLVM: CPU
25.209/25.242/9.0635ms; generation90.9035/91.0875/365.3665ms. Bitcast-only removes
bytes with no demonstrated runtime gain. The word-TRUNC candidate e329 produced
CPU27.3295/27.1455/10.5915ms and generation109.7575/103.9795/503.4815ms in its
own rotating comparison. Do not compare percentages across these different
machine-load windows. Four rotating generation and16CPU samples afterwarmup;
opaque common LLVM caller checks invalid inputs and128valid results.

Scalar-property Always-inline annotations were independently tested and rejected:
less than1% Stogir CPU change,5.6% worse generation, larger object. They are not
in the adopted sources. Patch/results are preserved in the standalone evidence.

## Next original upstream stage

Backward integer-width propagation remains absent from our iterative optimizer.
It can move truncations through eligible arithmetic before matching/allocation.
The pinned upstream implementation also produces wrong results for MIN/MAX/ABS
corner cases reproduced natively in standalone docs/INTEGER_TYPE_PROMOTION_AUDIT.md.
Port with exact use/root proofs and appropriate range/order guards; do not copy
those unsound cases. No type-propagation port or its performance benefit is
claimed by this checkpoint.

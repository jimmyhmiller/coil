# Symbolic word constant rematerialization

Standalone base93349ce. Same-width BITCAST views of negative ADDR constants
(64-bit integer/address results) receive a persistent matching recipe before
liveness. They keep original graph references/types, have no virtual register
definition, and receive a read-only constant-source location(kind4). Frame
location kinds2/3 retain their meaning. Scalar reads and call/return capture
materialize through the existing constant emitter. Phi copies and GP arguments
use the existing deferred literal paths; stack arguments capture before register
moves. Relocations and literal bytes retain ordinary image ownership. No fake
IR constant types, Tile payloads, changed ABI or changed GCM policy.

Cold16-address fixture: before16 virtual definitions/0 rematerialized, after
0/16. Native text744→448B, frame160→32B. Both check49 inputs, unsigned wrap,
canaries and zero-trip null output under debug/ASAN. Independent linked C
driver checks the same49 cases on before/after objects, with and without ASAN.
Sixteen rotating process-CPU samples after excluded warmups, common C O3 caller,
4x1M cold-path iterations:23.978→18.5425ms (-22.67%). This compares two Stogir
outputs, not LLVM, and is not bootstrap acceptance. Host process snapshots kept.

Thirteen serial debug/ASAN suites pass: module execution, Phi, rematerialized
frame transfers, stack/pressure/variadic calls, static stack, scalar/switch
pressure, memory, floating Phi,165 scalar conversion variants and atomics.
Expanded module suite checks STR and raw FUNC_ADDR word views, signed/unsigned
GP/stack arguments, two interleaved frame recipes, Phi/return capture, repeated
pointer identity and image use after the source graph is released. Eighteen
native calls exercise those paths. Additional54 raw-address-word consumer
cases/216 native answers cover pointer returns, scalar arithmetic, floating
register-bank bitcasts and low-word truncation.

The old module suite used CONST_FUNC32 as an incompatible ABI flag in its
negative test. The preceding93349ce compatibility fix correctly made that
compatible; this test now uses convention9 versus0, retaining ABI rejection
coverage rather than contradicting the effect-bit contract.

Compiler seed1914b373, LLVM O1/debug/ASAN for generators/tests. Native graph
images use the library O3 pipeline, matching off only for legacy low-level APIs.
Baseline source is the frozen93349ce library, same fixture through a private
build project. No task builds/tests overlap timing. Actual verifier comparison
and compiler integration remain pending; full5x/within10% goal remains unmet.

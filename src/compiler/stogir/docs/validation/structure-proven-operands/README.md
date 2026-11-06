# Structural operand reads within a checked extent

The verifier retains storage-length, opcode/type, arity/header-count, complete
cell extent and continuation checks before entering each operand loop. For
1≤i≤count≤65535, cell r+floor(i/4) lies in r..r+floor(count/4), precisely the
validated extent. i%4 selects one signed32-bit word, including continuation
header payload. No graph mutation occurs while the borrow exists. Referenced
node membership, local-storage rejection, prototypes and optional references
are all checked as before. Immutable opcode metadata is cached once per node.
This follows pinned ir.h instruction-word storage, not an unchecked Graph API.

An explicit signed-reference storage-domain check now matches Graph.append's
existing limit: instructions.len≤2147483648 (index0 reserved, maxpositive ref
2147483647). Oversized storage previously let cursor→i32 conversion wrap. New
unit fabricates only header metadata and verifies rejection BEFORE any out-of-
allocation access, then restores real headers before release. Length mismatch
retains priority; representable graphs keep old results/diagnostic ordering.

255cases compare exact counts and every diagnostic byte to unchanged231c610:
arity0..65535, every payload slot/continuation, truncation, malformed metadata,
invalid opcode/type/count/aux, zero/extreme refs, prototype and local-storage
errors. Common LLVM O1/debug/ASAN raw-storage caller, old/new b27ffeb4 Stogir
O3/debug kernels, new LLVM O1/debug/ASAN kernel and current30467d56 native kernel
all agree. Stock verify suite including new domain case passes Stogir/debug and
LLVM/debug/ASAN. No sanitizer finding.

Initial fallback variant regressed1.6% with b27 emitter. Bounded/direct variant
improves3.6–3.7% there, but code has18staticcalls vs5baseline due different inline
admission. Do not treat the older emitter as the current backend's measurement.

Current30467d56 fixed emitter, same opaque b27 LLVM caller and unchanged full
arithmetic-verifier workload4096calls, eight rotating CPU samples after warmup:
Stogir640.538→577.1075ms (-9.90%); LLVM225.582→214.0335ms (-5.12%). Current native
structure body555→556instructions,3→2calls, frame240→208bytes. Static instruction
count alone does not predict runtime. No build/test/sampling overlaps timing.
This is a source experiment, not integrated Coil candidate or whole-bootstrap
result. Current whole compiler status remains the qualified30467d56 checkpoint.

Benchmark/kernel/runner and timing drivers are in benchmarks/structure-operands.
A separate LLVM shared-constants linker bug reappeared when both ASAN objects
imported opcode through builder:26duplicate globals/ASAN ODR symbols. Existing
coil-bugs/llvm-multi-object-duplicate-module-constants report covers it. The
common opaque caller now constructs raw graph storage without builder/opcode;
no duplicate-symbol linker override or ABI bypass was used. Reproducer input and
original linker diagnostics retained; this does not fix the general Coil bug.

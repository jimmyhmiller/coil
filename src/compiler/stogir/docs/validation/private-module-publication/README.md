# Private module publication

The module-bound image entry emits callers without embedding certified leaf bodies.
A context first owns the leaf image bytes and declared ABI under a canonical name.
The target adapter publishes each body once at its original local symbol, confirms
that symbol's actual binding and bytes, then seals the context against a target
scope. Callers must map declarations to the exact published symbol IDs. The
adapter must verify publication before exposing the final artifact. The target
scope and publication borrow their context; neither outlives its owner.

This is distinct from `image-with-private`, which returns a self-contained image
and remains available for standalone consumers. Module publication is not a raw
register-mask override and cannot certify exported, unknown or mutable bodies.

Validation on macOS/AArch64 using Coil candidate71856236:

- `run tests/private-module-publication.coil --backend stogir -O3 --no-debug --debug-checks`: pass.
- The same test with `--backend llvm -O1 --no-debug --debug-checks --sanitize=address`: pass.
- Existing `tests/private-call-allocation.coil` native O3/debug: pass.

The publication test rejects wrong scope, global binding, different bytes,
duplicate target IDs and sealing before all bodies are published. It checks
nonembedding of the callee in a caller image, exact binding identity and rejection
after context release. This does not establish compiler adapter correctness or
whole-compiler performance. Coil integration must supply those separate checks.

Address-taking correction: an emitted FUNC constant with prototype zero is a
valid untyped address, not a typed call declaration. Such references retain the
published name binding without granting a reduced mask. `context-mask` still
requires a validated actual CALL signature matching the owned leaf ABI. Explicit
typed declarations continue to reject mismatches. The module test now covers an
untyped ABS64 address reference; native/debug and LLVM/ASAN both pass. The existing
private allocation/typed mismatch/aggregate suite also passes native O3/debug.

### Scalar ABI equivalence

The real Coil emitter fixture exposed declarations using unsigned32 (type4)
for definitions using signed32 (type10): graph.lookup, strings.lookup and
 graph.operand. Exact serialized type equality rejected these despite identical
AArch64 argument representation. Comparison now checks ABI shape: signed and
unsigned 32/64-bit scalars are equivalent; calling-convention/variadic flags,
parameter count, groups (first/count/alignment) and aggregate result kind/count
remain exact. Narrow integers, pointers and FP remain distinct. Semantic proof
flags above the low five ABI bits remain irrelevant.

The 11×11 scalar signature matrix checks narrow signedness, width, GP/FP and
pointer distinctions, plus explicit calling-convention rejection. Native O3/debug
and LLVM O1/debug/ASAN module tests pass. This compares signatures only; machine
body certification remains the independent closed effects decoder.

Reference: [Apple ARM64 ABI](https://developer.apple.com/documentation/xcode/writing-arm64-code-for-apple-platforms),
which requires caller-side extension for integer arguments smaller than32 bits.
This is an ABI compatibility comparison, not a source type coercion.

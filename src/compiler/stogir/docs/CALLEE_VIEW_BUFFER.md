# Callee-view buffer reduction

This is an isolated mechanism test, not a compiler-bootstrap performance result.
The existing module-execution reduction now also passes a private16-byte buffer
through its wrapper. The compact wrapper reads the two fields and passes only
scalar data to its helper. After inlining that compact view, ordinary O3 memory
optimization removes the buffer, its two stores and two field reloads. The
expanded wrapper exceeds the caller's unchanged32-cell budget and leaves the
buffer crossing the call boundary. Both views derive from the same graph.

The complete ASAN/debug module suite passes. Each selection has128 independent
native expected-value cases; the source compact graph is released after registry
snapshotting. Existing zero/error/Never/shared-budget cases remain. Caller,
wrapper and leaf are rebuilt with O3. All four rebuilt objects match first-run
hashes (first build optimized the caller and used legacy image entry points for
helpers); the measured machine code is identical. Compact-only and both
alternative orderings produce byte-identical1007-byte objects. Expanded-only is
951bytes; static size alone is not the speed criterion.

One identical separately compiled C caller checks128 affine-formula answers and
an independently computed checksum over8million opaque native calls. Sixteen
rotating process-CPU samples after one excluded warmup; construction and linking
are outside measured runtime. C caller object and each generated object are
hashed. This is ordinary linked AOT execution of the same image path used by JIT.

|Selection|CPU ms|Repeat CPU ms|
|---|---:|---:|
|compact-only|41.7120|45.7310|
|expanded-only|46.0995|51.0900|
|expanded then compact|41.8240|46.3830|
|compact then expanded|41.8540|45.9150|

Fallback improves9.27%/9.21% versus expanded-only. Absolute runtimes shift between
runs; within-run ordering rotates and object bytes are stable. This establishes
a useful mechanism, not the required~58% full-compiler runtime reduction. No
LLVM parity or whole-compiler gain is inferred. The32-cell test cap models the
same callee-growth/caller-budget issue observed at512cells in the verifier.

Next gate: a generic provider policy using compact and finalized versions of the
same verified immutable source definition, followed by the actual unchanged
verifier workload. Keep production unchanged until that shows a meaningful gain
and all semantic/ABI/ownership and generation-cost checks pass.

[Caller, raw samples, hashes and assembly](validation/callee-view-buffer).

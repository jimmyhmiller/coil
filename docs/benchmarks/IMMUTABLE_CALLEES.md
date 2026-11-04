# Owned immutable callee registry

The standalone library's `6842e2d` introduces opaque owned callee snapshots.
Coil `9ac901b4` registers each definition version during serial preparation,
invalidates its handle on replacement, freezes final registrations before
emission, and releases all snapshots after the emission jobs finish. Complete
callee validation is reused across callers. Caller, per-site and output checks
remain. This extends orchestration around the pinned upstream representation;
it does not remove checks or claim upstream pass parity.

Same-source serial compiler diagnostics, with caches off and both hosts emitting
byte-identical target objects:

| Host | Target | Generation | Whole process CPU | Peak RSS |
|---|---|---:|---:|---:|
| LLVM before (`06606cdf`) | stogir O3 | 14.343 s | 21.731 s | 4.743 GB |
| LLVM current (`9ac901b4`) | stogir O3 | 13.518 s | 20.831 s | 4.999 GB |
| LLVM current | LLVM O3 | 31.785 s | 38.598 s | 4.387 GB |
| stogir current | stogir O3 | 37.479 s | 57.098 s | 5.012 GB |
| stogir current | LLVM O3 | 32.330 s | 51.494 s | 4.398 GB |

The matched generation reduction is 5.8%, at 256 MB additional peak memory.
Current generation is 2.35× faster than LLVM O3, below the 5× target. The generated
compiler consumes 2.74× the LLVM-host CPU on stogir emission, outside the 10%
runtime target. These are single diagnostics, not repeated acceptance results.
The native compiler is linked from the exact measured stogir object; version,
check and native execution smoke checks pass. Both target objects are identical
across compiler hosts. This validates host consistency, not runtime parity.

The reduced verifier comparison uses 8 rotating generation and runtime samples,
with warmups excluded. Generation is essentially neutral: 117.808 ms before,
116.619 ms current, LLVM 356.461 ms, TPDE 1.486 ms. Stogir objects are identical.
CPU medians: stogir 43.727 ms, previous 43.653 ms, LLVM 10.045 ms, TPDE 76.956 ms.
No runtime improvement is claimed for this validation-only algorithm.

Raw measurements: [compiler](results/immutable-registry/compiler.json),
[small workload](results/immutable-registry/small.json). Full local artifacts are
under `build/compiler-immutable-registry-checkpoint` and
`build/verify-immutable-registry`. ASAN/debug standalone module execution passes,
including destroying original callee storage, repeated transactions, malformed
storage/metadata, bad handles, Never and duplicate-CALL cases. Remaining work
includes generated code quality and snapshot lifetime/memory optimization.

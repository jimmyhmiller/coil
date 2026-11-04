# Exact masks and persistent shifted fields

Standalone `06b7d4f` restores pinned upstream `ir_fold.h`'s TRUNC(AND) restart.
Standalone `3ed815e` adds persistent AArch64 TRUNC(SHR/SAR) bitfield selection,
with machine uses and constraints established before liveness. BOOL, dynamic
counts and fields crossing the source word retain ordinary lowering. Rooted and
shared producers remain available. The generic bitfield fusion is an independent
extension; upstream uses UBFX for narrow shifts but does not provide this generic
truncation matcher. Integration: Coil `ff466828` and `d0f86cfc` respectively.

Eight rotating samples, warmups excluded, caches off, one identical LLVM-built
opaque runner. Baseline is registry-only `9ac901b4`; before is fold-only
`ff466828`; current is `d0f86cfc`.

| Workload / metric | Baseline | Before | Current | LLVM O3 | TPDE |
|---|---:|---:|---:|---:|---:|
| Tags, generation ms | 0.1990 | 0.1950 | 0.1940 | 17.0295 | 0.0420 |
| Tags, process CPU ms | 37.0095 | 34.9375 | 34.6050 | 6.0545 | 41.3370 |
| Verifier, generation ms | 118.4750 | 116.1165 | 116.7895 | 365.2395 | 1.4070 |
| Verifier, process CPU ms | 44.7080 | 44.5525 | 44.4835 | 10.0130 | 78.6675 |

Most of the tag reduction comes from the upstream fold; the additional bitfield
runtime difference is small. Current node.type-id emits LDR W, UBFX X, RET rather
than the original six instructions. Verifier object size falls from 115471 to
114031 bytes. The tag text shrinks by one instruction from before to current;
object file padding keeps both files at 578 bytes.

Same-source full compiler diagnostics (single samples, not acceptance):

| Host | Target | Generation s | Whole CPU s | Peak RSS GB |
|---|---|---:|---:|---:|
| LLVM baseline | stogir O3 | 12.971 | 19.999 | 5.003 |
| LLVM current | stogir O3 | 13.169 | 20.349 | 5.003 |
| LLVM current | LLVM O3 | 31.456 | 38.176 | 4.390 |
| stogir current | stogir O3 | 37.324 | 56.885 | 5.012 |
| stogir current | LLVM O3 | 32.228 | 51.445 | 4.398 |

The full generation sample regresses 1.5% versus the matched baseline; no
compile-time improvement is claimed. Current generation is 2.39× faster than
LLVM O3, below 5×. The generated compiler consumes 2.80× LLVM-host CPU on stogir
emission, outside the 10% runtime target. Small instruction improvements have
not closed the aggregate lowering gap. Both target objects are identical across
hosts, and the compiler linked from the exact stogir object passes native smoke
checks. Before/current stogir objects differ as expected for these optimizations.

ASAN/debug: 3,120 additional native graphs and 249,600 results, existing binary
matrix, incremental fold/CSE/JIT, memory-address matching and encoder boundaries
pass. Raw [compiler](results/shifted-fields/compiler.json),
[tags](results/shifted-fields/tags.json), [verifier](results/shifted-fields/verifier.json).
Local complete artifacts: build/compiler-bitfield-checkpoint and
build/{tag-extract,verify}-bitfield-final. An earlier contended verifier run is
excluded; the records here are the subsequent serial measurements.

# Hosted fixed aggregate bulk operations

Candidate e3f6bca7 routes fixed aggregate copies larger than the library's
128-byte inline limit through memmove and zero fills through memset. Smaller
copies retain scalar promotion. The library algorithms are unchanged; its
existing inline-limit constant is exported by coil-stogir 823e27b.

New external runtime imports created during deferred preparation are admitted
by the emission planner only when undefined and externally bound. Newly added
local definitions remain rejected.

The independent C driver for benchmarks/runtime-bulk/graph-copy.coil checks
whole-buffer overlap/alias and zero-fill canaries. Four rotating generation
samples and sixteen process-CPU samples after warmups produced these medians:

| Backend | Generation | Copy CPU | Object bytes |
|---|---:|---:|---:|
| Previous Stogir 6af08261 | 0.372 ms | 36.593 ms | 804 |
| Candidate Stogir e3f6bca7 | 0.2575 ms | 16.293 ms | 821 |
| LLVM O3 | 24.398 ms | 10.5165 ms | 1656 |

Candidate retains the 416-byte temporary and two memmove calls. LLVM elides
that temporary and emits one memmove. This is a small diagnostic, not bootstrap
acceptance. Disassembly and raw measurements accompany this report.

## Rejected whole-bootstrap timing

The frozen-source whole-bootstrap comparison completed and generated hosts
emitted the exact current Stogir object. However, process snapshots in the raw
JSON show competing rustc, Coil and clang builds. Do not use this run as an
acceptance result, as a replacement baseline, or to claim bootstrap improvement.
Candidate generation was 11.648792s versus LLVM 40.340230s; generated compiler
wall was 41.538456s versus LLVM 24.479033s. Previous-backend generated wall was
41.189505s. Runtime improvement is not demonstrated.

## Regression

scripts/tests/stogir-runtime-bulk.py passes 17 sizes from zero through1024 bytes,
including128/129, across69,632 overlapping snapshot copies and1,088 zero-fill
canaries. The independent C harness links with ASAN; comparisons cover the whole
4096-byte buffer. It is included in FAST cli/objects. ASAN instruments the C
harness, not every load/store of the generated native object.

The 5x generation / within10% bootstrap-runtime goal remains unmet.

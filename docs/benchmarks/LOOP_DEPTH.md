# Natural-loop analysis work

The old loop-depth implementation cleared a graph-sized Boolean array for every
candidate header and walked the dominator chain for every incoming edge. It also
scanned all block starts after each natural-loop union. The new implementation
uses unique header references as visitation epochs, increments depths only when
first visiting a member, reserves known array capacity, and builds iterative Euler
intervals for constant-time dominance queries in this phase. Loop membership and
irreducible-cycle policy remain unchanged; no graph validation is bypassed.

ASAN checks compare5120 generated CFGs and all their start-pair dominance queries
against the original implementation, alongside325 block-order cases, fixed nested
loop expectations, sparse/disconnected/self/irreducible/duplicate-edge cases, a
4096-level dominator tree, disjoint roots and unreachable entries. Native scalar
and switch-loop suites pass. No recursive traversal is added.

The standalone `loop-depths` kernel retains the old algorithm as a reference.
One identical opaque LLVM caller constructs64 blocks at reference stride16,
checks the known depth sum124 for nested multi-latch loops, then makes1024 calls.
Context creation, validation and destruction are included equally in child CPU.
The source tree is frozen across modes; each backend's kernel and the LLVM caller
are byte-identical between modes. Four generation and six runtime repetitions
follow excluded warmups; external system activity is possible.

| Backend | Prior CPU ms | Indexed CPU ms | Speedup |
|---|---:|---:|---:|
| stogir |36.5960|15.0740|2.43×|
| LLVM O3 |15.1305|6.7865|2.23×|
| TPDE |482.4620|36.8050|13.11×|

This measures the library analysis algorithm, **not compiler-bootstrap acceptance**.
The kernel was emitted by candidate807d6ed4, before integrating the optimized
analysis into the compiler itself. The integrated comparison below measures actual backend generation impact. The stogir-generated phase is still2.22×LLVM runtime.

Run `scripts/benchmarks/stogir-iterator.py --workload loops` with the usual
`--compiler`, `--library` and `--output` paths. Add `--legacy` for the reference
algorithm. Exact samples/hashes: [indexed](results/loop-depth/default.json) and
[legacy](results/loop-depth/legacy.json).


## Integrated compiler measurement

The matched verifier workload (2048 primitive nodes, 128 runs and three rejected
invalid graphs) compares candidate86036f0c against saved807d6ed4. Six rotating
code-generation repetitions and eight runtime repetitions follow warmup. All
before/after stogir objects have the same SHA256:
`4ed3fe8c87db5de9e2164b1675d9770359c53c0df38c7ec4d79a41e7cc023675`.

| Backend | IR-to-object median ms | Generated verifier CPU ms |
|---|---:|---:|
| stogir before |133.3750|61.6955|
| stogir indexed loops |130.8610|61.6835|
| LLVM O3 |323.0390|14.6015|
| TPDE |1.4470|99.3850|

The generation reduction is 1.9%; runtime is unchanged within noise. Stogir is
2.47× faster in generation and 4.22× slower in runtime than LLVM on this reduction.
This does not establish compiler-bootstrap acceptance. Exact samples and hashes:
[integrated verifier](results/loop-depth/verify-generation.json).

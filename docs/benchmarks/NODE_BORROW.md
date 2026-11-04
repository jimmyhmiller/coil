# Checked short-lived instruction-cell borrows

Standalone9113825 (contract clarification10fa500), Coil2ac4ffbd add checked
`graph.borrow-node` while preserving the existing value-returning lookup API.
Membership checks are identical: absent/zero/out-of-range refs, continuation cells
and long-constant payloads return null. Graph storage must be consistent, as for
lookup. A borrow is consumed only while the graph is unchanged and is invalidated
by mutation, growth or release. Callers retain signed references across those
operations. This follows upstream's borrowed instruction-cell reading pattern
without retaining a movable interior base pointer.

Vector and floating read-only classifiers use borrows locally, avoiding OptionNode
aggregate-result transport. No validation is removed and no pointer survives a
mutation. The graph suite compares all four Node words against lookup across4096
instruction/constant growth, variadic rewrites, long-constant payload/header cells
and extreme invalid references. ASAN graph, vector arithmetic/transport/constants,
scalar floating and verifier suites pass.

## Runtime-only comparison

Fixed emitting compiler45f4e200 and one exact opaque LLVM caller. The retained
before object is checked against its prior report SHA256 and fixture hash.
Current LLVM/TPDE kernels use updated source. Ten rotating child-CPU samples after
excluded warmup; every run checks the valid graph checksum and three malformed
inputs. Source digests frozen. No concurrent heavy build/test/install job.

| Backend | Verifier CPU median ms |
|---|---:|
| stogir previous value reads |46.2905|
| stogir checked borrows |41.9460|
| LLVM O3 current source |9.3110|
| TPDE current source |75.0515|

Stogir CPU decreases9.4%. Current stogir remains4.50×LLVM runtime on this
reduction. This is not compiler-bootstrap acceptance. Actual integrated generation
impact remains to be measured. Exact [samples/hashes](results/node-borrow/runtime.json).


## Integrated generation comparison

Candidate2ac4ffbd versus saved45f4e200, same current library/fixture and opaque
LLVM runner. Six rotating generation and eight CPU samples after warmup. Objects
are byte-identical (SHA256
`97bd39f4c288671e042876dba5b1070f6f9055a14de9bb6dbf8ae028c4d9a26c`).
Generation112.9315→113.4460ms and runtime41.3880→41.3490ms show no meaningful
integrated generation change. Current LLVM O3 generation340.3455ms/CPU9.2155ms;
TPDE1.3645ms/73.9215ms. This is distinct from the9.4%runtime algorithm gain
above. Exact [integrated samples](results/node-borrow/integrated-verifier.json).

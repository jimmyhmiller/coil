# Phi preallocation coalescing

Selectively copied from coil-stogir 26879ab and its call-boundary correction.
Source and architecture credit: [provenance](PROVENANCE.md), [license](../LICENSE), [notice](../NOTICE).

The prepared pipeline joins exact-type, same-class non-overlapping Phi ranges
before physical allocation, preserving holes, fixed constraints, original graph
IDs and resolver moves for constants/overlap/multi-successor predecessors.
Contained COPY/BITCAST reuse excludes these multi-definition groups.

Native free-range splits use legal input boundaries and explicit call definition
transitions. This does not establish loop-aware optimal split parity.
Native debug/ASAN range, constraint, branch, loop, GP/SIMD pressure, call, binary
and stencil checks pass in the standalone library. Compiler timing is pending.

Split transfers stop at a new SSA definition in the same allocation group;
COPY/BITCAST aliases retain existing lowering. This fixes the captured
metahost.mh-quoted bootstrap failure without weakening parallel-copy validation.

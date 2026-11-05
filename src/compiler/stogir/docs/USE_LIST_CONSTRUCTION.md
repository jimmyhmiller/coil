# Two-pass use-list construction

Keep the upstream-shaped count/prefix/fill representation and exact edge order.
Specialize count and fill walks with a Boolean compile-time parameter. The fill
walk no longer fetches an unused Range record or branches on a runtime pass flag
for every edge. Both walks use the same complete packed reference categories.

The existing build contract requires structural verification. The private
verified-input helper retains checked cell access and reads the bounded 0..3
word slot; it omits repeated optional node-membership/arity checks already proven
by that contract. Graph and node layout are unchanged. Public graph accessors
and all verifier requirements remain. Invalid graphs must not call this API,
exactly as before. Both walks are immutable and preserve sentinel/continuation
range entries and positive-reference-only edge semantics.

Validation under debug checks and AddressSanitizer: empty graph, exact repeated
edges, full 65535-operand continuation fixture, mutable edge lists, PHI SCCP,
native SCCP control, native iterative folding, and native PHI cases all pass.

Isolated construction benchmark: same opaque 2300-node-class graph and caller,
128 constructions per call; independent checksum of every definition/user/slot.
32 rotating CPU samples after warmup:

| Kernel | Before ms | After ms |
|---|---:|---:|
| Stogir O3 | 9.9155 | 7.0140 |
| LLVM O3 | 5.4550 | 4.7325 |

Stogir improves 29.26%; LLVM 13.24%. Distinct source roots and object hashes are
verified; Stogir specialization symbols confirm new code is present. An initial
same-cwd comparison resolved both imports to the new source and was discarded.
LLVM inlines the scan specializations, so symbol absence there is not a source
identity check; source and differing object hashes are used instead.
No integrated generation or full bootstrap gain inferred yet. The latest full
compiler profile identifies use-list construction in both backend windows;
see Coil COMPARE_CHAIN_BOOTSTRAP_PROFILE.md for window-specific evidence.
Raw accepted samples and script: validation/use-list-construction.

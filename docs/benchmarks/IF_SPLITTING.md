# Upstream private IF splitting

Standalone cbde231 ports the pinned upstream private Phi/test splitting rules.
The adapter observes terminals and cycle-covering edges rather than every
intermediate branch. Explicit standalone roots keep their existing contract.
See the backend guide for the control argument and ARCHITECTURE.md in the
vendored library for provenance.

Eight rotating generation and process CPU samples, warmups excluded, same
opaque LLVM caller, caches disabled. Baseline compiler c7bdd0ba; current source
is its IF-splitting integration. Both hosts consume the same workload/library.

| Workload / metric | Before stogir | Current stogir | LLVM O3 | TPDE |
|---|---:|---:|---:|---:|
| Iterator generation ms | 1.1930 | 1.1745 | 16.1870 | 0.0635 |
| Iterator CPU ms | 25.3225 | 25.4330 | 9.7325 | 55.2505 |
| Verifier generation ms | 113.3695 | 111.6920 | 375.6955 | 1.4240 |
| Verifier CPU ms | 42.6625 | 42.7785 | 10.0645 | 79.8705 |

There is no runtime improvement. The iterator object is byte-identical; the
verifier object changes from 102276 to 102244 bytes. The small generation
difference does not establish a full compiler gain. No full bootstrap timing
was run for this change. The 5x generation / within-10% runtime target is unmet.

The standalone ASAN/debug iterative suite checks 10,560 graphs and 253,440
original/optimized native answers, exact incremental use lists, all integer
widths/signs, protected identities, and guarded loads with null pointers on the
other path. The integrated O3 sweep keeps the same six passing corpus programs
and the same three previously reported unsupported/failing programs. FFI
goldens are unchanged. A separate bounded subprocess check confirms the finite
return and three nonreturning cycle paths. FAST and installed delivery follow.

Raw [iterator](results/if-splitting/iterator.json) and
[verifier](results/if-splitting/verify.json) samples.

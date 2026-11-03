# Shared AVec bounds diagnostic and observed control roots

`avec--check [T]` previously instantiated the full type-independent formatted panic path per element type (152 graph cells in the compact-node workload). The stdlib now shares one index/count diagnostic helper with the correct `never` return type. Bounds conditions and diagnostic text are unchanged; no inline annotations are added.

The inliner imports standalone component 7f8adba. Callees supply all observed control roots separately from their unique RETURN. The closure check uses all observations; cloned controls are mapped and added to caller roots. UNREACHABLE terminals with zero reserved/previous-terminal metadata are supported. Stack/frame operations remain excluded. The module provider passes its already-owned complete observed set.

Standalone native before/after tests pass ASAN, including cold helper calls followed by UNREACHABLE, child-process trap checks with a watchdog, hot answers, Never/zero budgets and fallback when the provider omits the non-returning root. Restoring RETURN-only closure fails the new assertion.

The existing backend fixture adds valid, negative, end and empty-vector accesses. Candidate source c6eed721 builds. LLVM, TPDE and stogir pass the backend fixture, including exact bounds diagnostics for negative, end and empty-vector accesses and preservation of the infinite arm. FAST and installation are pending; this checkpoint is not installed globally or pushed.

A preliminary void-return helper probe is retained in `avec-cold-path/void-return-preliminary.json` for diagnostic history. It is superseded by the correctly typed non-returning helper and is not a delivered performance result.


## Matched AVec diagnostic

One excluded warmup plus five alternating measured process runs, the same opaque runner object and checksum 859763163008. Both new backend objects use the same refactored stdlib:

| Kernel | Median runtime |
|---|---:|
| Previous nested-call stogir f3a88fae | 0.10619862494058907 s |
| Observed-control and shared-never-helper stogir c6eed721 | 0.08115674997679889 s |
| LLVM O3 c6eed721 | 0.05074412492103875 s |

This is **23.58% less stogir runtime**, leaving a **1.60x** gap to LLVM. The checker shrinks from 152 to 43 graph cells and is inlined with its non-returning branch intact. Saved general registers are gone from the hot kernel; the frame retains FP/LR for the cold call. New object size is 14,492 bytes versus 14,372 previously. Single small kernel generation diagnostics are 0.012286 s stogir and 0.038820 s LLVM; these are not full compiler acceptance timings.

Raw samples and identities: `avec-cold-path/never-return-results.json`. The earlier LLVM kernel used a different stdlib; compare the current matched objects when judging backend runtime.


## Broad-suite observation-contract regression

The c6eed721 kernel/backend fixtures passed, but stogir compilation of the complete module-execution suite rejected a legitimate observed COPY value in `generate-matched`. FAST was deliberately stopped after six passing steps and did not establish a pass. No installation/push occurred.

The corrected inliner accepts all valid positive observed roots, including values retained by SCCP. A PARAM mapped to a literal actual argument gets a positive COPY root; duplicate observations reuse that mapping. The existing conservative budget includes the original PARAM cell. The new ASAN regression checks linked answers, duplicate root identity, one-cell growth, Never/zero-budget fallback and a three-cell budget. Restoring strict-control validation fails this regression. Rebuilt candidate and broader backend checks are required before delivery.

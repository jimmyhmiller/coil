# Shared AVec bounds diagnostic and observed roots

Delivered compiler source **df2a4c21** is installed globally, committed and pushed. FAST passes **49/49 in 214.8 s**, including the constant-loop regression. Full compiler objects match across LLVM and stogir hosts. Performance remains outside the goal: **3.30x generation advantage, 3.51x native self-rebuild slowdown**. Current timings and identities are in OBSERVED_AVEC_COMPILER_CHECKPOINT.md; historical probes and corrections below explain the delivered contract.

`avec--check [T]` previously instantiated the full type-independent formatted panic path per element type (152 graph cells in the compact-node workload). The stdlib now shares one index/count diagnostic helper with the correct `never` return type. Bounds conditions and diagnostic text are unchanged; no inline annotations are added.

The inliner imports standalone components 7f8adba and b3a4e6c. Callees supply all explicit observed roots separately from their unique RETURN; this includes value observations and non-returning control. The closure check uses the complete supplied set and cloning remaps those observations. UNREACHABLE terminals with zero reserved/previous-terminal metadata are supported. Stack/frame operations remain excluded. The compiler provider retains its full optimization anchor list locally and supplies its control-observation view when cloning, as detailed below.

Standalone native before/after tests pass ASAN, including cold helper calls followed by UNREACHABLE, child-process trap checks with a watchdog, hot answers, Never/zero budgets and fallback when the provider omits the non-returning root. Restoring RETURN-only closure fails the new assertion.

The existing backend fixture covers valid, negative, end and empty-vector accesses, recursion, non-returning control and constant-loop specialization. The historical c6eed721 probe passed its initial fixture but failed the broader suite and was never delivered; the corrected source and validations are recorded below.

A preliminary void-return helper probe is retained in `avec-cold-path/void-return-preliminary.json` for diagnostic history. It is superseded by the correctly typed non-returning helper and is not a delivered performance result.


## Historical c6eed721 AVec diagnostic

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

Corrected source **f860d6b6** builds and passes the complete module-execution suite compiled by stogir O3, including cold child traps and duplicate literal observations. All three backend fixtures and exact bounds diagnostics pass again. Both regenerated AVec objects are byte-identical to the c6eed721 objects, so the retained runtime samples apply to the corrected checkpoint; SHA-256 identities are in `avec-cold-path/fixed-observed-kernel-identity.json`. FAST is being rerun from the start.


## Constant-loop template observation regression

A full-source diagnostic on f860d6b6 failed at `wasm-table-section`; no full compiler timing/object was produced. A small ULEB writer called with constant 1 reproduces it, while direct byte writes and variable ULEB inputs compile. Loop-only 256d0dd7 and nested-call f3a88fae compile the same reduction. The existing backend fixture now includes `encoded-constant`; the pre-fix candidate fails there with `observable SCCP data root is unresolved`.

CIR block-end observations are control observations. Optimization can retain additional pure COPY identities when CALLs are expanded. Those anchors must stay in a definition's own optimization roots, but copying them into a caller can unconditionally pin a value from a branch that specialization makes unreachable. The provider now owns a separate control-observation view for cloning. Returned values remain connected through RETURN; effects and non-returning control remain explicit, and library closure validation still rejects missing control regions. This does not discard the standalone API's explicit value observations or change the template's own full root set.

The corrected provider needs candidate, fixture, broad-suite, full-source and FAST revalidation before delivery. Open Coil issue: `stogir-inline-template-value-observations` in the `coil-bugs` pad.

Final provider source **df2a4c21** passes both full-source emissions and native self-rebuilds with byte-identical objects across hosts. FAST passes **49/49 in 214.8 s**, including the constant-loop fixture now in its normal native checks. Official installation, off-checkout all-backend/bounds/constant-loop/stogir-SDK checks and all 144 SDK source identities pass. Full performance remains outside the target; see OBSERVED_AVEC_COMPILER_CHECKPOINT.md for the unfavorable tradeoff and exact numbers.

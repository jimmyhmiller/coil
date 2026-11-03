# Observed-root and shared AVec diagnostic: full compiler checkpoint

The full compiler now compiles correctly after the constant-loop root-view fix. This is source **df2a4c21**, combining closed-loop and typed nested-call expansion, complete observed-root support, and the shared never-returning AVec bounds diagnostic. It does **not** meet the performance goal.

Mac AArch64, O3/no-debug, serial generation, inherited COIL variables cleared, `COIL_LIBRARY_STATE=0` and `COIL_CODEGEN_TIMINGS=1`. Native timing includes adaptation, module/template preparation, expansion, Always eligibility/body spans, graph optimization and emission. Each row is one matched-source diagnostic, not repeated acceptance medians.

| Compiler host | Target | IR-to-machine-code | Whole object emission |
|---|---|---:|---:|
| LLVM O3 | LLVM O3 | 33.391895 s | 40.34699487499893 s |
| LLVM O3 | stogir O3 | 10.123763 s | 17.35894029098563 s |
| stogir O3 | LLVM O3 | 34.208074 s | 55.80250170803629 s |
| stogir O3 | stogir O3 | 37.707400 s | 60.90059479197953 s |

The matched LLVM host gives a **3.30x generation advantage**, below the required 5x. The generated compiler's stogir self-rebuild is **3.51x slower**, far outside the permitted 10%. The 5x generation threshold for this LLVM sample is 6.678379 s.

The preceding full checkpoint (675c94ae) recorded 8.661270 s stogir generation and a 3.27x native self-rebuild slowdown. These revisions have different compiler source, so they are historical diagnostics rather than paired before/after medians. The current same-source cross-host comparison remains decisive: the goal is unmet, and added inlining work has not improved the full result. The combined template preparation/finalization span is 1.392591 s under LLVM versus 6.902049 s under stogir, a concrete cost to investigate.

Both target objects are **byte-identical across compiler hosts**. The stogir object is 13,297,872 bytes (SHA-256 `200cdf16bcfc5ef367fc2666b2d2d926538c28f736da038bae6467df3540e5d3`); LLVM is 8,342,488 bytes (SHA-256 `864e4760148571616cc79bb2d04fec8319855de572426adb7f430d33c01eb52c`). The stogir-built native compiler is 11,440,192 bytes and passes version/check/run smokes. Raw identities and timings are in `control-view-compiler-checkpoint/`.

The unchanged compact-node AVec workload still shows a local gain: prior nested-call stogir 0.10542575002182275 s, current 0.08166745805647224 s, and LLVM built against the same stdlib 0.051142374984920025 s. One excluded warmup and five alternating samples use an identical opaque runner and checksum 859763163008. This remains a 1.60x runtime gap; small-case improvement is not evidence that the full compiler target passed. Raw samples are `avec-cold-path/control-view-results.json`.

The correctness regressions and their reductions are retained in AVEC_COLD_PATH.md and the existing backend fixture. Official installation and off-checkout checks pass for df2a4c21: all three backend fixtures, constant-loop specialization, exact bounds diagnostics, stogir-built module execution and all 144 SDK modules. FAST passes **49/49 in 214.8 s**, including the newly wired graph-call fixture (existing objects memory warning 1.69 GB). The source is installed globally; final delivery commits include these reports.

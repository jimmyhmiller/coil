# Conditional inliner graph ownership

Coil candidate source 679ee6da integrates standalone f1b37f2. The inliner validates all inputs, then opens an owning graph copy only after a proven expansion. A None outcome preserves the caller graph and avoids verifying an unchanged output again. The existing always-owned library API remains compatible. No verifier is disabled, and graph optimization/matching/emission order is unchanged. See vendored provenance for ownership and validation details.

The extended module-execution suite passes ASAN and a stogir O3-built binary. Conditional outcomes, release followed by caller reuse, empty sites, invalid duplicate sites at zero budget and private-result negative cases are covered. All compared opcode, DAG and module-suite objects are byte-identical across old/new drivers, and both resulting binaries execute correctly.

The full compiler is also byte-identical across drivers on fixed source 679ee6da: 13,123,628 bytes, SHA256 e79995ad06a9d6c89d7c817822a4f521c0be974dad9e928479492abaf4948449. Single serial diagnostics with caches disabled and complete generation accounting:

| Driver | IR-to-code seconds | Whole emission seconds |
|---|---:|---:|
| b86a0b5f | 10.774556999999934 | 19.127446457976475 |
| 679ee6da | 10.046414999999955 | 18.501816749922 |

This is about 6.8% less measured generation time without changing generated compiler code. The machine had substantial external Rust load during this work; these are diagnostic samples, not repeated acceptance results, and no new LLVM speed ratio is claimed. No native self-rebuild runtime claim is made. The goal remains unmet.

Three measured alternating small compile samples (one excluded warmup) gave old/new medians: opcode 8.431/8.293 ms; DAG 22.936/20.459 ms; module suite 2.125548/2.157221 s. Module timings were visibly contended. Raw negative and positive samples are retained; byte identity is the correctness evidence.

Delivery validation: candidate 679ee6da installed globally. FAST 49/49 in 267.2 seconds (objects peak 1.60 GB). Off-checkout LLVM/TPDE/stogir fixtures, exact AVec diagnostics and constant-loop regression pass. Installed stogir-built module execution, bitwise, SCCP control and iterative-fold suites pass. All 144 SDK modules, AVec and toolchain identity match the tested candidate.

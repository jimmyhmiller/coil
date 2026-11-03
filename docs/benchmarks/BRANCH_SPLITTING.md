# Conditional PHI branch splitting

Coil candidate source 2354d0b4 integrates standalone 95d77bd. This follows pinned upstream IF(PHI)/IF(CMP(PHI,literal)) transformations before matching/liveness, with explicit observation preservation and incremental use updates. See vendored provenance for the supported subset and exclusions.

The standalone ASAN control/pipeline/rewrite suites pass, as does a stogir O3-built control suite. The new nested rewrite assertion fails against the previous implementation. Effectful paths, shared values, protected/duplicate observations, floating edge cases and exact independently rebuilt def-use lists are checked.

## Measurements are not acceptance results

The exact opcode workload retains checksum 9979482367440117777. A first matched-source measurement gave medians 0.10062370798550546 seconds before and 0.106118708034046 seconds after (LLVM 0.034836582955904305). The generated kernel shrinks from 164 to 155 instructions but still has repeated validity tests. This is an unfavorable result, not a claimed speedup. Raw samples are retained.

A subsequent paired AVec run encountered a concurrent unrelated Rust build on this Mac: LLVM reference runtime rose from about 51 ms to 78 ms, with highly variable stogir samples. The full contaminated samples and a process snapshot are retained; no performance conclusion is drawn. The earlier df2 baseline run is not a source-matched branch-split comparison and is not used to claim a gain.

The prior full compiler diagnostic remains 3.30x IR-to-code advantage and 3.51x slower native self-rebuild. There is no new full compiler acceptance claim. The goal remains 5x generation advantage and runtime within 10% of LLVM O3.

The repeat after the Rust build ended retains the unfavorable opcode outcome: before 0.11172912502661347 s, after 0.11749479197897017 s, LLVM 0.03756283293478191 s. Checked AVec improves locally: before 0.08351091598160565 s, after 0.07712916703894734 s, LLVM 0.05257312499452382 s. Both stogir objects were rebuilt against the unchanged workload. One warmup and five alternating measured samples; raw data retained. Neither result establishes full compiler performance.

Candidate source 2354d0b4 passes FAST 49/49 in 259.7 s (object step peak 1.60 GB). The next isolated component follows upstream Boolean comparison restart rules; branch splitting is not described as an across-workload performance win.

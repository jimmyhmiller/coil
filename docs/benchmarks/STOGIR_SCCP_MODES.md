# SCCP/native mode delivery checkpoint

Compiler executable source: `3baa1650`; standalone library executable source:
`799bba6`. The O3 stogir path now runs rooted SCCP, owned rewriting and
incremental scalar cleanup before native preparation/matching/liveness.

The fixed native stencil, inputs, LLVM O3 policy and IR-to-machine-code timing
boundary are unchanged. One warmup and five measured samples rotate LLVM O3,
TPDE and stogir, with 200000 passes and seed 12345. Short nonzero-checksum inputs
1/2/17/257 agree across the engines and stogir O1/O2/O3.

## Provisional measurements, not a replacement baseline

Concurrent Turbopack/Rust compilations were observed in 8 of 24 monitoring
samples. These medians are retained as a provisional run, not accepted evidence
of a performance gain. The previous accepted benchmark artifacts remain intact.

| Backend | Whole CLI compile ms | IR-to-machine-code ms | Runtime ms |
| --- | ---: | ---: | ---: |
| LLVM O3 | 213.932 | 25.790 | 361.365 |
| TPDE | 185.193 | 0.122 | 4002.083 |
| stogir O3 | 187.650 | 5.963 | 2990.253 |

Within this provisional cohort stogir code generation is 4.33 times faster than
LLVM O3 and runtime is 8.27 times as long. This does not meet either goal gate:
at least 5 times faster IR-to-machine-code generation and runtime at most 1.10
times LLVM O3. The scalar pipeline alone has not closed the stencil's SIMD gap.

Raw samples, input hashes and interference evidence are in
[stogir-sccp-modes-provisional.csv](stogir-sccp-modes-provisional.csv) and
[stogir-sccp-modes-provisional.json](stogir-sccp-modes-provisional.json).
Installed compiler validation, including its remaining corpus failures, is in
[the delivery report](../validation/stogir-sccp-pipeline-installed.json).

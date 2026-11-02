# Finalized location indexing: actual compiler comparison

Coil executable f9f0b602; standalone executable 4ff76d2, main ac64679.
The owned per-value split-child index is built after final allocation and
verification. Ordinary/Phi CFG reconciliation and contiguous transfers use it;
other emission queries remain linear. Allocation decisions, ranges, graph
semantics and selected code remain unchanged. All 5406 AOT fixture objects and
all three actual benchmark objects match the preceding checkpoint byte-for-byte.
Runtime differences between code checkpoints reflect measurement conditions.

Same native-stencil, 200000 passes, seed 12345, O3/no debug, rotated backend order,
five measured samples after warmup. IR→object includes optimization:

| Backend | IR to object median ms | Whole compile median ms | Runtime median ms |
| --- | ---: | ---: | ---: |
| LLVM O3 | 25.423 | 220.790 | 362.491 |
| TPDE | 0.127 | 181.470 | 4009.435 |
| stogir O3 | 4.846 | 206.038 | 383.205 |

Measured codegen speed is 5.246x and runtime 1.057x LLVM O3, meeting both numeric
thresholds in this run. This remains provisional pending a repeat. External
activity occurred in 17/17 monitor observations, mostly WindowServer, with codex
and xprotectd in 6 observations each. LLVM runtime 356.587–417.077ms, stogir
379.023–388.845ms. Raw samples, hashes and load observations accompany this report.
The original accepted baseline remains intact.

Standalone validation passes 236 programs and 72 linked consumers; all 5406 AOT
objects are byte-identical to 0fc663a. Focused ASAN 31752-query oracle and native
stencil/switch/Phi/edge/allocation tests pass. Coil FAST passes all 49 steps in 216.5 seconds (cli/objects memory warning:
1.60GB versus 1.5GB). Official global installation and off-checkout verification
pass: installed/candidate code-section equality, all 133 SDK modules match
standalone main, LLVM/TPDE/stogir AOT smoke and new namespace imports succeed.
See ../validation/stogir-location-index-pipeline-installed.json.

## Confirmed checkpoint on the frozen workload

Same compiler binary, sources, flags, iteration count and five rotated measured
samples, after installation and without other development jobs running:

| Backend | IR to object median ms | Whole compile median ms | Runtime median ms |
| --- | ---: | ---: | ---: |
| LLVM O3 | 26.120 | 219.462 | 359.693 |
| TPDE | 0.132 | 185.763 | 3994.737 |
| stogir O3 | 4.859 | 208.347 | 380.500 |

The confirming comparison yields **5.3756x faster IR-to-object generation** and
**1.05785x runtime** (5.8% slower), meeting the agreed >=5x /<=1.10x goal on this
workload. The first run independently meets the median thresholds. The confirm
also meets both using its entire observed ranges: fastest LLVM codegen 25.842ms
versus slowest stogir 4.931ms gives 5.2407x; slowest stogir runtime 383.473ms versus
fastest LLVM 350.390ms gives 1.09442x. These are observed sample bounds, not a
prediction for other workloads or future runs.

Normal external activity remains present in 17/17 monitor observations:
WindowServer 17, codex 7, xprotectd 6 and occasional OS services. The confirming
run has no external Node-worker saturation, and link medians return to ~39ms.
The reported ranges and all load records are retained rather than calling the
machine idle. No competing build/test jobs were started by this session during
any benchmark. All three benchmark objects are byte-identical across metadata,
first index and confirming runs. Runtime differences reflect measurement
conditions; the index changes compile cost, not emitted code.

One intervening repeat is explicitly rejected for severe external contention:
many Node workers at 80–111% CPU in 18/19 monitor observations. Link medians rose
from ~37ms to 90–97ms, and LLVM/stogir runtime medians became 402.128/476.600ms.
Its LLVM/stogir codegen medians were 34.702/8.970ms. Complete raw inputs, samples,
summary and load observations remain under stogir-location-index-rejected-repeat.*;
the classification explains why it is excluded from the confirming comparison.

This establishes the performance checkpoint for the agreed IR-ready→relocatable
object boundary on this Mac and this fixed workload. Whole CLI compilation is
reported separately and does not meet a 5x claim. The original historical
baseline remains unchanged, and upstream architecture parity gaps documented in
the standalone library remain outside this performance checkpoint.

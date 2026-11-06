# Combined return and allocation whole-bootstrap diagnostic

Compiler01f47440, standalone library through e1ee083: canonical private GP return
values, propagated result hints, single-scan fixed-use limits and reusable
decision storage. Based on earlier pointer metadata/bitcast/effect integrations;
joined-load forwarding remains isolated. Source/SDK072feff5632c860851266fc77c9765b805ace149e49cf1f38dba45fd27e3f3af.
Candidate buildPASS, quick36.8sPASS, emission/ABI/symbol checksPASS. Not globally
installed or pushed; fullFASTnotrun.

Same frozen compiler source, serial/O3/no-debug, all COIL variables cleared then
library-state off plus serial/timing flags. Standard whole-bootstrap measure.py
adapted only for source version. Each seed object is linked to a compiler with
same frozen SDK and dependencies. Each generated compiler compiles the identical
whole source to Stogir. Both outputs exactly match the seed Stogir object:
SHA2568518b77085925bc8a9546899937a574d8e2c23535dbe2edde9007a2c58a090fc.
One diagnostic sample per backend/generated host, no warmup/repetition. No task
builds/tests/profilers overlap these timings. Raw samples, host observations,
identities, commands and transcripts retained here. Not performance acceptance.

| Metric | Stogir O3 | LLVM O3 | Stogir target maximum |
|---|---:|---:|---:|
| Seed IR-to-machine-code generation |10.702427s|35.300149s|7.0600298s|
| Generated compiler wall runtime |31.570623041s|16.206796208s|17.827475829s|
| Generated compiler CPU runtime |31.423668s|16.157346s|—|
| Generated compiler own Stogir IR-generation phase |19.551276s|9.043740s|—|
| Compiler object size |12,068,624B|8,589,608B|—|

Generation3.29833× faster, runtime1.94799×slower. Both goals unmet: roughly34.0%
less generation time and43.5%less runtime still needed from current Stogir.
Different source/protocol state from older checkpoints: no controlled historical
improvement percentage is claimed.

## Separate whole-process profiles

Exact linked hosts are sampled on separate untimed compilations using sample
at1ms, up to50seconds/host. Each profiled output must match the same seed object.
Parser verifies child sums and exclusive totals. Worker selection uses nonzero
native-function-emission ancestry, excluding main-thread join waits. LLVM has
inlined native-build/module-finalize names, so those family shares cannot be
compared by name. Family shares overlap and inlining affects attribution.

| Worker family | Stogir (25,980samples) | LLVM (14,040samples) |
|---|---:|---:|
| Function emission |33.73%|34.69%|
| Verification |13.59%|8.86%|
| Use-list construction |5.04%|6.05%|
| Register allocation |4.56%|4.57%|
| Allocation/scratch API |7.24%|8.13%|
| Graph.operand visible leaf |1.62%|absorbed into callers|

The synthetic emitter's24%allocation share is not representative of whole
bootstrap's4.6%. Further allocation tuning has limited whole-workload upside.
Stogir visible top leaves include structure1044, memmove777, uses.build763,
integer verification657, assigned-indexed-pressure483, uses.scan476 and
Graph.operand420. Sampling diagnostic writes are also present; counts are not
absolute wall time or direct like-for-like leaf comparisons with LLVM.

Next code-quality audit: caller register-result projection requires same-block,
exact-width loads. A conditional payload read can fail that restriction even
when CALL dominates it. Determine prevalence on actual hot caller graphs before
extending selection with a CFG dominance proof; preserve initialization/privacy,
SSA definition positions and call-clobber liveness. This is a hypothesis, not an
implemented optimization or established explanation of the entire runtime gap.

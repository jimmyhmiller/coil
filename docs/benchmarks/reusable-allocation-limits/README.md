# Reusable allocator limit storage

Librarye1ee083, compiler37d5c0a4. One private buffer per allocator run, reset for
each decision/retry and released on all exit paths; existing compatibility
entry signatures retain owned temporary storage. Source/SDK hashesresults.json.
Candidate buildPASS, quick36.4sPASS, live emission checksPASS. FullFASTnotrun.

Same real CIR emitter/kernel as ../emission-workload. Common LLVM caller from
../fixed-limit-summary/runner.coil,513emissions at each32/128/512operation size,
75JITedgeanswers/process; every emitted text fingerprint equal across every
iteration and host. Eight rotating childCPU/wallsamples afterwarmup; task builds
finish before timing. Shared CIR construction/JIT/oracle/hash overhead included.
Before object: c95dade7 source checkpoint, previous fixed-limit-summary worktree.
Reuse/LLVM: identical changed source,37d5c0a4driver.

| Host | Median CPU | Median wall |
|---|---:|---:|
| Before Stogir |838.3860ms|841.2885ms|
| Reuse Stogir |791.0005ms|793.5693ms|
| Changed-source LLVM O3 |338.6850ms|341.4959ms|

Stogir CPU improves5.652%; still2.3355×LLVM. Do not compound across earlier runs
or claim a whole-bootstrap benefit.

Separate four alternating old/new Stogir driver IR-generation samples after
warmup on identical changed kernel source:2.6447765s→2.616271s(1.078%gain).
The complete generated kernel object must match byte-for-byte across all old/
new driver invocations. Preparation included in existing timing spans. This
isolates allocation implementation cost without changing output. The LLVM
kernel generation transcript is one build, not a repeated timing result.
Exact drivermeasure.py expects baseline summary.o from prior frozen worktree.

Full-bootstrap goal remains5×generation and≤1.10×runtime, unverified here.
Next integrate already validated canonical return work and collect a fresh
whole-compiler diagnostic before further small optimization work. Experimental
compiler remains uninstalled/unpushed; fullFASTrequired beforepush.

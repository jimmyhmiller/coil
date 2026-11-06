# Single-scan fixed-use limit experiment

Library3659161; compilerc95dade7, SDKd96f99fa7cc6b1b29e251ca844c4dc6f9406fa1985526bef65f8c74600a129dd.
Only allocator/constraint summary changes integrated from the library; latest
canonical return work is not included. Candidate built, quick36.3sPASS, live
emission checksPASS. Full FAST not run, not installed/pushed.

Same actual emitter kernel from ../emission-workload. Common caller now emits
each32/128/512-operation function513times; fingerprints must agree at every
iteration and across all hosts, plus75native edge-answer checks perprocess.
Eight rotating CPU/wall samples afterwarmup, no task builds overlap; includes
caller setup/JIT/oracle/fingerprint overhead. Four rotating IR-generation
samples afterwarmup for changed source only, preparation included. Source/SDK
frozen; raw samples/hashesresults.json and exact drivermeasure.py. Beforeobject
is the preserved6cff505d Stogir kernel from earlier baseline; summary/LLVM use
identical changed source withc95dade7driver. measure.py expects that preserved
baseline in /tmp/emission-kernel-stogir.o, which can be rebuilt with6cff505d in
the earlier frozen stogir-callee-return-producers worktree.

| Host | Median CPU | Median wall |
|---|---:|---:|
| Before Stogir |837.8305ms|840.5850ms|
| Summary Stogir |823.8635ms|827.1343ms|
| Changed-source LLVM O3 |348.3975ms|351.3414ms|

Stogir CPU improves1.667%; remains2.3647×LLVM. Changed-source generation:
Stogir2.636639s, LLVM7.3297385s,2.7799×advantage. No before-generation comparison
was measured, so no generation gain attributed. This is not bootstrap acceptance.

Old profile family analysis excludes samples outside the emitter ancestry and
checks child sums. Allocation509/2110Stogir samples(24.12%) vs415/2145LLVM(19.35%);
verification18.25%/13.33%, allocator API17.30%/14.97%. Inclusive families overlap,
and inlining affects attribution. This supports investigating allocation but
cannot assign its entire cost to fixed-use scans.

Next: evaluate reusable allocator temporary limits storage instead of a fresh
ArrayList perdecision. Preserve public APIs, bounds, hints, boundary rounding,
full allocation choices and emitted code. No speed claim until measured.

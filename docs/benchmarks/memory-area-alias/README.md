# Memory-area alias experiment: neutral small results

The whole-bootstrap goal remains unmet. This experiment closes a qualified
upstream alias-analysis gap but does not demonstrate a useful compiler speedup.
It is not adopted into the global toolchain and does not justify another full
bootstrap timing run.

Standalone source6989997; experimental compiler source/candidate efd69a33.
Comparator b27ffeb4 includes private GP result projections. All rows compile the
same current source and use one opaque LLVM O3 caller per workload.

| Workload / emitter | IR-generation median | Runtime CPU median | Object bytes |
| --- | ---: | ---: | ---: |
| Verifier before |93.9795ms|25.3845ms|83239|
| Verifier alias analysis |94.679ms|25.487ms|83239|
| Verifier LLVM O3 |394.342ms|9.6865ms|39880|
| Graph preparation before |102.5765ms|23.147ms|95652|
| Graph preparation alias analysis |106.2715ms|22.9435ms|95348|
| Graph preparation LLVM O3 |378.061ms|10.4955ms|56032|

Verifier generation worsens0.74% and runtime0.40%; graph preparation generation
worsens3.60% while runtime improves0.88%. These are small observed medians with
noise, not acceptance gains. Four rotating generation and16 rotating child-CPU
samples follow excluded warmups; exact object/caller/compiler/source hashes and
samples are in results.json. No task builds or tests overlapped measurement.
Opaque runners check malformed inputs and independent successful checksums.

Candidate build PASS; quick gate PASS38.2s; extended native aggregate/effect/
retained-symbol/unit smoke PASS. All159 vendored modules match library source
and the SDK stamp remains unchanged after measurement. Full FAST has not run
for this experimental compiler. It is locally committed, not pushed or installed.
Standalone library implementation/correctness evidence is committed and pushed.
No validation or optimizer stage was disabled to improve timing.

Next causal gap: aggregate-result calls remain universal memory barriers, even
when the target's native behavior is read-only, because the caller capture writes
its result buffer. A sound extension needs a target effect proof separate from
the result-region write, and an alias-aware test for the specific queried load.
Do not mark aggregate calls globally memory-preserving or ignore their capture.
Existing scalar CONST/PURE behavior stays intact. No such extension is implemented
or measured in this checkpoint.

# Compact getter: signed high-field folding

Standaloneb3a2fcb / Coil8714fe10, baseline2860d92b. Unchanged compact-node
getter, shared exact LLVM O3 caller,200million opaque calls, checksum63500000000.
Five alternating measured runs after one excluded warm run.

|Kernel|Median seconds|
|---|---:|
|LLVM O3|0.167182166|
|stogir memory forwarding|0.201194542|
|stogir high-field fold|0.171600333|

The fold reduces runtime14.7% against the matched current baseline, leaving
stogir2.64% slower than LLVM on this example. Its kernel has12 instructions,
versus16 before and LLVM's7. The typed high-field identity removes redundant
logical-shift/truncate/sign-extension sequences, retaining final signed bit views.
The same LLVM caller hash527f39022613da6d55f09b1ec2dd55b93bfadd01ef8b95a95ac338dfdaf1f67a
is retained. Raw samples and focused assembly accompany this report.

This closes this small runtime gap only. The full compiler5× code-generation /
within10% generated-code runtime goal remains unmet. The last full diagnostic
covers2860d92b, not this fold.

ASAN checks pass the incremental use-list rebuild oracle, private/rooted/shared
intermediate cases, adjacent nonmatching shifts and dynamic8/16/32-bit signed
payloads; promotion and call-pressure checks also pass. FAST49/49 passes in209.6s
with the object-check memory warning at1.69GB. Official installation succeeds.
Off-checkout all3 native backend executions return42; new SDK and pressured-call
JIT checks pass, as does the installed high-field/use-list oracle. All142 installed
sources match standalone and installed executable code sections match candidate.

# Loop-entry active eviction: local benefit, bootstrap still misses both goals

Library5ab34a5; Coil source/candidatebb4634f0 versus76f45b07. Frozen source/SDK
`1031db87cc9099694709977b42f46d79fe76c4812e854fdb274043ab51dcbe92`. Candidate builds, quick47.5s and live/prebuilt retention pass.
Ten native suites and19,880 exact pinned-C selector answers pass; selector and
actual graph/metadata replay pass AddressSanitizer. No global install or push.

## Same-source whole bootstrap diagnostic

| Measurement | LLVM O3 | New Stogir O3 | Previous Stogir O3 |
|---|---:|---:|---:|
| Seed IR→machine code |38.333992s|11.353696s|11.870841s|
| Generated compiler wall |18.231818s|28.187113s|28.233528s|
| Generated compiler CPU |16.720081s|27.832729s|27.938404s|
| Generated compiler own Stogir IR phase |10.378187s|15.460805s|15.876572s|

New generation3.3763× LLVM; generated runtime1.5460× LLVM. Goal requires at least
5× generation and at most1.10× runtime: currently≤7.666798s and≤20.055000s.
Current-source generation improves4.36% versus the prior compiler. Generated
whole runtime is neutral (-0.16% wall), not a meaningful demonstrated gain.
Single full-bootstrap runs with recorded external host activity: diagnostic,
not acceptance-quality medians. Do not compare the historical smaller source's
LLVM runtime with this one to claim a runtime win. All generated hosts reproduce
the exact seed Stogir object `aa5081bd990c416322d5bdab4d685da48c8bb8ae32942927f09a2159d23253a6`.

## Controlled small components

Eight alternating CPU samples after warmup, identical opaque caller and same
current source across each driver pair. No own tests/builds/profiles overlap
any timed run. LLVM before/after objects are identical in both fixtures.

| CPU median | Before | After |
|---|---:|---:|
| Actual provider closure,20,000 queries |113.0185ms|102.4985ms|
| LLVM provider control |53.693ms|54.4975ms|
| Actual emitter,513 emissions |655.5465ms|655.9905ms|
| LLVM emitter control |360.4085ms|359.647ms|

Resolver improves9.31%; emitter is neutral. Provider construction/release are
outside its kernel CPU clock;100,000 independently expected results and every
returned name pass. The common emitter caller checks output hashes and execution
answers. Single generation samples establish no component generation speedup.

Actual provider bytes match the standalone replays exactly:1568→1464bytes.
The active owner122 cut moves489→329, before the inner loop at330. All past
operand uses remain in the assigned prefix; the next required-use queue stays
forward. The native emitter's transfer rules are unchanged. This does not delete
visible stores/loads by pattern.

Scope: pinned upstream optimal selection for active-owner eviction only.
Free-assignment/reload restart categories and full irreducible classification
remain open. The metadata builder reuses existing immediate dominators and
natural-loop depth; unsupported classification retains the prior policy.
Further work must address broader generated-code quality and generation cost;
this local win does not close the compiler-wide gap.

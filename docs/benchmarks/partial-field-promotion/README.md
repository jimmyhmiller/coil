# Partial integer field promotion: code-shape gain, neutral component timing

Librarye440314; Coil43df70f5. Build, quick50.2s and live/prebuilt retention pass.
270 promotion/fallback fixtures and22,680 native expected-byte answers, ASAN,
full validation of retained uninitialized graphs, existing memory/control/
aggregate-result suites and old-source negative control pass. No installation/push.

| Eight alternating CPU medians after warmup | Before | After |
|---|---:|---:|
| Actual provider closure |101.870ms|102.144ms|
| LLVM provider control |52.717ms|52.678ms|
| Actual emitter |666.1835ms|667.489ms|
| LLVM emitter control |363.872ms|363.336ms|

Both effects are neutral. LLVM control object pairs are byte-identical. Every
closure expected result and every emitter answer/hash passes. Single generation
samples: provider0.987681→0.992694s, emitter2.730029→2.727058s; no demonstrated
generation gain. No own tests/builds/profiles overlap timing. External compiler
and js-frontend jobs were visible; process snapshots retained. Diagnostic only.
No new whole-bootstrap claim: last whole checkpoint remains3.3763× generation,
1.5460× runtime; both goals unmet.

Actual free-decision-for-class shrinks1284→972bytes. The earlier standalone replay
of the prior module graph yields1036bytes; module preparation also runs memory
promotion before cloning, followed by native cleanup. Capturing the current
module graph and replaying its normal final optimization reproduces the actual
972-byte body exactly, SHA0b3d19b097da737254c028bedc8447acabe489729fc1b14938e990bd6711d5ae.
Baseline body matches SHA f7bff319e1fba9b381f153392782af9d07aa69b43b7d63a5f3ad1c69471b8d76.
The allocation frame is120bytes (aligned machine SP reservation128) versus216.

The same-start bit-insertion extension preserves initialized high bytes and
reuses demand-driven Phi construction. It does not support displaced overlaps:
adjacent32-bit fields within a zeroed64-bit word still retain memory. Full support
needs access-order-independent canonical fields, bit insertion/extraction at
byte offsets, initialized incoming values, root/escape/volatile fallbacks and
independent native byte checks. Do not infer a broad gain from the smaller body.

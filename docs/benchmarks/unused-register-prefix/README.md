# Unused assigned prefix: actual frontend benefit, neutral emitter

Coil source/candidate76f45b07 versus572c6210, libraryfbfa8fa. Same current
fixture sources for both drivers; one identical opaque caller in each comparison.
Eight alternating CPU/wall samples after excluded warmup. No own build/test/profile
overlap. All independent answers pass. Final quick52.6s/live/prebuilt suite pass.

| CPU median | Before | After | Change |
|---|---:|---:|---:|
| Actual provider closure,20,000 queries |121.0635ms|113.5595ms|-6.20%|
| LLVM control, same provider closure |52.9405ms|53.072ms|+0.25%|
| Actual emitter,513 emissions |650.360ms|649.0505ms|-0.20%|
| LLVM control, same emitter |354.846ms|354.3525ms|-0.14%|

Provider timing excludes constructor/release; common clang C caller checks100,000
answers. Emitter uses the unchanged opaque LLVM caller and verifies emitted
machine code and execution answers. LLVM before/after objects are identical in
each fixture. Single generation samples are recorded but establish no speedup.

Actual provider code exactly matches both standalone allocation replays:
1636bytes/8eb24179fe0e2e941fa1efd29194c7b34bcf3cf3d804955a09a0dadaf792b9d2
before,1568bytes/1999ebc0a55aefacffa736b83353a9779898d25f593dd9fa35864b91333b7411
after. Register-only prefixes with no earlier operand use are spilled as in the
pinned upstream active-owner eviction rule. Used prefixes remain preserved.
Native/ASAN indexed-state tests and call/FP/switch/private pressure checks pass;
full evidence is in the library validation note and vendored copy.

This is a6.2% improvement in one real frontend operation, not a compiler-wide
runtime gain. Emitter is neutral. No new whole-bootstrap checkpoint is justified
by the emitter result alone. Last whole comparison remains the qualified
private-call-module diagnostic:3.3524× generation,1.7816× runtime, goal unmet.

Next upstream gap: ir_find_optimal_split_position and loop-entry-aware active
splits. The captured graph's parent122 has last earlier use294 and eviction489;
upstream loop-entry selection can cut329 before inner header87. Do not replace
that analysis with deleting visible stores/loads or reintroducing rejected
call-release retries. The complete loop split policy is still unimplemented.

Committed locally; not installed globally or pushed. These candidates remain
experimental pending goal progress and broader delivery gates.

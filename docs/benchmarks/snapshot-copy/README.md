# Aggregate snapshot fusion

Shared CIR canonicalization removes an exact-size private aggregate snapshot
when its only uses are adjacent initialization and copying out, in one block.
The replacement is overlap-safe MEMMOVEV or zero-fill MEMSETV. Escapes, extra
uses, mismatched sizes and intervening instructions prevent fusion. Debug marks
move through the existing dead-instruction compaction mechanism. Removed frame
slots are compacted in one scan; analysis reuses Func scratch-use storage.

This is a Coil canonicalization before the Stogir adapter, not an upstream pass
port. It does not disable any Stogir optimization. Constant oversized moves use
the existing hosted runtime policy. Dynamic nonconstant bulk lowering is
unchanged. Snapshot analysis is explicitly counted in IR-to-codegen timing.

## Preliminary code-quality evidence

Initial907a76a5 native Graph assignment emits one memmove tailcall instead of
two calls through a416-byte temporary. LLVM also emits one memmove. Stogir still
saves/restores a16-byte frame. Repeated copy CPU medians were16.720ms before,
11.004ms after,10.7605ms LLVM. Native overlap/zero-fill checks passed.

The initial generation measurements did not include the new CIR pass. They
are invalid for compile-performance claims; source8e452187 corrects the timing
boundary. The initial JSON is qualified accordingly. External host load was not
captured for the small measurement. No bootstrap-performance claim follows.

## Validation

The direct CIR ownership harness checks positive copy/zero cases and rejects
an extra read, a returned address, differing transfer extents, differing
allocation extents, an intervening effect and a cross-block transfer. It checks
removed allocations and source debug-mark transfer. The native matrix covers17
sizes,69,632 overlapping snapshots and1,088 zero-fill canaries with an ASAN C
harness. Both checks run in FAST cli/objects.

Full bootstrap goal remains unmet until same-source measurements prove5x faster
IR generation and generated compiler runtime within10% of LLVM O3.

## Corrected candidate8e452187

Quick PASS41.9s and cli/objects PASS43.1s, with the existing3.99GB objects
memory warning. Snapshot analysis is included in generation timing. Repeated
small-case medians: previous0.2775ms, candidate0.2445ms, LLVM25.004ms generation;
previous16.922ms, candidate12.099ms, LLVM10.9025ms copy CPU. Runtime varies
relative to the initial run, so the initial2.3% gap is not a stable result.
External process observations are included in timed-copy-results.json.
Whole-bootstrap diagnostic is pending; competing external builds mean it must
be qualified rather than treated as performance acceptance.

## Initial whole-bootstrap diagnostic8e452187

Both generated hosts emitted the exact seed Stogir object. Stogir generation
13.819041s versus LLVM36.257130s; generated compiler CPU40.341109s versus
LLVM17.763648s, wall41.665932s versus17.969353s. Previous e3f6bca7 backend on
this same frozen source used13.729235s generation and38.605329s generated-host
CPU. There is no demonstrated bootstrap improvement. External competing builds
were observed; these are single-sample diagnostics, not acceptance.

Audit then found that fused zero fills below128 bytes used the dynamic memset
call path instead of inline bulk/zero lowering. The extended native regression
fails on the initial candidate with: small zero-fill1 became a runtime call.
Known small zero fills now retain inline lowering; corrected candidate testing
is pending. Do not report the initial fusion as a delivered performance win.

## Corrected bootstrap diagnostic7944bdfa

Full FAST PASS277.7s, objects memory warning3.99GB. Quick PASS70.1s with60s
wall-target warning. Native ownership/overlap tests pass, including the small
zero-fill instruction-shape regression.

| Same frozen compiler source | Prior e3f6bca7 backend | Corrected Stogir | LLVM O3 |
|---|---:|---:|---:|
| Seed IR generation s |11.913601|11.534419|37.266725|
| Generated compiler CPU s |38.210880|35.912306|17.050776|
| Generated compiler wall s |40.958102|37.415659|18.416748|
| Compiler object bytes |12590876|12539624|8533712|

These are single diagnostic samples with competing Next/Node/Turbo/Coil builds
recorded in process snapshots. Do not replace the uncontended baseline or claim
performance acceptance. Observed same-source differences: generation-3.18%,
generated compiler CPU-6.02%, wall-8.65%. The goal still fails at3.23091x
generation advantage and2.03161x runtime slowdown in this run. All generated
hosts emit the exact current seed Stogir object; source/SDK fingerprints match.

Whole-process1ms profiles are separate from timing. Worker samples29154 Stogir,
13826 LLVM; main-thread join waits excluded. Inclusive families overlap:
Stogir verification4058(13.92%), allocation API3557(12.20%), memory/SCCP
optimization7321(25.11%). Memory optimization within final native emission is
2642(9.06%); preparation2073, template finalization1376, emission planning1230.
Snapshot fusion itself10samples(0.034%). This rules out the new pass's analysis
cost as a dominant runtime explanation. It also bounds the benefit of eliminating
final-emission memory optimization alone; it cannot close the whole gap.

Raw results, matching-host profiles, validated stack parser, commands and hashes
are under corrected/. Profile distributions are diagnostic and affected by
inlining and sampling; they are not timings or proof that repeated passes can
safely be removed. Public and post-mutation validation remains required.

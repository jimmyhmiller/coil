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

# Callee-view provider probe: not adopted

Experimental source610ac7dc / standalone3aa2386. Provider retains compact and
finalized views derived from the same verified source definition; only smaller
compact views get immutable registry snapshots. Module-arena ownership keeps
original borrowed graph/control arrays live during preparation. No clone-budget
increase, validation removal, Never override or source-name recognition.

The isolated buffer reduction repeats~9.2% runtime gains, but actual unchanged
opaque verifier comparison gives:

|Driver/backend|Generation ms|Native CPU ms|Object bytes|
|---|---:|---:|---:|
|production088de286/stogir|98.3750|35.9755|103419|
|views610ac7dc/stogir|101.5160|34.2775|105718|
|production088de286/LLVM|378.4870|10.4420|41008|
|views610ac7dc/LLVM|382.1080|10.5210|41008|

Eight rotating generation and24 native CPU samples after warmup, state off,
serial O3/no-debug. One identical checked caller; every variant passes valid and
malformed input checks. LLVM objects match byte for byte across drivers, checking
that the input frontend path remains unchanged. Trace-mode output also matches
the untraced experimental object. Host snapshots and binary hashes are retained.

Runtime improves4.72%, generation worsens3.19%, object grows2.22%. Static calls
increase126→145; classification remains a call. This is one comparison, not
repeated bootstrap evidence. The current provider policy is not adopted: the
small runtime gain does not justify moving further from the5× generation target
while leaving most of the runtime gap. No whole-compiler speedup is claimed.

Experimental implementation remains in610ac7dc and the standalone branch for
future work; production source is restored exactly toac2803dc's SDK/backend.
The global installed compiler remains088de286, not the experimental candidate.

Next investigate an existing predicate control-ancestry reference-number cutoff
against preallocated block headers. Prove a legal failing reduction before
changing it; ordinary later-created-predicate cases are already tested and
supported. Do not infer an unported upstream optimization merely from a name
search. Pinned ir.c:ir_check_dominating_predicates_i is already implemented.

[Raw measurements, source fixture/caller hashes and trace](results/callee-view-probe).

Restoration validation: FAST49/49PASS278.4s, cli/objects1.60GB memory warning.
The restored candidate and full SDK digest match production088de286. Official
installation restored/warmed that same production binary, SDK/native/JIT/lint;
the experimental610ac7dc binary is archived separately and is not installed.

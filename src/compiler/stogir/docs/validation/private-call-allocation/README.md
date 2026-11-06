# Private leaf effects in AArch64 allocation

The new `compile.image-with-private` is a self-contained single-image API. A module-lifetime opaque Context owns the registered leaf snapshots and a collision-checked name index. Registration must finish before freeze; accepted names cannot be replaced, even by an unsupported second body. Unknown bodies decline normally. Source images may be released after registration.

During allocation, only ordinary direct declared CALLs with matching private name/ABI signature can reduce GP reservations. The callee's exact write set is combined with the whole x0..x8 setup bank. Tail modes, indirect and unknown calls retain full ABI reservations. SIMD reservations remain full ABI. Existing APIs pass no context and retain full ABI behavior.

Before returning an image, the native entry validates the references actually emitted against the registered prototypes (not dead graph constants), internalizes matching undefined symbols at their existing IDs and appends the exact owned leaf bytes. Existing caller relocation IDs therefore bind to the local definition instead of an external resolver. A conflicting definition or incompatible private ABI is an error; no partially bound image escapes the native entry. Low-level bind-image! expects a valid completed image and its output must be discarded on error.

IR semantics, references, optimizer ordering, splitting/hint policy, allocation checks and ordinary ABI remain unchanged. No raw caller-provided clobber mask is accepted.

## Validation

Native Stogir O3/debug and LLVM O1/debug/ASAN pressure tests pass. Twelve runtime-loaded values plus their address remain live across the call and are observed afterward. Four leaf variants write x0..x8, or additionallyx9/x12/x15. Both full-ABI and private-effect versions execute correctly. Physical reservation checks assert the exact private mask, full tail/indirect/unknown fallback, and unchanged complete SIMD masks. Context freeze, duplicate-name protection (including unsupported duplicates), ABI mismatch rejection and external symbol retention are checked.

Two-word GP aggregate and x8 indirect results pass through the new native entry at O1/O2/O3, including result-memory observations. Independent AOT callers pass10,000 pressure answers per linked variant and20,000 aggregate-result answers. Native and ASAN hosts regenerate byte-identical pressure objects matching the measured objects. Existing allocation/pressure, ordinary calls, wide/narrow call pressure, aggregate results, by-value ARGVAL and floating pressure tests pass through the legacy APIs.

## Small diagnostic timings

One local paired run, shared opaque clang-O3 caller,50million dependent calls per sample,10,000 randomized ABI checks, eight rotating CPU/wall samples after warmup. No own builds/tests/profiling overlap timing. These are two Stogir-generated versions, not an LLVM runtime comparison. Source/compiler/object identities and raw samples are retained in pressure-results.json and metadata.json. External system activity is not isolated; this is not bootstrap acceptance.

| Leaf writes beyond setup bank | Full ABI CPU | Private CPU | Change | Caller bytes before/after |
|---|---:|---:|---:|---:|
| None |214.3825 ms|153.463 ms|-28.42%|244 /188|
| x9 |213.110 ms|169.1525 ms|-20.63%|244 /196|
| x12 |213.9815 ms|166.8895 ms|-22.01%|244 /196|
| x15 |211.833 ms|166.8775 ms|-21.22%|244 /196|

The smallest caller drops61→47 instructions and15→8 stack stores and loads each. Other variants use49 instructions and9 stores/loads each. These stack accesses include ABI saves/restores as well as spills; they are not all spill instructions. Full disassemblies and counts are retained here.

## Required Coil module integration

This API embeds each referenced leaf once in its returned image. Independently invoking it for every Coil function would duplicate private bodies and could change function-address identity across the module. Do not use that as the compiler integration.

The Coil adapter must compile eligible live leaves once, retain their exact images, publish each once at its original local assembler symbol, freeze the verified name/signature-to-symbol mapping, and compile remaining callers against those exact published bodies. Noncertifiable bodies keep full ABI behavior. Preserve source signatures, actual private binding, reachability, JIT/AOT identity, body lifetimes and phase accounting. Callee-first source filtering must be conservative and may not trigger double native compilation. A module-bound native image path must retain these verified external-to-image private bindings rather than embed per-caller copies.

Only after that integration should actual compiler fixture timings and whole-bootstrap acceptance be measured. The latest whole-bootstrap result remains the previous checkpoint; no5x/10% claim is made here. Not installed or pushed.

This is an independent target extension; pinned dstogov/ir attribution and licenses remain centralized in NOTICE/PROVENANCE.

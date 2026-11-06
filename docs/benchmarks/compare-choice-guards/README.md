# Cheap comparison guard experiment: neutral

Source/candidate 83172ef2 versus f1b39ed6. Library e48c294 changes only predicate evaluation order. Rejected call-release retry policies remain excluded.

| Fixture CPU median | Before Stogir | After Stogir | Before LLVM | After LLVM |
|---|---:|---:|---:|---:|
| Array access | 61.247 ms | 61.022 ms | 46.3745 ms | 46.554 ms |
| Actual verifier, 4096 iterations | 434.6095 ms | 434.051 ms | 187.8815 ms | 187.474 ms |
| Actual emitter, 513 iterations | 635.5445 ms | 637.4375 ms | 326.954 ms | 325.6985 ms |

Eight rotating CPU/wall samples after warmup; shared LLVM caller. Frozen source/SDK identities, repeated deterministic answers, cross-version equality, no overlapping own builds or checks. Exact manifests and raw samples are in results.json. Array-access and verifier Stogir objects are byte-identical across versions. Emitter fixture compiles changed implementation and therefore differs.

Quick checks passed in 43.0 seconds; live emission/prebuilt retention passed. This experiment does not demonstrate a performance gain and does not justify a new whole-bootstrap checkpoint. No full FAST, global installation, or push. Whole-bootstrap target remains unmet.

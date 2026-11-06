# Class-only allocator decisions: small integrated effect

Library ab061ee, Coil candidate/source2c45fb02 versus83172ef2. Same input fixtures, source SDK identities frozen, common opaque LLVM caller b27ffeb4. Eight rotating CPU/wall samples after warmup; no own build/test/profiling overlap. Exact emitted machine-code hash and runtime answers match across all versions of the emitter fixture. Verifier/array fixture Stogir objects are byte-identical. Full raw samples and identities in results.json.

| CPU median | Before Stogir | Class-only Stogir | Before LLVM | After LLVM |
|---|---:|---:|---:|---:|
| Array access |62.803 ms|62.948 ms|47.3375 ms|47.3975 ms|
| Actual verifier,4096 iterations |443.9445 ms|443.8305 ms|191.437 ms|192.028 ms|
| Actual emitter,513 iterations |644.009 ms|639.422 ms|330.5515 ms|335.8155 ms|

Emitter Stogir -0.71%, LLVM +1.59%; verifier neutral. These small effects do not establish a meaningful performance gain or justify a new whole-bootstrap checkpoint. The 59% isolated decision improvement does not translate to a large compiler speedup. Optimized decision policy remains exactly checked, including279,936 reference cases and native/ASAN pressure tests.

Quick43.8s PASS, live/prebuilt retention PASS. No full FAST, global installation, or push. Both rejected release retries remain excluded. Whole-bootstrap5x/10% target unmet.

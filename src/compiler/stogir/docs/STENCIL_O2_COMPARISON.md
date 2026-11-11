# Same stencil at O2 and O3

Same installed/compiler-candidate executable f9f0b602, unchanged stencil source,
200000 passes, seed 12345. Five measured samples after warmup, rotated backend
order. The temporary existing Coil harness changes only its two -O3 literals to
-O2; its own build remains LLVM O3. O3 is the earlier confirming run, not a fresh
paired rerun. Compiler/source/driver hashes and raw observations accompany this
report in validation/stencil-o2-*.

| Backend | O2 IR→object ms | O3 IR→object ms | O2 runtime ms | O3 runtime ms |
| --- | ---: | ---: | ---: | ---: |
| LLVM | 24.892 | 26.120 | 364.811 | 359.693 |
| TPDE | 0.128 | 0.132 | 4011.453 | 3994.737 |
| stogir | 3.722 | 4.859 | 2977.712 | 380.500 |

Whole CLI compile medians (O2/O3 ms): LLVM 217.083/219.462;
TPDE 182.255/185.763; stogir 184.972/208.347.

Stogir O2 spends less time generating code but runs 7.83x slower. Its current
level 3 enables guarded loop vector prefixes; level 2 retains scalar SCCP. The
entry-point dispatch is src/stogir/a64/compile.coil:image-with-options. TPDE's
objects are byte-identical at O2/O3 (5128 bytes). Stogir objects are 8014/9114
bytes and LLVM 2752/2624 bytes respectively. All executable outputs match.

O2 runtime ranges: LLVM 358.100–454.128ms, TPDE 4006.235–4023.006ms,
stogir 2945.112–3001.702ms. All 24 monitor observations contain background OS/UI
activity, mostly WindowServer and Codex Renderer. Small LLVM/TPDE differences
between separate runs cannot reliably be assigned to optimization level. The
large scalar/vector stogir difference is consistent with the explicit pass
policy. Historical O3 raw data remains in Coil docs/benchmarks/
stogir-location-index-confirm.*. No toolchain implementation changed.

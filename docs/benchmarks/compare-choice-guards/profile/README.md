# Emitter diagnostic samples

Three separate runs per generated emitter, sampled at 1 ms. Sampling ran after all paired timing finished. Short process lifetimes yield only 360/385/385 Stogir and 140/146/146 LLVM samples; these are exploratory observations, not timing or bootstrap acceptance evidence. Compiler inlining changes stack attribution, so missing LLVM frames do not mean missing work. Nested inclusive samples must not be added together.

Stogir arithmetic emission is present in 75/1130 inclusive samples (6.64%). Allocation build-core-results is 286/1130 (25.31%), SCCP optimize-memory 231/1130 (20.44%). This bounds the opportunity from removing per-arithmetic temporary buffer work well below the remaining 35% target, even before accounting for necessary instruction emission inside those 75 samples. Do not treat buffer reuse as the principal solution. The generated LLVM fixture also spends substantial sampled time in allocation and SCCP; no unique dominant missing optimization is established by these samples.

Raw sample reports and complete named Stogir inclusive counts are retained for further investigation. No overlapping own build/test/benchmark processes.

# Contained-load promotion checkpoint

Candidate 6b6352f5 versus preserved a58918c7, standalone implementation 451ba87.
Existing exact classifier APIs remain compatible. Eight alternating generation
and 24 CPU samples after excluded warmups; same fixed LLVM caller per workload.
LLVM objects are identical across drivers; every executable oracle passes.

| Workload / backend | Generation ms | Runtime CPU ms | Object bytes |
|---|---:|---:|---:|
| Operand prior Stogir | 1.6075 | 84.9390 | 2290 |
| Operand contained Stogir | 1.6130 | 89.9310 | 2274 |
| Operand prior LLVM O3 | 22.1950 | 31.6520 | 1616 |
| Operand contained LLVM O3 | 22.3000 | 31.6945 | 1616 |
| Verifier prior Stogir | 92.2280 | 34.9290 | 103003 |
| Verifier contained Stogir | 92.2180 | 34.5375 | 101339 |
| Verifier prior LLVM O3 | 348.9400 | 9.5205 | 41008 |
| Verifier contained LLVM O3 | 348.4625 | 9.4455 | 41008 |

Option frame allocation and memory accesses disappear from the operand wrapper,
but the redundant sign checks, tag dispatch and general signed division/modulo
sequences survive. Operand CPU is nominally 5.88% worse; verifier CPU is nominally
1.12% better. Neither establishes a meaningful overall runtime benefit. Do not
claim progress against full-bootstrap acceptance from this experiment. Keep the
optimization isolated rather than installing it on these results.

Debug/ASAN standalone promotion and inline stack-result suites pass. New tests
cover 52 contained-view policy configurations and 2106 native answers at O1/O2/O3,
plus existing forwarding/partition/view checks. Store canonicalization remains
full width; partial stores, missing initialization, escapes and incompatible
mixed-width views retain memory. The little-endian target policy is explicit.

Compiler experiment committed, not globally installed, not pushed; FAST has not
run. Standalone implementation committed and pushed. The installed compiler was
independently changed to 4776c39fffbf; this work did not install a toolchain.

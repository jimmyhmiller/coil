# Multiple-return eligibility fixed; bootstrap goal remains unmet

Library6aa12bf, compiler source/candidate50093aa5. Return normalization precedes
immutable template registration; it preserves terminal membership, extra roots
and full validation, resets the edited graph epoch and keeps all existing inline
eligibility and exact512-cell budgets. Latest-symbol placement is not included.

The small actual verifier now registers types.valid? and opcode.operand-code.
They pass ordinary eligibility; structure25sites/20expansions reserves496cells
and leaves16. operand-code expands, while types.valid?, operand-slots,
graph.operand, graph.borrow-node and input-count remain calls. At this budget,
new eligibility changes selection rather than eliminating all hot calls.

| Repeated small verifier median | Beforec9186232 | Candidate50093aa5 | LLVM O3 |
|---|---:|---:|---:|
| IR-codegen ms |102.3095|102.0865|407.3665|
| Runtime CPU ms |30.0585|30.3400|10.6745|
| Object bytes |102078|102066|41440|

Four alternating generation samples and16 rotating CPU samples after warmups,
same unchanged source and LLVM-built caller. No clear small speedup.

## Whole compiler diagnostic

| Metric | Stogir O3 | LLVM O3 |
|---|---:|---:|
| Seed IR-to-machine-code seconds |13.719460|37.859676|
| Seed total wall seconds |23.767710|46.192438|
| Generated compiler wall seconds |44.733425|22.358192|
| Generated compiler CPU seconds |42.447016|21.220126|
| Generated compiler IR-codegen seconds |28.530554|11.511152|
| Compiler object bytes |14591592|8514440|

Generation advantage2.759560×; generated compiler wall slowdown2.000762×.
Goal requires generation≤7.571935s and wall runtime≤24.594011s. It is unmet.
Both generated hosts emit exactly the seed Stogir object
109d4aaa3c9a5f13a658f851ef7b43b2b653b8326c31f15f38a089aeddf5f5ec.

One diagnostic sample each, no warmups or repetition; not acceptance. Source and
SDK frozen to50093aa5 with official stamps. Serial/O3/no-debug/caches and library
state off. Timing spans include all template normalization/optimization. No
competing build/test during measurement. Source/system differ from earlier full
checkpoints; do not infer a controlled historical runtime improvement. This
run compares current Stogir and LLVM on the same current compiler source.

Native debug/ASAN return/side-effect/inlining tests pass, including a surviving
side exit between replaced returns in the terminal membership list. Compiler
quick9-step gate PASS53.6s. Full FAST not run. Source committed; compiler NOT pushed, NOT installed. No performance
adoption or goal completion. Raw scripts/hashes/observations/host snapshots are
archived beside this report.

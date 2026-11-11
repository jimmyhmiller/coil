# Same-budget inline benefit density experiment

Existing priority sorted by natural-loop depth first, regardless of expansion
cost. Under the unchanged512cell compiler budget this may prefer one large
inner-loop expansion over several small loop expansions. New optional priority
compares bounded static loop weight per reserved cell: weight doubles per
natural loop, saturating at depth8; ties use lower actual cost then original
ordinal. Zero-cost sites precede positive-cost sites. Comparison costs are capped
at16385 because no legal invocation budget exceeds16384; cross products fit
within4194560 and cannot overflow. No frequency assertion is made by the estimate.

Independent heuristic, not an upstream policy port or profile-guided guarantee.
No change to caller/callee validation, Never/recursion/ABI/privacy checks,
context ownership, original ordered APIs or the single nonreplenishing clone
ledger. Compiler budget and source growth cap remain512; no tuning by function
name or benchmark. Weighted rank is used only when total estimated demand
exceeds the available budget, as before.

Existing module-execution suite passes LLVM O1/no-debug/debug-checks/ASAN with
Coilb27ffeb4. Covers ordered-vs-prioritized native loop execution, exact tiny
budget growth, zero budget, invalid entries, stable ordering, recursive/data
roots, symbolic values and registered context/ownership cases. Captured caller
selection audit in adjacent documentation rejects the initially proposed GP
result-selection extension. Compiler compatibility and performance pending;
no improvement claim or adoption before measurement.

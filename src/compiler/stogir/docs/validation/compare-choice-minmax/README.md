# Exact ordered comparison choices

Base33d6b59 (correctness-only active physical protection, no retry policies).
Recognize exact32/64-bit integer/address choice of the comparison's own inputs,
including swapped choices and predecessor order. Both values already feed the
comparison, so no general availability or constant-bound adjustment is assumed.
Existing empty-diamond/root/use-list preflight and ordinary movability exclusions
remain. Float/narrow/extra-identity/eq-ne/RLOAD patterns decline.

Sea-of-Nodes retains COND, important because CIR canonicalizes ordinary wordvalues
as unsigned while comparisons carry signedness explicitly. Target matcher chooses
existing signed/unsigned MIN/MAX recipes from the comparison opcode, not result
type. Only consumed Boolean uses disappear; shared/protected comparisons stay.
Machine inputs become exactly two word values before liveness and constraints.
Native emission uses existing CMP/CSEL recipes. Discovery uses existing node walk
and a sparse selected list; no new full schedule scan or per-node plan array.
The exact comparison/diamond idea follows pinned92171d0 ir_sccp.c MIN/MAX handling;
this representation/target split is a Coil adaptation, not a direct typedMIN port.

1,219,680 original-versus-selected native answers in each native O3/debug and LLVM
O1/debug/ASAN test run PASS. Canonical opcode-name oracle independently checks
LT/GE/LE/GT/ULT/UGE/ULE/UGT. U32/U64/address/I32/I64, dirtyupperinputbits, signedness
mismatches, extremes/equality, register/literal arms, direct choices and diamonds,
both predecessor orders, shared/multiple choices and eight data/control rootsets.
Exact maintained use lists and public graph validation pass after every diamond.
Literal mode and pointer bits are never dereferenced. Decline cases explicit.

Existing native conditional, conditional-builder, iterative-fold and SCCP-control
regressions PASS. This is semantics evidence, not performance acceptance.

Actual free-decision-with-limits snapshot from fixed Coil71856236: before27Phi,
0COND,40IF; after26Phi,1COND,39IF, selectedMINrule35. Value type5(unsigned64),
comparison16(LT signed) demonstrates why compare interpretation must be retained.
Shared snapshot replay, not different compiler snapshots. Reproduce with
python3 benchmarks/compare-choice-minmax/generate.py, then run its generated
build/compare-choice-minmax/replay.coil from desired sourceworktree.

No integrated compiler or performance numbers yet. Whole5×/within10%goal remains
unmet. Not installed/pushed. Central LICENSE/NOTICE/provenance retained.

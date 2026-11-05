# Predicate ancestry across preallocated block headers

Pinned upstream92171d0 ir.c:ir_check_dominating_predicates_i walks a straight
control-predecessor chain, using numeric reference order as an early cutoff.
Coil's adapter reserves block headers before their predicates and effect chains.
Consequently a legal chain can go from a later control node through a lower
numbered IF projection and back to its higher numbered parent IF. The copied
numeric cutoff missed that dominating predicate. Existing later-created-pure-
predicate tests exercise a different ordering and did not cover this chain.

The query now follows positive control references until a semantic barrier or
its existing graph-size step bound. Exact SSA predicate identity is still
required. START, MERGE and LOOP_BEGIN remain barriers. ENTRY and labelled BEGIN
are also barriers: pruning already treats these as independently enterable, so
a predecessor-shaped fake edge must not supply an inherited branch fact. Plain
BEGIN/END chains still carry facts. Checked lookup and the cycle bound remain.
No unchecked load, new IR representation or extra global analysis is introduced.

## Evidence

The existing repeated-predicate fixture now covers normal/preallocated headers
and normal/later-created predicates, both truth arms, optional memory effects,
and three observation modes. The preallocated fixture explicitly asserts that
its chosen projection precedes the predicate and its later control follows it.
Original native execution passes on the old implementation; the expected IF
fold then fails. After the fix the complete ASAN/debug SCCP control suite passes.
The48 repeated-predicate cases check7 signed boundary inputs before and after
optimization (672 answers), including observed predicate and IF identities.
Join/loop/independent-entry/label/noncontrol/cycle boundaries are checked too.

An optimized forward-reference memory-effect case is emitted through the common
Mach-O AOT path. An independently linked C caller checks7 boundary answers,
exact memory effects and a null pointer on the unselected path, all passing.
[Before/after logs, source/object hashes, C caller and assembly](validation/predicate-control-order).

This establishes a semantic optimization miss and its correction, not a compiler
performance gain. Actual unchanged verifier generation/runtime comparison is
required before adopting it in Coil. Both full-bootstrap goals remain unmet.

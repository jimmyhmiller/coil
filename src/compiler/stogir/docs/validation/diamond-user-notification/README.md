# Diamond rewrites must notify existing consumers

Pinned ir_sccp.c ir_optimize_phi adds the rewrittenCOND and its uses to the
iterative worklist. boolean-diamond.replace-node! previously queued only the
producer, so consumer folds depending on its new opcode/type did not restart.
Notify the current exact users after each rewrite, matching the existing
iter-fold.rewrite-expression! discipline. No new fold/scan/graph representation.

The real regression is IF(NE(COND(...),0)), not merely IF(COND(...)). Existing
boolean-compare!/not-compare! already handle the former once visited. The new
direct-choice projection experimentf83436a is NOT included here: it passed
semantic tests but showed no net performance gain on this workload.

Exact same earlier d8dbc1b7 snapshot, fixed93222a58 emitter, baseline19d6a1a
versus this notification change: scheduled IF predicate chains containingCOND
12→4. Consumer1410's operands remain unchanged when Phi946becomesCOND, but its
existing fold now runs. Final direct probe boolean-compare! returns true before
(the work was missed), false after (already folded); the probe mutates only a
separate owned graph copy AFTER collecting counts/native-preparation evidence.
A later3ee9a33a snapshot already containsCOND before this pass, so replaying that
snapshot cannot demonstrate the missed creation-time notification. Do not
conflate counts across those two different snapshots.

Tests extend affected-diamond-case with a Boolean comparison consumer, seeding
ONLY the extra identity Phi. Two predecessor orders×eightroot configurations×
ordinary/comparison variants give32fixtures and576native original/rewritten
answers. New comparison is observed to fold and unused choice to disappear;
rooted choice remains. Rebuilt exact uses/public validation pass. Baseline19
fails the specific expected optimization assertion using the identical driver;
this is missed optimization, not a claim of baseline native miscompilation.
Native O3/debug and LLVM O1/debug/ASAN PASS, plus SCCPcontrol/rewrite/conditional
and12288register/20480memory-countdown regressions. No debug prints remain in
production source; temporary tracing was reverted byte-for-byte.

Reproduce snapshot with ../value-diamond-audit/integer-verifier.snapshot.txt.gz,
generator/template under build/frame-origin-audit. Use fixed93222a58 and compile
both old/new library replays. All audits untimed; no performance claim yet.
This fix and local merge reconsideration need fresh integrated measurements.
Not installed or pushed.

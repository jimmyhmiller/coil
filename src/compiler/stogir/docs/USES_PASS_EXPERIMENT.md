# Explicit def-use walks: rejected pending inline profitability work

Pinned ir.c:ir_build_def_use_lists has two explicit count/fill walks, resetting
range counts to fill cursors. We tested that shape and a separate-cursor variant.
Both preserve exact reference categories, edge order and final counts. ASAN/debug
uses, mutation, native switch and verifier checks pass for the first variant;
uses/mutation pass for subsequent cursor/prefix variants. The new maximum-arity
storage fixture verifies structure and all65535 edge positions/range sentinels.

The explicit-walk variant with the original while prefix and separate cursor
removes both incidental representation/loop-form changes. It still regresses:

|Backend|Shared walk CPU ms|Explicit walks CPU ms|Kernel generation before ms|After ms|
|---|---:|---:|---:|---:|
|stogir|10.9550|12.4145|16.5710|17.2715|
|LLVM|6.5055|6.5225|61.7085|58.2530|
|TPDE|43.6210|44.2105|0.4945|0.4535|

These local runs were contended by external Rust/other compiler work. Preserve
raw host snapshots and do not turn their absolute times into acceptance claims.
The range-count and incidental for-prefix variants are also preserved, without
claiming a causal performance result from their combined changes.

Assembly provides a concrete new lead: shared metadata-cached uses.build has
554 listing lines/7 calls (allocation, memset and free); explicit walks have
611 lines/12 calls. Five helpers remain called inside the fill loop:
operand-code-word, edge-code?, graph.operand, ArrayList.set Use and set i64.
Trace reports all31 original sites individually common/capture/result eligible,
but only25 changes. call-inline.optimize-sites-core consumes one bounded budget
in submitted order. Budget exhaustion is the leading explanation; exact per-site
remaining costs are not yet traced. We must not just raise the512-cell cap.

Reject the production refactor for now: retain metadata-cached shared walks.
Keep the stronger maximum-arity test. Next investigate bounded inlining
profitability and site order using actual cloned-cell costs/frequency, preserving
Never, recursion/capture safety, total-budget enforcement and deterministic ties.
Cheap/hot helpers must compete with cold allocation helpers on a principled
policy, never by function names or benchmark annotations. This module policy is
our extension, not an upstream IR function-inlining port.

Evidence: docs/validation/uses-pass-experiment contains exact candidate source,
raw measurements, assembly and inline trace. No Coil integration or bootstrap
speedup is claimed; installed/pushed state remains Coil4d21432d/f746e3ac.

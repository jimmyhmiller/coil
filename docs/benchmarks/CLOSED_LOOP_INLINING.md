# Closed returning loops in graph-call expansion

Standalone component aa66d7a permits LOOP_BEGIN/LOOP_END and cyclic PHIs in the independent bounded graph inliner. The existing two-phase clone reserves all references before patching edges. Every control operation must be live from the unique RETURN; separate non-returning regions, nested calls, frame operations and terminal side exits remain ineligible. Never and growth budgets are unchanged. Matching, placement and liveness still run after graph optimization.

The standalone module-execution suite passes with AddressSanitizer, comparing linked native execution before and after expansion with two loop-carried PHIs, zero/multiple trips, negative/positive inputs, Never/zero-budget fallback and rejection of a separate infinite control region. Restoring the previous implementation fails the new expansion-count assertion.

This addresses the loop eligibility prerequisite exposed by the AVec workload, not the whole runtime gap. The accessor also contains calls and its bounds checker has cold panic paths; those remain separate work. No source inline annotations or checks change.

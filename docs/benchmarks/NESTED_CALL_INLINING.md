# Nested ordinary calls in bounded graph expansion

Standalone component 5539039 permits direct named CALLs carrying ordinary typed prototypes inside inline bodies. The existing mapper re-interns function names and prototypes and preserves control/data edges. Indirect PROTO nodes, variadic calls and aggregate-result call adapters remain excluded. The standalone native before/after suite passes ASAN and when compiled by stogir O3, including calls inside two-PHI loops, policy/budget fallbacks and indirect/variadic retention. Restoring the preceding implementation fails the new assertion.

The compiler provider uses linear Kahn elimination of actual direct CALL edges among registered templates. Only definitions with acyclic registered-call closures may be cloned. Cycle members and their callers remain callable and may absorb acyclic helpers themselves; this intentionally conservative policy avoids recursive template unrolling. Function-address imports are not call edges. Never definitions remain excluded by the existing source policy.

After expansion, the module worklist records newly introduced import dependencies and revisits newly cloned calls. The existing 512-cell total growth budget remains in force: positive growth consumes budget, while zero-growth expansion cannot add a CALL and removes one. All structural analyses still run after graph optimization, and provider work stays in backend timing.

The existing stogir-register-results CLI fixture now covers wrapper chains retaining a Never call, calls inside a loop, and a recursive function that remains callable. Candidate build and backend checks are pending; this component is not globally installed or pushed yet.

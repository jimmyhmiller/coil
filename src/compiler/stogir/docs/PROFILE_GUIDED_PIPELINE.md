# Combined immutable graph pipeline

Combine the existing specialized use-list construction f8d307f and immutable
validation transactions c2c83a3 with contained-field/predicate work0f89b62.
The merge preserves fixed-frame allocation's build-selected path and all public
checked validation APIs. Count/prefix/fill edge order, reference categories,
continuation extents and checks on graph mutations remain unchanged.

The full frozen bootstrap profile identifies verification and use-list building
as broader targets than the isolated operand leaf. Earlier kernel evidence shows
29.26% Stogir construction improvement and9.81% preparation improvement; these
are not combined compiler performance claims. An unchanged fixed verifier runtime
does not evaluate use-list construction or changed preparation algorithms.

Combined debug+ASAN validation passes uses, validation-transaction (29700 error
priority/count comparisons plus storage boundaries), jit-mem2ssa,
jit-sccp-control, static-stack and inline-stack-results. Logs and runner are in
validation/profile-guided-pipeline. Source c2c83a3's private preparation boundary
is retained; no unchecked caller proof or stale mutable-graph cache is added.

Next: vendor the combined source into an isolated Coil worktree, freeze SDK,
build a candidate, then compare both emitted compilers on the entire bootstrap.
No installation or bootstrap acceptance is claimed by this document.

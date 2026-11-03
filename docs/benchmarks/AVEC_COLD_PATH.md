# Shared AVec bounds diagnostic and observed control roots

`avec--check [T]` previously instantiated the full type-independent formatted panic path per element type (152 graph cells in the compact-node workload). The stdlib now shares one index/count diagnostic helper with the correct `never` return type. Bounds conditions and diagnostic text are unchanged; no inline annotations are added.

The inliner imports standalone component 7f8adba. Callees supply all observed control roots separately from their unique RETURN. The closure check uses all observations; cloned controls are mapped and added to caller roots. UNREACHABLE terminals with zero reserved/previous-terminal metadata are supported. Stack/frame operations remain excluded. The module provider passes its already-owned complete observed set.

Standalone native before/after tests pass ASAN, including cold helper calls followed by UNREACHABLE, child-process trap checks with a watchdog, hot answers, Never/zero budgets and fallback when the provider omits the non-returning root. Restoring RETURN-only closure fails the new assertion.

The existing backend fixture adds valid, negative, end and empty-vector accesses. Candidate build, backend checks, measurement and FAST are pending. This checkpoint is not installed globally or pushed.

A preliminary void-return helper probe is retained in `avec-cold-path/void-return-preliminary.json` for diagnostic history. It is superseded by the correctly typed non-returning helper and is not a delivered performance result.

# Iterative identity-only Phi cleanup

Independent extension: pinned ir_sccp.c4034also skips iterative PHI folding.
Do not present this as an upstream port. The real verifier audit in
../value-diamond-audit first established34live identical-input Phis after SCCP
and ordinary native scheduling, among187live Phis.

On a validated Phi, all nonself incoming values must be one exact reference.
Exact self edges are ignored; all-self cycles decline. No constant equality,
COPY equivalence, range or feasibility inference occurs. Stop at first distinct
incoming value. Existing replace! detaches exact input edges, redirects/requeues
users and preserves explicit roots as softCOPYs. Shared/distinct hardCOPYs retain
identity/barriers. Control edges, effects, graph IDs and allocation extents are
unchanged. This does not remove loops or diamonds itself.

Every remaining Phi receives an initial visit inside the existing bulk rewrite
seed walk (no new graph scan), then ordinary affected-user requeues handle
cascading identities. Without that seed only2of34initial identities were removed;
with it, final actual-verifier schedule187→145Phis, zero identical-input Phis.
42removed includes identities exposed by cascading replacements. Native input
preparation validates the resulting graph. No timing or generated-code-quality
claim from counts alone.

Tests extend existing jit-iter-fold program:182scalar shape/root cases over all
13nonvoid scalar types; identical/self-only/mixed/constants/sharedhardCOPY/
distincthardCOPY inputs; rebuilt exact-position use lists and public validation.
864native original/rewritten branch/finite-loop answers include signed extrema,
zero/one/five trips and protected roots. All-self cases are structural tests,
not execution of an uninitialized recurrence. Final Stogir O3/debug and LLVM
O1/debug/ASAN builds pass. Existing SCCP seed/transfer/transition, floating-Phi,
loop, finite-countdown12288answers and memory-countdown20480answers regressions
pass. Final helper early-exit change is covered by final native/ASAN and replay;
regression transcripts also include the preceding equivalent full-scan helper.

Fixed emitterd8dbc1b7, source hashes in identities.json. Reproduce suite with
coil build tests/jit-iter-fold.coil --backend stogir -O3 --debug-checks; repeat
LLVM O1/debug/ASAN. Replay generator/template/snapshot are in value-diamond-audit.
No integrated Coil candidate/performance claim, installation or push yet.

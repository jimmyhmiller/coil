# Actual verifier inline-growth ledger

Diagnostic source/candidateeda0391c adds exact reserved and remaining cell counts
to existing COIL_TPDE_STATS tracing. It changes no inline policy or clone budget.
On the actual verifier fixture, structure has23sites and15expansions. It reserves
509 of512caller cells, leaving3. The finalized generic string-equality template
has102cells and32base clone cells. Thus budget pressure is verified, not merely
inferred from surviving calls. The emitted verifier object is byte-identical to
baseline88e09ce2; raw trace and hash receipt are in inline-ledger/.

Independent standalone numeric specialization3009e06/bd2adf9 retains typed
argument conditions and target width, validates original input before edits and
uses existing SCCP on an owned copy. Its native reduction removes an unreachable
store and lowers exact inliner preflight from17to8cells without raising the cap.
At8cells ordinary expansion is rejected, specialized expansion executes correctly.
Extra control observations, changed/dynamic arguments, target mismatches and
malformed bindings/source are covered with debug checks and ASAN. This support
is not integrated into Coil or automatic inline selection yet.

Next work: bounded memoization tied to immutable registered callee identity and
exact numeric binding conditions, selection before call-site ranking, retaining
all ordinary identity/prototype/Never/recursion/ownership/clone-ledger proofs.
Preparation cost and actual verifier/runtime/generation effects must be measured.
This diagnostic is not a bootstrap speedup or evidence of goal completion.

Compiler source/evidence committed, not installed globally, not pushed; FAST
not run. Standalone source/evidence committed and pushed. No global toolchain
was changed. Full5× generation and runtime within10% remain unmet.

# Experimental immutable callee alternatives

Status: isolated library experiment, not integrated in Coil or accepted as a
performance improvement. Source-equivalent views are a provider obligation;
matching name/prototype alone cannot establish semantic equivalence.

The native budget reduction in the existing module-execution suite shows the
same growth cap can expand a helper within its wrapper yet exclude that expanded
wrapper from its caller. A compact wrapper remains eligible. Both forms produce
identical native answers for128 inputs. This demonstrates the budget effect,
not a runtime benefit; inlining a compact wrapper can retain its helper calls.

`RegisteredAlternatives` supplies ordered immutable snapshot handles for one
original CALL. Names, complete prototype bytes and Never policy must match.
All handles/contracts are checked before budget/Never shortcuts. Each candidate
retains existing ordinary eligibility, ABI, closed-control and private result
proofs. The first eligible/safe candidate is applied once; actual clone extent
is charged to the one nonreplenishing transaction ledger. Failed candidates
neither spend nor restore budget. Ordinary registered APIs retain one candidate.

The optional prioritized API preserves natural-loop depth and stable ranking;
its estimated cost is the cheapest view, while actual selection tries provider
order and enforces the unchanged exact budget checks. Registry snapshots stay
immutable and retain their existing ownership/release contract.

ASAN/debug module-execution passes: compact/expanded/alternative selection,
source release after snapshot,128 native answers per selection, zero/invalid
budgets, invalid fallback handles, empty alternatives, duplicate CALLs, invalid
caller roots/references, Never preservation and mixed-Never rejection. Ordered
and prioritized two-CALL batches prove exactly one expansion under a shared
24-cell ledger. Existing module semantic/ownership/ABI/store/loop tests still pass.

The buffer/linked-AOT reduction repeats9.27%/9.21% runtime gains from eliminating
a private buffer; see CALLEE_VIEW_BUFFER.md. This is not a bootstrap result.

Name/prototype mismatch negatives (even at zero budget), provider preference
when multiple views fit, cached cost lookup errors/release and linked AOT buffer
cases also pass. registered-base-cells exposes the immutable cached lower bound;
base-clone-cells requires a verified graph and never authorizes expansion.

Remaining before production integration: aggregate capture and effectful
alternative fixtures; actual verifier runtime and generation measurements;
existing-API performance checks. Coil must supply views derived from the same
immutable source definition and prove their semantic/ABI/observation contract.
Do not treat this API or its reduction as closing the full compiler runtime gap.

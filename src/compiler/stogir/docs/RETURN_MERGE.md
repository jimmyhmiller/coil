# Canonical function exits before inlining

The Coil adapter previously registers only optimized templates with exactly one
RETURN. The actual verifier dependency trace contains136 templates:133 single
return and3 double return. types.valid? (20cells) and opcode.operand-code
(41cells) remain calls in the hot verifier; types.size (54cells) is also excluded.
This is an eligibility gap, not proof of a performance gain.

return-merge is an independent graph canonicalization API. It validates the full
source before edits, requires one START and all same-typed RETURNs explicitly
observed, and owns a graph duplicate. Each old RETURN becomes END; a common MERGE
and, for nonvoid results, typed PHI feed a new RETURN. All extra observations
remain, with return observations replaced by the common exit. Original IDs are
preserved; the new graph acquires a fresh full validation.

Terminal membership is metadata, not execution. Links through replaced RETURNs
skip to the next surviving terminal. A nonempty START list receives the new
RETURN as head; its previous link preserves the surviving old head. Empty lists
stay empty. Original source/prototype/relocations remain intact. The ordinary
inliner's control closure, identity, prototype, Never, ownership, recursion and
exact clone-growth budgets remain mandatory. Canonicalization does not itself
make linked terminal lists or other rejected control regions inlineable.

Native debug/ASAN tests cover void/Boolean/U64 results, linked/unlinked lists,
branch stores and output canaries, original versus canonical execution, extra
root preservation, and native execution after ordinary inlining. Failure checks
include omitted returns, wrong entry, missing roots, pointer width, malformed
source arity and cyclic terminal lists. No compiler performance claim yet.

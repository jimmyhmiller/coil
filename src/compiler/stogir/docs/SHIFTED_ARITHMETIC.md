# Shifted arithmetic target selection

The existing compact-node aggregate-get example is already scalarized, so it
is not evidence of a remaining interior-load promotion gap. With candidate
928b34ee, Stogir emits12 instructions versusLLVM7: separate address shifts,
word extractions/sign extension and adds remain. Original objects are preserved
under build/interior-load-audit in the call-parameter-specialization worktree.

This independent target extension selects ADD/SUB of a same-block constant
LSL/LSR/ASR on32/64-bit integer values. ADD may commute; SUB never commutes.
Rules50/51 retain original definition identities and encode the selected shift.
Immediate arithmetic keeps its existing priority. The producer's canonical
constant-shift tile supplies the already width-masked amount. Narrow integer
operations, negative literal shift sources, cross-block producers, and unhandled
forms retain ordinary selection.

Machine input slots are redirected before liveness/constraints/allocation.
Replacement counts are added before retiring the absorbed edge. Shared and
rooted shift definitions survive; unobserved pure shifts retire only when their
last use disappears. No graph reference, opcode, or graph ownership changes.
Verified ADD/SUB nodes have exactly two machine input slots, so the target plan
replaces those existing slots without allocating full-function override maps.

Validation: native binary matrix exercises signed/unsigned32/64-bit arithmetic,
all3 shifts, amounts0/4/31/63/64, ordinary/commuted/reversed/rooted/shared uses,
and25 input pairs per graph (480 graphs,12000 native comparisons), plus existing
binary/comparison/extraction coverage. Matching enabled/disabled checks assert
machine inputs and whether the producer remains live. Encoder checks include
known words and invalid kind/amount/register rejection. Performance and compiler
integration still require measurement; no bootstrap gain is claimed.

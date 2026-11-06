# Pinned AND/OR/XOR literal bypass and unary restart

Port of ir_fold.h:2878–3060 at pinned92171d0. Zero and all-ones identities
include BOOL/CHAR and both operand orders; exact result/operand types and actual
numeric constant opcodes are required. Pointer/relocation/type/target guards
remain. XOR all-ones requests an explicit unary RESTART to NOT. SCCP keeps that
result Bottom and schedules iteration; it must never alias the XOR to its input.
The iterative kernel rewrites exact operand uses, requeues node/users and folds
normally. This extends the existing Decision contract with kind4 unary restart.

180 decisions exactly match original C rule bodies compiled with ASAN. Extraction
is pinned and hashed by benchmarks/bit-literal-identities/oracle.py. Commutative
left literals are normalized to the original right-literal rules. Native and
ASAN tests pass4320 O1/O3 result checks; pointer, named relocation, mismatched
type and unsupported pointer-width guards pass. The old-source negative control
omits calls to the new helper API and fails the first decision assertion.

Existing field-promotion and memory ASAN suites plus native iterative decisions,
iterative/control/SCCP analysis/pipeline suites pass. Final helper guard avoids
calling the literal matcher for nonlogical or all-literal binary operations;
the final native/ASAN oracle test and actual graph replay exercise that path.

Actual node.make normal image88→64bytes after contained promotion (original112).
3375 returned Nodes match independently computed header and signed fields; replay
ASAN passes. No runtime or whole-bootstrap improvement is claimed yet.

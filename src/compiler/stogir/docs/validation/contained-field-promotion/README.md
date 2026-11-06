# Contained integer views and adjacent fields

Independent continuation of partial-field promotion; pinned upstream split layout
rejects unequal/displaced overlap. Ordinary accesses are collected after proving
bounds/escape rules, then canonical fields are selected widest-first using only
populated type-size buckets (valid sizes are powers of two through512 bytes).
This prevents pointer/use order from making adjacent narrow fields hide a later
wide initialization. Exact-width compatibility remains byte-order independent.

Explicit little-endian contained integer stores insert bits at their byte offset;
loads logically extract and truncate. Previous-value/initialization and rollback
use the established demand-driven Phi machinery. Crossing views with no single
containing canonical field, mixed-width FLOAT/BOOL/pointer views, escapes,
volatile accesses and observed addresses retain memory. Widest floating/pointer
views block mixed-width promotion regardless of equal-size view order.

168 adjacent-field policies pass15,120 native checks (originalO1/promotedO1/O3),
including branch/loop writes, reversed order, aliases and narrow signed fields.
Eight crossing/type fallback graphs validate and execute. Existing270-policy
partial-field suite passes22,680 native answers with displaced views now enabled.
Both suites and existing memory suite pass ASAN; native control/iterative/SCCP/
aggregate-result suites pass. Old-source adjacent negative control fails as expected.

Captured actual node.make graph: normal native image112→88bytes, now frameless;
3375 dynamic results per version match independently computed header and every
signed field. Before image matches the actual Coil43df70f5 body. The manual
allocator-debug path adds result staging and is not the canonical native ABI;
its132→116bytes are recorded separately in the replay, not used as actual size.
Borrow-node returns a pointer and has no aggregate temporary: its graph is kept
as an investigation control, with no expected promotion benefit.

Generate python3 benchmarks/contained-field-promotion/generate.py; run the replay
with the fixed71856236 compiler, LLVM O1/debug checks/ASAN. No runtime claim yet.
The post-promotion image exposes missing general OR/AND/XOR literal bypass folds;
these are a separate pinned-upstream parity follow-up, not special-case cleanup.

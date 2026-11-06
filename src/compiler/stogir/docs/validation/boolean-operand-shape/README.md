# Missed existing IF/Phi split: real graph reproduction

Base library: 5ab34a5. Snapshot is the actual Coil stogir.graph.operand graph from candidate bb4634f0. Generate with `python3 benchmarks/boolean-operand-shape/generate.py`, then run the generated build/boolean-operand-shape/replay.coil with the fixed compiler and LLVM O1, debug checks enabled.

The normal memory/SCCP optimizer returns a graph on which the existing iter-control/split-if! returns true for IF15. This is an outstanding pipeline defect, not a missing transformation.

Temporary tracing of run-core-indexed! recorded the attached phase-probe.txt. Columns: control-enabled, reference, opcode, op1, op2, op3, use-count. IF15 first has control190. In the final control-disabled drain it has control186; comparison78 subsequently changes from input196 to Phi192. The existing split is now applicable but never runs. Initial IF/MERGE queue seeding alone was tested and did not fix the issue.

Production tracing and unsuccessful seeding edits have been removed. The reproduction deliberately reports the missed split rather than asserting an invented fix. Next implementation must reach a proper control/memory cleanup fixed point while retaining unreachable-observation checks; simply enabling control in the last drain without pruning/validation is insufficient.

## Implemented correction

run-rooted-indexed! now drains control-enabled affected work to a fixed point
across prune/boundary merging. Each control-changing round checks unreachable
observations and rebuilds protected roots before the next drain. Memory
replacement still waits until this boundary settles. This addresses the
captured case without global IF scans or repeated SCCP analysis.
The replay asserts IF15 becomes END and Phis191/192 are removed, and asserts
that the formerly missed direct split is no longer applicable. It passes both
native Stogir O3 and LLVM O1 with AddressSanitizer and debug checks.
This does not assert that arbitrary memory-forwarding-induced control folds
reach a global fixed point; the final memory-only phase is retained.

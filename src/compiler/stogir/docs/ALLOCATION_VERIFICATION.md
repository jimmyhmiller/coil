# Allocation verification sweep

The independent assignment verifier retains its checks for admissible register
classes, physical locations, ordered merged ranges, covered uses, required/fixed
register constraints, split-child class agreement and register interference.

The previous verifier compared each nonempty child to every earlier child.
The replacement indexes parent class masks sparsely and merges the sorted live
range streams through the existing interval min-heap. A last-end value per
physical register detects interference while preserving lifetime holes and
physical reservations. The interference check costs O(R log P), for R ranges
and P assigned children. Use coverage retains the existing binary search.
Empty-child class behavior is preserved; sparse parent IDs never size an array.

This is an implementation of the independent verifier, not a new upstream
optimization pass or a removal of validation. `tests/allocator-driver.coil`
retains the former pairwise algorithm as an acceptance oracle and compares
1,200 valid/invalid scenarios. Native pressure and mixed-class tests exercise
actual generated assignments.

`benchmarks/compiler-gaps/allocation-verify.coil` isolates the check from builds.
Seven alternating runs, three checks per size per run, showed these LLVM-built
host-code medians in nanoseconds per verification:

| Children, four ranges each | Pairwise | Sweep |
| --- | ---: | ---: |
| 128 | 30,666 | 19,333 |
| 512 | 496,000 | 82,333 |
| 2,048 | 8,351,666 | 344,333 |
| 8,192 | 131,603,000 | 1,440,333 |

These are subpass scaling measurements, not full IR-to-machine-code timings.

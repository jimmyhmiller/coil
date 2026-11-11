# Reusable decision limits

Each run-impl! now owns one private ArrayList of register limits. The free
assignment attempt and retry after eviction borrow that buffer; every query
clears its length and rebuilds all limits, preserving capacity across queries.
All error/success paths release it alongside existing run-owned indexes.
No state is shared across allocator invocations. Existing public free-decision
and grant-free signatures retain call-scoped owned buffers. Scratch-taking
variants require nonaliasing storage; allocation passes its own separate buffer.
No Pressure/Part layout or allocator policy changes.

Independent reference-choice in the existing allocation suite retains original
per-register scans, masks, preferences and rounding.1458exact choice comparisons
reuse the same buffer through empty, shrinking, growing and >64-register arrays,
position/fixed-use changes, preferences and boundary steps1/2/4. Checks include
register, lifetime bound and exact scratch length. Native projection pressure
120answers and aggregate ABI/stack/alignment suite pass. All run via Coilb27ffeb4,
LLVM O1/no-debug/debug-checks/ASAN; emitted instructions are not instrumented.
Performance and compiler integration pending; no speed claim.

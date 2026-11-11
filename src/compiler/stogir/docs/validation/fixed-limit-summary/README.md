# Fixed-use limit summary

Actual CIR emission profiles identify the allocator decision path as material.
`free-decision-at-boundaries` previously invoked `register-limit` for each
candidate register, rescanning identical uses. A single summary records the
first effective future fixed-use register/position and first subsequent fixed
use requiring a different register. Every other candidate is limited by the
first position; the first register is limited by the second. MAX positions are
inert, preserving the existing query's sentinel behavior. No-fixed-use lists
retain unbounded limits. No allocation or extra state persists across decisions.

This is an implementation optimization of our fixed-use constraints, not an
upstream port or allocation-policy change. Pinned dstogov/ir92171d0a uses a
freeUntilPos array in ir_ra.c ir_try_allocate_free_reg; existing central license
and attribution remain applicable. All preference, mask, boundary-rounding and
split checks remain unchanged. Original per-register query is retained.

LLVM O1/no-debug/debug-checks/ASAN validation with Coilb27ffeb4:
constraints191232 exact old/new queries; split allocation suite; JIT result
projection pressure suite120 answers. Ordinary/ASAN tests establish correctness,
not a performance gain. Compiler integration and timing remain pending.

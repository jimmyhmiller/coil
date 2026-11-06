# Unused assigned prefix: upstream allocator parity

Pinned dstogov/ir92171d0 ir_ra.c:ir_allocate_blocked_reg (active owner eviction)
uses child=other when there is no earlier required/should-register use. The Coil
allocator previously retained a register-only prefix up to the eviction point,
even when the prefix had never used that assignment. It now spills that whole
prefix and resumes at the next required use. Any earlier operand use, including
location-allowed kind0, retains the old assigned prefix. Physical reservations,
fixed uses, class choices and retry policies are unchanged. No retry policy from
the rejected experiments is included.

The allocation tests now distinguish every prior-use kind from no prior use.
Indexed-pressure tests exercise both whole-owner mutation and the retained
nested split, independently comparing indexed state/events with full scans.
Native and ASAN allocation tests pass; native pressure-index, mixed spills,
JIT call/floating/switch pressure and private-call aggregate/pressure pass.
Pressure-index ASAN also passes, including both indexed mutation cases.

## Exact actual-frontend graph replay

Coil source572c6210 actualprimitive-providers-in, fixed standalone emitter71856236.
Before the change, the replay emits the exact1636-byte function body from the
real frontend probe, SHA256
8eb24179fe0e2e941fa1efd29194c7b34bcf3cf3d804955a09a0dadaf792b9d2.
The lossless graph snapshot and complete allocation/frame/range/use dumps are
retained. This establishes the same machine-code gap, not a synthetic analogue.

After this rule, the replay body is1568bytes, SHA256
1999ebc0a55aefacffa736b83353a9779898d25f593dd9fa35864b91333b7411.
Frame remains280bytes before alignment. No runtime gain is claimed from size.
A Coil integration candidate and matched frontend/component measurements are
still required; whole5×/10% bootstrap goal remains unmet.

The eleven-store/reload nonmatching branch includes parent128, a hidden result
parameter with an assigned child starting99 and no use before eviction489.
Its next required use is762. Other values have earlier uses and require the
separate upstream loop-aware optimal-split rule; this commit does not claim that
complete port or a general post-allocation availability optimizer.

Generate from the library root with
`python3 benchmarks/frontend-provider-transfers/generate.py`, then run the
emitted build/frontend-provider-transfers/replay.coil with the fixed compiler.
The replay reproduces the ordinary full-call ABI path, which matches this actual
function because its surviving call targets receive no private leaf mask.
Central NOTICE/LICENSE credit remains applicable; no per-file license headers.

# Exact verifier frame origin audit

Current indexed candidatebb21d63f captures finalized stogir.verify.structure from
the original CIR emitter kernel. Replay reconstructs all raw cells/strings/roots
and rebuilds the constant interner before the ordinary checked SCCP/native
pipeline. Omitting that interner initially produced two extra instructions;
identity assertions rejected that replay. Final replay matches all2228bytes
of the actual emitted function, SHA1d2c584053ad4784fa92f57153370a90a3f8459c89523621aa60c99b4141bd3c.
The verifier reduction's object contains the same function bytes as well.

The frame is232bytes, including16bytes outgoing reservation,16byte header,
16byte private GP capture object,13spill slots of8bytes,80bytes saved registers.
Direct SP instruction accesses classify as98spill transfers,20saved-register
transfers and4header transfers. The private object has no direct SP accesses.
This resolves most local stack traffic as allocator-owned spill storage; it is
not evidence of a large retained Graph snapshot. Slot maps, graph parents,
part ranges/uses, CFG depths and exact assembly references are retained.

Static spill sites fall35atloopdepth1,60atdepth2,3outside. This is NOT dynamic
frequency: cold error edges lie inside loops too. Read-only emission markers
associate node/edge-stub byte offsets with schedule positions. The temporary
host-emitter print instrumentation is restored in finally; byte equality remains
mandatory, and no branch-relax expansion is permitted for PC attribution.

Use gap examples: parent431 (hidden result pointer) has required uses only at3
and1270+, but a register prefix extends to599 (inner-loop call clobber).
Parent433 has its last required use438, then only memory-allowed call uses at
598/658/912, yet also stays in a register until599. Boolean values1503/1504 have
required definitions481/483 and later uses1036/1040 across the inner loop, but
retain registers through599/659. Upstream ir_ra.c ir_last_use_pos_before and
ir_find_optimal_split_position consider last required uses and shallower loop
entry splits; current native allocation keeps the longest free prefix and has
no equivalent CFG-aware cut selection. Correct integration must respect this
backend's even input/odd definition transfer boundaries and lifetime holes.

A separate32768-call opaque verifier run passes its existing checksum and malformed
input checks;3second sample included. sample groups several instruction PCs,
so it does NOT assign a reliable runtime percentage to individual spill slots.
It also exposes repeated immutable global operand-code reads; reduction and
shared CIR lowering investigation continue separately. No timing gain or new
whole-bootstrap measurement is claimed by this audit.

Reproduce from the source checkpoint in an isolated worktree: copy scripts and
inspect-tail.coil.in into build/frame-origin-audit; decompress snapshot.txt.gz;
run generate.py with that snapshot; run run-instrumented.py; provide the original
emitter object via FRAME_AUDIT_OBJECT and its llvm-objdump disassembly as
build/frame-origin-audit/structure.asm; run classify.py. Absolute original object
and compiler paths/identities are retained in scripts and metadata. All source
mutations made by instrumentation are transient and restored byte-for-byte.

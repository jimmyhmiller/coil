# Scalar leaf instruction write effects

This is a foundation for private-call optimization, not a callable certificate or a relaxed clobber policy. No caller uses the summaries yet. AOT/JIT binding, immutable body ownership, caller argument/result setup, callee-first emission and integration remain required before any register reservation can be reduced.

## Implemented contract

`stogir.a64.leaf-effects.instruction` recognizes a closed scalar subset of the existing emitter recipes and returns the GP registers those instructions may write. W writes count as writes to the full corresponding X register. Stores do not write their source register. SP/ZR are excluded from GP numbering; writing LR declines. Scalar arithmetic, bitfields, logical immediates, conditional selection, multiply/add/subtract, division, variable shifts, unary bits, unsigned/scaled and unscaled/register-offset non-writeback memory forms are covered with reserved-form checks. Other classes decline, including paired/writeback memory, SIMD, conversions, atomics, system instructions and unmodeled scalar forms.

`text` checks every word, including unreachable words; no unknown word is skipped. Direct B, B.cond, CBZ/CBNZ and TBZ/TBNZ require aligned targets within the exact body. Ordinary instructions and conditional branches require in-body fallthrough. At least one exact RET X30 is required. BL/BLR, indirect branches, other returns, exceptions, external branches, LR writes, malformed lengths and unterminated fallthrough decline. This does not prove stack/callee-save ABI correctness, termination, private binding or argument marshalling.

`buffer` additionally rejects references, embedded text-data ranges and invalid alignment. The caller must supply the exact code body from owned emission metadata; symbol-adjacent bytes are insufficient.

## Validation

3,254 independently clang-assembled positive/declined instruction cases cover W/X destination registers0..31, distinct input registers, arithmetic flags, shifts and immediates, memory addressing modes, LR/ZR/SP, unsupported instructions and multi-destination forms. Expected write masks come from assembly operand roles, not the Coil encoder. Separate literal invalid-encoding, control-flow, LR modification, metadata, alignment and malformed-byte checks pass. Native Stogir O3/debug checks and LLVM O1/debug/AddressSanitizer both pass. Commands are reproduced by benchmarks/private-leaf-calls/assemble-effects.py and the generated build/leaf-effects/validation.coil.

Replay from audited actual compiler object0aed11120770a106a1ba7e15fdefcfa1fcd3d1a8cf01946b18a101ff713e3efe passes natively and under ASAN. Graph.borrow-node (62 instructions) writes GP0..6 and16; Graph.operand (53) writes0..4 and16. The Graph.lookup symbol-adjacent range includes a trailing zero word and correctly declines. An explicit304-byte fixture ending before that padding writes0..6,16,17. This explicit fixture boundary is not a production trimming rule. Notably lookup does not write hidden result pointerx8, but the caller must still write x8 during setup; a callee mask alone is insufficient.

Oracle assembly/expected-word data, actual fixture bytes and validation outputs are retained here. Fixed compiler71856236. No performance measurement or whole-bootstrap improvement is claimed.

## Sources and attribution

The accepted recipes were independently implemented against the existing Coil AArch64 encoder and cross-checked with independently assembled instructions. Architectural references: [Arm A64 instruction descriptions](https://support.arm.com/documentation/ddi0596/2020-12/) and [Arm load/store addressing modes](https://support.arm.com/documentation/ddi0487/mb/-Part-C-The-AArch64-Instruction-Set/-Chapter-C1-The-A64-Instruction-Set/-C1-3-Address-generation/-C1-3-3-Load-store-addressing-modes). The encoding groups were also checked against [QEMU v9.2 A64 decoding](https://github.com/qemu/qemu/blob/v9.2.0/target/arm/tcg/a64.decode) as a reference. No QEMU implementation or decoding table is included. Original dstogov/ir credit remains centralized in NOTICE; this private-call analysis is an independent extension, not an upstream pass port.

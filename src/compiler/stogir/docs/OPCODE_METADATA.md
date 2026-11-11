# Indexed opcode metadata

The profile identified string-returning opcode dispatch as a hot path:
operand-kind 233 top-of-stack samples, shape 140, versus location lookup 207
and pressure calculation 164. This checkpoint replaces 131-way dispatch
with a static packed u32 table in pinned opcode order. Upstream dstogov/ir
92171d0a4a36b0acf707f2dea7998de615dd4acd uses indexed opcode metadata
(`ir.h` opcode declarations, `ir_private.h`: `ir_op_flags` and `IR_OPND_KIND`). Existing public string APIs remain.

Each record contains five operand nibbles and a six-bit shape dictionary index.
Slots 1–4 are explicit; slot 5 repeats for larger indices. This preserves SIMD
lane/immediate distinctions that cannot be represented by repeating operand 3.
Invalid opcode and nonpositive operand indices retain their existing results.
Static dictionaries are borrowed as slices. Graph semantics and pass ordering
are unchanged.

The existing opcode test has an independent frozen string oracle covering
all 131 opcodes, invalid bounds and indices including minimum/maximum i32,
zero and 1–8. Ordinary and debug-check runs pass. A rotated diagnostic of
2000 image compilations per process, five runs each, reports medians 2678.310ms
before and 2293.489ms after (14.37% lower). It reconstructs a captured graph and
is not the actual Coil acceptance timing boundary. Both emit 2952000 text bytes
per process. Full validation passes 236 standalone programs and 72 linked AOT
consumers. All 5406 generated AOT objects are byte-identical to source 7801b60.
The opcode oracle additionally passes AddressSanitizer. Assembly confirms a
bounded indexed load and nibble extraction, with no metadata array copy.
Actual Coil benchmark and integration validation remain required.

## Extension opcodes

Opcodes 131..141 are not part of the pinned upstream order: scalar floating
operations appended after it (see [FLOATING_EXTENSIONS.md](FLOATING_EXTENSIONS.md)).
Their metadata reuses the upstream records of a unary (`ABS`), a noncommutative
binary (`SUB`) and a three-value (`COND`) data operation. The opcode test's
oracle lists them after the 131 frozen rows.

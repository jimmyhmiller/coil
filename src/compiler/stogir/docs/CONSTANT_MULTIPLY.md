# Constant multiply selection and wide-record audit

The32-byte ArrayList record scan already scalarizes its copy: no stack storage
survives. Together with the16-byte example, this rejects these examples as
evidence for an interior-load promotion change. The loop instead exposes a
multiply-by33 on a serial checksum dependence. LLVM uses ADD with LSL5;
Stogir currently loads33 into a scratch register and executes MUL.

Upstream ir_aarch64.dasc at1337 selects MUL_PWR2, and the library already does
that. Rule52 is an independent extension for word multiplication by2^k+1.
It emits ADD rd,rn,rn,LSL k without flags, exact modulo32/64 bits, including
signed top-bit patterns. Either constant operand may supply the factor. Existing
power-of-two selection takes precedence; zero/one/nonmatching constants and
narrow/vector operations retain their established policies. The graph stays
unchanged and the tile has one source/no materialized RHS constant. No extra
whole-function pass or override maps are allocated.

The native binary matrix tests everyk from1 to width-1 for signed/unsigned
32/64-bit types, both operand orders, boundary/near-miss constants and wrapping
input patterns. The scan runner owns a real Coil ArrayList; an independently
compiled C reference checks signed field extraction and unsigned checksum wrap.
Its process-CPU timer covers only opaque kernel calls, with reference checking
outside the timer. Small kernel measurements are not bootstrap acceptance.


## Absorbed multiply retirement

Persistent shifted ADD/SUB can consume an existing MUL_PWR2 tile, whose original
IR opcode is MUL rather than SHL. The retired-expression cascade previously
recognized shifts but not pure word MUL, leaving a dead LSL in the scan body.
Word MUL is now included in the same reference-counted, root-protected pure
retirement set. The graph is still unchanged. Matching tests cover MUL_PWR2
producers under normal/commuted/reversed/rooted/shared ADD/SUB; the omission
assertion fails before the fix, while native correctness alone would miss it.


## Multiply-accumulate

Rules 54/55 are an independent extension: persistent matching turns `ADD(c, MUL(a, b))`
(either operand order) into MADD and `SUB(c, MUL(a, b))` into MSUB when the MUL is a
register multiply (rule 3) with that single use, unrooted and in the consumer's block.
The tile's left is the addend, right the multiplicand and the immediate the multiplier's
graph reference (`select/multiplier`); all three are machine inputs before liveness and
the MUL is retired through the existing reference-counted cascade. Only two scratch
registers exist, so a fusion whose three sources could all need one (literal, frame
address or constant view) is declined, and emission reports a hard error rather than
overwrite a scratch. `tests/multiply-accumulate.coil` checks the plan and native
answers for 32/64-bit signed/unsigned types, all four operand shapes, literal and
register multipliers, rooted/shared products and the narrow types that must not fuse.

## Literals in loops

`a64.constant-hoist` (independent extension) runs on the prepared schedule before
matching. A nonzero 32/64-bit literal that an instruction in a loop block would rebuild
in x16/x17 (a register operand of a selected arithmetic or comparison tile, a STORE
value, or one literal COND arm) becomes one COPY of that literal, scheduled at the end
of the nearest dominating block of smaller loop depth and shared by every such use
with the same block. Loops that contain a CALL are left alone: a value live around
them needs a preserved register. Literals that later matching inspects stay literals
(encodable address displacements, MIN/MAX against a literal, Boolean and constant-pair
COND). The caller's graph is untouched: the rewrite works on `graph/instruction-overlay`
(own instruction cells, borrowed constant pool) and `pipeline/schedule-appended!` adds
the operand-free nodes to the existing schedule instead of preparing again.

The allocator has no rematerialization. If allocation puts any part of a hoisted
definition in a spill slot, `matched-uses/rematerialize!` withdraws it (its uses rebuild
the literal in a scratch register exactly as before, through the constant recipe of
`word-constant/recipe`) and the function is allocated again; a second such round
withdraws all remaining ones, so at most three allocations run. On the compiler
workload (10,079 functions) 506 functions get 941 hoisted definitions and 4 of them
need the second allocation.

# Extension floating opcodes

The pinned upstream table (`ir.h`, 131 opcodes) has no square root, no fused
multiply-add, no IEEE minimum/maximum and no rounding to an integral value.
Upstream reaches them through calls. Each is one AArch64 instruction, and none
can be built from the upstream set without changing its IEEE result (the
selecting `MIN`/`MAX` return the right operand when unordered and keep the left
signed zero; a multiply and an add round twice). They are therefore opcodes of
their own, numbered after the pinned table so every upstream number keeps its
meaning.

| Opcode | Name | Inputs | Meaning | AArch64 |
| ---: | --- | ---: | --- | --- |
| 131 | `SQRT` | 1 | square root | `fsqrt` |
| 132 | `FMA` | 3 | `op1 * op2 + op3`, rounded once | `fmadd` |
| 133 | `FMIN` | 2 | IEEE 754-2019 minimum: a NaN operand gives NaN, -0 < +0 | `fmin` |
| 134 | `FMAX` | 2 | IEEE 754-2019 maximum | `fmax` |
| 135 | `FMINNM` | 2 | minNum: a quiet NaN operand is ignored | `fminnm` |
| 136 | `FMAXNM` | 2 | maxNum | `fmaxnm` |
| 137 | `ROUND_EVEN` | 1 | to integral, ties to even | `frintn` |
| 138 | `ROUND_UP` | 1 | to integral, toward +infinity | `frintp` |
| 139 | `ROUND_DOWN` | 1 | to integral, toward -infinity | `frintm` |
| 140 | `ROUND_ZERO` | 1 | to integral, toward zero | `frintz` |
| 141 | `ROUND_AWAY` | 1 | to integral, ties away from zero | `frinta` |

Types are scalar `f32` (13) and `f64` (12) only; every operand and the result
have the same type. There are no vector forms.

## Where they are handled

- `stogir.opcode`: names, operand metadata (shapes `d1`, `d2`, `d3`), input
  counts and properties (floating data, as every pure value operation).
  `extension-data?` names the range for passes that enumerate pure data.
- `stogir.floating`: `operation?`, `unary?`, `ternary?`, validation,
  construction with exact-operand CSE (`build!`; FMA's addend travels in the
  guard argument) and constant evaluation.
- `stogir.validation-kind`: the `FLOATING` family, so the verifier runs
  `floating/validate`.
- `stogir.sccp-analysis`, `stogir.sccp-fold`, `stogir.iter-fold`,
  `stogir.dead-code`: the same treatment as the upstream pure range 14..68
  (lattice transfer, literal folding, CSE, removal when unused).
- `stogir.call-inline`: pure, so a callee made of them can be expanded.
- `stogir.a64.constraints`: FMA's third value is a register use.
- `stogir.a64.encode`, `stogir.a64.floating`: one instruction each. FMA's
  addend is materialised in a scratch register the factors left free, or in the
  result register when both scratches hold literal factors.

No other target exists in this library; a new one must implement these
opcodes or reject them with an error.

## Constant folding

Folding happens only where IEEE 754 fixes every bit of the result on every
machine, and is otherwise absent:

- `FMIN`, `FMAX`, `FMINNM`, `FMAXNM` of two non-NaN literals (signed zeros by
  bit pattern);
- the five roundings of a non-NaN literal (`round-bits`, integer arithmetic on
  the encoding).

A NaN operand is not folded: which payload survives and how a signalling NaN is
quieted is the target's rule. `SQRT` and `FMA` are never folded; the library
has no correctly rounded implementation of either that does not itself depend
on the host's instruction.

## Tests

`tests/jit-floating-extension.coil` executes every opcode at both widths
against tables produced by `tests/jit-floating-extension-table.py`, an exact
rational model of the instructions with the Arm NaN rules that uses no host
floating point: signed zeros, infinities, subnormals, quiet and signalling
NaNs, ties, the largest finite value, and a product whose low bits only a
single rounding keeps. Operands are parameters, literals in every position, and
values reloaded around a call with more live values than SIMD registers. It
also checks that `floating/evaluate` folds exactly the cases above.

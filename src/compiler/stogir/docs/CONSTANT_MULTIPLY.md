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

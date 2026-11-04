# Persistent power-of-two scalar division rules

Standalone e3719fa, Coil55422438 select upstream-style unsigned/signed DIV/MOD
power-of-two rules before allocation. The tile stores an exponent and no RHS
register operand. The graph, guarded DIV/MOD control and validation stay intact.
Unsigned operations use LSR/AND. Signed operations use sign-derived bias and
ADD/ASR or mask/SUB to preserve truncation toward zero. Signed negative top-bit
divisors, zero and nonpowers retain general division. Narrow normalization and
canonicalization are unchanged. Reserved x16/x17 support result/input aliases;
this independent bias sequence differs from upstream's compare/select form.

ASAN passes selector and invalid-exponent/atomic-output emission checks, the
native binary matrix and register-pressure suite, extended with DIV/MOD by4
after simultaneous Phi definitions at8/16/17/24/40-value pressure and independent
i128 answer checks.1216 new native graphs cover
every exponent across9integer/address types, DIV/MOD, dying/still-live dividends,
and200704 answers from an independent i128 oracle, including all8-bit inputs.
Forced-register native cases cover source/output0/1/16/17 aliases at32/64bits.

## Matched verifier result

Six rotating generation repetitions and ten runtime repetitions after warmup,
identical source and one checked opaque LLVM caller. No concurrent heavy job.

| Backend | Generation median ms | Runtime CPU median ms | Object bytes |
|---|---:|---:|---:|
| stogir before7cb5bc7e |118.1865|58.4990|114314|
| stogir55422438 |117.8605|58.3655|114378|
| LLVM O3 |323.0610|13.3655|37176|
| TPDE |1.3595|95.5840|74757|

There is no meaningful measured generation or runtime improvement on this
workload. Disassembly confirms8 SDIV and3 MSUB instances become0, with ASR
instances rising3→16. Replacing hardware division alone does not close the
verifier runtime gap; do not interpret opcode removal as performance success.
Objects are stable within each compiler. Exact samples and hashes:
[verifier](results/power-division/verify.json).

No full-bootstrap timing or acceptance claim is established for this change.

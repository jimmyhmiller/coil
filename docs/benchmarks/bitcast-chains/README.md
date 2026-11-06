# Nested-bitcast construction: neutral compiler reductions

Library d32f24b, compiler36b5cff6; before compiler47cc9364. Both compile
the same current library source. Four rotating generation and sixteen child-CPU
samples follow excluded warmups, serial O3/no debug, caches/library-state off,
common opaque LLVM O3 caller. No task build/test overlapped measurement. Raw
samples/hashes and compressed disassembly are archived. Candidate build, quick
35.5s and extended emission smoke pass. Full FAST has not run on this experiment.

| Workload | Backend | IR generation ms | Child CPU ms | Object bytes |
|---|---|---:|---:|---:|
| verify | before | 93.9430 | 24.5515 | 83275 |
| verify | nested cast | 93.7435 | 24.6015 | 83275 |
| verify | LLVM O3 | 375.2125 | 9.1050 | 39880 |
| prepare | before | 102.4660 | 24.9270 | 93143 |
| prepare | nested cast | 106.3935 | 25.0555 | 93167 |
| prepare | LLVM O3 | 385.5420 | 10.6855 | 56032 |

Verifier objects are byte-identical. No speedup established. The hypothesis that
this fold would recover retained Len helper expansions was rejected. The missing
pinned upstream rule is implemented and tested, but does not close this gap.
It must not be presented as a successful compiler performance optimization.

A static address grouping of the pointer verifier snapshot identifies repeated
loads at Graph+8, Graph+48 and Graph+120, plus a private frame root. This grouping
only identifies matching address expressions; it does not establish dominance,
absence of intervening writes, dynamic hotness, or legality of forwarding them.
The next investigation must trace actual control paths and memory effects before
implementing loop-aware reuse. Pinned ir.c forwarding stops at MERGE/LOOP_BEGIN;
any extension needs its own proof and must preserve zero-trip fault behavior.

No whole-bootstrap run: the5x/within10% goal remains unmet.

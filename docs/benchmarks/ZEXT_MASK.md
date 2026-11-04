# Exact source masks after zero extension

Standalone 1aa851f ports pinned ir_fold.h AND(ZEXT, full-source-mask), integrated
in Coil 043f7801. The ordinary replacement mechanism preserves shared values and
observed identities; adjacent masks are left unchanged. Named relocation payloads
are not numeric masks. ASAN/debug tests add 960 graphs / 26,880 native answers
across source/destination signs, both pointer widths, operand orders, and roots.

Matched generation and process CPU samples, identical opaque LLVM caller, caches
off. Baseline 53c44122, current 043f7801. First and verifier runs use eight CPU
samples; repeat uses twelve. Generation uses eight samples. Warmups excluded.

| Iterator metric | Before | Current | LLVM O3 | TPDE |
|---|---:|---:|---:|---:|
| First generation ms | 1.1850 | 1.1835 | 16.5120 | 0.0675 |
| First CPU ms | 26.4445 | 23.4905 | 11.5940 | 63.2230 |
| Repeat generation ms | 1.2235 | 1.1925 | 16.4395 | 0.0715 |
| Repeat CPU ms | 22.4615 | 22.4555 | 10.6575 | 57.6100 |

The first apparent runtime gain does not repeat. **No confirmed runtime gain**
is claimed. Objects shrink 1452 to 1436 bytes, removing redundant masks after
byte loads. Compare matched pairs: absolute CPU timings drift between runs.

Verifier generation is 114.4190 -> 113.7285 ms; CPU 44.9395 -> 45.1340 ms. Its
102244-byte object is unchanged. LLVM CPU is 11.6670 ms; TPDE 84.6685 ms. This
rule does not close the verifier gap. No full bootstrap measurement was run.
The 5x generation / within-10% runtime compiler target remains unmet.

Raw [first iterator](results/zext-mask/iterator.json),
[repeat iterator](results/zext-mask/iterator-repeat.json), and
[verifier](results/zext-mask/verifier.json) samples.

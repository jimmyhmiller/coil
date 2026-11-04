# Immediate integer rotate selection

Standalone 9157de6 and Coil 53c44122 port the pinned upstream AArch64
IR_SHIFT_CONST choice for 32/64-bit ROL/ROR. Persistent tiles carry a normalized
immediate and no count operand. Liveness/allocation therefore need no constant
register. Narrow and dynamic cases retain their previous lowering.

Eight rotating generation and CPU samples per host, excluded warmups, identical
opaque LLVM caller and workload, caches off. Baseline 9c40f654; current 53c44122.

| Iterator metric | Before | Current | LLVM O3 | TPDE |
|---|---:|---:|---:|---:|
| First generation ms | 1.1880 | 1.1940 | 16.2995 | 0.0665 |
| First CPU ms | 27.4280 | 21.4370 | 10.2720 | 55.1785 |
| Repeat generation ms | 1.1900 | 1.1940 | 16.6145 | 0.0675 |
| Repeat CPU ms | 27.7370 | 21.8945 | 10.9670 | 57.4500 |

The matched CPU improvement is 21.8% and 21.1%. Generation is essentially
unchanged. The object shrinks 1468 to 1452 bytes, with immediate ROR replacing
count materialization plus RORV. Host CPU levels drift between runs; use matched
pairs, not cross-run ratios. Stogir remains about twice LLVM runtime on this
workload, outside the 10% target. No full compiler speedup is claimed.

Verifier generation is 115.1835 -> 114.7815 ms; CPU is 44.7390 -> 44.7825 ms,
with an identical 102244-byte object. LLVM CPU is 11.3890 ms and TPDE 83.0240 ms.
This workload does not benefit from the new rule.

ASAN/debug encoder, native shift and division/rotate suites pass. Counts cover
zero, width boundaries, wrapped and maximal constants across signed/unsigned
32/64-bit values; dynamic rotates remain covered by the existing suite. Encoder
words independently agree with llvm-mc. FAST and global installation follow.

Raw [first iterator](results/immediate-rotate/iterator.json),
[repeat iterator](results/immediate-rotate/iterator-repeat.json), and
[verifier](results/immediate-rotate/verifier.json) data.

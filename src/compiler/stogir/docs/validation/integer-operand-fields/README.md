# Integer verifier current-header operands

Independent implementation improvement after78394b7, not an upstream machine
selection rule. integer-operations-target-structured requires successful
structure validation of this immutable graph. That proves cursor membership,
fixed arities and header fields1/2. Read these fields directly instead of
repeating Graph.operand membership/count/address checks. Keep all referenced
borrow/type/width/guard checks and the original diagnostic assignment order.
Public integer-operations-target still runs structure first. No new pass or
cache/invalidation requirement.

Fixedca35b006 emitter and commonb27ffeb4 LLVM opaque caller:
| CPU median ms | Before | Header fields |
|---|---:|---:|
| Stogir O3 |558.0035|511.9645|
| LLVM O3 |215.0155|201.884|

Stogir-8.25%, LLVM-6.11%. Eight rotatingCPU samples afterwarmup; unchanged4096-call
arithmetic fixture/native malformed checks, builds finish before timing and no
tests/profiles overlap. Source hashes, object/caller/emitter hashes and raw
samples in speed-results.json. Local diagnostic, not integrated/whole gain.

92992 differential cases:32comparison/binary/unary opcodes,14³scalar type
combinations, vector input/result types, null/extreme references, invalidarity,
invalidtype, divisionguard and valid negative constant references on either/both
sides. Rawgraph LLVM/ASAN caller; old/new Stogir O3/debug kernels and new LLVM
O1/debug/ASAN kernel agree on exact result counts/every diagnostic byte. Does
not assume graph construction or structural validity for the public API.
Compressed full answers and empty error streams retained. All fields remain
checked by the public verifier; no invalid-reference checks are elided there.
Native and LLVM/ASAN verifier suites pass on final source.

Reproduce: python3 benchmarks/integer-operands/validate.py then measure.py, from
this worktree, without other builds/tests/profile sessions during timing.
Drivers explicitly select fixed compilers and baseline9d1502a worktree, with
commoncaller independent of verifier implementation. Toolchain LLVM23clang is
required when linking its ASAN runtime; Appleclang has a different ASAN ABI.
No Coil integration/installation/push yet. Full bootstrap goal remains unmet.

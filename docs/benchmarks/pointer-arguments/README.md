# Authenticated pointer arguments through CIR

Library source: coil-tpde fb8d04e. Compiler source/candidate: 47cc9364.
The vendored CIR receives only the focused metadata addition, preserving later
compiler-local changes. Existing central TPDE attribution and license apply.

CIR keeps I64 physical register shapes. AF-ADDRESS (0x2000) marks authenticated
pointer arguments and promises neither nonnull nor noalias. BYVAL excludes this
semantic field because it encodes its size in bits12..31. Formal parameters and
call-site operands receive the same metadata. Source pointer/ref/function types
and indirect aggregate addresses are marked; integers are not inferred from use.
Stogir converts pointer call operands to ADDR and formal inputs back to CIR word
containers. Physical calling conventions and storage layouts remain unchanged.

## Validation

Candidate build, quick gate (36.0s), and extended post-inline/aggregate/effect/unit
smoke passed. A mixed integer/address fixture with deliberately aliased arguments
runs correctly; its parameter snapshot is [U64, ADDR, U64]. The first integer is
later cast to an address and remains U64. The actual verifier's borrowed Graph
parameter changes from U64 to ADDR. Standalone CIR tests emit AArch64 and x64
objects and the AArch64 linked C oracle prints ok; x64 execution was not tested.
Full compiler FAST has not run for this experimental branch. No global install.

## Repeated actual compiler-library reductions

Four rotating IR-generation and sixteen child-CPU samples after excluded warmups;
serial O3, no debug, caches/library-state disabled, common opaque LLVM O3 caller.
Source and compiler hashes, all samples and compressed disassembly are archived.
No task build/test overlapped the comparison. The initial driver attempt stopped
at a trace identity assertion using the former four-row index; after correction,
the full three-row comparison was rerun. Only the corrected run is reported.

| Workload | Backend | IR generation ms | Child CPU ms | Object bytes |
|---|---|---:|---:|---:|
| verify | before0284ac70 | 95.3225 | 24.4455 | 83239 |
| verify | pointer47cc9364 | 93.8715 | 24.5955 | 83275 |
| verify | LLVM O3 | 386.0410 | 9.2025 | 39880 |
| prepare | before0284ac70 | 104.3505 | 22.0435 | 95348 |
| prepare | pointer47cc9364 | 104.7815 | 22.0290 | 93143 |
| prepare | LLVM O3 | 382.1445 | 9.5305 | 56032 |

Runtime is neutral. The preparation object shrinks about2.3%, without a measured
runtime benefit. No whole-bootstrap speedup is claimed and no new full bootstrap
was run. The5x generation / within10% runtime goal remains unmet.

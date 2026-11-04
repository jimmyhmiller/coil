# Conditional iterator results

The standalone `benchmarks/compiler-gaps/iterator-return.coil` kernel walks a
64-byte cursor through `Option u8` results. An ordered rotate/XOR hash keeps the
work observable. Its default and Never helpers have identical bodies. A single
LLVM-built opaque caller checks every prefix length against independent indexed
iteration and checks the accumulated hash of 312,500 full walks.

Run `python3 scripts/benchmarks/stogir-iterator.py --compiler
build/bin/coil-candidate --library <coil-stogir-checkout> --output <directory>`;
add `--before <previous-candidate>` for a paired comparison or `--never` for the
retained-call mode. Four rotating generation samples and six rotating runtime
samples follow excluded warmups. Source, runner and object hashes are recorded.
These small-kernel results are not compiler-bootstrap acceptance.

The original iterator helper has 100 graph cells and two local ALLOCAs. The old
65-cell template cap discarded it. The new template cap follows the existing
512-cell expansion budget. Scoped cloning retains upstream BLOCK_BEGIN/BLOCK_END
stack semantics; its private ABI result proof requires every byte written on the
common return tail and rejects any earlier virtual-result read. It does not
assume constructor padding or inactive payload fields are initialized.

The broader template set exposed two adapter defects during compiler emission:

* CIR observations name program control exits. Generic library rewrites also
  preserve value identities when replacing observed LOADs/CALLs, retaining their
  control closure separately. After expansion the adapter must carry its control
  observations forward. An intermediate COPY of a call on a specialized dead
  branch is not an externally requested program value. RETURN and branch operands
  still carry program values. This adapter boundary does not alter the library's
  explicit data-root contract or its unresolved-root checks.
* Expansion budgets must charge cloned graph cells immediately after expansion.
  Charging net size after memory/SCCP optimization both spent budget on unrelated
  optimizer nodes and could replenish budget after graph shrinkage.

The emit-only `template-control-roots.coil` standalone wrapper retains
`driver/m-cc-sources` through a C export, reproducing the first failure without
emitting the whole compiler. Diagnostic tracing identified a rooted COPY whose
source CALL had unreachable control. The fix emits the wrapper successfully;
the existing register-result and capture-loop runtime checks pass. Full compiler
and delivery gates remain in progress; no new bootstrap ratio is claimed here.

## Full compiler diagnostic, source 8e60aeec

Same compiler source, serial code generation, caches disabled. Each row is one
diagnostic sample; external activity was possible. Both generated compiler hosts
produce byte-identical stogir and LLVM objects. Generation is **2.05×** faster
than LLVM O3; generated compiler CPU through stogir is **3.12×** slower than the
LLVM-built host. Broad expansion regresses the bootstrap. This does not meet
either acceptance target and is not a performance delivery.

| Host | Target | Generation s | Whole emit s | Process CPU s |
|---|---|---:|---:|---:|
| llvm-host-before | stogir | 11.076210 | 21.425309 | 19.450522 |
| llvm-host | stogir | 17.680901 | 26.739329 | 26.022482 |
| llvm-host | llvm | 36.237838 | 43.846811 | 43.215804 |
| stogir-host | stogir | 61.340795 | 87.955598 | 81.196321 |
| stogir-host | llvm | 35.403238 | 62.259477 | 58.713059 |

Exact values, object sizes and SHA-256 hashes: [compiler.json](results/iterator-results-control/compiler.json).

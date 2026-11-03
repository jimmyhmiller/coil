# Preserved GPR compiler checkpoint

Coil source `9ea2f8c8`; engine component `d1bb9ec`, main merge `13a6bfe`. Local arm64 Mac, O3. Full-source results below are one serial diagnostic run per cell, not acceptance medians. Both targets include IR optimization/emission and disjoint Always expansion spans; host/comptime spans are excluded. COIL overrides were cleared and serial emission explicitly enabled for both hosts.

| Full compiler source, fixed LLVM-built driver | LLVM O3 | stogir O3 |
|---|---:|---:|
| IR-to-machine-code seconds | 29.802132 | 14.667794 |
| Total emit-object wall seconds | 35.543250 | 21.292847 |
| Object bytes | 8,289,992 | 12,456,128 |

Code generation is **2.03× faster**, below the required **5×**. This revision has different compiler source from previous checkpoints; ambient load is uncontrolled, so cross-revision absolute differences are not isolated effects.

| Generated compiler executes full-source emission | LLVM-built host wall s | stogir-built host wall s |
|---|---:|---:|
| LLVM target | 35.543250 | 61.736390 |
| stogir target | 21.292847 | 152.313760 |

The stogir-host stogir-emission workload is **7.15× slower**, far outside runtime within10%. Both hosts generate byte-identical LLVM and stogir objects. Stogir-host target codegen time is119.059540s versus14.667794s for the LLVM host. The linked stogir compiler is11,737,912bytes; version/check/native-run smoke tests pass. No full-compiler acceptance result is claimed.

The unchanged small branch workload has five warm alternating medians LLVM0.171296834s, current stogir0.382917833s and previous stogir0.382595083s. There is no measured runtime improvement on that fixture. Assembly now keeps loop state in x19–x21 with entry/exit saves, replacing per-call spills; the boolean branch remains.

The implementation follows pinned upstream used-preserved-register policy: x19–x28 are allocated and only touched registers saved/restored in private frame storage; x18 remains reserved. SIMD preserved lanes remain excluded. Call-boundary preservation and argument transfers form one typed parallel-copy group. Generic unsupported odd-position transfers remain guarded. Central LICENSE/NOTICE/PROVENANCE attribution is preserved.

Component ASAN checks pass for explicit x19–x28 ABI preservation, wide/narrow pressure, framed/nested calls, dynamic stack scopes,8.8KB frames, mixed FP calls, checked pressure, vectorization and over-aligned frames across278 caller SP residues. Linked AOT calls pass. FAST passed49/49 in210.6s (cli/objects memory warning1.72GB vs1.5GB). Official global install of9ea2f8c8 passed. Off-checkout checks confirm code-section equality with the candidate, exact source bytes for all139 installed SDK modules, correct LLVM/TPDE/stogir timing tags and native execution, and the installed pressure/ABI probe suite.

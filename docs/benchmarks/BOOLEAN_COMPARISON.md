# Boolean comparison restart rules

Standalone ebe11b3 integrates as Coil source b86a0b5f, after conditional PHI splitting. Central vendored provenance identifies pinned ir_fold.h and the exact supported subset. Native before/after execution passes ASAN and a stogir O3-built suite; the old implementation fails the new optimization assertion. Exact uses, idempotence, shared/observed values and noncanonical input bytes through ordinary conversion are covered.

The combined opcode kernel drops from 164 to 151 instructions (branch-only 155), versus LLVM 24. Runtime remains worse: paired medians baseline 0.10913670808076859 s, combined 0.11155283299740404 s, LLVM 0.03657845803536475 s. These are one warmup and five alternating process samples, not full compiler acceptance. The raw samples and shape counts are retained. The prior full compiler diagnostic remains 3.30x generation advantage and 3.51x slower native self-rebuild; the goal remains unmet.

Candidate b86a0b5f is installed globally. FAST passes 49/49 in 281.8 seconds (object-step peak 1.63 GB). Off-checkout LLVM/TPDE/stogir fixtures, exact bounds diagnostics and constant-loop case pass. Installed stogir-built module execution, bitwise, SCCP control and iterative-fold suites pass. All 144 installed SDK modules and AVec match the validated source; installed toolchain identity equals the candidate.

# AArch64 logical-immediate selection

The persistent selector now recognizes representable scalar OR/AND/XOR literals on either side and stores canonical N:immr:imms fields before liveness. Emission uses these fields directly. Word-level zero/all-ones and unencodable masks retain register rules. Narrow scalar inputs and results keep the existing normalization around 32-bit instructions; vector paths remain unchanged. The independent mask encoder fills the feature represented by pinned upstream `aarch64_may_encode_logical_imm` and its logical binary rules; attribution stays in the vendored NOTICE/provenance.

The standalone host-independent encoder/selector/emitter suites and native JIT bitwise suite pass ASAN and when compiled with stogir O3. Native execution covers all 6,636 mathematical masks for all three operations against five inputs (99,540 hardware answers), plus signed/unsigned graph compilation, both literal sides, fallback and invalid-field rejection. The selector does not redo the shift/multiply literal lookup for logical operations.

Candidate source ab70a560 is installed globally. FAST passes 49/49 in 214.6 seconds. Off-checkout LLVM/TPDE/stogir fixtures, exact bounds diagnostics, constant-loop regression, stogir-built module execution and the native bitwise suite pass. All 144 installed SDK modules match the standalone component. The current full-compiler checkpoint remains outside the performance goal; see OBSERVED_AVEC_COMPILER_CHECKPOINT.md. These small measurements do not replace that full checkpoint.


The initial 32/64-bit-only candidate 605b9315 gave almost no runtime gain: matched AVec 0.0760400410508737 -> 0.07597149990033358 s (LLVM 0.04920020804274827 s); opcode lookup 0.10009341698605567 -> 0.09915158292278647 s (LLVM 0.034007292008027434 s). Raw samples are retained in `logical-immediates/wide-only-*.json`.

The compiler's opcode predicates use byte-sized masks. The next component enables immediate selection through the existing narrow normalization path. Extended signed/unsigned byte/halfword and boolean selection/native tests pass ASAN and stogir O3. The candidate and matched measurements are recorded below.

The narrow candidate ab70a560 also shows no gain on this workload: wide-only median 0.0986543329199776 s, narrow median 0.0995749580906704 s, LLVM 0.03427954204380512 s. Disassembly corrects the initial source-level hypothesis: the compiler promotes these flag operations to 64 bits, so both stogir kernels have 164 instructions, while LLVM has 24. The gap is dominated by repeated validity branches and boolean conversions. Narrow support is a tested coverage extension, not a claimed performance fix. Raw timings and shape evidence are retained in `logical-immediates/`.

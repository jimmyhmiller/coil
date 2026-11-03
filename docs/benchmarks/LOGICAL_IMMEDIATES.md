# AArch64 logical-immediate selection

The persistent selector now recognizes representable 32/64-bit OR/AND/XOR literals on either side and stores canonical N:immr:imms fields before liveness. Emission uses these fields directly. Zero/all-ones, unencodable masks, narrow scalars and vectors retain their existing paths. The independent mask encoder fills the feature represented by pinned upstream `aarch64_may_encode_logical_imm` and its logical binary rules; attribution stays in the vendored NOTICE/provenance.

The standalone host-independent encoder/selector/emitter suites and native JIT bitwise suite pass ASAN and when compiled with stogir O3. Native execution covers all 6,636 mathematical masks for all three operations against five inputs (99,540 hardware answers), plus signed/unsigned graph compilation, both literal sides, fallback and invalid-field rejection. The selector does not redo the shift/multiply literal lookup for logical operations.

Compiler candidate build, unchanged-workload measurement and FAST are pending. The current full-compiler checkpoint remains outside the performance goal; see OBSERVED_AVEC_COMPILER_CHECKPOINT.md. This matching component is not installed globally or pushed yet.

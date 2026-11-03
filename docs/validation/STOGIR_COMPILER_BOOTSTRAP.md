# Full-compiler bootstrap preparation

The first whole-compiler attempt from executable f9f0b602/source a9b15305 failed
on CIR i128 registers in jit_elf.ejit-divti3 and stogir.builder.integer-unary!.
The 49.308-second failed attempt is not a successful compile-time result.

The adapter now legalizes a wide CIR value into two scalar u64 graph references.
Low/high PHIs are reserved and patched together; arithmetic, comparisons, shifts,
word multiplication-high, memory operations, constants, calls and returns retain
both words. Darwin argument groups keep each pair together, including the case
with only one free GPR. Division/remainder use ordinary compiler-rt C ABI calls,
as the other native backend does; no alternative selector compiles any function.
The semantic IR remains the compact stogir graph. This also repairs source-width
handling of narrow rotates, byte swaps and bit counts, including odd widths.

Validation so far: a temporary copy of the existing numeric corpus runs its
wrapping/division/shifts/bits/comparisons/overflow/casts/i128/operators sections.
Only main's five unrelated floating/math/formatting/SIMD section calls are omitted;
no tested function is rewritten. All three backends return zero and produce
identical output. The shipped numeric corpus is extended with no-output checks
for narrow zero/sign bit counts, odd-width rotates, wide arguments after an odd
GPR prefix and wide arguments crossing the register/stack boundary. These pass
on all three backends. The complete numeric corpus still has the separately
reported FSQRT adapter gap; it is not claimed as passing.

A stogir O3/no-debug object of src/compiler/main.coil was emitted successfully:
38.53 seconds wall time, 3,493,232,640-byte maximum RSS; object about 15MiB.
This is an uncommitted-development capability probe with ordinary parallel native
generation, not the controlled serial IR-to-object benchmark or a linked compiler.
The next gates are linking, executable behavior, self-rebuild correctness, and a
same-source comparison against LLVM O3. The installed compiler remains f9f0b602.

## Delivered feature validation

Source 0dcc4101 now passes full self-rebuild object equality for both stogir and
LLVM targets. Cross-backend wide C ABI tests pass in both directions. FAST 49/49
and official global installation/off-checkout checks pass. The LLVM-built driver
with updated stogir support is installed globally. The final comparison is in
[STOGIR_COMPILER.md](../benchmarks/STOGIR_COMPILER.md): full compiler performance
is substantially worse than LLVM and must not be inferred from the stencil.

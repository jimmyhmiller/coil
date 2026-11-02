# Stable graph rewrites and initial-owner spilling

Compiler source checkpoint `77916498`; vendored standalone library `8111f09`.
Pinned architectural reference: `92171d0a4a36b0acf707f2dea7998de615dd4acd`.

Whole-node rewrites preserve all preexisting valid references and later nodes.
A replacement must fit the current cell allocation; unused tail cells become
cleared, independently traversable NOPs with valid arity metadata. Successful
rewrites invalidate construction CSE; rejected requests preserve it. Repeated
invalidation skips an already-empty retained map, avoiding capacity scans.
The owning optimizer must still remap incoming edges/roots and rebuild external
use/analysis caches. No second instruction IR is introduced.

## Allocator correction and native evidence

The rewrite conformance program exposed a genuine blocked-allocation defect.
An uninstalled diagnostic compiler captured an owner with start=position=1506,
end=1554 and no next register-required use. The blocked decision selected that
owner, but eviction rejected the starting position. Pinned
`ir_ra.c:ir_allocate_blocked_reg` explicitly handles the corresponding
`child = other` case. The correction spills the whole owner prefix, requeueing
its future required-use suffix when needed. An immediate register-required use
remains protected; no empty prefix is created. Temporary tracing is removed.

The native fixture creates 8/16/17/24/40 simultaneous Phis, consumes them in
reverse order and checks both branch paths for arguments -100..100. Holding
project modules and a frozen 273-file host toolchain fixed, replacing only the
allocator with the old implementation produces four failures; the corrected
implementation JIT-executes all cases. The 24-Phi object also passes linked AOT.
[Exact inputs, hashes and outputs](stogir-owner-prefix-spill.json).
This is native generated-code evidence, not full upstream allocator parity.
Optimal split positions, coalescing and target reuse remain incomplete.

The original larger source-level fixture now reaches the known i128 CIR
register-type gap in HashMap<u128,i32> cleanup, rather than the allocator
failure. Its reproduction is recorded in `coil-bugs#stogir-numeric-cir-gaps`.
The test was not weakened. LLVM and TPDE execute its 81 rewrite shape/size
combinations. Additional Phi coverage in the existing Coil CLI fixture passes
on both old and fixed compilers; it is integration coverage, not the isolated
allocator reproducer.

## Validation and delivery

- Final-source standalone validation: 213 programs and 65 linked AOT consumers,
  frozen project/compiler/SDK hashes and freshly generated objects. The linked
  pressure consumer now uses both switch-pressure objects and phi-pressure.o.
- Independent one-register allocation checks cover equal starts with later
  required uses; completed assignments pass the consistency verifier. Native
  mixed spill-shape and AArch64 integration checks pass.
- Final graph/CSE checks pass with LLVM and TPDE. The candidate's stogir target
  passes the supported allocator-driver/split tests; no claim is made that the
  whole library source can currently be compiled by stogir.
- Coil FAST passes 49/49 in 241.0 seconds, with the object-test memory warning
  at 1.60 GB against 1.5 GB. Full stogir corpus remains 6/9 with the same
  pinned-shim, narrow/i128 adaptation and deep-tail-call failures.
- Compiler `77916498` is installed globally with matching stamp/SDK, native
  archives and warmed JIT/lint units. All 118 main-library, vendor and installed
  source modules match byte for byte. [Off-checkout installed AOT checks](stogir-rewrite-installed-checks.json)
  pass under LLVM/TPDE/stogir: measured object emission, system linking,
  exit 42 and empty output. The diagnostic trace is absent from the binary.

SCCP analysis/transformation/iteration and optimization-level policy are still
unfinished. Separate development commit `4db06ec` in the independent library's
ignored `.worktrees/sccp-analysis` worktree starts feasible-input Phi transfer
with 100 initial metadata cases. It is unmerged, not vendored or installed,
and still needs broader coverage and a pinned differential. It is not part of
the 213-program delivery checkpoint and does not enable SCCP.

## Performance status

The last uncontended measurement remains the
[block-layout checkpoint](../benchmarks/STOGIR_BLOCK_LAYOUT.md): 4.85× faster
IR-to-object generation and 9.68× LLVM O3 runtime. Both acceptance criteria
remain unmet. The unchanged stencil and historical reports are preserved.
New timings remain pending while other builds are active on the Mac. No speedup
is claimed from correctness-suite durations or from unused optimizer APIs.

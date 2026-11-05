# Register-result target effects and caller capture writes

Whole-bootstrap5× generation / within10% runtime goal remains unmet. This is
library correctness evidence; no compiler performance improvement claimed.

Pinned CONST_FUNC/PURE_FUNC declarations describe native target effects. The
independent aggregate ABI also models an explicit caller capture write. The new
call-effects module keeps these separate: global preserves-memory? remains false
for every aggregate result. Address-specific forwarding crosses a qualified
register-result target only if the queried footprint is disjoint from the complete
capture span. Unknown, overlapping or partially overlapping captures are barriers,
as are writers, missing/malformed declarations and indirect x8 results.

Native register-result PARAM0 is synthetic private callee frame storage. The new
validated-body proof admits only contained, nonescaping ordinary accesses there,
with all STOREs accounted for and all other operations in the conservative scalar
effect domain. Foreign stores, escaped result addresses, volatile/atomic effects,
allocation scopes, unqualified calls and nested aggregate captures reject. A new
region policy reuses mem2ssa's pointer escape/bounds walk while permitting partial
or overlapping accesses; those accesses do not enable SSA promotion. Exact-field
promotion still uses its original policy. Policy selection is a compile-time
constant, not another branch in the access walk. The existing scalar proof API
retains its prior behavior. Facts are recomputed for each immutable graph version.
No graph opcode, result ABI, root identity or native emission behavior is changed.

The extended jit-mem2ssa suite checks55 GP/HFA/HVA body cases, including later
mutation, mixed-width writes within the result region, foreign/out-of-bounds
writes and escape rejection. It checks1,632 native answers with direct/indirect
GP/HFA targets, readonly/constant/writing functions, private/same/disjoint/unaligned/
unknown capture regions, deliberate caller aliases and rooted loads. The original,
explicit-forwarded and full-O3 paths all use exact value and80-byte side-effect/
canary oracles. A32-byte HFA capture overlaps a queried field beyond the first
16bytes, guarding against a GP-only footprint assumption. CALLs remain retained.
Existing malformed and x8 declarations are checked through all effect predicates.

Six O3 Mach-O objects use indirect native targets, making them independently
relocatable across processes. `driver.c` supplies C Pair/Quad functions and checks
all values and caller-visible bytes. Twelve C binaries (ordinary/ASAN) check96
answers, including GP/HFA unaligned capture, writer/constant targets, disjoint HFA
capture and its full-width overlap case. Host compilation uses LLVM O1/debug/ASAN;
generated JIT/AOT instructions themselves are not ASAN-instrumented.

The original memory suite, including promotion, rooted effects, symbolic offsets,
pure-call and branch regressions, remains intact. Additional suite transcripts and
regressions.json are alongside this document. Core shared-classifier suites were
repeated after separating the region policy; region-regressions.json identifies
those checks separately. No full-compiler ASAN cleanliness claim is made.

Reproduce from the standalone checkout:

```
coil run tests/jit-mem2ssa.coil --backend llvm -O1 --no-debug --debug-checks --sanitize=address
cc -O3 -DMODE=3 docs/validation/register-result-effects/driver.c /tmp/coil-register-effect-gp-partial.o -o /tmp/register-effects
/tmp/register-effects
```

For HFA objects use `-DHFA=1` and MODE2(disjoint),3(partial),9(wide overlap).
GP MODE5(writer) and8(constant) select the corresponding C target. Credits remain
centralized in LICENSE, NOTICE and docs/PROVENANCE.md, without new license headers.

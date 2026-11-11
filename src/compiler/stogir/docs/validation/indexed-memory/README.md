# Register-offset memory preparation

The pinned upstream 92171d0 ir_aarch64.dasc ir_match_fuse_addr only fuses constant
ADD offsets. Register-offset fusion is an independent target extension, not a
claimed upstream port. It belongs in the persistent matcher before liveness,
without rewriting the semantic graph or changing the upstream pass order.

Whole compiler source01f47440 object static disassembly has15916 adjacent register
ADD/memory pairs versus616 in LLVM. This is an opportunity count only: some
addresses are shared, scales unsupported, or code cold. It proves neither legal
fusion count nor speed. The observed profiled arena-vector helper contains a
scaled index ADD immediately followed by its load.

This preparatory checkpoint implements a read-only full-word base/index selector
and checked UXTX register-offset encodings. Optional SHL absorption requires the
exact storage-size scale and a full-width input. Other shifts stay explicit.
COPY remains a barrier; bounded word BITCAST views may be bypassed. Invalid
widths, missing references and non-word inputs decline. Existing constant-offset
selection remains unchanged.

128 instruction words independently checked against LLVM MC: unsigned GP
byte/halfword/word/doubleword load/store, signed byte/halfword W loads, FP32/64
and Q128 load/store; scaled/unscaled, SP/ZR, aliases. Invalid width/register/sign
combinations rejected. Encoder tests pass LLVM O1/debug/ASAN and Stogir O3/debug.
Selector geometry and existing JIT address suite pass LLVM O1/debug/ASAN.

NOT integrated into matching/allocation/emission yet. No generated-code change,
performance gain, compiler adoption or whole-bootstrap claim. Next: persist
selected index/scale; substitute base+index machine uses before liveness; retire
only genuinely unused address/shift nodes; preserve roots/shared uses; handle
base/index/value spill scratch conflicts; differential native tests for both
loads and stores, volatile accesses, SIMD, aliases and high pressure. Only then
measure representative emitter and compiler paths. Full goal remains5x
IR-to-machine-code speed and compiler runtime within10% of LLVM O3.

## Integrated library continuation

Persistent Plan now records index/scale, redirects memory base+index uses before
liveness, and updates register constraints for the index. Existing retirement
keeps shared/rooted address and shift definitions. Emission uses register-offset
loads/stores, preserving volatile control; store index recipes using x17 are
consumed into an effective address in x16 before a store value can reuse x17.
Ordinary spill reloads remain owned by allocation/transfers and the register
constraints, rather than hidden operand loads in the emitter.

1040 new native cases:13 integer/FP/SIMD types x4 dynamic positive/negative
indices x5 sharing/root/COPY/escape/mixed-width variants x2 scale modes. Exact
bytes and untouched output sentinels checked. Forty volatile loads whose values
are summed after a volatile constant store check pressure and reload behavior.
Existing constant-address native suite remains. LLVM O1/debug/ASAN and Stogir
O3/debug test hosts pass. Compiler integration and performance remain pending.

## Retired shifted-tile edge correction

First compiler integration2a33d42d quick passed but live-emission executable hit
BUS: a MUL-by-power-of-two value used as a selected memory base was omitted.
A word BITCAST chain deferred retirement of its ADD until after shifted-ADD
fusion. Retirement then decremented the original MUL edge a second time rather
than the already-substituted shifted tile inputs. Retiring rule50/51 now removes
its actual selected input edges, exactly matching machine-use construction.
No address-shape blacklist or disabled optimization is used.

Added commuted MUL/ADD/BITCAST shape extends native matrix to1560cases, plus
assertions that selected memory machine inputs are not omitted. New regression
fails with old95e3a4d (ASAN BUS), passes with corrected accounting under
LLVM/debug/ASAN and native Stogir/debug hosts. Compiler rebuild/live-emission
recheck pending. Raw before/after evidence retained here.

## Arithmetic-tile cost follow-up

Initial paired compiler measurements are neutral (actual emitter757.4105 vs
757.112ms) and AVec slightly regresses. Its disassembly shows commuted MUL-by8
selected as base instead of scaled index, and a shared16-byte stride forced
into an8-byte memory access as an extra LSL. Reuse existing word arithmetic
rules38..40 to recognize both SHL and MUL-by-power-of-two. Commute a shifted
operand into the index field. Select only natural-scale LSL tiles; otherwise
retain the existing shifted ADD rather than force an extra standalone shift.
Ordinary unshifted indices remain legal. The existing geometry oracle now also
asserts non-natural scales decline; mixed-width sharing keeps its address when
needed.1560native variants plus volatile pressure pass LLVM/debug/ASAN.
Compiler performance for this follow-up remains pending.

Refined compiler bb21d63f candidate build/quick45.4s/live-emission and current
candidate native address suite pass. Paired actual CIR emitter CPU762.5935→
746.449ms (2.12%), LLVM340.4485ms; object2706144→2697868bytes. AVec neutral,
verifier0.79% gain. Same-source before55d4a5ff, four generation/eight rotating
runtime samples after warmup, no task builds/tests overlap, all source/SDK
identities recorded. Full evidence in Coil docs/benchmarks/indexed-memory-natural.
Keep isolated: no whole-bootstrap acceptance or fullFAST/install/push claim.

# Shared wide comparison fusion

Pinned upstream 92171d0a4a36b0acf707f2dea7998de615dd4acd,
ir_aarch64.dasc all_usages_are_fusable (line1063) and IR_IF matching
(line1698), allows shared comparisons with fusible consumers. This ports the
supported wide integer IF subset. Narrow, floating point and GUARD consumers
are not newly supported. It is not a claim of complete upstream parity.

During the existing scheduled edge walk, any comparison use other than an IF
condition marks it as requiring materialization. Explicit roots also require
materialization. Otherwise each IF redirects machine inputs to the comparison
operands before liveness; the comparison definition is omitted. Each branch
emits its own compare, so condition flags are never carried across calls.
Cross-block/call operand lifetimes are handled by ordinary machine liveness.

Validation using fixed Coil30467d56 on macOS AArch64:
- jit-branch Stogir O3/debug and LLVM O1/debug/AddressSanitizer pass.
- New test covers all10signed/unsigned integer predicates,25input pairs each,
  six modes: cross-block reuse, intervening call, data use, explicit root,
  hard COPY, and40volatile values live across a call (1500native answers).
  Matching assertions verify omission and real machine inputs as well as
  independent native return-value expectations.
- Existing a64-select and jit-call-pressure Stogir O3/debug pass.
- Actual post-inline Graph.borrow-node replay changes comparison44 from
  twoIFuses/onecross-block/fused0 to fused2. Data consumers remain unfused.

Reproduce replay: copy generator/template under build/frame-origin-audit,
decompress snapshot there, run generator with snapshot path, build replay.coil
using the current library and run it. The generator rebuilds constant indices
before ordinary SCCP/preparation/matching. This is matching evidence, not a
whole-compiler timing or proof of identical independently generated code.

No timing claim. Not yet vendored into a new Coil candidate, installed or pushed.

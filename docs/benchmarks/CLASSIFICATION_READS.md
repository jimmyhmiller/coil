# Immutable classification input reads

One fixed8bbe8647 emitter compiles old library2dddff9 and the changed verifier.
The exact opaque LLVM runner checks valid graphs and malformed layout/reference/
type cases. Each run has16 rotating process CPU samples after excluded warmup;
the before object is reemitted and verified against its retained SHA.
These are library source-algorithm comparisons, not generation timings.

| Case | First CPU ms | Repeat CPU ms | Object bytes |
| --- | ---: | ---: | ---: |
| Original stogir |35.2485|35.3550|102483|
| Cursor/input reuse stogir |32.2775|32.3205|101874|
| LLVM O3 (changed source) |8.7895|9.3420|41008|
| TPDE (changed source) |65.6490|65.3290|75589|

Stogir improves8.4%/8.6% against its matched original source. The earlier
cursor/first-input-only checkpoint was3.6% in one run (results/classification-reads/shared-first.json).
The repeat remains3.46× LLVM CPU on this kernel; the full compiler target is
unmet and unmeasured here. No integrated emitter speedup is established.

The structural verifier cursor already owns exact Node/count. Classification
uses its first three operand fields directly; continuation cells still use the
checked accessor. All referenced inputs retain checked membership/borrows.
First-input type is shared with floating classification where appropriate.
Both flags stay independent and validators keep their original order/errors.
The existing ASAN/debug verifier suite compares both original classifiers over
1,451,220 raw opcode/type/count/input cases and checks exact diagnostics/counts.

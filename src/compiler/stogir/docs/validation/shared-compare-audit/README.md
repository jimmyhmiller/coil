# Missing upstream shared-comparison fusion gate

Pinned92171d0 ir_aarch64.dasc:1063 all_usages_are_fusable accepts a comparison
whose nonempty users are all IF/GUARD/GUARD_NOT. IR_IF matching at1698 accepts
single-use OR that predicate, without this port's same-block CMP restriction.
Current a64/match.coil accepts only count1, non-root, same-block wide integer
comparisons. Thus the broader upstream gate is missing, not an invented LLVM
optimization. Native GUARD fusion remains a separate unsupported case here.

Real post-inline stogir.graph.borrow-node captured by Coil30467d56, run through
ordinary optimize-memory, prepared CFG/schedule and current matching:
comparison44: rule32, wide=true, two scheduled uses, both IF condition operands,
one cross-block, zero fused consumers. Single-use same-block comparisons in the
same graph do fuse. The machine body in the current whole object materializes
this condition (CSET and boolean tests). This is a concrete missing selection.
No speedup is claimed from the audit; no native matching change yet.

Reproduce with generate.py and inspect-tail.coil.in copied under
build/frame-origin-audit, decompress snapshot, generate replay, compile/run with
30467d56. The generator rebuilds the constant index before SCCP. It produces
semantic/matching facts, not byte identity with an independently emitted object.
Any port must redirect every fused consumer to actual comparison operands
before liveness, omit only when all live uses are supported and unprotected,
retain data/hard-copy/root uses, and test cross-block/call pressure semantics.
Start with supported IF consumers, explicitly retaining guards until their
machine-use/emission support exists. Extend actual operand live ranges; do not
reuse stale condition flags across calls or branches.

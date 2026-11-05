# Integer complement ancestry

The ancestry-order correction alone produced byte-identical operand diagnostic
objects and neutral timings (about 90.1 ms Stogir / 31.3 ms LLVM). This extension
addresses a distinct miss: LE and GT, for example, are different SSA predicates
but complementary for identical integer operands.

Reuse the existing straight control-chain query and IF rewrite machinery.
Recognize only the five existing integer complement pairs, in either direction,
with the exact same SSA operands. Integer comparison conditions with one user
are eligible; a complement need not share a predicate reference. Do not infer
floating/vector facts, cross merges/loop/independent entries, change memory
ordering, or speculate guarded values. Guard/guard-not truth is inverted by the
same checked relation. Checked lookups and the existing graph-size cycle bound
remain.

Debug-checks + ASAN SCCP control suite passes. New native cases exercise all ten
integer comparison operators, both selected branch truths, and eight signed
boundary bit patterns, before/after optimization (640 answers, including delayed cast cleanup), checking both
actual answers and elimination of the redundant IF. Existing memory-effect,
preallocated-header, late-definition and observed-root cases remain. Negative
queries cover changed operands, joins/loops/entries/labels/cycles and F32/F64
comparison complements (which cannot use this integer-only proof).

Compiler integration and performance measurement are pending. This is an
independent extension to the pinned upstream ancestry setup, not a claim of full
upstream pass parity or bootstrap acceptance.

## Changed-input worklist dependency

The real operand graph becomes complementary only after nested BITCAST/SEXT
cleanup. Replacing a comparison input queued that comparison, but if its own
reference survived scalar folding, its IF was not necessarily notified. The
IF ancestry query observes those inputs, so they are a real dependency.
The iterative drain now queues comparison condition users through the existing
reverse-use index when draining a comparison during the control-folding phase.
No graph-wide rescan, repeated SCCP analysis, or new CFG cache is needed.
A regression reserves the IF before a later cast chain, removes the unused
already-canonical inverse, and seeds the IF before canonicalization. The old
implementation executes original answers correctly but fails to eliminate the
IF. The corrected suite passes both elimination and native-answer checks.

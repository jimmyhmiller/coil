# Incremental optimizer development

Reference: dstogov/ir `92171d0a4a36b0acf707f2dea7998de615dd4acd`,
`ir_sccp.c:ir_iter_fold`, `ir_iter_replace_insn`, `ir_iter_find_cse` and
`ir.c:ir_folding`. Attribution remains centralized in NOTICE and PROVENANCE.

`iter-fold` is an incremental scalar fold/CSE/DCE kernel. It consumes explicit
seeds, maintains the existing use lists, and revisits affected users and former
inputs. Shared fold decisions distinguish CSE from forced emission, including
hard-copy and invalid-division barriers. Positive observable data references
survive through COPY nodes. The public entry transforms an owned graph and
discards failed output; affected structural analyses must be rebuilt afterward.

This is not the complete upstream `ir_iter_opt`: algebraic rule coverage,
canonicalization, promotion, related-use scheduling and control/load cleanup
remain pending. Optimization-mode policy is also pending.
The feature is isolated and no new optimizer is enabled in Coil.

Focused decision-oracle, use-list, JIT/AOT and AddressSanitizer evidence is in
[validation/iterative-fold.json](validation/iterative-fold.json). The decision
oracle checks 16 selected outcomes, not complete fold-rule or transformed-graph
parity. Full standalone and compiler validation remain pending. No new
performance measurement or improvement is claimed.

Selected scalar algebraic rules now cover integer same-reference comparisons,
subtraction and bitwise identities; zero/one arithmetic identities; nested unary
cancellation/idempotence; and scalar identity BITCAST. Literal folds run before
applicable generic identities. Floating counterexamples and mixed-type cases
requiring a restart remain expressions. The expanded native fixture exercises
chained rewrites and verifies 25 JIT and 25 linked AOT answers under the same
worklist and root-preservation contract.

[validation/algebraic-fold.json](validation/algebraic-fold.json) records 272
selected normalized upstream results, including exact constant type/payload or
positive copy target and floating cases that must remain unfurled. Normalization
accounts explicitly for upstream's reserved TRUE/FALSE constant references.
This extends the kernel's rule coverage; it does not complete upstream folding
or enable optimization in Coil.

The development `stogir.sccp.optimize` entry now follows upstream's stage order:
one rooted analysis, one owned rewrite, then incremental scalar fold/CSE/DCE.
The rewrite result owns a deduplicated worklist. A single scan compares original
instruction starts and all their operands, including continuation cells, to
transport edits and affected references alongside analyzer candidates. The
orchestrator rebuilds uses after the bulk rewrite and mutates the existing owned
graph during cleanup; it neither repeats SCCP nor duplicates that graph again.

[validation/sccp-pipeline.json](validation/sccp-pipeline.json) records a Phi
simplification exposing a duplicate ADD to iterative CSE, preserved observable
COPY roots, 25 original JIT plus 25 optimized JIT and 25 linked AOT answers,
second-run stability, tail-only Phi edits, and ASAN ownership regressions.
These checks establish this stage connection, not complete upstream optimizer
coverage or performance acceptance. Mode policy and Coil delivery remain open.

Standalone image/object mode policy is now exposed through explicit options;
see [OPTIMIZATION_MODES.md](OPTIMIZATION_MODES.md). Levels 2 and 3 connect the
current SCCP pipeline before native preparation; level 1 retains the legacy
path. O0 explicitly rejects until its separate fast path exists. This supersedes
the pending standalone mode-API status above. Coil flag transport, complete
optimizer/allocator parity, delivery and performance acceptance remain open.

Full standalone compatibility validation at executable source `799bba6` passes:
228 standalone programs and 69 linked AOT consumers. Object freshness and frozen
source/toolchain hashes are verified. See
[validation/sccp-full-regressions.json](validation/sccp-full-regressions.json).
This does not substitute for compiler integration or performance measurements.

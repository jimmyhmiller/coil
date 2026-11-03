# Architecture contract

The reference is dstogov/ir commit
`92171d0a4a36b0acf707f2dea7998de615dd4acd`, specifically
`ir.h:ir_jit_compile` and `ir_main.c:ir_compile_func`. Attribution and license
terms are centralized in [PROVENANCE.md](PROVENANCE.md), [NOTICE](../NOTICE)
and [LICENSE](../LICENSE).

## Pipeline and current gaps

| Upstream optimized stage | Coil implementation and status |
| --- | --- |
| Construction folding/CSE, def-use lists | Compact graph, builder/fold modules and uses. Implemented coverage does not imply all upstream folds. |
| Optional mem2ssa, then reset CFG | Typed nonescaping ALLOCA partitions and block-local forwarding before SCCP. Cross-block Phi promotion remains open. Analyses are rebuilt afterward. |
| SCCP at optimization levels above one | Rooted analysis, owned rewriting and incremental scalar fold/CSE/DCE run through explicit image/object options at levels 2/3. Fold/restart coverage, promotion and CFG/control/load cleanup remain incomplete. See `OPTIMIZATION_MODES.md`. |
| CFG, dominators, loops, GCM, scheduling | `pipeline.prepare` orchestrates CFG, dominance, loop depth, placement and scheduling. Full upstream algorithm parity remains unverified. |
| Target matching | `a64.compile.generate` builds a persistent `a64.match.Plan` before register analysis. Fusion and reuse coverage remain incomplete. |
| Virtual registers, live ranges, coalescing, allocation | Matched operands feed register liveness, ranges and constraints, then split-interval allocation. Explicit upstream coalescing and full allocation-policy parity remain open. |
| Block scheduling and emission | Post-allocation block ordering and native emission. The scheduling core has a pinned-upstream differential; this does not establish whole-pipeline equivalence. |

Explicit library options now select the existing native path at level 1 and add
SCCP before it at levels 2/3, following the pinned positive-level gate. O0
explicitly rejects until the distinct de-SSA/fast-allocation path exists. This is
not complete upstream flag, optimizer or allocator parity. Legacy entry points
retain their existing behavior. Coil flag transport is committed separately and
must pass compiler delivery gates before being described as installed.

## Invariants for further work

- Keep the compact signed-reference graph as the semantic IR. Pass facts,
  schedules and machine constraints may index it; they must not become an
  independently maintained replacement IR.
- Put optimizer algorithms in the standalone library. The Coil adapter
  translates CIR and supplies policy; it must not recognize benchmark code.
- Perform matching before liveness. Fused operands and reuse requirements must
  reach allocation rather than being hidden in a late emission shortcut.
- A graph rewrite must preserve or explicitly remap observable roots, Phi
  predecessor correspondence and live references. Invalidate/rebuild affected
  uses, CFG, dominance, loop, placement, schedule and matching facts before use.
  Storage-level rewrite APIs alone do not satisfy this pass contract.
- Keep a working graph alive until pending graph references have been resolved
  into the owned image. Compilation must preserve the caller's graph when the
  API promises immutable input.
- JIT and AOT consume the same relocatable image. There is no alternate optimizer
  or LLVM/TPDE fallback behind either path.
- Keep all optimization, matching, allocation and image generation inside the
  measured IR-to-machine-code boundary.

## Extensions and sequencing

Automatic loop vectorization is an independent extension, not a ported feature
of the pinned upstream pipeline. The library O3 options API now selects guarded
integer vector prefixes after SCCP and before final matching/liveness. Coil
backend worktree delivery is in progress. See LOOP_VECTORIZATION.md.
It must not substitute for completing the missing upstream optimizer stages.

The rooted SCCP pipeline and explicit library mode API now have full standalone
compatibility coverage: 228 programs and 69 linked consumers at executable source
`799bba6`. That SCCP compiler integration is delivered; vector extension validation is in
progress, followed by the remaining
fold/restart, promotion, control cleanup, matching, coalescing and allocation gaps. Each stage needs semantic execution tests and,
where practical, differential checks against the pinned implementation.

Every vector transformation must operate on the same graph before final
matching/liveness, rebuild invalidated analysis, prove memory dependence safety
(or guard it at runtime), preserve scalar fallback and tails, and pass both JIT
and linked AOT execution tests. Analysis-only fixtures do not establish a safe
transformation or a performance improvement.

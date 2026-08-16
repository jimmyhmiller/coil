# Copy-ready prompt: generated compile-time stage

```text
Start from the latest `main` branch. Read and follow AGENTS.md, then run
`coil guide` before writing Coil code.

This is stage-metaprogram milestone 1 of 5. Read the full target design:

  git show origin/feat/scheme-continuation-pass:docs/landing/06-staged-metaprograms.md

Inspect research commit `15b5f52` for the generated-entry proof and `4e0f5f0`
for the final explicit marker shape. Reimplement only the smallest generic
mechanism: a before-expand syntax transform may emit
`(stage FRESH-MARKER PHASE-FORM...)` and a
`(FRESH-MARKER entry ARG...)` request that causes the compiler to compile and
invoke a newly generated fixed-arity `Code... -> Code` entry during a later
expansion round.

Use a generic Coil fixture based on `generated_stage.coil`; do not use Scheme as
the semantic definition. Do not port the later cumulative-stage machinery,
linked Code lists, arena experiments, direct metaprogram runner, Jolt/Chez code,
or broad checkpoint expander changes.

Use the final explicit declaration/request shape now; do not land the research
branch's earlier implicit name-based protocol. Prove that the generated phase
function did not exist in loaded source, executes
natively/in-process through the existing metaprogram engine, returns Code, and
produces the expected runtime result.

Use one candidate and the bounded modernize-fast gate. Add focused positive and
negative tests, keep the compiler green, commit one reviewable milestone, and
document what isolation, quote handling, and language-resumption problems
deliberately remain for milestones 2/3.
```

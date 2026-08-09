# Properties that fail on purpose

Everything in this directory is a **deliberate failure**. These are how the
reporting paths get exercised — the parts of `coil.prop` that a green suite can
never demonstrate, because demonstrating them means going red.

They are named `*_demo.coil`, not `*_test.coil`, so `coil test` with no argument
never picks them up. Run them by hand and read the output.

```sh
COIL_STDLIB_DIR=. coil test tests/prop/demos/shrink_demo.coil
```

| File | What it shows | Expected output |
|---|---|---|
| `shrink_demo.coil` | ordinary counterexamples, minimized | `a = 100`, `xs = (0 0 0)`, `xs = (5)` — each the exact minimum |
| `crash_demo.coil` | a property that **dies from a signal** is still minimized: the run forks, bisects to the case that killed the child, and shrinks with each candidate in its own child | `a = 10`, "the property CRASHED on this input (signal 11)" |
| `hang_demo.coil` | a property that **never finishes** is minimized the same way, via the watchdog | `a = 10`…`12`, "the property NEVER FINISHED on this input" — run with `COIL_PBT_TIMEOUT=3 COIL_PBT_CANDIDATE_TIMEOUT=1`, and expect it to take a minute: each candidate costs its whole timeout |
| `target_demo.coil` | `prop-target!` reaching an input uniform sampling never would (a byte list summing past 12000) | a long list of large bytes, found in ~3 000 cases |
| `fuzz_demo.coil` | **coverage-guided fuzzing**: a 4-byte magic value behind nested branches. `coil test` never finds it (~10^8 cases by construction); guided search finds it on 5 seeds of 5. Run with `scripts/tests/prop-fuzz.sh tests/prop/demos/fuzz_demo.coil` | `s = "FUZZ"`, in ~2k–12k cases (edge coverage alone: 6k–85k) |
| `memory_bug_demo.coil` | a real off-by-one read, found by generated inputs and minimized. **Needs `COIL_PBT_ALLOC=1 coil test --sanitize=address …`** — the arena hides small overflows from the sanitizer, and without the sanitizer the read is harmless | `heap-buffer-overflow … 0 bytes after 1-byte region`, `s = "a"` |
| `sparse_precondition_demo.coil` | the runner refusing to be quietly useless when `assume` rejects almost everything | `WARNING: … rejected 192 of 200 generated cases (96%)`, and the property still passes |

Two of these depend on defeating the optimizer, and both say so in a comment. An
infinite loop with no observable effect is legal to delete at `-O3`, and so is a
null dereference — the first version of `crash_demo.coil` used `(load (cast (ptr
i64) 0))` and the property passed, because LLVM removed the branch. A "crash
test" that gets optimized away tests nothing.

Each demo leaves a saved counterexample under `.coil/pbt/<property>/failing`, so
a second run replays it immediately instead of searching again. Delete
`.coil/pbt` to watch the search happen from scratch.

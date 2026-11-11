# Correct the two outstanding test contracts

No production source changed. The earlier full run passed 306 of 308 standalone programs; both remaining programs now pass in focused native runs with the same fixed test compiler. This is complete coverage across the full run plus these focused reruns, not a newly repeated full suite.

`private-leaf` treated an unsigned 64-bit argument as incompatible with a signed 64-bit argument. `private/same-abi?` deliberately normalizes both representations. The test now explicitly accepts signed/unsigned argument and result combinations, and rejects different conventions, widths, narrow arguments and arities. Its source-ownership mutation now uses a genuinely different width, so the snapshot check remains meaningful. JIT execution and Mach-O object emission pass.

`jit-parameter-specialize` reused the original specialized body's exact clone budget for a different body while testing cache identity. The independently measured minima are 17 cells for the original body, 1 for its zero-argument specialization, and 7 for the changed-result body. The test now searches the changed body's own budget from zero, then checks its native result and that the original cached specialization still returns its original result at its original minimum. All existing zero-budget, invalid-input, resource-limit, batch, cache-count and native side-effect checks remain. A diagnostic copy with only the changed-body budget increased also passed before the durable correction.

Commands, from the library worktree, for each corrected test:

```sh
COIL_LIBRARY_STATE=0 /Users/jimmyhmiller/Documents/Code/projects/coil/.worktrees/stogir-allocator-choice-fusion/build/bin/coil-candidate run tests/NAME.coil --backend stogir -O3 --no-debug --debug-checks
```

Raw successful logs are alongside this report; the prior failures remain in `docs/benchmarks/frequency-allocation/regional-native/`. The two failures were stale test assumptions, not production bugs introduced by regional allocation.

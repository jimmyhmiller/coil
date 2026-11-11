# Initial guarded integer-width propagation

Standalone checkpoint; no compiler bootstrap performance claim. Host compiler
e3295675, LLVM O1, debug checks and AddressSanitizer. All commands use
`COIL_LIBRARY_STATE=0` and the frozen compiler candidate from
`coil/.worktrees/stogir-validator-dispatch/build/bin/coil-candidate`.

Run `coil run FILE --backend llvm -O1 --no-debug --debug-checks --sanitize=address`
for tests/integer-type-promotion.coil, tests/jit-iter-fold.coil,
tests/jit-conversion-matrix.coil and benchmarks/compiler-gaps/word-width.coil.

The structural test covers 308 modular-arithmetic, shared-result, protected-root
and excluded MIN/MAX/ABS cases across seven integer types; additionally it checks
a 4096-node chain, constant left-shift boundary, rejected right shifts, COND,
Phi and direct self-Phi. Rebuilt exact-position use edges and semantic verifier
are checked after each mutation. Existing iterative optimizer and 165 native
conversion variants pass.

Both signed/unsigned word-container fixtures now emit 80 bytes (previously 156),
matching native i32 SSA; all 360 native calls pass. The fixture writes
/tmp/coil-stogir-word-width.o from the transformed unsigned variant.
Link `aot-word-width.c` with that object using `cc -O2 -fsanitize=address`;
all 120 linked AOT cases pass. These establish correctness/code shape on the
covered inputs, not runtime throughput or the whole-compiler goal.

The initial conversion suite caught unintended BOOL/pointer boundary scope.
Those conversions are now excluded; the rerun passes without changing the
existing test expectations. MIN/MAX/ABS remain excluded as audited.

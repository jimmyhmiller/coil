# Declared pure/const call forwarding

Pinned upstream ir.c skips CALL memory barriers only for declared flags32/64.
This port validates prototype bytes and scalar result/count shape, rejects
missing or malformed declarations and both aggregate result roles, and retains
the CALL control effect. The existing32-predecessor search bound is unchanged.
Both early forwarding and late incremental cleanup share this search.

Frozen e450d4a9 compiler, LLVM O1/debug checks/AddressSanitizer. Five suites pass
(see results.json): jit-mem2ssa, jit-iter-fold, jit-aggregate-results, jit-atomics,
calls. The expanded mem2ssa suite exercises28 direct/PROTO-indirect/observed
scalar cases with280 native answers across early/late paths,7 unqualified or
malformed barriers,6 aggregate result barriers, and4 validated read/write/volatile
body-proof cases. Missing/malformed fixtures deliberately use raw graph storage
where the checked builder correctly refuses their declarations.

Command: COIL_LIBRARY_STATE=0 coil run tests/NAME.coil --backend llvm -O1
--no-debug --debug-checks --sanitize=address. body-proof.txt is the final expanded
mem2ssa rerun; other suites have no intervening behavior changes.

A conservative effect proof scans an already validated scalar body, accepting
only pure data/control, ordinary loads, and declared nonwriting scalar calls.
All other effects reject. A body mutation invalidates the result. Compiler-side
interprocedural propagation is a separate integration, not an upstream port.

Existing e450 verifier traces contain85/126 finalized definition histograms
within the conservative opcode whitelist, with30 static call relocations to
13 such candidates among98 total. These are static candidate counts, not a
full body proof, dynamic counts or performance evidence. See prevalence JSON.
No compiler inference or whole-bootstrap gain is claimed by this checkpoint.

## Effect flags and inlining

Initial compiler inference regressed the actual verifier because the inliner
compared every prototype flag bit. PURE_FUNC changed eligible calls into ABI
rejections:55→77 emitted functions. Compatibility now ignores only CONST/PURE
bits32/64, preserving all other flags, result and group metadata. The expanded
inline-stack-results suite checks16 effect-flag pairs with64 native answers,
three convention/variadic rejection cases and the existing native scoped
aggregate/stack loops under debug/ASAN. Parameter-specialization suite also
passes. This fixes compatibility; performance must be remeasured separately.

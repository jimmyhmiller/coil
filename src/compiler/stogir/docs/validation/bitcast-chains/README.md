# Nested bitcast fold validation

All five suites ran with the established b27ffeb4 LLVM host, LLVM O1,
--no-debug --debug-checks --sanitize=address, COIL_LIBRARY_STATE=0.
Construction checks include valid non-Boolean type triples at pointer widths4/8,
Boolean barriers, invalid inner widths and a cyclic chain. Native JIT round trips
cover address/signed/f64 views including sign-bit and NaN payload patterns.
The vector-bitcast suite passes2350 cases, scalar conversion matrix165 variants,
and aggregate result ABI suite passes. ASAN instruments the host/harness, not
emitted JIT instructions. An initial command used the unsupported --asan flag;
no tests ran in that attempt; corrected invocations above establish the results.

# Structure-proven integer operand borrows

Base532a9cd; fixed Coil71856236 emitter. Scope is private integer semantic
traversal after structure succeeds on the same immutable graph. Structure has
already proved DEF/REF instruction/constant header membership. Only scalar
integer operand1/2 reads use the private helper. Zero retains null semantics;
negative refs widen before negation; no borrow survives mutation. Public Graph
borrow/lookup and exported classifications unchanged. Type/width diagnostics
remain checked. Canonical metadata assertion covers every integer dispatch role.
This follows instruction-cell access after verification; independent code, not
an upstream optimization port or permission to skip validation.

92,992 original/new integer-operation cases compare all result counts and every
diagnostic byte with an opaque LLVM-ASAN caller. Changed native-debug and LLVM
ASAN kernels agree exactly with baseline native-debug, with no sanitizer findings.
Native and ASAN verifier suite includes role assertions and existing structural,
classification, composite-priority and oversized-storage tests; all pass.

Unchanged4096-call verifier fixture, common b27LLVMopaque caller, eight rotating
CPU samples afterwarmup, all compilation/tests finish before timing. First:
Stogir428.1825→414.756ms(-3.14%), LLVM193.368→188.243ms(-2.65%). Repeat:
Stogir421.469→410.584ms(-2.58%), LLVM193.3565→187.8595ms(-2.84%). Single-machine
paired diagnostics, no whole/bootstrap claim. Similar LLVM gain means this does
not materially close Stogir generated-code quality gap. No integrated candidate,
not installed/pushed. Goal remains unmet at last qualified whole checkpoint.

Inliner trace evidence in audit.md rules out duplicating existing loop-weighted
cost ranking or blindly raising budget. Small source cost improvement is kept
separate from the still-open machine-code quality investigation.

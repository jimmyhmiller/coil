# Conversion restarts: full compiler diagnostic

Source2332c195, library accd7d7. Local macOS AArch64, O3/no-debug, serial, library
state cache disabled and codegen timings enabled for both hosts. Single samples,
not repeated acceptance medians. Adaptation and module preparation are included.

| Compiler host | Target | IR-to-code seconds | Whole emission seconds |
|---|---|---:|---:|
| LLVM O3 | LLVM O3 |32.182066|39.53796833299566|
| LLVM O3 | stogir O3 |8.999760|16.829847541986965|
| stogir O3 | LLVM O3 |32.865156|59.014356291037984|
| stogir O3 | stogir O3 |51.719460|78.27851691597607|

Generation on the matched LLVM host is3.58× faster; the generated compiler's
native self-rebuild is4.65× slower than the LLVM-built reference. The absolute
native self-rebuild remains about78seconds, so the small-kernel improvement
has not produced a major bootstrap gain. Neither performance target is met.

Both target objects are byte-identical across hosts. Stogir object12322176bytes,
SHA-256 d907a26a5c5bed6fe9fa3b1639400f0baf5690509e80e89c9997fa3fb7fe30ab.
LLVM object8347744bytes, SHA-256
d38afc0be85f6bfb2a757bce7959afe4929225214ac977be0ac6cc1a24315f36.
Generated stogir compiler11235696bytes. Version, checking and native-backend
smokes pass; FAST49/49 passes in219.0seconds (objects warning1.61GB).

The paired arity kernel improved27.3% (0.075815625→0.055125584seconds), versus
LLVM0.033164750seconds. Its emitted kernel shrank from89to73instructions;
LLVM uses27. That is a focused conversion result, not bootstrap acceptance.
See CONVERSION_RESTARTS.md and adjacent raw samples. Global installation matches all 143 standalone modules. Off-checkout native
fixtures pass for LLVM, TPDE and stogir (exit 42); the installed conversion JIT
and use-list oracle pass (exit 0). See installed-checks.json for provenance.

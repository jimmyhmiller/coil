# Canonical graph and scalar flag compiler checkpoint

Source7f1ed43d, library0267d8b. O3/no-debug, local macOS AArch64, serial,
library-state cache disabled. Single full-source diagnostics, not acceptance
medians. Timing includes adaptation and module preparation/expansion.

| Host | Target | IR-to-code seconds | Whole emission seconds |
|---|---|---:|---:|
|LLVM O3|LLVM O3|32.170333|39.70939608407207|
|LLVM O3|stogir O3|8.560014|16.56785920902621|
|stogir O3|LLVM O3|31.905644|56.59271745895967|
|stogir O3|stogir O3|45.496009|70.73376720794477|

Generation is3.76× faster on the matched LLVM host, versus the5× goal. Native
self-rebuild is4.27× slower, versus the within10% runtime goal. Both remain
unmet. Relative to conversion checkpoint2332c195, native self-rebuild falls
from78.278516916s to70.733767208s; native stogir generation falls from51.719460s
to45.496009s. These are separate single diagnostics, not a repeated median gain.

Both target objects are byte-identical across hosts (hashes and sizes adjacent).
Native compiler11198640bytes; version/check/native smoke tests pass.
FAST49/49 passed218.4seconds, with the existing objects memory warning1.61GB.
Global installed code sections match the candidate, all143 library modules match
standalone0267d8b, off-checkout LLVM/TPDE/stogir fixtures return42, and installed
opcode/fold/control/conditional components pass off-checkout.

Changes: scalar opcode flags with literal const masks; integer/shared PHI
conversion; canonical single-predecessor regions; raw-clone literal folding;
direct AArch64 CSET for literal boolean choices. Attribution and distinctions
from pinned upstream live in central PROVENANCE.md.

The exact property feedback kernel regresses with the later graph changes:
latest matched medians0.101378792s before,0.110810375s after, LLVM0.036132583s.
Fewer branches did not make this kernel faster; do not describe each component
as a performance win. Five alternating samples and excluded warmup, identical
fixture; raw samples for all intermediate regressions are in canonical-kernels.
The full compiler result above determines the observed bootstrap effect.

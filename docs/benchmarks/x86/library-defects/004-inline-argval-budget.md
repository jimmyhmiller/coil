# 004: an ARGVAL private copy is not in the inliner's preflight size, and the overrun is a hard error

Library `feature/x86` d278aba (introduced by the fix of 001, `9cb940a`).
Reproducer: `004-inline-argval-budget.coil` (copy to the library's
`tests/x64-inline-argval-budget.coil`): budgets 4 to 10 print `FAILED: budget
N: inline cloning exceeded preflight budget`.

**What happens.** `call-inline` decides a site by the callee's clone size
(`eligible-remembering?`, `base-clone-cells`) against the remaining budget.
`apply!` then also adds the private copy of an ARGVAL argument whose callee
writes or passes the parameter on (a frame object in the caller's entry prefix
and a block move at the call). After the expansion `added > remaining` and the
whole optimization returns `Err "inline cloning exceeded preflight budget"`
(`call-inline.coil`, the `cond` after `apply!`).

**In the Coil compiler.** With the adapter's 001 workaround removed, the
compiler's own `-O3` build stops at
`stogir: coil.compiler.expander.defderive-params: inline cloning exceeded
preflight budget`. The smoke programs pass.

**Expected.** The preflight counts the cells the copy will add for each ARGVAL
argument that needs one (the read-in-place case adds none), so a site that
does not fit is declined like any other.

**Adapter state.** The 001 workaround (`template-candidate?` refuses a
function with a MEMORY-class parameter) is back in place because of this, so
ARGVAL sites are still never inlined in the Coil compiler.

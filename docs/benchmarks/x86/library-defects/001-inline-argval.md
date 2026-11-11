# 001: the inliner puts an ARGVAL where the callee's MEMORY parameter was

Library `feature/x86` 9342480. Reproducer: `001-inline-argval.coil` (copy to
the library's `tests/x64-inline-argval.coil`; `tools/x86/remote-test.sh`).
It prints `FAILED: the expanded graph does not compile: ARGVAL is only valid as
a CALL argument`.

**What happens.** `stogir.call-inline` accepts a site whose prototype has a
`calls/memory-parameter!` record and whose argument is the `ARGVAL`
(`compatible?` matches the two prototypes), and maps the callee's ADDR `PARAM`
to the argument node, as it does for a scalar. The expanded graph then uses the
ARGVAL as an ordinary address. `rewrite/validate` accepts it; `argument-value/
verify` (run by `compile/image`) rejects it, and when the callee converts the
parameter first (the Coil adapter's `container!`) `conversion/validate` rejects
it with "conversion requires an ordinary value". In the Coil compiler this
stopped every `-O3` build that inlines a function taking an aggregate larger
than 16 bytes by value (seven of the nine corpus programs).

**Why it is also a semantic question.** The callee owns a private copy: it may
write through the parameter, and the caller's object must not change. Mapping
the PARAM to the ARGVAL's source address would be wrong unless the callee is
proven not to write or capture the parameter (the effect records the library
already derives could prove that).

**Expected.** Either the site is declined, or the expansion gives the clone a
private copy (a frame object of the record's size and alignment in the caller,
a block move from the ARGVAL's source at the call's control position, the
PARAM mapped to the frame object), or, with a proof that the callee neither
writes nor captures it, the PARAM maps to the source address directly.

**Adapter workaround in place.** `codegen_stogir.coil` `template-candidate?`
does not offer a function with a MEMORY-class parameter as an inline template.
Remove that condition when this is fixed; it costs the inlining of such
functions (for example `coil.fmt`'s number formatting takes `IntDigits` by
value).

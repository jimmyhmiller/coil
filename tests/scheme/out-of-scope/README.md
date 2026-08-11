# Historical provenance

This directory no longer lists deliberate R5RS exclusions. Continuations,
`dynamic-wind`, and proper tail recursion have graduated into the bounded public
gate under `tests/scheme/cases/`.

`02-tail-calls.scm` is retained only as the original failing artifact that
motivated the native `musttail` request trampoline. Its requirements are now
covered more aggressively by `tail_calls.coil`, `tail_closure.coil`, and
`03-callcc-tail.scm`, including mutual/computed calls and continuation-aware tail
loops across collection thresholds.

New known conformance gaps must be recorded in the live ledger at
`docs/reference/R5RS_STATUS.md` and accompanied by an executable case. Do not
move a passing requirement back here merely to keep the bounded gate green.

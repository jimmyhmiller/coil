# Integer vector doubling selection

AArch64 target matching selects integer vector MUL by a direct typed SPLAT(2)
as ADD(source, source). This is a target rule, not a semantic graph rewrite or
an upstream vectorizer claim. The compact graph remains unchanged. Integer
lane arithmetic wraps at the original width; floating-point and Boolean
multiplication do not use this rule.

The persistent plan redirects both machine inputs to the selected source before
liveness. Constraints require that source and the result. Emission consumes the
selected operation, without rediscovering the rule. A broadcast is omitted only
when all uses were absorbed and it is not an observable root. Shared/stored/rooted
broadcasts remain. COPY barriers are never bypassed: a HARD data COPY may be the
selected source, while a COPY around a splat or its scalar literal prevents
recognition. Commuted operands and identical splat operands are handled.

Focused validation passes:

- 180 D/Q configurations across ten integer bases and nine sharing/barrier modes;
  1980 native cases with independent bytewise modulo arithmetic, whole destination
  red zones and unchanged input checks. AddressSanitizer passes.
- Persistent plans with fusion disabled/enabled check exact redirected inputs,
  broadcast omission and retained data COPY. Floating-point types reject selection.
- Six linked AOT cases check 64-bit overflow and red zones through the same image
  path. Captured stencil 60 checksum checks pass with AddressSanitizer.

Full combined compatibility passes 235 standalone programs and 72 linked AOT
consumers with frozen source/toolchain and fresh-object checks. Coil integration
and production measurements remain pending. No production
runtime improvement is claimed before the unchanged benchmark is rerun.

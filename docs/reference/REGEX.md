# Ahead-of-time regular expressions

`coil.regex/is-match?` is a metaprogram. Its pattern must be a string literal;
Coil parses it while compiling the caller and emits an allocation-free state
machine. The regex parser and pattern do not remain in the executable.

```coil
(import "coil.regex" :as regex)

(regex/is-match? "^(?i:[a-z][a-z0-9_]{2,15})$" username)
```

## Syntax

The current byte-oriented engine supports:

- concatenation, `|`, capturing-syntax groups `(…)`, and noncapturing groups
  `(?:…)`;
- `.`, byte classes, ranges, and negated classes;
- greedy `*`, `+`, `?`, `{m}`, `{m,}`, and `{m,n}` repetition;
- lazy spelling (`*?`, `+?`, `??`, and `{m,n}?`). For boolean matching,
  greedy and lazy preference recognize exactly the same language;
- `^`, `$`, `\b`, and `\B` as zero-width assertions, including inside groups
  and alternatives;
- ASCII `\d`, `\w`, `\s` and their complements `\D`, `\W`, `\S`;
- `\xNN`, `\0`, `\a`, `\e`, `\f`, `\n`, `\r`, `\t`, and `\v`, plus escaped
  punctuation;
- scoped ASCII case-insensitive, dot-all, and multiline modes: `(?i:…)`,
  `(?s:…)`, `(?m:…)`, and combinations such as `(?is:…)`.

Matching is an unanchored search unless assertions anchor it. Dot excludes LF
unless `s` is scoped around it. Word characters and case folding are ASCII.

## Deliberate limits

This API currently returns only a boolean, so group syntax affects precedence
but does not expose captures. Match spans, capture results, replacement, and
iteration need APIs with a tagged state machine rather than pretending a
boolean result contains that information.

Unicode properties and case folding, lookaround, backreferences, atomic groups,
and possessive quantifiers are not implemented. Unsupported `(?…)` forms and
alphanumeric escapes are compile-time errors instead of being interpreted as
literals with surprising behavior.

The bit-parallel runtime currently permits at most 63 Thompson states. Large
counted repetitions can reach this explicit compile-time limit. A multiword
state set is the next representation tier.

The engine guarantees linear runtime for every accepted expression. Adding
backreferences would require a separate execution tier with a different
complexity contract.

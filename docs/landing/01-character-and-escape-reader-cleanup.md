# Porting dossier: character and escape reader cleanup

## Goal

Give Coil one unambiguous spelling for character literals and hexadecimal string
escapes:

```coil
#\a
#\newline
"\x1f600;"
c"\x00;"
```

The terminating semicolon makes a hexadecimal escape self-delimiting and permits
Unicode scalar values. The `#\` prefix prevents a character literal from being
confused with an escaped symbol. This cleanup also gives reader configurations a
typed character spelling, which the reader-metaprogram feature uses.

This is language syntax work, not Scheme or Jolt compatibility. Scheme happened
to expose some edge cases, but the behavior belongs to Coil's default reader,
parser, formatter, documentation, and migration tooling.

## Branch provenance

- `0364fdb` — terminated Unicode hexadecimal escapes.
- `e547189` — syntax-preflight lint migration for legacy `\xHH` escapes.
- `645ddae` — canonical `#\c` character literals and migration from `\c`.

Do not cherry-pick these blindly: `645ddae` also touched Scheme files because the
branch was using Scheme as a consumer. Those changes are optional integration,
not part of the generic syntax cleanup.

## Required behavior

### Hexadecimal escapes

- Accept one or more hexadecimal digits followed by `;`.
- Decode a Unicode scalar and encode it as UTF-8 in ordinary strings.
- Preserve the intended byte behavior for C strings while still requiring the
  explicit terminator.
- Reject an empty digit sequence, a missing terminator, values above `0x10ffff`,
  and surrogate code points.
- Do not silently accept the old unterminated two-digit spelling in compilation.

### Character literals

- Accept canonical one-character forms such as `#\a` and punctuation forms.
- Accept documented names such as `#\newline`.
- Keep character values represented as the existing integer code point at the
  typed-language boundary; this feature changes syntax, not runtime layout.
- Ensure formatter output uses the canonical spelling and round-trips through
  the reader.

### Migration

`coil lint --fix` must be able to rewrite legacy syntax before ordinary parsing,
import loading, or type checking. This is important: invalid old syntax cannot
be migrated by a linter that first requires a successful compile.

## Implementation anatomy

- `src/stdlib/reader.coil`
  - terminated hex scanning;
  - Unicode scalar validation and UTF-8 emission;
  - canonical character token recognition.
- `src/compiler/parser.coil`
  - conversion from the reader's character token to the existing typed literal.
- `src/compiler/formatter/cst.coil`
  - canonical character output.
- `src/compiler/driver.coil`
  - syntax-preflight migrations for legacy escape and character forms.
- `scripts/dev.py`
  - bounded modernization-gate assertions, including idempotence.
- `docs/reference/LANGUAGE_GUIDE.md`
  - source of truth; regenerate `src/compiler/guide.coil` with
    `scripts/docs/gen-guide.py`.
- `tests/compiler/features/terminated_hex_escape.coil` and
  `tests/compiler/features/hash_character_literal.coil`.

## Extraction strategy

1. Port terminated hexadecimal reading and its focused test.
2. Port the preflight legacy-escape migration and prove a second fix is a no-op.
3. Port canonical character reading/parser/formatter behavior and its test.
4. Port the legacy-character migration separately.
5. Regenerate the embedded language guide rather than copying its diff manually.
6. Update generated source fixtures only where their literal spelling actually
   changes.

Avoid bringing over Scheme forms/ports unless a generic test proves they are
needed. Scheme can adopt the canonical spelling in a later integration change.

## Known gaps and questions

- Decide and document whether C-string hexadecimal escapes encode Unicode or
  exact bytes. The branch implementation should be reviewed against the current
  main contract rather than inferred from tests alone.
- Audit every named character accepted by the reader; Chez's larger name set is
  a separate compatibility concern.
- The migration must not rewrite backslashes inside comments or unrelated token
  kinds.
- Generated files such as the llhttp corpus need regeneration provenance, not a
  hand-edited bulk diff.

## Acceptance

- Focused positive and negative reader tests pass.
- Reader/formatter round-trip is stable.
- `lint --fix` migrates both legacy forms and is idempotent.
- Ordinary escaped symbols remain unaffected.
- `python3 scripts/dev.py test modernize-fast --compiler <candidate>` finishes
  under its 30-second bound.
- Relevant read/full/diagnostic snapshots are reviewed and refreshed together.


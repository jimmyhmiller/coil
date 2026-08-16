# Copy-ready prompt: character and escape cleanup

```text
Start from the latest `main` branch in the Coil repository. Read and follow
AGENTS.md, then run `coil guide` before writing Coil code.

Implement the language-level character and escape cleanup described in:

  git show origin/feat/scheme-continuation-pass:docs/landing/01-character-and-escape-reader-cleanup.md

Research provenance is `0364fdb`, `e547189`, and `645ddae` on
`origin/feat/scheme-continuation-pass`. Inspect those commits, but do not merge
the branch or cherry-pick their Scheme/Jolt changes.

Implement this as a small, reviewable series:

1. terminated `\xHEX;` Unicode scalar escapes with focused positive/negative
   reader tests;
2. syntax-preflight `lint --fix` migration for legacy hex escapes, including
   idempotence;
3. canonical `#\c` character literals across reader, parser, and formatter;
4. syntax-preflight migration from legacy character spelling.

This is generic Coil syntax work. Do not import Scheme/Chez compatibility,
reader metaprograms, linked Code lists, or aggregate branch snapshots. Preserve
the current main contract for C-string bytes and explicitly document any choice
needed there.

Regenerate `src/compiler/guide.coil` from the language guide rather than editing
it by hand. Run focused tests, the bounded modernize-fast gate with one candidate,
and the relevant read/full/diagnostic snapshot audit. Commit the result in
logical main-ready commits and report tests plus any deliberate snapshot scope.
```


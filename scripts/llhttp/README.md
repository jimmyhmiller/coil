# llhttp Coil backend

This directory contains Coil's source backend for the `llparse` state-machine
compiler. It consumes the exact dependency graph from the pinned llhttp 9.4.3
checkout and emits `src/stdlib/llhttp_generated.coil`.

The generated file is checked in. Normal Coil builds therefore require neither
Node.js nor npm. Regeneration and parity testing use an upstream checkout whose
version and Git revision are verified before its graph is loaded.

During the migration, upstream C llhttp is retained only as a differential
oracle. It is not part of the final Coil runtime.

Run `scripts/llhttp/regenerate.sh` to download the checksum-pinned `v9.4.3`
source and regenerate both the state machine and checked-in differential corpus.
You may pass an existing checkout to avoid the download; its package version is
verified. The tag resolves to `45c8699d0ca8431ab366c8706e613b2e2ac62c04`.

`regenerate.sh` reproduces `src/stdlib/llhttp_generated.coil` and
`tests/llhttp_corpus_generated_test.coil` exactly. Do not edit either by hand;
change the generator and regenerate.

## Deliberate divergence from upstream C llhttp

The generated parser matches upstream llhttp 9.4.3 byte for byte in every
callback, error code, error position and reason, with one exception.

**A NUL byte in a header value with `LENIENT_HEADER_VALUE_RELAXED` set is
rejected; upstream loops forever.** With the relaxed flag on and
`LENIENT_HEADERS` off, upstream's graph cycles without consuming input:

    header_value_relaxed            table lookup; its table leaves out 0, 10, 13
      -> header_value_otherwise     handles LF and CR only
      -> invoke_test_lenient_flags  (lenient_flags & HEADERS: clear)
      -> invoke_test_lenient_flags  (lenient_flags & HEADER_VALUE_RELAXED: set)
      -> header_value_relaxed       ... on the same byte, forever

Reproducer (upstream C, from a `v9.4.3` release build):

    llhttp_init(&p, HTTP_REQUEST, &settings);
    llhttp_set_lenient_header_value_relaxed(&p, 1);
    llhttp_execute(&p, "GET / HTTP/1.1\r\nt:\0", 19);   /* never returns */

Only byte 0 triggers it: the relaxed table admits every other byte except CR
and LF, which `header_value_otherwise` handles. The relaxed table already
treats NUL as invalid, so `generate-coil.ts` (`patchRelaxedHeaderValueNul`)
adds one edge: byte 0 in `header_value_relaxed` goes where the relaxed test
goes when the flag is clear, the `on_header_value` span end followed by
`Invalid header value char` (`HPE_INVALID_HEADER_TOKEN`), exactly as a strict
parser rejects the byte. The patch checks every node and edge of the cycle
by name and by meaning before it applies, and generation fails if upstream
changes that shape. When upstream fixes the bug, the check fails and the patch
should be removed. `tests/llhttp_coil_test.coil`
(`relaxed-header-value-rejects-nul`) covers the behaviour.

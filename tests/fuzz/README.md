# Fuzz targets

Each `*_fuzz.coil` file here is a set of `defprop`s aimed at one part of the
standard library, written to be run as a **fuzzing campaign**:

```sh
coil fuzz tests/fuzz/json_fuzz.coil --time 300 --jobs 4 --sanitize=address
python3 scripts/tests/fuzz_targets.py --compiler build/bin/coil --time 60   # all of them
```

They are ordinary properties, so `coil test tests/fuzz/json_fuzz.coil` runs them
too — generation only, and it replays any counterexample a campaign saved.
The `_fuzz` suffix keeps them out of a bare `coil test`: a campaign is something
you run on purpose, locally, not on every change.

| Target | Area | Properties |
|---|---|---|
| `json_fuzz.coil` | `coil.json`, `coil.serde.json`, `coil.serde.value` | differential against an independent recognizer, tape consistency, string/number oracles, JVal and derived-record round trips, a failing writer |
| `reader_fuzz.coil` | `coil.reader` (the compiler's own reader) | arbitrary and reader-shaped text read sanely under three configs, span sanity, print→read round trip, integer and `\uHEX` oracles, deep nesting |
| `text_fuzz.coil` | `coil.unicode.grapheme`, `coil.str` | UAX #29 segmentation against an independent model, UTF-8 validation, formatting/parsing/search/split/trim against naive references, String/StrBuf/map models |
| `serde_fuzz.coil` | `coil.serde.msgpack`, `coil.serde.sexp`, `coil.serde.derive`, `coil.serde.value` | round trips of derived records and sums, differentials against deliberately unusual (but valid) encoders, raw/structured/mutated documents that must re-encode to the same value, truncation, derive options |
| `http_fuzz.coil` | `coil.http.parser` (the llhttp port), `coil.http.server` | split invariance over generated pipelines and raw bytes, pause/resume transparency, exact round trips of well-formed requests and responses, `parse-request` round trip and `consumed`, strict-mode violations refused |
| `http_upstream_fuzz.coil` | the same, against upstream C llhttp 9.4.3 | callback-for-callback differential (trace, errno, error offset, reason, `finish`) over raw bytes and generated streams, any lenient flags and chunking; pause schedules, `on_headers_complete` results and injected callback errors; `parse-request` against `scripts/native/llhttp_shim.c` |
| `collections_fuzz.coil` | `coil.hashmap`, `coil.arraylist`, `coil.pvec`, `coil.pmap`, allocators | model-based operation sequences, persistence of every version, allocator block integrity, leak and double-drop accounting |

Between them the first campaigns found (and the tree now fixes): a stack overflow
and a heap overread in the JSON stack, lossy float and depth handling in
serde_json, five reader bugs (unlocated errors, split UTF-8 character literals,
silently wrapping integer literals, `\uHEX` wrapping, stack overflow on deep
nesting), a negative-index write in `string-truncate!`, a size-mismatched hand-off
in `al-into-slice`, arena alignment of offsets rather than addresses, a quadratic
free in `coil.dbgalloc`; in msgpack/sexp, a token-tape overread, uninitialized
skipped fields, stack overflow on deep nesting, quadratic map decoding, a bare
tag that swallowed the next value, trailing bytes accepted, malformed floats
accepted; and two compiler ownership bugs (generic locals wrapping `T` never
dropped, stores through `(mut T)` not dropping the old value).

## The HTTP targets

`http_fuzz.coil` needs only the standard library:

```sh
coil fuzz tests/fuzz/http_fuzz.coil --time 300 --jobs 4 --sanitize=address
```

`http_upstream_fuzz.coil` links upstream C llhttp, so it needs the oracle
archive `scripts/native/build-llhttp.sh` builds (the same one the llhttp
differential test uses). That script downloads the checksum-pinned llhttp 9.4.3
source and runs `npm`, so it needs the network once; the archive lands in
`build/bin/native/llhttp/<arch>-<os>/libllhttp.a` and is reused after that. It
contains upstream's state machine and API, `scripts/native/llhttp_shim.c`, and
`tests/fuzz/native/http_fuzz_trace.c`, which drives upstream over the same
chunks, pauses and callback results as the Coil side and writes the same trace.

```sh
scripts/tests/http-upstream-fuzz.sh --time 300 --jobs 4 [--sanitize=address]
coil test tests/fuzz/http_upstream_fuzz.coil \
  --link-flag build/bin/native/llhttp/arm64-macos/libllhttp.a
```

`coil fuzz` has no `--link-flag`; it takes link inputs from the working
directory's `Coil.toml`. The script therefore runs the campaign in
`build/fuzz/http-upstream/`, whose manifest links the archive, and the corpus
persists there.

These targets print their own inputs rather than using `prop-note`: replay with
`HTTP_FUZZ_VERBOSE=1` to print a failing case's input and both traces, or
`HTTP_FUZZ_SHOW=1` to print every input before it runs.

These targets found, and the tree fixes: Content-Length and chunk sizes of 2^63
and more read before the buffer (a signed length compare in the generated
parser), an infinite loop on NUL in a relaxed header value (inherited from
upstream llhttp; see `scripts/llhttp/README.md`), `parse-request` misreporting
HTTP/0.9 and HTTP/2.0 and returning error code 0 for empty input, and
`coil emit-ir` rewriting `"#0"` inside string constants.

## Writing a target

- **State a law, not an example.** The strongest properties need no expected
  output: a round trip (`decode (encode x) = x`), a differential against an
  independent, obviously-correct reference, a model (apply the same operations to
  the real structure and to a list; compare), or an invariant of the output
  (every span inside its parent). "Does not crash" is the weakest law; keep it,
  but do not stop there.
- **Generate structure.** Arguments come from `Arbitrary` impls; build inputs
  from values (`(derive Arbitrary Debug T)`, a grammar generator), not from bytes,
  so the fuzzer's structural mutations — delete, repeat, splice an element or a
  subtree — have something to work on. Wrap each element a collection generator
  draws in a `SPAN-ELEM` span. Keep one byte-level property per parser as well
  (`arb-bytes` draws the full 0–255 range; a `(slice u8)` argument is printable
  ASCII).
- **Make failures readable.** A value drawn inside the body is not an argument, so
  a counterexample shows it only if you name it: `(prop-note "label" EXPR)` or
  `(prop-draw T "label")`. A wrapper type with its own `Arbitrary` and `Debug`
  impl works too, and prints best.
- **Read `coverage.txt`.** After a campaign, `.coil/fuzz/<property>/coverage.txt`
  lists the functions it never entered. Code nothing reaches is code the target
  does not test, however green it runs.
- **A bug the target finds gets fixed, not stepped around.** While a fix is in
  progress an `(assume …)` can keep a campaign searching past it, but it does not
  belong in a committed target.

## `regress/`

Deliberate failures that pin down the fuzzer itself: each plants one bug that a
blind property run cannot reach and a working campaign reaches in seconds. They
are named `*_regress.coil` so nothing discovers them;
`scripts/tests/fuzz_gate.py` (part of `scripts/dev.py test prop`) runs them with
fixed seeds and checks the exact minimized counterexample and kind of failure.

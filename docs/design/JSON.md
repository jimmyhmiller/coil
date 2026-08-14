# JSON subsystem

Status: implementation baseline for `feature/json`.

## Goals

Coil's JSON support has three deliberately separate paths. Keeping them separate is
important: a tape parser, an owned tree, and direct struct decoding solve different
problems and must not be presented as one benchmark number.

1. **Document/tape** — validate once and retain compact, zero-copy spans into the
   input. This is the fast path for lookup, filtering, and direct typed decoding.
2. **Dynamic value** — an owned recursive `Json` sum with null, bool, signed integer,
   unsigned integer, float, decoded UTF-8 string, array, and insertion-ordered object
   variants. This is the flexible tree users can inspect and mutate.
3. **Typed codec** — generated code which decodes directly from the tape into a Coil
   struct and serializes a struct directly into a writer/byte buffer. The normal path
   must not construct a dynamic tree.

The public model follows Serde's useful separation between a format-independent
serialization protocol and JSON's concrete parser/writer, but the implementation is
a Coil library over traits, macros, and compile-time reflection. JSON derive is not a
compiler keyword.

## Required API baseline

### Syntax and data correctness

- Accept exactly one RFC 8259 JSON value with JSON whitespace around it.
- Validate UTF-8 everywhere. Decode all string escapes, including UTF-16 surrogate
  pairs, and reject lone/invalid surrogates and unescaped controls.
- Parse numbers without loss when they fit `i64` or `u64`; otherwise retain/produce an
  `f64`, rejecting overflow and non-finite values. Preserve exact number text on the
  document/tape path.
- Define duplicate object key behavior. The document path preserves duplicates and
  order. Typed structs reject duplicate known fields by default. Dynamic objects use
  last-value-wins lookup while preserving source order.
- Enforce a configurable nesting limit and return a structured error containing byte
  offset, line, column, category, and an optional field/index path.
- Never read beyond the supplied slice; embedded NUL is not an input terminator.

### Dynamic values

- Parse to and serialize from the recursive `Json` sum.
- Query values by type, array index, object key, and JSON Pointer.
- Create, insert, replace, remove, iterate, deep-compare, and free owned values.
- Compact and pretty serialization; correct escaping; deterministic optional key
  sorting; caller-supplied allocator and writer.

### Typed values

- `JsonSerialize` and `JsonDeserialize` protocols with implementations for booleans,
  integers, floats, strings, `Option`, arrays/slices/lists, maps, structs, and sums.
- `(derive-json Type)` generates both directions using `code-field-*` and
  `code-variant-*` reflection. Generated decoding goes tape-to-struct directly.
- Struct policy: rename/rename-all, alias, default, skip, skip-if, flatten,
  deny/ignore/capture unknown fields, borrowed vs owned strings, and per-field custom
  `with` encoder/decoder.
- Sum policy: externally tagged default plus internal, adjacent, and untagged forms;
  per-variant rename/alias and catch-all variant.
- A handwritten implementation is the universal customization escape hatch. A
  generated implementation may delegate individual fields to handwritten codecs.
- `to-json`, `to-json-pretty`, `from-json`, `to-json-value`, and `from-json-value`
  convenience functions return `Result`; serialization never silently emits invalid
  JSON.

### Streaming and resource behavior

- Parse a complete slice, one value from a prefix, and repeated JSON/NDJSON values.
- Serialize to `StrBuf` or any `Writer` without building an intermediate tree.
- Explicit ownership: borrowed tape strings live as long as the input; owned dynamic
  and typed strings live in the caller's allocator; every owning document/value has a
  matching free operation.
- Parsing failure releases allocations made by that parse.

## Correctness gates

1. Unit tests for every scalar, escape, boundary number, container, policy, derive,
   customization hook, ownership rule, and error location.
2. The `nst/JSONTestSuite` parsing corpus: every `y_` input accepted, every `n_`
   input rejected, and `i_` inputs recorded as explicit policy decisions.
3. Round trips (`parse -> write -> parse`) over the corpus and generated nested data.
4. Differential semantic checks against two mature parsers, including decoded strings
   and numeric values—not merely "parse succeeded".
5. Depth, huge token, malformed UTF-8, allocator-failure, debug-check, and AddressSanitizer
   tests. Fuzzing is a required release gate once a stable fuzz entry point exists.

## Performance baseline

Canonical fixtures are `twitter.json` (mixed social payload), `citm_catalog.json`
(deep object/array structure), and `canada.json` (number-heavy GeoJSON), sourced from
`serde-rs/json-benchmark`. Add tiny-message and NDJSON corpora so large files do not
hide startup and per-document costs.

Report at least these independent operations:

| Operation | Coil path | Fair comparisons |
|---|---|---|
| validate + build index | tape | simdjson DOM/tape-like, yyjson DOM |
| known-field extraction | tape/on-demand | simdjson On-Demand |
| dynamic parse | owned `Json` | yyjson DOM, serde_json `Value` |
| typed parse | generated direct decoder | serde_json derived struct |
| compact serialize | dynamic and typed separately | yyjson, serde_json |
| parse + mutate + serialize | owned `Json` | mutable DOM implementations |

The harness loads fixture bytes before timing, reuses the parser only where the public
API permits it, runs enough iterations to amortize process startup, and consumes a
semantic checksum from every iteration. It records CPU, OS, compiler versions, parser
versions, optimization flags, fixture SHA-256, bytes/s, allocations/bytes allocated,
and peak RSS. Median and dispersion come from `hyperfine`; cold-start/build time is
not mixed into runtime throughput.

Initial performance targets are directional, not claims: the scalar tape parser should
reach at least 500 MB/s on `twitter.json` on a modern Apple/AMD core; typed direct decode
should beat dynamic-tree decode; serialization should avoid an intermediate tree; and
no optimization may weaken the correctness gates.

## Reference designs

- simdjson: strict validating SIMD parser and On-Demand API; its tape/index separation
  is the closest performance reference for Coil's document path.
- yyjson: small portable ANSI C reader/writer with allocator hooks, accurate `i64`,
  `u64`, and `double`, and a strong DOM benchmark suite.
- serde + serde_json: the functionality reference for dynamic `Value`, generated typed
  codecs, enum representations, and customization attributes.

Benchmark claims must be regenerated locally. Upstream headline numbers are context,
not Coil results.

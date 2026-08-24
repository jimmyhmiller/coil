# Proper strings for Coil

Status: partially implemented

The first standard-library increment is implemented in `coil.str`: `StringView`,
owned `String`, `Rune`, `StringIndex`, UTF-8 validation, scalar iteration, explicit
clone/free/transfer, allocation-free trimming and splitting, and the `Text` and
`TextWrite` traits. `coil.unicode.grapheme` implements Unicode 17 extended grapheme
`Char` iteration and passes the official conformance corpus. `(sv "...")` provides
explicit literal construction while existing literals and `(slice u8)` APIs remain
compatible. `coil.lint.string` implements the report-only annotation inventory;
transactional cross-caller fixes remain future work described below.

## Summary

Coil should distinguish text from bytes and borrowed text from owned text:

| Type | Meaning | Ownership | Mutable? |
| --- | --- | --- | --- |
| `(slice u8)` | arbitrary bytes | borrowed | through `(mut ...)` |
| `StringView` | valid UTF-8 | borrowed | no |
| `String` | valid UTF-8 | owned | yes, at UTF-8 boundaries |
| `Rune` | one Unicode scalar value | value | no |
| `Char` | one extended grapheme cluster | borrowed view | no |

`StringView` and `String` are sequences of text, not collections addressable by integer.
They therefore do **not** implement `Get` or `Set`. They implement `Iterable` with
`Char` as the element, while explicit views provide the other units:

```coil
(bytes text)       ; (slice u8), O(1)
(runes text)       ; UTF-8-decoding iterable of Rune
(chars text)       ; grapheme-breaking iterable of Char
```

The default iteration unit is `Char`, following Swift's user-facing semantics:

```coil
(for-in [ch (iter text)] ...)
```

Byte and scalar iteration remain explicit. Positions returned by text operations
are opaque `StringIndex` values, not integers. Byte offsets remain available at the
systems boundary but cannot accidentally masquerade as character indices.

The design deliberately combines:

- Rust's UTF-8 invariant, owned/borrowed split, explicit byte access, and refusal
  to support integer indexing;
- Swift's separation of characters, Unicode scalars, and UTF-8 views, and its
  definition of a user-perceived `Character` as an extended grapheme cluster;
- Coil's explicit allocators, concrete iterator protocol, value-oriented structs,
  and simple trait dispatch.

## Goals

- Make invalid UTF-8 impossible inside `StringView` and `String`.
- Make ordinary text iteration Unicode-correct.
- Keep parsing, compiler work, protocols, and FFI byte-efficient.
- Make ownership and allocation visible and mechanically safe.
- Permit allocation-free borrowed text processing.
- Give generic APIs a small set of useful text traits rather than requiring one
  concrete representation.
- Keep costs legible: byte length is O(1); character count is O(n).

## Non-goals

- Locale-aware collation.
- Unicode normalization as an implicit side effect.
- Constant-time integer indexing by character.
- Hiding allocators behind a global heap.
- Making file paths or arbitrary OS strings text. Those remain byte/platform path
  types and require an explicit decoding step.
- A rope or other non-contiguous representation in the first implementation.

## Why `(slice u8)` is not enough

The current representation is an excellent byte span but cannot state three facts
needed by text APIs:

1. the contents are valid UTF-8;
2. mutation must preserve that invariant;
3. an owning value must release exactly the allocation it owns.

It also makes `(len s)` and `(get s i)` look like character operations when they
are byte operations. Renaming those operations does not repair the type-level
ambiguity.

## Core representation

### `Rune`

```coil
(defstruct Rune [(value u32)])
```

`Rune` represents one Unicode scalar value: `0...0xd7ff` or
`0xe000...0x10ffff`. Its constructors validate this invariant. It implements
`Eq`, `Ord`, `Hash`, and `Show`.

The name `Rune` is preferred over `Char`: in many languages `char` suggests a
code unit, while Coil's public `Char` means a user-perceived character.

### `StringView`

Conceptually:

```coil
(defstruct StringView [(data (ptr u8)) (byte_len i64)])
```

`StringView` has the same two-word runtime layout as `(slice u8)`, but carries the
invariant that its bytes are valid UTF-8. It is an immutable borrowed view. Empty
values may use a null data pointer.

This is a semantic type, not an alias: an alias could not restrict construction or
remove the inherited `Set` implementation of `(slice u8)`.

The initial implementation may use a public struct with private/primitive
construction until Coil has opaque fields. Safe code obtains one through literals,
validation, a `String` borrow, or UTF-8-preserving slicing.

### `String`

Conceptually:

```coil
(defstruct String
  [(data (ptr u8))
   (byte_len i64)
   (capacity i64)
   (allocator (dyn Allocator))])
```

`String` owns one contiguous allocation, stores valid UTF-8, and is growable. Its
layout intentionally matches Coil's `ArrayList` pattern. Capacity is measured in
bytes. Mutation is only exposed through operations that preserve valid UTF-8.

There is no separate `StrBuf`: `String` is the owned buffer and builder, as Rust's
`String` is. Formatting can append directly to it.

### `Char`

```coil
(defstruct Char [(text StringView)])
```

`Char` is a non-empty `StringView` containing exactly one Unicode extended grapheme
cluster. It is a borrowed view into its source. It implements `Eq`, `Hash`,
`Text`, and `Show`. It does not promise a fixed byte or scalar count.

The Unicode grapheme-breaking tables should be a separable standard-library
module so freestanding or size-sensitive programs can use `StringView`, `String`, bytes,
and runes without pulling them in.

## Ownership and cleanup

`String` follows Coil's existing `ArrayList` and `HashMap` model. It stores its
allocator, owns its buffer by convention, and has explicit cleanup:

```coil
(scope :done
  (let [(mut text) (string-new allocator)]
    (defer (string-free! (mut text)))
    ...))
```

`scope` guarantees that its direct `defer` forms run in reverse order on normal
exit and `(return-from :done ...)`. No borrow checker, compiler-inserted destructor,
reference count, or implicit heap is required.

Like the current owning collections, copying a `String` value copies its header,
not its allocation. Such a copy is an alias and must not be independently freed or
mutated in a way that invalidates the other header. APIs should therefore:

- take read-only `String` values only long enough to inspect them;
- take `(mut String)` for mutation and cleanup;
- return `StringView` when they mean a borrowed view;
- use `(string-clone allocator text)` for an independent owned copy;
- use `(string-take! (mut text))` when transferring the buffer out and resetting
  the source to empty.

This is the same discipline Coil already requires for `al-slice`, `al-into-slice`,
and `al-free!`. Debug checks should poison/reset a freed or transferred header so
double-free and obvious stale-header use fail loudly under `--debug-checks`.

An eventual move checker or automatic destruction facility could improve all Coil
resources, but it is explicitly not a prerequisite for strings.

## Literals and conversion

Ordinary literals should become `StringView`:

```coil
"hello"            ; StringView, valid UTF-8 in static storage
c"hello"           ; (ptr i8), unchanged FFI spelling
b"hello\xff;"      ; proposed (slice u8), arbitrary byte literal
```

Changing `"..."` from `(slice u8)` is source-breaking but worthwhile: source
strings already contain validated UTF-8 and almost always mean text. `b"..."`
makes byte intent explicit. A migration command can insert `b` where a byte slice
is expected.

Conversions are named by whether they validate, replace, borrow, copy, or transfer:

```coil
(string-view-from-utf8 bytes)             ; (Result StringView Utf8Error), borrows bytes
(string-view-from-utf8-unchecked bytes)   ; StringView, unsafe/primitive namespace
(string-view-bytes text)                  ; (slice u8), borrowed O(1)

(string-new allocator)            ; String
(string-from-str allocator text)  ; (Result String AllocError), copies
(string-from-utf8 allocator bytes); (Result String StringFromUtf8Error), copies
(string-from-utf8-lossy allocator bytes)
                                  ; (Result String AllocError), U+FFFD replacement
(string-into-bytes value)         ; OwnedBytes, transfers allocation when possible
(string-as-view value)            ; StringView, borrowed O(1)
(string-clone allocator text)      ; independent owned copy
(string-free! (mut value))         ; release and reset to empty
```

`Utf8Error` includes the valid prefix length and the failing sequence length when
known. This supports diagnostics and streaming repair without rescanning.

C conversion remains explicit because Coil strings are not NUL-terminated and may
contain interior NULs:

```coil
(with-cstr allocator text callback) ; temporary NUL-terminated copy
(string-from-cstr allocator ptr)     ; copies and validates
```

## Indices and slicing

```coil
(defstruct StringIndex [(byte_offset i64)])
```

`StringIndex` denotes a UTF-8 scalar boundary in one string. Public constructors do
not accept arbitrary integers. APIs that produce indices preserve the invariant:

```coil
(string-view-start text)                         ; StringIndex
(string-view-end text)                           ; StringIndex
(string-view-next-index text index)              ; (Option StringIndex), next grapheme
(string-view-prev-index text index)              ; (Option StringIndex)
(string-view-index-after-rune text index)        ; (Option StringIndex)
(string-view-byte-offset text index)             ; i64
(string-view-index-at-byte text offset)          ; (Option StringIndex), validates boundary
(string-view-slice text lo hi)                   ; StringView
```

Like Swift's indices, an index is only valid for the text value that produced it.
Unlike Swift's current compact index representation, the first Coil version cannot
dynamically prove provenance; passing an index from unrelated text is a documented
precondition checked in debug builds for bounds/boundary, not identity.

There is no `(get text 3)`. The expression is ambiguous, potentially O(n), and
almost always wrong for non-ASCII text. Algorithms either iterate or use explicit
indices/views. Byte slicing is available by converting to bytes; converting the
result back to `StringView` validates the boundary/content.

## Views and iteration

```coil
(defstruct Bytes [(text StringView)])
(defstruct Runes [(text StringView)])
(defstruct Chars [(text StringView)])
```

These view types implement `Len` only where the cost contract is honest:

- `Bytes`: `Len`, `Get`, `Iterable`; length and indexing are O(1).
- `Runes`: `Iterable`; `(rune-count ...)` is explicitly O(n).
- `Chars`: `Iterable`; `(char-count ...)` is explicitly O(n).
- `StringView`/`String`: no `Len` and no `Get`; use `(byte-len text)` or an explicit
  count operation.

`StringView` and `String` implement `Iterable` with `RuneIter`; the optional Unicode
module exposes `chars` and `CharIter` for grapheme clusters. This keeps the core
string module independent of Unicode tables while preserving explicit fast paths:

```coil
(for-in [r (iter text)] ...)           ; Rune
(for-in [ch (chars text)] ...)         ; Char, with coil.unicode.grapheme
(for-in [b (iter (bytes text))] ...)   ; u8
```

For parser/compiler hot paths, `RuneIter` exposes the current and next byte offset,
so decoding does not require rescanning or allocating an index object.

## Text traits

The traits should describe useful capabilities, not mirror every method on the
concrete types. Coil's x86 SysV classifier supports the two-word slice layout used
inside `StringView`, so these traits work through both static and dynamic thunks.

### Borrowing text

```coil
(deftrait Text [Self]
  (as-string-view [(value Self)] (-> StringView)))
```

`StringView`, `String`, and `Char` implement `Text`. Most read-only APIs should accept a
`Text` generic and call `as-string-view`; this permits future substring, inline-string, or
foreign-string representations without overloading every function.

Because Coil does not express returned-reference lifetimes, the resulting `StringView`
must not outlive the storage behind `value`. This is the same documented aliasing
contract as `al-slice`. APIs that need to retain text must explicitly clone it.

### Building text

```coil
(deftrait TextWrite [Self]
  (write-string! [(out (mut Self)) (text StringView)] (-> (Result i64 TextWriteError)))
  (write-rune! [(out (mut Self)) (rune Rune)] (-> (Result i64 TextWriteError))))
```

`String` and textual writers implement `TextWrite`. Formatting targets this trait,
so the same formatter can write to a string, file, socket buffer, or test sink.
The success value is bytes written. `TextWriteError` can carry allocation or I/O
failure through the concrete implementation's chosen error sum once Coil supports
associated error types; initially a common error sum is sufficient.

### Conversion to owned text

```coil
(deftrait ToString [Self]
  (to-string [(value Self) (allocator (dyn Allocator))]
             (-> (Result String ToStringError))))
```

This is for semantic conversion, not formatting as an accidental fallback.
Numbers implement `Display`, and generic conversion to a string is performed by
formatting into a `String`. Text values implement `ToString` as a copy/clone.

### Formatting

Prefer two distinct traits:

```coil
(deftrait Display [Self]
  (display [(value Self) (out (mut (dyn TextWrite)))]
           (-> (Result i64 TextWriteError))))

(deftrait Debug [Self]
  (debug [(value Self) (out (mut (dyn TextWrite)))]
         (-> (Result i64 TextWriteError))))
```

`Display` is user-facing; `Debug` is diagnostic and unambiguous. Neither allocates
unless its output does. This replaces protocols that require first constructing an
owned string merely to print a value.

### Standard conformances

`StringView`, `String`, and `Char` implement:

- `Eq`: canonical UTF-8 byte equality;
- `Hash`: the same bytes used by `Eq`;
- `Ord`: Unicode scalar-value lexicographic order, implemented efficiently over
  UTF-8 (which preserves scalar ordering lexicographically);
- `Text` and `Display`.

They do **not** normalize. Canonically equivalent strings such as precomposed and
decomposed `é` remain unequal unless explicitly normalized. Hidden normalization
would make construction, mutation, hashing, and FFI surprising. A later
`coil.unicode.normalize` module can provide NFC/NFD transformations and normalized
comparison.

`String` additionally implements `TextWrite` and `Push Rune`; `Collect` for `Rune`
and `Char` inputs remains follow-up work. It must not implement `Push u8`, because a single byte append can
violate UTF-8. Cleanup and independent copying remain explicit `string-free!` and
`string-clone` operations rather than traits with automatic-looking semantics.

## Everyday API

The initial surface should be deliberately small:

```coil
; queries
(byte-len text)
(empty? text)
(ascii? text)
(starts-with? text prefix)
(ends-with? text suffix)
(contains? text needle)
(find text needle)                   ; (Option StringIndex)
(compare text other)                 ; Ordering

; borrowed results
(trim text)                          ; StringView, Unicode whitespace
(trim-ascii text)                    ; StringView, small-table systems version
(split text separator)               ; SplitIter, no allocation
(lines text)                         ; LinesIter, no allocation
(string-view-slice text lo hi)       ; StringView

; owned mutation
(string-clear! (mut s))
(string-reserve! (mut s) bytes)
(string-push-str! (mut s) text)
(string-push-rune! (mut s) rune)
(string-insert! (mut s) index text)
(string-remove! (mut s) lo hi)
(string-truncate! (mut s) index)
```

Fallible allocation operations return `Result`; they never silently abort. Each
mutator provides the strong guarantee that allocation failure leaves the original
string unchanged.

Splitting and line traversal return iterators of borrowed `StringView` values instead of
allocating an `ArrayList`. A separate `(collect [...])` call makes ownership and
allocation explicit.

## Mutation rules

- Mutation requires `(mut String)`; `StringView` is immutable.
- Every public operation preserves valid UTF-8.
- Positions accepted by mutation are `StringIndex` boundaries.
- A mutation invalidates all `StringView`, `Char`, and iterator views into that `String`,
  even if the allocation does not move. As with `al-slice`, the caller must not use
  such a view after mutation.
- Unsafe byte mutation, if exposed, is scoped as a callback that must revalidate
  before returning. It should not expose a lasting `(mut (slice u8))`.

## Performance model

- Storage is contiguous UTF-8.
- `String` growth follows `ArrayList` amortized growth and uses its stored
  allocator.
- `byte-len`, `as-string-view`, and `bytes` are O(1).
- equality, ordering, hashing, validation, rune count, and character count are O(n).
- slicing with existing indices is O(1); finding an index by character count is
  O(n).
- ASCII detection may initially scan. A spare metadata bit/cache is an optional
  later optimization and should not complicate the first ABI.
- Small-string optimization and copy-on-write are deferred. They complicate
  allocator identity, pointer stability, moves, and FFI, and can be added behind a
  private representation after profiling.

## Migration

### TODO: annotation-driven text migration lint

Build `coil lint --fix strings` as an opt-in, semantic migration rather than a
global `(slice u8)` replacement. The first version should use a doc marker directly
above a declaration:

```coil
;; string
(defn greet [(name (slice u8))] (-> (slice u8)) ...)
```

The marker declares that every marked `(slice u8)` position in that declaration is
text. The lint should then:

1. rewrite marked parameter, return, field, and local types to `StringView`;
2. rewrite known byte-string operations to their text equivalents;
3. inspect all statically resolved callers and insert conversions where the types
   determine them unambiguously:
   - literal or already-valid text -> `StringView` directly;
   - `String` -> `(string-as-view value)`;
   - arbitrary `(slice u8)` -> `(string-view-from-utf8 value)`, propagating or
     explicitly handling the `Result` rather than assuming validity;
4. propagate the text type through private functions when every use is textual;
5. stop at public APIs, FFI, pointer arithmetic, byte mutation, serialization, and
   mixed text/byte use unless those declarations are also marked;
6. emit a precise remaining-work diagnostic at every ambiguous boundary instead of
   applying a speculative edit.

The marker is migration scaffolding, not a permanent semantic comment. After a
successful fix it should be removed because the resulting `StringView`/`String`
types carry the intent. A later version may offer `;; string: params=[name] return`
for mixed signatures, but the initial whole-declaration marker is deliberately
simple.

Before implementing fixes, add a report-only mode that classifies candidates as
safe, propagation-required, validation-required, or ambiguous. Test it first on
`src/compiler`, where many `(slice u8)` values intentionally remain raw source,
object data, paths, or protocol bytes.

1. Add `Rune`, `StringView`, UTF-8 validation, byte/rune views, and explicit conversion
   while literals still coerce to `(slice u8)` for compatibility.
2. Introduce owned `String` with explicit `string-free!`, make `StrBuf` a deprecated
   compatibility wrapper, and
   move formatting to `TextWrite`.
3. Change ordinary literals to `StringView`, add `b"..."`, and provide a mechanical
   migration command.
4. Add grapheme `Char`/`Chars` in the Unicode module and make `iter text` use it.
5. Deprecate byte-named string helpers (`char-at`, ambiguous `str-len`, and
   allocator-returning `str-concat`) in favor of the explicit APIs.

The compiler and low-level standard library may continue to use `(slice u8)` where
their data is intentionally byte-oriented. Migration should not turn every byte
buffer into Unicode text.

## Decisions and rejected alternatives

### Make `String` reference-counted with copy-on-write

Rejected initially. It gives Swift-like value ergonomics, but Coil has no automatic
copy/destruction hooks, atomics policy, or implicit allocator. Adding those solely
for strings would be a hidden runtime model inconsistent with the rest of Coil.
Explicit cleanup is consistent with Coil's other owning collections.

### Keep one string type and use methods for ownership

Rejected. A two-word borrowed view and a four-word owner have different validity,
mutation, and destruction rules. Encoding those differences only in function names
cannot make illegal ownership operations unrepresentable.

### Define strings as collections of bytes

Rejected for the public text abstraction. It repeats the current ambiguity and
allows mutation into invalid UTF-8. The byte view remains first-class and cheap.

### Define strings as collections of Unicode scalars

Rejected as the default. Scalars are right for lexers and Unicode algorithms but
wrong for user-visible character operations such as deleting an emoji or cursor
movement. They remain an explicit view.

### Store UTF-32 for constant-time indexing

Rejected. It uses substantially more memory for common text, still does not provide
constant-time grapheme indexing, and is a poor match for files, networks, Unix APIs,
Wasm hosts, and Coil's existing UTF-8 literals.

### Make canonically equivalent strings equal

Rejected. It makes `Eq` and `Hash` depend on Unicode normalization tables and hides
linear work. Exact equality plus explicit normalization is predictable and suitable
for identifiers, protocols, and systems work.

## Open questions

1. Should `iter StringView` require the Unicode grapheme module, or should core `iter`
   yield `Rune` while `(chars text)` opts into graphemes? This proposal favors
   graphemes for the default user model but recognizes code-size pressure.
2. Should `Ord` be byte/scalar lexicographic at all, or omitted to prevent users
   mistaking it for locale collation? The proposed ordering is deterministic and
   useful for maps/builds, but documentation must call it non-linguistic.
3. Is the documented `as-string-view` lifetime convention acceptable on a trait method, or
   should APIs accept `StringView` explicitly until Coil can express borrowed returns?
4. Should allocation failure use `AllocError`, the existing `Option` convention,
   or a richer standard error? The string API should choose consistently with the
   allocator redesign rather than invent a string-only convention.

## Acceptance criteria

The feature is ready to call a proper string type when all of the following hold:

- safe APIs cannot construct or mutate invalid UTF-8;
- cleanup composes with `scope`/`defer`, and debug checks catch double-free and
  obvious stale-header use;
- ownership transfer, cloning, and borrowed-view invalidation are documented and
  match the conventions of existing owning collections;
- byte, scalar, and grapheme iteration have distinct types and tests;
- integer indexing of text is rejected;
- allocation behavior is visible in signatures;
- literals, formatting, hashing, maps, FFI, and collection integration have a
  coherent migration path;
- Unicode conformance tests cover decoding and extended grapheme segmentation.

## References

- [Rust standard library, `std::string`](https://doc.rust-lang.org/stable/std/string/):
  UTF-8 growable `String`, conversion errors, and owned/borrowed operation.
- [The Rust Programming Language, “Storing UTF-8 Encoded Text with
  Strings”](https://doc.rust-lang.org/book/ch08-02-strings.html): rationale for
  rejecting integer string indexing and distinguishing bytes from scalar values.
- [Swift String
  Manifesto](https://github.com/swiftlang/swift/blob/main/docs/StringManifesto.md):
  strings as collections of extended grapheme clusters and explicit encoding
  views.
- [Swift Evolution SE-0464,
  `UTF8Span`](https://github.com/swiftlang/swift-evolution/blob/main/proposals/0464-utf8span-safe-utf8-processing.md):
  valid UTF-8 as a useful invariant and a two-word allocation-free borrowed view
  over contiguous bytes.

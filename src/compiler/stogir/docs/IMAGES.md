# Shared code images, JIT, and AOT

The standalone pipeline has an address-independent image boundary. Code and data
belong to the image, together with stable symbol IDs and explicit relocations.
The JIT resolves those IDs to runtime addresses. The Mach-O writer records them
for the system linker. Writing an object or loading an image leaves the source
image unchanged.

## Construction and ownership

`stogir.a64.compile/image` compiles a scalar function into an owned
`stogir.image/Image`, with its text and exported entry symbol. The image remains
valid after the graph is released. `compile/object` consumes that same path and
serializes it; it does not use a separate machine-code emitter or clone the text
into an intermediate image.

The image builder can additionally hold multiple functions, local/exported data,
undefined external symbols, and relocations. Graph compilation lowers named
FUNC/SYM/STR references into the same representation. Raw image construction
remains available for multiple definitions and explicit section layouts.

Use `image/release!` to release an image. `macho/image-object` returns owned object
bytes. `jit/map-image` and `jit/map-image-resolved` return an owned loaded image;
release it with `jit/release-image!`. See the executable ownership example in
[compile-image.coil](../tests/compile-image.coil).

## Named graph constants

`stogir.symbols` constructs FUNC, FUNC_ADDR, SYM, and STR constants using
upstream opcode/type/header conventions. `function!` accepts an exact object
name and a prototype string ID (zero means unspecified). `symbol!` accepts a
nonempty name without embedded zero bytes. `string!` accepts arbitrary bytes,
including an empty string or embedded zeros. `function-address!` represents a
numeric address and optional prototype. Each returns a graph-owned negative
constant reference.

`calls/attach!` stores a FUNC/FUNC_ADDR prototype ID in the constant's 16-bit
auxiliary header; other addresses retain the PROTO identity instruction.
Function, symbol, string, and numeric address constants remain distinct even
when their payloads match. Folding and immediate selection never interpret
unresolved name IDs as numeric addresses.

A named FUNC in a call emits BL with a BRANCH26 relocation. A matching exported
entry name binds recursive calls inside the image. Other named FUNC/SYM uses
emit ADRP/LDR through an aligned local data slot with an ABS64 relocation to the
actual symbol. The slot supports arbitrary 64-bit external addresses without
assuming that JIT code and external data are within ADRP range. STR materializes
ADRP/ADD to owned literal bytes with an appended zero; embedded zeros are retained.
Slots are shared by symbol, including function constants with different prototype
metadata. STR storage is shared by graph constant reference.

Temporary code buffers carry reference records as well as bytes; appending a
buffer rebases its records. Returns, arithmetic operands, memory operands, call
arguments/targets, and phi-edge literals use this common materializer. Public
names are registered before fresh private data labels are generated, so an entry
or external name cannot collide with a generated label. The image owns all
literal bytes and names independently of the graph. `compile/text` rejects code
with pending relocations; use `compile/image` or `compile/object` for such graphs.

COND supports named address conditions and arms. Named truth is evaluated at
runtime so an explicit zero-valued external binding selects the false arm.
Materialization preserves NZCV: conditional emission captures the condition
before reusing x16/x17 for both value arms. `code/materialize!` reports emitted
bytes for numeric and symbolic forms; its numeric primitive counts words
internally and is converted at the shared-buffer boundary.


## Sections and symbols

The model has text and mutable data sections. Each image carries power-of-two
`text-alignment` and `data-alignment` requirements, defaulting to four and eight
bytes. `image/require-alignments!` raises these requirements without weakening
older objects. `image/data-space!` reserves zeroed object storage and padding,
returns its section-relative offset, and raises the data requirement. The byte
arena is staging storage; its host pointer does not represent the final global
address. Architectural ADRP pages are **4 KiB**, independently of the OS granule.

`image/symbol!` interns an exported definition or an undefined external.
A later compatible definition fills an undefined symbol without changing its ID.
`image/local-symbol!` creates a definition that is not exported by the object.
Conflicting bindings or definitions fail. Symbol names are copied into an owned
arena, including when the supplied name is a substring of that arena.

Names are exact target object names. Darwin C symbols normally include the
leading underscore, such as `_labs`. The loader resolves by stable ID using
explicit address/presence arrays; it does not implicitly rewrite names or treat
address zero as a missing value.

Mach-O serialization orders local symbols, exported definitions, and undefined
symbols, sorting names within groups and remapping all relocation symbol indices.
Symbol values include the section's object address. Stable image IDs remain
unchanged. The writer emits LC_SYMTAB, LC_DYSYMTAB, and a macOS build-version
command. Symbol/relocation sorting uses merge sort rather than quadratic insertion
sorting, and section serialization uses reserved output storage and bulk copies.
These are implementation choices; throughput has not yet been benchmarked.

## Relocations

The relocation record's signed addend is authoritative. Existing pointer payloads
or instruction-immediate bits are replaced rather than counted as another addend.
Sites must fit their section; instruction sites align to four bytes. Overlapping
logical relocations fail validation in both consumers.

| Image kind | Meaning | Mach-O record |
| --- | --- | --- |
| ABS64 | 64-bit symbol address plus signed addend | ARM64_RELOC_UNSIGNED, addend in section bytes |
| BRANCH26 | B/BL displacement to symbol plus addend | ARM64_RELOC_BRANCH26 |
| PAGE21 | ADRP page displacement to symbol plus addend | ARM64_RELOC_PAGE21 |
| PAGEOFF12 | Low-page offset in ADD or unsigned-offset load/store | ARM64_RELOC_PAGEOFF12 |

Mach-O branch/page relocations with nonzero addends use a preceding
ARM64_RELOC_ADDEND record. That format has a signed 24-bit addend limit; ABS64
retains the full signed 64-bit addend. Relocations are written in descending
address order within each section. Local targets also use symbol-table references.

JIT instruction relocation checks final displacement and scaled-offset alignment.
It plans every patch before modifying the private copy, so a failed page/branch
relocation cannot leave a partially patched image. External branch veneers handle
out-of-range external function addresses. The object writer checks representable
records and instruction forms; the linker chooses final addresses and validates
final target range/alignment.

## Evidence and remaining work

[macho-image.coil](../tests/macho-image.coil) builds one shared image containing an
external call to libc `labs`, local data, exported functions/data, ABS64 pointers,
positive and negative addends, ADRP plus scaled load and ADD forms, and a branch
addend. It runs through JIT and writes an object executed by
[aot-image-link.coil](../tests/aot-image-link.coil).

The page target crosses a 4 KiB boundary and selects a different low-page slot;
the branch addend skips a different return sequence. Ignoring either page addend
or the branch addend would change the result. Repeated serialization produces
identical bytes, and source bytes/IDs remain unchanged. LLVM reads the resulting
symbols and relocation records, and the macOS linker links them successfully.

[named-image.coil](../tests/named-image.coil) compiles an external call, external
data access, and a binary string literal into one image, releases the graph,
executes the image with explicit resolutions, and writes objects executed by
[aot-named-link.coil](../tests/aot-named-link.coil). The recursive factorial graph
in [named-recursion.coil](../tests/named-recursion.coil) runs through JIT and AOT
with its FUNC bound to its own exported entry. Address-phi/return/arithmetic and
nested-buffer tests cover literal ownership, 64-bit numeric address preservation,
reference rebasing, slot deduplication, and private-name collisions.

The current format is Darwin arm64 Mach-O. Arbitrary extra sections, BSS/readonly
section policy, weak/common/TLS/GOT symbol/relocation features, unwind/debug
metadata, other object formats, and additional special constant kinds remain
unfinished. Full optimization/target parity, Coil compiler integration, and the
LLVM/TPDE runtime and compile-time comparisons also remain open.

Format references are Apple's SDK `mach-o/loader.h`, `mach-o/nlist.h`, and
`mach-o/arm64/reloc.h`; no SDK source is vendored. The writer is Coil code under
the project license, with upstream port attribution retained in LICENSE/NOTICE.

## Data embedded in text

Images and AArch64 emission buffers retain a `text-data` array of
`stogir.text-data/Range` values: text-relative `offset`, byte `length` and Mach-O
DICE `kind`. Ranges are ordered, disjoint, within the text section and aligned to
their element width. Buffer appending validates both sides and rebases range
positions. Image finalization retains them; JIT's private copy retains them too.

Dense switches emit JUMP_TABLE32 ranges whose entries are signed offsets from
the table base to local edge stubs. These entries need no address-dependent image
relocations. Moving the whole text keeps them valid. Raw byte-only output also
remains directly JIT-able, though it carries no separate object metadata.

Mach-O objects with ranges gain LC_DATA_IN_CODE. Entries describe text VM offsets
for MH_OBJECT, as emitted by LLVM MC; they are not file offsets into the object.
The writer splits large ranges at element boundaries to fit each u16 length and
keeps serialization immutable and repeatable. Objects without embedded data keep
their previous load-command and section layout. Manually constructed ranges are
subject to the same bounds/order validation as generated tables.

## Module composition

`stogir.link/compose(sources, allocator)` borrows a slice of images and returns an
owned `link/Module`. It composes all inputs in one batch and leaves their bytes,
names, symbols and relocation IDs unchanged. On failure it releases its partial
output. `link/release!` releases the output image and its per-input maps; retain
the module while borrowing its `.image` for JIT loading or object writing.

Each `Module.parts` entry corresponds to one input and holds its text/data base
and a `symbols` array mapping every old symbol ID to the composed image ID. This
allows callers to find private entry points without depending on generated names.
The returned image owns every byte, name and metadata record independently of
its inputs, which may be released immediately after composition.

Public declarations with the same exact name share an ID and may be fulfilled
by one public definition in any input order. Two definitions conflict, even if
zero-sized sections place them at the same offset. Private definitions retain
separate identities and receive fresh private names. They cannot fulfill another
input's public declaration. All public names are reserved before private labels
are generated, including names that use the private-label prefix.

The name arena and symbol records are validated independently of an input's
mutable lookup-cache fields. Duplicate raw symbol records, invalid name/section
bounds, embedded zeros, malformed text/data ranges and invalid or overlapping
relocation records are rejected. Composition aligns each input's section base
to that input's requirement and retains the maximum requirement in the output.
This property survives nested composition. It uses checked layout arithmetic,
NOP text padding and zeroed data padding. Aligned stack frames remain a separate
implemented feature.

Relocation locations and defined symbol offsets are rebased by section. Symbol
target IDs are remapped; addends are preserved. Already-patched internal branches
and relative tables keep their bytes because the whole input text moves together.
Text-data metadata receives the corresponding base offset. This preserves JIT
movement and Mach-O JUMP_TABLE32 records through nested composition. Address-
dependent bytes must still carry their normal image relocations; composition
does not infer pointers from numeric constants.

Collect per-function images and compose them in one batch to copy each section
once. Repeatedly composing an ever-growing prefix introduces repeated copying.
The compiler adapter must establish module-level function bindings and final
export visibility consistently; graph, aggregate and backend integration work
remains unfinished.

## Aligned runtime and object layout

The JIT planner includes space for actual external-branch veneers, rounds text
and data to OS pages, and places data at its required alignment. It over-reserves
when section alignment exceeds a page and chooses an aligned usable base. Only
text/data pages become accessible. Text is writable while copying and becomes
RX before execution; data remains RW and non-executable. Alignment prefix, gap
and suffix stay PROT_NONE. Data-only images require no executable text pages.

`Loaded.memory.base` and `.size` describe the usable image span. `.allocation`
and `.allocation-size` retain the original mmap reservation, which `release!`
unmaps in full. Callers should use the release API rather than unmapping the
interior usable base. Relocation planning uses the actual aligned text/data
addresses, including for relocations stored in the data section. Layout and
reservation arithmetic reject invalid powers, negative sizes and overflow before
mapping. Metadata bounds remain relative to the original input text before any
veneers are appended.

Mach-O writes section alignment exponents and aligns the data VM address, then
uses those VM addresses in symbol values. The object file positions follow the
segment-relative VM layout; the file offsets need not be multiples of the
requested section alignment, matching LLVM MC output. Default requirements keep
the previous object layout.

The current Darwin arm64 AOT writer accepts requirements through 16 KB. Larger
requirements produce an explicit error: the tested Apple linker reduces 64 KB
sections to its 16 KB segment maximum, so serialized metadata alone would not
establish the requested final alignment. JIT images retain larger requirements;
native tests exercise globals through 1 MB and code alignment above an OS page.
This AOT target limit is explicit and never silently clamped.

# Sealed namespaces

A sealed namespace is one whose declarations are read from a file and whose code is
linked from an archive beside it. Importing it costs a parse instead of a compile.

The motivating case is `coil.jit`. It is a source-linked SDK: importing it pulls the
native compiler implementation into the program, so a program that embeds the JIT
compiles the whole compiler into itself on every build — about 28 seconds, of which
roughly 2 is the frontend and 26 is LLVM, to re-derive an artifact the toolchain
already built. An installed toolchain now ships that namespace sealed and the same
program builds in about a quarter of a second.

## The seal

A seal is ordinary Coil source. A `;;;` header names the namespace, the archive, and
the toolchain and target that produced it; the rest is the module's public surface
with no bodies:

```
;;; coil seal v1
;;; namespace: coil.compiler.jit_api
;;; archive: coil.compiler.jit_api.a
;;; toolchain: coil 0.1.0
;;; target: aarch64-darwin
;;; source: e1bc00ea…9b57 ../compiler/jit_api.coil
;;; source: a058f07a…3ecd ../stdlib/alloc.coil
(module coil.compiler.jit_api)
(defstruct JitSession [(raw (ptr i8))])
(defn jit-submit! [(p0 (ptr coil.compiler.jit_api.JitSession)) (p1 (slice u8))] (-> i64))
```

There is no binary metadata format to keep in step with the language. Once the header
has been checked the text travels the same path as any other module, and the header
is `;;;` comments so that path needs no second reader. Signature types are printed
fully qualified, so a seal imports nothing — the namespace's own imports are exactly
the cost it exists to avoid.

The declarations come from the CHECKED callable surface (`Program.function_abis`),
not from the monomorphized bodies. By the time mono has run, an aggregate parameter
has been lowered to a pointer, and a seal that said `(ptr T)` would change the API
its callers write against. The checked surface keeps the semantic call ABI — `ref`
for a non-affine aggregate — which is the form a caller's own code checks against.

## What the compiler does with one

Loading a seal registers it as a virtual source for its namespace, records every
function it declares, and queues its archive as a link input. Three phases consult
that record: `check-func` skips the body rules for a sealed name, `cg-declare-funcs`
gives it external linkage, and `cg-emit-bodies` emits no definition — leaving the
reference the archive satisfies. The arm64 backend registers the name the way it
registers an extern, undefined and external, and emits no body for it.

Only a validated seal can put a name in that set. Nothing a user writes can, so a
body-less definition remains the ordinary "body has type void" error everywhere else.

A sealed export surface must be concrete. Exported generics and macros need their
source at every use site and cannot be declared away.

## Staleness is a separate question from compatibility

A seal also records a SHA-256 of every source the frontend read while building it,
written relative to the seal so that moving or reinstalling the toolchain does not
invalidate all of them. A build re-hashes them, and a file that differs means the
namespace is compiled from source instead, naming the file that changed — compiling
it costs half a minute rather than a second, so that is worth a line on stderr.

This is not belt-and-braces on the toolchain check. A toolchain's library is real
files beside the binary and editing one is meant to be live; that is why the library
stopped being `include-str` constants. A seal that trusted only "same toolchain"
silently shadowed such an edit and made it look like it did nothing, which is exactly
the trap that change removed. The digest is what keeps the property.

A source that cannot be read is not an edit — an installation may ship seals and no
library, and refusing the seal would leave nothing to compile in its place. Only a
file that is present and differs counts.

Staleness and incompatibility get different answers. A seal for another toolchain is
refused outright when a manifest named it, because that seal can never work here. A
stale seal always falls back to compiling, even when named: the artifact that
produces it may be about to run, and `check` in a package whose module was just
edited has to check the edit.

The verdict is remembered per process. A build resolves the same namespace once per
compilation unit — the program and each metaprogram are separate units — and the
files on disk do not change underneath it.

## Why identity, not compatibility

A seal is machine code plus declarations describing it. Layout, the call ABI, the
mangled names and the vtable shapes are all decided by the compiler, and none of them
is a stable format — so a seal stands in for its source only under the toolchain that
produced it. The check is identity: same toolchain, same target. That is also why the
toolchain builds its own seal during `install`, from the sources it just installed,
using the compiler it just installed; built anywhere else, "these match" would be a
claim rather than a fact.

Sanitizers and debug checks change the code a build wants rather than the ABI it
uses, and the archive carries neither, so those builds decline seals instead of
linking an uninstrumented half of a program.

Everything that fails a check falls back to compiling the namespace, because the
source is always still there. The exception is a seal a manifest named by hand whose
TOOLCHAIN or target is wrong: that one was asked for by name and can never work here,
so it is an error rather than a build that is thirty seconds slower for a reason
nobody was told. `--no-seal` forces the source path everywhere.

Discovery is confined to installed layouts. In a checkout the compiler's own sources
are the thing being edited, and a seal shadowing them would make an edit look like it
did nothing — the trap the bundled-stdlib-as-string-constants scheme set before the
library became real files beside the binary.

## Shared state is what makes it equivalent

A program linking a sealed archive still compiles its own copy of any library module
the archive also uses, so both contain code for, say, `coil.scratch`. They must not
also contain two copies of its *state*, or a sealed build would only resemble a
source-linked one.

They do not: an `alloc-static` cell is one logical object identified by its name, and
so is a trait vtable. In an archive both are emitted as weak definitions, so the
program and the archive share one cell — deliberately, rather than as two tentative
definitions the linker silently merges and then warns about once per cell on every
build. `gate-cli` pins this with a number that only comes out right if the cell is
shared.

The one visible difference from source-linking is function address identity: a
library function has a copy in each, so `fnptr` equality across the boundary would
compare unequal. Nothing in the sealed API does that.

## Producing one

`[artifacts.NAME] kind = "sealed"` in `Coil.toml` builds its entry as a library and
writes the seal beside the archive. Declaring the artifact is the whole
configuration: the package that produces a seal consumes it, and a seal names its own
archive, so nothing else has to say produce this, consume this, or link that.

A build that is producing a seal marks the module's exported names — read from the
entry's own `(module …)` and `(export …)` forms, before the frontend runs — so their
definitions are emitted externally. Library emission used to decide that by whether
the program defined `main`, which is false for any module whose import closure
supplies one: sealing the JIT SDK that way produced a 285 KB archive with none of its
API in it.

## Metaprograms

A metaprogram that imports a sealed namespace compiles against its declarations like
anything else, so its dylib links the same archive; otherwise it carries undefined
references and `-undefined dynamic_lookup` turns those into a dlopen failure during
expansion. A macro can therefore call sealed code while the program around it is
being compiled — including embedding the JIT, which does not compile at all when the
SDK is source-linked into a metaprogram.

## Known limits

A manifest's sealed artifact is rebuilt on every `coil build` of that package, as
`kind = "object"` artifacts are; freshness is not tracked. Seal generation runs the
frontend a second time, so producing one roughly doubles that module's build time —
paid once per toolchain install, never by a consumer. Only the host target is
sealed; a cross-build declines the seal and compiles from source. Verifying the
digests costs about 30ms per build that uses a seal; a memo keyed on file size and
modification time would remove that, but the toolchain has no `stat` binding to key
it on.

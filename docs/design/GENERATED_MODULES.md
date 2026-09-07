# Generated modules: experimental compilation contract

Generated modules are an opt-in source-reader facility. They are independently
checked implementations connected by concrete interfaces, with one owner for
each exported function and each shared storage cell. Existing readers still
return `Code` and existing non-partitioned programs keep their compilation model.

```coil
(import "coil.meta" :as meta)

(meta/generated-unit!
  "generated.answer"
  "(module generated.answer)
   (extern generated_answer :cc c [] (-> i64))
   (export generated_answer)"
  "(module generated.answer)
   (defn generated_answer [] (-> i64) 42)")
```

The reader's ordinary returned facade may import `generated.answer`, as may
another generated implementation. Implementation imports may refer to units
submitted in any order: all interfaces are registered before implementations
compile. Imports inside interfaces have the stricter ordering rule below.

An interface contains its module declaration, concrete `defstruct`/`defsum`
declarations, `export` declarations, and explicit `extern NAME :cc c` signatures.
An extern may include `:as "c_symbol"` to separate its safe Coil binding from the
native entry name. Ownership is checked by the actual linker name, including
collisions between differently named bindings. Generated exports retain the
ordinary `export-c` requirement that their native names are valid C identifiers;
ordinary imported extern aliases and `linker-address` may name other linker
spellings supported by the target.
An interface may import an already registered generated interface with
`(import "generated.types")`. Forward, self and ordinary implementation imports,
import aliases/use lists, generics, executable definitions and registered
metaprograms are rejected. Registration order therefore makes interface imports
acyclic. Shared type references use fully qualified names, such as
`generated.types.Pair`, so implementation aliases cannot redirect them.
The implementation defines the named functions; the compiler adds
C exports and read-only extern signature witnesses from the interface. After
checking, it compares those resolved declarations with the export's original C
parameter metadata and return type, before backend emission. This distinguishes
the C export ABI from Coil's internal implicit-reference aggregate ABI. Interface
type declarations are supplied to the implementation automatically, so the body
must not redefine them. C symbol names are explicitly owned and cannot be claimed
by two generated modules. The platform backend's normal C ABI limitations apply.

Use an exported function returning a pointer to represent shared mutable storage.
Only its implementation allocates the cell; callers import its declaration. An
implementation can import ordinary Coil helpers, but reachable imported helpers
that allocate static storage, imported runtime definitions, and imported C exports
are rejected. Put that state behind an owned interface. This also avoids treating
separate copies of a stateful standard-library module as one shared module.
Stateless imported implementations are private to each compilation unit; their
function addresses do not establish identity across units.

Macros and transforms inside an implementation run through the normal compiler
pipeline. They see that implementation and its imported declarations, not other
units' bodies. Imported generated interfaces, the owner's injected interface type
declarations, and the compiler-generated signature witnesses are read-only:
a transform that changes one is rejected. Declaration comparison is one-to-one,
so duplicating one declaration cannot compensate for removing another. Do
whole-program/body-reflective transformations before partitioning, or keep the
affected bodies together in one implementation. There
is no automatic cohort planner or transparent cross-unit generic specialization.
Nested generated-module submission is currently rejected with a diagnostic.
Type-only units provide one nominal owner for concrete records used by several
interfaces. Their implementation can consist of just the module declaration.

Each reader invocation is a registration transaction. A failed or declined read
discards its registrations and owned source buffers. An identical repeated submission is
idempotent; a conflicting interface or implementation is an error naming the
module. Source slices are borrowed only during the call. The compiler copies them
into explicitly owned buffers, using temporary parsing storage. Bodies are freed
after their unit compiles; interfaces remain available until the program session
closes. Interfaces are virtual modules, not temporary files or environment aliases.
The current public Code-provider protocol has no decline sentinel; the compiler's
internal declined-result path is covered directly by a same-session rollback and
retry regression.

After compiling and releasing the emitting facade, the compiler checks and emits
each body sequentially in the same process. A `CompilationUnitSession` owns a resettable arena and typed
AST, parser, resolver, expander, semantic/diagnostic, loader, driver, metaprogram,
interpreter, tracing-context and backend state. Entering a unit binds that state;
leaving restores the prior bindings before releasing the arena. Reader node IDs
and opaque Code handles belong to the same unit. There is no generated-unit
subprocess, request serialization, or temporary-source orchestration.

`CompilationUnitConfig` captures normalized target, optimization, metaprogram
optimization, sanitizer, debug checks, DWARF, setup modules, link flags, engine
policy, and namespace/manifest configuration before the reader runs. Generated
owners consume it directly. The earlier command scope retains unset option
policies until argv/manifest normalization; in particular, an unset `--meta-opt`
continues to follow `-O`.
Source-reader providers selected through `--use` or `[readers]` belong to input
decoding: the facade/raw sources use them, but already-decoded generated Coil
owners do not activate or implicitly import them. Ordinary semantic `--use`
modules, macros and checkers still apply independently to every owner. An owner
can explicitly import a provider module if it genuinely needs its definitions;
that explicit import has the normal per-unit semantic and ownership rules.

LLVM builders, target data, lowering/emission target machines, pass options,
modules and contexts are disposed by their owning operation. JIT mappings,
interpreter-owned literal/static storage, and loaded metaprogram images have
explicit unit resource ownership. A cached dylib is immutable code, not shared
mutable metaprogram state: each unit loads its own instance, reuses it within that
unit, and closes it at teardown. Ordinary lint passes retain their checker images
in the enclosing command scope until the command finishes.
Successful metaprogram-generation scratch arenas also belong to the unit: their
checked closures can outlive the expansion call, but not the unit. Retry paths
release those arenas early. Compiler-owned CtVal cells, Code constructors and
semantic helper allocations use that same unit lifetime.

An emitting facade has its own unit scope, separate from the program's source,
configuration and artifact storage. Its arena and executable resources close
before the first generated owner starts. Only scalar entry-point and native-link
dependency facts cross that teardown; parallel emission and test-root settings
are applied explicitly to the facade. Inspection and lint paths retain their
command scope because later passes may still use the checked model and images.

## Explicit native reader artifacts (experimental)

`coil build-provider MODULE FUNCTION -o EXISTING_DIRECTORY --meta-opt=2` builds
a trusted native syntax-reader plugin. `--reader-artifact DIRECTORY/KEY` explicitly
selects it for `build`, `check`, or object/IR inspection. With manifest `[readers]`,
the artifact must match a configured reader's defining module and entry; the
project entry stays ordinary Coil. Without configured readers it decodes the entry.
Other configured source readers and ordinary semantic `--use` modules retain their
normal behavior. The selected artifact's decoding `--use` is not also injected
into the application facade. Explicit imports remain semantic imports.

Construction performs the normal provider checking and monomorphization once.
Its concrete reachable closure may use syntax operations and generated-unit
submission, but not authoritative reflection over the future application's typed
program. Reachable restricted operations are diagnosed before publication; unused
SDK helpers do not make an otherwise syntax-only reader ineligible. Source
providers retain unrestricted program reflection. This is not a generic serialized
compiler snapshot or a way to run arbitrary source transforms against stale bodies.

The directory key hashes provider/entry, the running compiler binary (the SDK ABI
pin), host/target, normalized options/configuration, and the source closure's exact
contents. Implicit prelude and `include-str` inputs are included. Metadata uses a
versioned, bounded, endian-independent wire format, not dumped process pointers.
Publication atomically renames a complete image/metadata pair. Rebuilding an
existing valid key is idempotent; corrupted existing entries are rejected, not
silently overwritten. Ordinary failed builds clean their private staging files.
A killed/crashed process can leave an unreferenced `.provider-*` staging directory;
it is never a valid artifact. Loading verifies metadata, dependencies and image
hash, rebases syntax identities, and gives each compilation unit its own native
image instance. Per-invocation scratch storage is reclaimed after promoting the
returned syntax and diagnostics. Static state belongs to the image/unit, not the
individual reader invocation.

Artifacts are native executable code and require the same trust as source
metaprograms. This facility does not sandbox authored native I/O or make arbitrary
environment-dependent compile-time code reproducible. A reproducible provider's
compile-time inputs must be declared source/`include-str` dependencies; application
files/configuration read by its runtime reader remain application inputs. Current
configuration matching is conservative and may require rebuilding when namespace
or manifest selection changes. There is no implicit cache-miss compilation or
dependence on a warmed compiler process. Report provider construction separately
from application compilation, and report cold misses explicitly.

The initial artifact implementation removes source-provider compilation from the
application path; it does not remove generated Coil text, repeated checking, or
whole-unit backend construction. Those costs remain blockers for the Emacs time
and memory targets. Any optimized representation must remain ordinary Coil after
reader expansion, preserving normal macros, metaprograms, checking, and backend
semantics; a producer-specific path directly to LLVM is not an acceptable design.

Backend registration tables, executable/toolchain identity, and synchronized
callback-thread services remain process services. The callback threads retain no
borrowed invocation pointer after acknowledgement. Tracing aggregates copy names
into process-owned storage; their live diagnostic context and allocator counter
are scoped. The generated collector/hook and artifact vector belong to the
program, while the already-normalized project manifest belongs to the command.
The coordinator switches scopes only after all callbacks have completed. This is
sequential compilation, not a claim of concurrent/reentrant compiler execution.

After facade emission, the live working set includes command configuration,
registered source buffers, and at most one generated unit's compiler state. The C producer still
needs to release its own per-body work; partitioning cannot bound allocations made
inside an arbitrary reader or undo its external side effects.

The build layer tracks an explicit object list. `build` links that list normally;
`check` and `build -o /dev/null` check every implementation without producing a
final artifact. `emit-obj` combines the objects with a relocatable link and
publishes one object at the requested path. `emit-ir` rejects a partitioned
session before writing partial IR because its public output is one LLVM module.
Wasm partition linking is not implemented and is rejected during submission,
before backend output. Failed builds remove session sources and partial objects;
normal builds also release their source buffers and remove temporary objects.

The in-process generated-module suite passes shared state, cross-unit interfaces,
owner checks, macros/transforms, retries, inspection commands, native/LLVM paths,
ASan/UBSan and a metaprogram PID identity check across the facade and three owners.
Twelve sequential 64 MiB allocation scopes, nested scope restoration, distinct
static instances of the same cached image, and repeated 32 MiB object scans peak
at 136,757,248 bytes RSS in the focused contract executable. Modernize-fast
and all snapshot stages pass. The full-pipeline memory regression generates its
owners from a constant-sized reader: 64 owners peak at 366,297,088 bytes and
128 owners at 367,165,440 bytes, both below its 512 MiB regression guard. Before
the facade lifetime split, 64 owners peaked at 643,219,456 bytes. The actual
pipeline test also caught a separate successful-generation arena leak that the
allocator-only SDK test could not.

The complete 163-source in-process Emacs LLVM build succeeds in 680.291 seconds,
with 8,813,002,752 bytes peak live process-tree RSS (also the compiler's own
peak RSS). Ordinary linker/metaprogram-image tooling may still run as needed;
there are no generated-unit compiler subprocesses. Completed owners return to
roughly 1.8–2.5 GB RSS, and the largest unit determines the peak. The final
artifact's SHA-256 is
`d79261d9139b4a2df17bff466527088618a9c2dedb2909610ec3d20dad383910`.
Its temporary object directory is removed after linking. Version, bare-batch and
normal `--batch --quick --eval` smokes all pass with real upstream assets. The
quick-batch probe prints `42`, exits zero and takes 158.584 seconds with this O0,
undumped, source-Lisp startup; it is not an optimized runtime benchmark.

Before the facade lifetime split, the correct in-process build took 846.405
seconds and peaked at 10,751,262,720 bytes. The new executable is byte-for-byte
identical, while these runs show 18% lower peak RSS and 20% lower build time.
The new peak is also below the superseded subprocess implementation's
10,184,163,328 bytes. These are individual development measurements, not a
controlled performance benchmark. The largest pure-storage initializer still
expands into hundreds of thousands of elements. Compact constant-data lowering
remains a separate memory improvement.

## Historical subprocess implementation (superseded)

The previous assessment used subprocess-isolated owners. Its opt-in C producer uses
a two-pass, per-source scratch arena and a shared concrete boundary-type unit.
The shared boundary-type interface for the 163-source Emacs program contains
six records in 797 bytes. A complete LLVM build compiled and linked all 163 C
sources in 783.799 seconds. Peak live process-tree RSS was 10,184,163,328 bytes;
the parent peaked at 2,738,733,056 bytes and the largest worker at 7,931,281,408
bytes. The previous monolithic expansion peaked at 36.634 GB and stopped at an
earlier compiler phase, so its wall time is not a comparable full-build baseline.

Earlier attempts exposed two final-link memory defects. The driver now queries
each object once in a short-lived scratch arena and retains scalar dependency
facts. ArrayList extension grows geometrically, avoiding quadratic retained
copies when reading files in chunks. Sixteen scans of a 32 MiB object, including
positive curl/LLVM dependency assertions, peak at 102,416,384 bytes in the focused
regression. Multiline manifest parsing and quoted link paths have regression
coverage. The complete build above includes these fixes and removes its session
sources and objects after linking.

The translated executable now reports GNU Emacs 30.2.50 with `--version` and
runs both a bare batch Lisp file and normal `--batch --quick --eval`, printing 42
and exiting successfully. Its initial startup crashed because the C parser kept
an earlier incomplete extern array type and
reserved only 8 bytes for the 5.67 MB pure-storage array. The shared C parser now
completes that type from the definition's explicit bound; the figures above
include correctly sized storage. Materializing its 708,334-element initializer
now accounts for the largest worker peak. An earlier 7.84 GB measurement did not
include that storage and is not the corrected-program memory figure.

Startup then exposed signedness loss in nonnegative C enum bitfields, followed
by missing C hexadecimal/octal escape decoding in charset strings. The producer
corrections pass C tests and Clang differential fixtures on LLVM and direct
AArch64, including signed-negative enum fields, binary strings, and numeric
character constants. The figures above include the corrected escapes.

The next startup failure exposed a lifetime error in the C alloca lowering: an
inline-IR helper returned already-expired dynamic stack storage. The producer now
uses `primitive/alloc-stack-bytes`, lowered directly into the executing LLVM
function. Lifetime, alignment, loops, branches, repeated function returns, and
ASan/UBSan are covered by `scripts/tests/dynamic-stack.py`; a separate multi-C-unit
fixture matches Clang. This primitive supports LLVM AArch64/x86-64 and explicitly
rejects other backends. The full build and successful bare-batch test above
include this fix.

Normal bootstrap uses real charset maps, Unicode tables, loaddefs, and DOC generated by the
pinned upstream make targets in a private copy, using installed Emacs 30.1 as
the bootstrap executable. That startup exposed unsigned division/remainder and
discarded integer casts in the C parser's constant folder. Typed-width folding
now passes 109 C tests, all 18 native differential cases, and a two-generated-unit
GMP limb-limit regression on LLVM and direct AArch64. The measured build above
includes this correction. Normal quick-batch startup succeeds in 150.189 seconds
with this O0, undumped executable loading Lisp sources; this is not an optimized
or dumped Emacs performance result. The experiments repository documents the
private bootstrap procedure and has a repeatable `scripts/c-emacs-smoke.py` gate.

The remaining high worker peak comes from the expanded pure-storage initializer,
not accumulation across units. Compact constant-data representation is a future
memory improvement. The C frontend's older VLA helper has a separate block-lifetime
defect recorded in `emacs-jim`; configured Emacs explicitly disables VLAs, and
the caller-frame primitive is not a substitute for correct VLA scope reclamation.

The C producer preserves original C linker names using explicit extern aliases
(except the facade-owned `main` and static startup hooks). Native libraries can
therefore
call the generated definitions without renamed declarations or forwarding
wrappers. It names each owned function's actual C linker entry when taking
its address. An aggregate C entry may be a marshaling thunk distinct from the
internal Coil function; the producer must not substitute the internal address.
Cross-unit pointer equality and calling an owner-returned aggregate callback
are covered by the C differential fixture. Direct AArch64 currently rejects C
exports with by-value record parameters; use LLVM for this Emacs experiment.

Owner-side layout mutation is covered by executable before-expand and after-expand
transform regressions. Matching duplicate declarations, unequal multiplicities,
reordering, and declined-reader retries are covered by
`tests/compiler/features/generated_session_contract.coil`. The shared-state
fixture also runs with AddressSanitizer and UndefinedBehaviorSanitizer through
LLVM. Cross-target execution beyond the local LLVM/direct AArch64 probes remains
a validation gap; the current implementation carries normalized settings in the
in-process configuration record, not a worker request.

Validation commands:

```sh
python3 scripts/dev.py build candidate --output build/bin/coil-generated-inprocess-facade
COIL_TEST_GENERATED_SANITIZERS=1 python3 scripts/tests/generated-modules.py build/bin/coil-generated-inprocess-facade
python3 scripts/tests/generated-unit-memory.py build/bin/coil-generated-inprocess-facade --units 128
python3 scripts/tests/extern-aliases.py build/bin/coil-generated-inprocess-facade
python3 scripts/tests/dynamic-stack.py build/bin/coil-generated-inprocess-facade
python3 scripts/dev.py test modernize-fast --compiler build/bin/coil-generated-inprocess-facade
```

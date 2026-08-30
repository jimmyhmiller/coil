# The Coil Language — a guide for agents

A dense, practical reference for writing correct Coil. Coil is a low-level,
Lisp-syntax, ahead-of-time language: s-expressions, a macro system, and a type
system where **calling convention** and **allocation** are first-class. It emits
a native object and links with the system `cc`; the `wasm32-unknown-unknown`
target instead writes a WebAssembly module directly. Read this end to end before
writing Coil; most mistakes come from the gotchas marked ⚠.

The compiler and its standard library form one installed toolchain. An installation
places `coil` beside `lib/coil`, so the matching prelude and library work from any
directory; a checkout compiler finds the checkout's `src/` tree the same way. A bare
executable copied elsewhere is not a complete installation. A project may instead
select a sealed, dependency-supplied library universe with the `[language]` manifest
section described below.

## Build & run

    coil run   file.coil                 # build + run a single file
    coil build file.coil                 # release build: build/release/file
    coil build file.coil --debug         # DWARF debug build: build/debug/file
    coil build file.coil -o out          # override the output path
    coil install                         # install this package to ~/.local/bin
    coil install --root DIR              # install to DIR/bin instead
    coil build file.coil --target wasm32-unknown-unknown -o out.wasm
    coil run                             # build+run the ./Coil.toml project
    coil test                            # discover and run project test suites
    coil fuzz  file.coil -n 100000       # run its properties under coverage guidance
    coil check                           # typecheck every project target graph (no codegen, no link)
    coil verify                          # fmt + lint + check + native build + test
    coil run -- arg1 arg2                # forward args to the program
    coil build file.coil -lm             # link a library (-l<name>)
    coil repl                            # interactive session
    coil fmt   file.coil                 # print formatted source (--write / --check)
    coil lint  file.coil --fix            # apply the standard safe fixes
    coil lint  file.coil --use my.rules   # add project/policy checkers
    coil doc   file.coil                 # markdown for the module's `;;;`-documented surface
    coil namespaces                      # bundled standard-library namespace names
    coil namespace coil.arraylist        # every definition/signature, plus available docs

`main`'s `i64` return is the process exit code. Normal builds are ahead of time;
the interactive `coil repl` uses the native in-process JIT. A file that is
imported must start with `(module NAME)`. `Coil.toml`:

Native `build` writes its intermediate object in a private temporary directory,
spawns the linker driver directly with an argument vector (never through a shell),
and removes the object after linking. Only the requested executable remains.
Set `COIL_CC` to select a compatible linker driver; the default is `cc`.

### Interactive development

`coil repl` keeps definitions and runtime state for the life of the session.
Forms may span lines; the prompt changes to `....>` until delimiters balance.
Ordinary, non-generic `defn`s are hot reloadable: redefining one with the same
typed signature updates its stable `Var (fnptr c [Args...] R)`, so functions
already compiled against that binding call the new implementation. A different
signature is rejected transactionally, leaving the working definition intact.

Expressions print integers, floats, booleans, strings, and pointers. Useful
commands are `:type EXPR`, `:load NAMESPACE`, `:defs`, `:reset`, `:cancel`,
`:help`, and `:quit`. Definitions and failed evaluations are transactional;
successful `alloc-static` storage survives later evaluations and reloads.

The same engine is available to applications through the optional `coil.jit`
standard-library module. It is an in-process, source-linked compiler SDK—there is
no subprocess protocol. Importing it pulls the compiler into that program's
reachable module graph; programs that do not import it link none of the SDK.

    (import "coil.alloc" :use [malloc-allocator])
    (import "coil.jit" :use *)

    (let [(mut session) (jit-session-new (malloc-allocator))]
      (jit-submit! (mut session) "(defn twice [(x i64)] (-> i64) (* x 2))")
      (jit-submit! (mut session) "(twice 10)"))

`jit-session-new` locates the matching installed toolchain through `coil` on
`PATH`; `jit-session-new-with-toolchain` accepts an explicit compiler command.
`jit-submit!` returns zero after a successful transactional submission and one
after rendering a diagnostic. `jit-source` exposes accumulated successful
definitions and `jit-reset!` starts a fresh state lineage. `coil.jit.reload` is
the public metaprogram implementing stable typed function bindings.

The execution backend is selected by host: `arm64-macho` uses Coil's native
backend on macOS, while `llvm-mcjit-x86_64-linux` lowers each generation through
LLVM on Linux. Both retain old code for captured function pointers and map each
new generation's `alloc-static` declarations onto its prior stable addresses.
An application embedding `coil.jit` on Linux must link LLVM, for example with
`--link-flag "-L$(llvm-config --libdir)" --link-flag -lLLVM`; the stock
`coil repl` binary is already LLVM-linked.

    [package]
    name  = "app"
    entry = "main.coil"      # default src/main.coil
    [dependencies]
    local_math = { path = "../local-math" }
    remote_math = { git = "https://example.com/math.git", sha = "0123456789abcdef0123456789abcdef01234567", subdir = "packages/math" }
    [link]
    libs = ["m"]             # -> -lm

To compile without any ambient bundled library, select an ordinary module from an
explicit dependency as the replacement prelude:

    [language]
    stdlib = false
    prelude = "platform.prelude"

    [dependencies]
    platform = { path = "../platform" }

`stdlib = false` removes both the bundled `coil.core` prelude and bundled namespace
fallback. `platform.prelude` is loaded through the same namespace index as any other
dependency module, and its public names become the implicit refer-all for every module.
The root project's choice applies to the complete reachable module graph: a transitive
dependency cannot silently restore `coil.os`, `coil.io`, or another bundled namespace.
Language syntax, fundamental types, and compiler primitives remain available; every
library-shaped API must come from the declared dependency universe. A replacement
prelude is required when `stdlib` is false and is rejected when `stdlib` is true.

For code that keeps the bundled language foundation but must not depend on its
host environment, use the hermetic standard-library profile:

    [language]
    stdlib = "hermetic"
    core-providers = ["platform.core"]

    [dependencies]
    platform = { path = "../platform" }

`"full"` is the spelled-out form of the default `stdlib = true`; `false` retains
its sealed replacement-prelude meaning. The hermetic profile admits only the
closed bundled namespace set `coil.primitive`, `coil.control`, `coil.try`,
`coil.result`, `coil.match`, `coil.dyn`, `coil.var`, `coil.async`,
`coil.atomic`, `coil.simd`, and `coil.assert.hermetic`. Imports of other bundled
namespaces are rejected while loading the complete reachable graph, including
imports made by a core provider. Native dependencies and `[link]` inputs are also rejected.
The built-in ambient assertion provider traps on failure without writing output;
the full profile instead activates `coil.print` and `coil.assert`.

A module contributes selected declarations to the single ambient namespace
`coil.core` with an explicit declaration:

    (module platform.core)

    (defn platform-answer [] (-> i64) 42)
    (provide-core [platform-answer])

Declaring `provide-core` does not activate the module. Only the root manifest's
`core-providers` list does that; dependency manifests cannot add ambient names.
Names not listed in the declaration stay ordinary qualified exports.

`core-providers` is **ordered, and a later entry overrides an earlier one**. The
profile's own ambient providers are activated first, so a root provider outranks
them: listing a module that provides `println` replaces `coil.print`'s, and under
`stdlib = "hermetic"` a module providing `assert-eq` replaces the trap-only one
from `coil.assert.hermetic` -- which is how a board supplies its own fault
handler. A provider also outranks names the prelude merely reexports, such as
`when`, so ambient macros are replaceable too, and a provider holding a plain
function replaces an ambient macro of that name completely. An overridden
definition is never reached ambiently; it remains available under its own
module name.

Project tools inherit the same package, native, target, and link configuration as
`coil build`. **Naming a file inside a project changes only the entry, not the
configuration**: `coil build src/main.coil`, `coil run src/main.coil` and
`coil check src/main.coil` resolve the same dependencies and apply the same
`[cc]`, `[link]` and `[metaprograms]` as the bare command, so an
`(import "somedep.lib")` that works one way works the other. Build artifacts default
to `build/release/<source-stem>` for a named file and `build/release/<package-name>`
for a package. `-g` or `--debug` emits DWARF symbols and selects the corresponding
`build/debug/` directory. `-o` overrides the complete path, and `[build] out`
overrides the package artifact name. `[build] optimization = 0` (or `1`, `2`,
`3`) supplies the default `-O` level for manifest builds; an explicit command-line
`-O` flag takes precedence.
Outside a project — no `Coil.toml` — a file is compiled on its own, as always.
`coil new` adds both `/build` and `/.coil` to the new package's `.gitignore`.

A fuller project can declare:

    [package]
    name = "app"
    entry = "src/main.coil"
    source-roots = ["src", "tests"]
    exclude = ["src/generated/*"]

    [build]
    optimization = 2

    [cc]
    sources = ["native/app.c"]
    include-dirs = ["native"]
    flags = ["-std=c11", "-Wall"]

    [link]
    libs = ["curl"]
    search-paths = []
    frameworks = []
    objects = []
    flags = []

    [native-dependencies]
    libcurl = { pkg-config = "libcurl" }
    llvm = { flags-command = "llvm-config --ldflags --libs --system-libs" }

    [test]
    roots = ["tests"]
    suffixes = ["_test.coil"]

    [test.suites.integration]         ; a named suite; `default = false` keeps it
    roots = ["tests/integration"]     ; out of a bare `coil test`
    suffixes = ["_integration.coil"]
    default = false

    [lint]
    rules = ["tools/project_rules.coil"]

    [metaprograms]
    use = ["myproj.gcauto", "httptap"]

    [readers]
    ".json" = "myproj.readers.json"

    [modules]
    "myproj.data.people" = "src/data/people.json"

Native objects and depfiles live under `.coil/build/native/`; sources and headers
are rebuilt only when their inputs or toolchain configuration change. Test runners
use collision-free paths under `.coil/build/test/`.

A native dependency selects exactly one discovery provider. `pkg-config` names a
package whose link flags Coil queries in the usual way. `flags-command` runs a
project-owned configuration command and treats its whitespace-separated stdout as
linker arguments; it is intended for libraries such as LLVM that ship a dedicated
`*-config` tool but no pkg-config metadata. A nonzero provider exit stops the build
before compilation.

Dependency names are manifest-local handles, not import prefixes. Coil adds each
dependency root to the namespace index, so consumers import the namespace declared
by the dependency's source—for example `"local_math.numeric"`—regardless of where
that source lives inside the dependency. `path` is relative to the project directory.
A Git dependency selects exactly one of `sha`, `tag`, or `branch`; `sha` requires a
full 40- or 64-digit commit ID. Tags and branches are resolved to a concrete commit
at the start of each invocation, so they intentionally follow repository updates.
An optional `subdir` selects a package inside the checkout. It must be
repository-relative, may not contain an escaping `..`
component, and must name a directory containing `Coil.toml`. Coil treats that manifest
as the dependency boundary: its source roots, exclusions, module/reader mappings,
transitive dependencies, native dependencies, C inputs, and link inputs compose into
the root build. Repository-relative native paths remain relative to the selected
package. Checkouts are cached by repository and SHA, so dependencies selecting several
subpackages at the same pin share one checkout. The string shorthand
`local_math = "../local-math"` is equivalent to `{ path = "../local-math" }`.

### Workspaces

A repository containing several packages uses a `[workspace]` root instead of a
root `[package]`:

    [workspace]
    name = "tools"
    members = ["src/apps/*", "src/libraries/*"]

Each matched member directory contains its own `Coil.toml` with a `[package]`
name. A member's namespace is `<workspace>.<package>` plus at least one module
segment: package `parser` in workspace `tools` may declare
`tools.parser.syntax`, but not exactly `tools.parser`. The namespace index reports
an incorrectly owned module at its source path.

Workspace members compile as one namespace graph and import each other without
dependency declarations. `check`, `build`, `lint`, and `fmt` at the workspace
root fan out over executable members; a member with no `entry` is a library and is
compiled through the executable members that import it. Command-line flags are
forwarded to each member. Package `source-roots` and `exclude` settings still own
source discovery and namespace indexing, so excluded fixtures do not create
duplicate or incorrectly owned modules. A workspace-level `tests/` directory is
also indexed without becoming a package.

`[readers]` associates a source suffix with an ordinary Coil module containing one
`reader-provider`. Imported files with that suffix are read by the provider and
then continue through normal loading and checking. Their namespace is selected, in
order, by an explicit `[modules]` namespace-to-file entry, a first-line
`coil-module: NAME` marker (anything before the marker is treated as the guest
language's comment leader), or the package name plus their source-root-relative
path with the suffix removed. JSON normally uses either `[modules]` or the path
fallback because JSON has no comments. Reader modules themselves always use Coil's
default reader, and reader output may omit `(module ...)`; the loader inserts and
validates the namespace it indexed.

Different suffixes may name different providers in the same project. Each distinct
provider is compiled into an isolated reader setup, and every imported guest file is
dispatched by its longest matching configured suffix. This also applies recursively:
one program may import JSON, Scheme, or other guest modules together without either
reader seeing the other's input. Repeating an extension, mapping one file to two
module names, selecting a module with no `reader-provider`, or returning a conflicting
`(module ...)` declaration is a manifest/load error.

The Wasm target produces an instantiable module. The compiler performs the final
Wasm-object conversion itself; this target does not invoke a linker process, and
native libraries cannot be linked into the module. It is otherwise a full target
for **the browser** — enough to build interactive pages in Coil:

- **Exports.** `main` and its linear `memory` are always exported. Every
  `(export-c [f :as "name"])` function is also exported, so JS can call into Coil:
  `instance.exports.name(args)`. Args/results are wasm scalars (`i32`/`i64`/floats).
- **Host imports.** An `extern … :cc c` that is *declared but never defined* becomes
  a wasm import `env.<name>` — this is how Coil calls out to JS (DOM, `console`,
  fetch, …). Pass a string as a `(ptr u8)`+`i32` pair via `(slice-data s)` /
  `(slice-len s)`; the host reads it from linear memory as UTF-8.
- **Self-contained.** The finalizer resolves the linker-provided `__memory_base`
  and `GOT.mem.*` globals to concrete addresses, so string literals and
  `alloc-static` global state work with no JS-side plumbing. The only imports a
  module has are the host functions it actually calls.
- **`externref`.** A built-in opaque type: a wasm reference to a host (JS) value,
  held directly by the runtime and GC-managed. Use it in `extern` signatures and as
  params/returns/`let`-locals to pass JS values to and from Coil without a handle
  table — `(extern js_get :cc c [externref (ptr u8) i32] (-> externref))`. ⚠ An
  `externref` lives only in wasm locals/args; it **cannot** be stored in linear
  memory (no struct field, array, `(mut …)` slot, or `(ptr externref)`). To persist
  one across calls, hand it to a host retain-table and keep the returned `i32`
  index. Transient `externref`s are collected automatically — nothing to free.

To run one: instantiate the `.wasm` from JS and supply each `env.*` import the
module declares (the DOM calls you `extern`-declared), then call
`instance.exports.main()`. Build with `--target wasm32-unknown-unknown`.

## Modules & imports

    (module myproject.app)               ; conventional project-prefixed namespace
    (import "coil.io" :use *)            ; bring all exported names in, unqualified
    (import "coil.io" :use [a b])        ; specific names
    (import "coil.io" :as io)            ; qualified: io/name
    (import "coil.io" :use * :exclude [print])          ; all but these
    (import "coil.io" :use * :rename [[print io-print]]) ; refer under a local name
    (export foo bar)                     ; optional; omitted = everything visible

Every module behaves as if it began with `(import "coil.core" :use *)`. Writing any
explicit `(import "coil.core" …)` replaces that implicit line — Clojure's
`:refer-clojure` rule — so you can shadow a core name with your own, or drop core
entirely:

    (import "coil.core" :use * :exclude [len get])   ; define your own len/get
    (import "coil.core" :use [Eq Ord Option Result]) ; a whitelist
    (import "coil.core" :use [])                     ; no core; special forms + primitives
    (import "coil.core" :as core :use [])            ; nothing bare; core/Option still works

An `:exclude` entry matches a definition name, a trait name, or a method name, so
`:exclude [Ord]` drops `< <= > >=` together while `:exclude [<]` drops only `<`. Special
forms (`defn`, `let`, `if`, `match`, …) are not names and are never affected. This
controls *which names you may write*; it does not change what reaches your binary — dead
code is already stripped whether or not you exclude anything.

Wildcard imports are allowed. To audit or replace them on demand, use the bundled
opt-in checker (it is not enabled by ordinary builds or lint runs):

    coil lint app.coil --use coil.lint.no-star-imports
    coil lint app.coil --use coil.lint.no-star-imports --diff
    coil lint app.coil --use coil.lint.no-star-imports --fix

The fix changes `:use *` to an explicit list of the target module's exported names
and preserves other clauses such as `:as` and `:reexport`.

Module names may contain dots. By convention, every project owns a prefix and uses
it for all importable modules: `myproject`, `myproject.http`, `myproject.db.user`,
and so on. This is a convention, not a compiler requirement; a one-part name remains
valid. Public/package namespaces may also use a leading owner scope, for example
`(module @myname.project.thing)`. The complete scoped name is the module identity.

The bundled standard library follows the same rule under `coil.*`: `coil.core`,
`coil.json`, `coil.http.client`, `coil.http.server`, `coil.slice`, etc. Import these
using their public namespace, for example `(import "coil.time" :as time)`.

Compiler setup modules selected with `--use` may replace the entry file's initial
read by declaring `(reader-provider "provider.namespace" function)`. The provider
is ordinary compiled Coil with signature `[(context Code)] -> Code`; its argument
starts `(read-context PATH SOURCE entry INPUTS ARGS)`, preserving the original
path/source/role positions. `INPUTS` is `(read-inputs (read-input PATH SOURCE
entry) ...)` for every command-line input, and `ARGS` is `(reader-args ARG...)`
for arguments after `--`. The provider is invoked once for the complete set.
It returns either one form or `(do FORM...)`, after which normal loading,
expansion, checking, compilation, and linking continue. Provider imports always
bootstrap with Coil's default reader. Zero providers preserves the ordinary
reader, and more than one selected provider is an error.

A provider can delegate to the built-in configurable s-expression reader:

```coil
(primitive/code-read source
  `(reader-config :unquote #\, :splice #\@))
```

The current context kind is only `entry`; textual imports retain Coil's default
reader and do not automatically inherit the entry reader.

Use `coil namespaces` to discover every standard-library namespace bundled into
the installed compiler. `coil namespace NAME` prints the definitions, signatures,
and available `;;;` docs in one of those namespaces. It also accepts a source path,
so `coil namespace src/my_lib.coil` is the namespace inventory for project code.
When a namespace implements traits, its guide entry states those traits and their
methods first; treat those methods as the public vocabulary. `coil doc FILE` remains
the concise, documented-only view.

Imports name namespaces, never files. Coil indexes every `.coil` source under the
project's configured `source-roots` (the project directory for a direct-file build),
each dependency root, and the bundled standard library. File placement beneath those
roots is irrelevant: `(import "myproject.db.user" :as user)` resolves the file whose
leading declaration is `(module myproject.db.user)`. A namespace declared by multiple
files is an error. Relative paths, absolute paths, dependency-prefixed paths, and bare
filenames such as `"time.coil"` are not valid imports.

`coil lint --fix` has a syntax-preflight phase that runs before import loading or type
checking. It migrates legacy path imports by opening the old target, reading its
`(module …)` declaration, and replacing only the import string. It also migrates old
two-digit `\xHH` string and C-string escapes to `\xHH;`, and legacy `\c` character
literals to canonical `#\c`. These fixes work even when legacy syntax prevents the
program from compiling.
⚠ `extern` declarations are NOT deduped across modules — declare each libc
extern in ONE module and `:use *` it, or two importers colliding will fail to link.

## The two operator tiers

- **Metal ops**, any width: `iadd isub imul idiv irem`, `icmp-eq icmp-ne icmp-lt
  icmp-le icmp-gt icmp-ge`, `iand ior ixor ishl ishr`, `udiv urem` (unsigned),
  `fadd fsub fmul fdiv`, `fcmp-eq fcmp-ne fcmp-lt fcmp-le fcmp-gt fcmp-ge`.
- **Clean prelude operators**: `+ - * / %`, `= != < <= > >=`, `& | ^ << >>`.
  Implemented on `i64` (all of them) and `bool` (`=` / `!=`). `f64` has `+ - * /`
  and `< <= > >=` but **deliberately no `Eq`** — like Rust, because `NaN != NaN`
  breaks reflexivity; use `primitive/fcmp-eq` / `primitive/fcmp-ne` for float equality. **`(ptr T)` has
  `= != < <= > >=` for any `T`, comparing ADDRESSES** (like Rust's `*const T`) — the
  metal `icmp-*` ops reject pointers, so these operators are the way to compare them.
  Every signed and unsigned integer width implements `Eq` and `Ord`, so use the
  clean comparison operators for ordinary integer code. The metal `icmp-*` ops
  remain the lowering primitives used to implement those traits.

These operators are not builtins — they are **trait methods** (see Traits & impls),
so they work on your own types the moment you write an `impl`.

The integer metal tier also provides operations that cannot be expressed cheaply
from those operators:

- `primitive/clz`, `primitive/ctz`, and `primitive/popcount` return a count in the
  operand's integer type. `clz` and `ctz` are defined on zero and return the type's
  bit width.
- `primitive/bswap` reverses the bytes of an integer (`u8` is unchanged; wider
  operands must contain a whole, even number of bytes).
- `primitive/rotl` and `primitive/rotr` rotate within the operand's declared bit
  width; the count is reduced modulo that width.
- `primitive/mulhi` returns the high half of the double-width product. Its meaning
  is signed for `iN` and unsigned for `uN`; ordinary `imul` supplies the low half.
- `primitive/iadd-overflow?`, `primitive/isub-overflow?`, and
  `primitive/imul-overflow?` report overflow according to the operand type's
  signedness. `coil.integer` supplies `overflowing-add`, `overflowing-sub`, and
  `overflowing-mul`, which return `Overflow[T]` containing both the wrapped result
  and the flag.

All of these operations preserve the operand width. Both operands of a binary
operation, including a rotate count, therefore have the same integer type.

`and` and `or` are variadic, short-circuiting syntax forms. Their zero-argument
identities are `(and)` → `true` and `(or)` → `false`; a single argument is returned
unchanged.

## Traits & impls

Rust-style, and the source of every clean operator: `Eq` (`=`), `Ord` (`< <= > >=`),
`Add`/`Sub`/`Mul`/`Div`/`Rem`, `BitAnd`/…, `Hash`, and the collection traits `Len`
(`len`), `Get` (`get`), `Set` (`set!`), `Push` (`push!`), `Pop` (`pop!`). The trait
names are in scope with no import.

    (deftrait Show [Self] (show [(x Self)] (-> i64)))   ; Self = the implementing type
    (impl Show Point (show [(p Point)] (-> i64) 1))     ; concrete
    (impl [T] Show (Box T) (show [(b (Box T))] (-> i64) 2))   ; generic: [T] first
    (impl [(T Eq)] Eq (Box T) …)                        ; with a bound on T
    (defn tell [(T Show)] [(x T)] (-> i64) (show x))    ; bounded generic: [(T Show)]

An impl's `[T …]` entries take bounds in the same `(name Trait…)` form `defn` uses —
write `(impl [(T Eq)] Eq (Box T) …)` when the body needs `T: Eq`. The bound is checked
where the impl is used, so `(Box f64)` is rejected (`f64` has no `Eq`) at the call site
rather than inside the impl.

Parameterized traits may constrain their non-`Self` associated types in a bound.
Write the trait and its associated arguments as a nested form:

    (defn next-i64 [(I (Iterator i64))] [(source I)] (-> (Option i64))
      (let [(mut it) source] (next (mut it))))

Here `I` must implement `Iterator` with `Item = i64`. Associated arguments participate
in inference as well as checking: if `I` is known, its selected impl can infer an
otherwise-unmentioned item type. A mismatched impl is rejected at the generic call.
The argument order is the trait's declared non-`Self` parameter order; for
`(deftrait Pairing [Self Left Right] ...)`, the bound is `(T (Pairing L R))`.

**Any type can carry an impl** — a struct, sum, scalar, generic instance, and the
structural types `(ptr T)`, `(slice T)`, `(array T N)`, `(vec T N)`, `(fnptr c […] R)`.
A generic impl's `[T …]` params are inferred from the receiver, and every declared
param must appear in the implementing type.

    (impl [T] Show (ptr T)   (show [(x (ptr T))]   (-> i64) 3))   ; all pointers
    (impl [T] Show (slice T) (show [(x (slice T))] (-> i64) 4))   ; all slices
    (impl Show (Pair i64 i64) (show [(p (Pair i64 i64))] (-> i64) 5))  ; ONE instance

That last one applies to `(Pair i64 i64)` **only** — calling `show` on a `(Pair u8
bool)` is "does not implement", not a silent mismatch.

**Specialization.** Several impls may cover the same type constructor; the **most
specific** one matching the receiver wins. `(Pair i64 i64)` is more specific than
`(Pair A B)` because the general pattern matches the concrete type and not the reverse.

    (impl [A B] Len (Pair A B)   (len [(p (Pair A B))]   (-> i64) 1))
    (impl     Len (Pair i64 i64) (len [(p (Pair i64 i64))] (-> i64) 2))
    ; (Pair i64 i64) -> 2 ;  (Pair u8 bool) -> 1

Disjoint instances are fine too — `(slice i64)` and `(slice u8)` can never both match.
Two impls that *do* overlap with neither more specific (`(Pair i64 B)` and
`(Pair A bool)`) are only an error where something actually instantiates the overlap:
"ambiguous impls … none is more specific". Two impls with the same pattern (up to
renaming) are always a "duplicate impl".

**Dispatch** picks the impl by matching the receiver's type, trying the receiver's own
type first and then auto-dereferencing through `(ptr …)`/`(mut …)` layers. So `(len p)`
on a `(ptr (ArrayList i64))` finds `ArrayList`'s `Len` (pointers have none), while
`(< p q)` finds the pointer's own `Ord` and compares addresses rather than peeling to
the pointee's.

⚠ You cannot impl on a reference type `(mut T)` — impl on `T` itself.

**Inherent/extension methods.** Omit the trait to attach methods directly to a type.
Generic and imported targets work too. A method whose first parameter is the target
type (possibly behind `ptr`/`mut`) is receiver-dispatched from argument zero, so the
call is bare; the parameter name is ordinary and need not be `self`.

    (defstruct Point [(x i64) (y i64)])
    (impl Point
      (new [(x i64) (y i64)] (-> Point) …)       ; associated: no receiver
      (sum [(p Point)] (-> i64) …)               ; receiver by value
      (shift! [(p (mut Point)) (d i64)] (-> i64) …))

    (let [(mut p) (Point::new 10 20)]
      (shift! (mut p) 1)                         ; owner inferred from p
      (sum p))

A receiverless associated function has no argument from which to infer its owner, so
call it as `Type::name`. Inherent methods take precedence over a same-named trait
method for a matching receiver; `Trait::method` still explicitly selects the trait.
Every type that can carry a trait impl can be extended: structs, sums, scalars,
generic instances, pointers, slices, arrays, vectors, function pointers, and `Code`.
An extension is present when its defining module is imported; duplicate applicable
definitions are reported rather than silently selected. For a generic target:

    (impl [T] (Box T)
      (box [(x T)] (-> (Box T)) …)
      (get [(b (Box T))] (-> T) …))
    (let [b (Box::box 42)] (get b))              ; T inferred = i64

**Trait objects:** `(dyn Trait)` is a copyable two-word value containing the concrete
object pointer and a compiler-generated vtable pointer. It is valid in every ordinary
type position: fields, sums, locals, parameters, returns, arrays, and generic containers.
The legacy `dyn` module and `(defdyn Trait)` remain available to request explicit
object-safety diagnostics, but are not required. A concrete `(ptr Implementer)` coerces automatically wherever a
`(dyn Trait)` is expected, or explicitly with `(primitive/make-dyn Trait p)`. The trait's methods
must take `(self (ptr Self))`; later parameters and the return type may not mention
`Self`. Copying the dynamic value does not copy or preserve the concrete object: its
`data` pointer follows the same validity rules as any other Coil pointer.

**Callable values.** `Callable` is the conventional core marker for static call
implementations. It is an ordinary namespaced trait, and `call` is an ordinary impl
member rather than a reserved method. A `call` method's signature defines that type's
arity, argument types, and result type. A local value in call-head position dispatches
through the matching ordinary trait impl:

    (defstruct Vec3 [(x i64) (y i64) (z i64)])
    (defn get [(v Vec3) (i i64)] (-> i64) …)
    (impl Callable Vec3
      (call [(self Vec3) (i i64)] (-> i64) (get self i)))
    (let [v (Vec3 :x 10 :y 20 :z 30)]
      (v 2))                              ; statically dispatches to call, yields 30

There is no boxed argument list, tuple value, vtable, or runtime trait lookup. The
checker selects the impl from the head value's concrete type and lowers the expression
to its ordinary monomorphized `call` function. `Callable.call` declares
`:inline (Always)`, inherited through the normal function-annotation pipeline, so its
dispatch wrapper cannot remain as an extra runtime hop. Defining `call` in any other
namespaced trait works identically. More than one
matching `call` implementation for a type is ambiguous; use a distinct wrapper type
when the same underlying state needs a different signature.

`Callable` uses a type pack to describe one fully typed family of signatures:

    (deftrait Callable [Self Args... R]
      (call :inline (Always)
            [(self Self) (args Args...) ...]
            (-> R)))

`Args...` declares one type-sequence parameter. In a type sequence such as the
parameter vector of `fnptr`, writing `Args...` expands that sequence. A value parameter
whose type is a pack is followed by a separate `...`; its name is then available as an
expression expansion (`args...`) in argument-list position. Packs are inferred as one
ordered sequence, may be empty, and are substituted before ABI lowering. They never
become a tuple, slice, boxed list, or runtime value. A specialization therefore has the
same concrete signature as if every parameter had been written by hand.

`coil.var/Var` is an ordinary generic value cell. For a function-pointer element type it
implements `Callable` with the same pack:

    (import "coil.var" :use [Var var-new var-set!])
    (let [(mut slot) (Var (fnptr c [i64] i64))]
      (store! slot (var-new (primitive/fnptr-of old-code)))
      (let [v (load slot)] (v 10))
      (var-set! slot (primitive/fnptr-of new-code))
      (let [v (load slot)] (v 10)))

After inlining, a call through such a `Var` is one load of the current function pointer
and one indirect call. Replacing the field changes subsequent calls without changing
the `Var`'s static function-pointer type.

`coil.closure/defclosure` generates a `Callable` closure and a typed
`NAME-set-code!` operation. The closure retains its environment while the code pointer
may be replaced, which is the stable value shape used by hot-reload tooling. Calls
through it inline to a code-pointer load and indirect call.

### Deriving trait implementations

`coil.derive` implements the registry-backed generic form `(derive Trait... Type)`;
`derive` itself is ambient and needs no import. A trait's deriver is registered by
the module that defines that derivable trait, so that module must still be imported.
A deriver is registered explicitly; its function name has no special meaning.
Libraries and applications can define their own with one or both type-shape arms:

    (deftrait Tag [Self] (tag [(x Self)] (-> i64)))
    (defderive Tag
      (struct [T] `(impl Tag ~T (tag [(x ~T)] (-> i64) 1)))
      (sum [T] `(impl Tag ~T (tag [(x ~T)] (-> i64) 2))))

    (defstruct Point [(x i64)])
    (derive Eq Hash Tag Point)

An option-bearing trait is written as a list. Options belong to that trait, so
two configured derives spell the options twice rather than hiding which impl
consumes them:

    (derive (Serialize (rename-all :camelCase))
            (Deserialize (rename-all :camelCase))
            User)

Either `struct` or `sum` may be omitted. Deriving that trait for the omitted
shape is a direct error at the `derive` call. Duplicate registrations for one
trait are errors rather than load-order-dependent overrides. `register-derive`
is the lower-level spelling used by `defderive`; use it only when the deriver
functions must be declared separately.

## Numbers, bool, casts

Int types `i8 i16 i32 i64 u8 u32 u64 …` (arbitrary width, real signedness).
Floats `f32 f64`. `bool` is real (`true`/`false`). Literals infer width from
context; hex `0x1F`, binary `0b1010`, octal `0o17`, underscores `1_000`.

`(primitive/cast T x)` converts: `(primitive/cast i64 f)` truncates f64→i64 (numeric), `(primitive/cast f64 i)`
converts int→float, `(primitive/cast (ptr T) x)` reinterprets pointers, `(primitive/cast i64 p)` is a
pointer's address. ⚠ `cast` between f64 and i64 is a **numeric conversion, not a
bit reinterpret**. For a bitcast (e.g. NaN-boxing) round-trip through memory:
`(let [(mut bits-place) bits] (primitive/load (primitive/cast (ptr f64) (mut bits-place))))` — LLVM at
-O3 folds this to a register move.

## Control flow

Core: `if`, `do`, `let`, `loop`/`break`/`continue`. `cond` is defined directly in
`coil.core`; the other everyday macros are reexported there, so none require an
import: `when unless cond case case-by while for and or not`.

    (if cond then else)      ; ⚠ BOTH branches required, and they must have the
                             ;    SAME type (the whole if yields a value).
    (do a b c)               ; sequence, yields last
    (let [x e (mut y) e0] …) ; bindings; (mut y) is a mutable stack cell
    (loop … (break) … (break v) … (continue))
    (cond t1 e1 t2 e2 … :else e)   ; :else is always true; a lone trailing clause
                                   ;   is also an else (the older flat spelling)
    (case x k1 e1 k2 e2 … default) ; x evaluated once; a dense integer case
                                   ;   compiles to a JUMP TABLE

⚠ `if` needs matching branch types. For effect-only conditionals write
`(if c (do …effects… 0) 0)` so both sides are `i64`. `store!` yields unit (canonical
`i64` 0), so `(if c (primitive/store! p ptr) 0)` type-checks directly — no wrapping `do` needed.

**Binding from a place.** When the initializer is already a place — another `(mut …)`
cell, or a `(mut T)`/`(ptr T)` parameter — a bare name binds its **value**, and an alias
is spelled `(mut …)`, exactly as at a call site:

    (let [(mut a) 10]
      (let [(mut b) (load a)] …)   ; b is a FRESH cell holding 10
      (let [(mut c) (mut a)]  …)   ; c IS a; a store through either shows in both
      (let [(mut d) a]        …))  ; ⚠ compile error — say which one you meant

Struct and array places are the exception: `(let [v s])` on one is a **view**, not a
deep copy, so passing a big struct around never copies it behind your back.

There is no `return`. Structure with `if`, or use `(block :b … (return-from :b v))`.
Self-tail-recursion is constant-stack (guaranteed `musttail`).

## Structs

    (defstruct Point [(x i64) (y i64)])
    (defstruct Rect  [(lo Point) (hi Point) (data (ptr u8)) (buf (array u8 64))])
    (Point :x 10 :y 20)                    ; named construction
    (Point :y 20 :x 10)                    ; field order is irrelevant

Struct values are constructed with `:field value` pairs. Every declared field is
required exactly once; missing, repeated, and unknown fields are compile errors.
Argument expressions are evaluated from left to right in source order, then fields
are initialized in declaration order. Sum variants accept the same named syntax for
their payload fields: `(Rect :width 10 :height 20)`.

Bracket expressions are homogeneous fixed-array literals. Their length is part of
the inferred type: `[10 20 30]` has type `(array i64 3)`. An array literal is
borrowed automatically when the expected type is `(slice T)`, including function
arguments and named constructor fields:

    (defstruct Header [(name (slice u8)) (value (slice u8))])
    (defstruct Request [(headers (slice Header))])
    (Request :headers [(Header :name "Accept" :value "application/json")
                       (Header :name "User-Agent" :value "my-agent")])

The backing array is a function-frame place, so the slice is suitable for a call or
another value that does not outlive the frame. Literals do not allocate. Empty array
literals are currently rejected because Coil has no zero-length array type.

- `(.name p)` reads a field value. It requires `p` to be a pointer/reference to a
  struct. Accessors compose like ordinary Lisp calls: `(.x (.origin rect))`.
- `(.. rect origin x)` is a core macro expanding to `(.x (.origin rect))`.
- The same accessor denotes a place where surrounding syntax requires one:
  `(mut (.name p))` borrows the field mutably and `(set! (.name p) value)` writes it.
  Two-argument `set!` writes any place, including a mutable local or raw pointer;
  three-argument `(set! collection key value)` remains the `Set` trait method.
  Symbols beginning with `.` (except `..`) are reserved accessor heads. A
  two-parameter function named `set!` is rejected because it could never be called.
- `field`, `load`, and `store!` remain available as explicit low-level place operations.
  `(field p name)` returns a pointer/reference rather than reading it. Array field
  element: `(index (field s buf) i)`. Prefer `.field` and two-argument `set!` in
  ordinary code; `coil lint --fix` performs mechanically safe migrations.
- Before an interactive project `build`, Coil quickly scans the project's readable
  source forms for syntax that is genuinely no longer accepted, currently legacy
  path imports and the removed `alloc-stack`, `alloc-static`, and `alloc-heap` call
  heads. If it finds any, it offers to run the transactional `coil lint --fix`
  migration before continuing. Valid explicit low-level operations such as
  `primitive/load`, `primitive/store!`, and `primitive/field` do not trigger the
  offer; the semantic linter may still modernize safe typed uses. The scan is based
  on syntax actually present, not a project or compiler version. Non-interactive
  builds never prompt or write; they print the migration command and continue.
- `(primitive/zeroed T)` = a zero value; `(primitive/sizeof T)`, `(primitive/alignof T)`, `(primitive/offsetof S f)` are
  compile-time.
- Passing: `(p Point)` = **immutable ref** (a `store!` through it won't type-check);
  `(mut Point)` = **mutable ref**, pass a place with `(mut place)`; `(ptr Point)` =
  raw pointer (metal / FFI / allocators). A `let` of struct/array type is a stack place.
- ⚠ `(primitive/field rvalue name)` fails — `field` needs a place (a pointer), not a value.
  Load into a place first, or take its address.

**Struct "inheritance" (C-style):** embed a header struct as the first field and
cast pointers — the header is at offset 0, so `(primitive/cast (ptr Sub) hdrptr)` and
`(primitive/cast (ptr Hdr) subptr)` are the same address.

## Sum types (tagged unions)

    (defsum Value (VBool [(b bool)]) (VNil) (VNumber [(n f64)]) (VObj [(o (ptr Obj))]))
    (defsum Option [T] (None) (Some [(val T)]))   ; generic

    (match v
      (VBool [b] …) (VNil [] …) (VNumber [n] …) (VObj [o] …))   ; must be exhaustive
    (Some 42)  (None)  (VNumber 1.5)             ; construct

`match` must be exhaustive, and `(_ body…)` is the catch-all that makes it so —
it covers every variant the explicit arms left out:

    (match v (VNumber [n] n) (_ 0.0))    ; the other three variants -> 0.0
    (match v (_ 0.0))                    ; legal: nothing left to cover

The catch-all names no variant, so it takes **no bind vector** (its body starts right
after the `_`), and it must be written **last** — arms after it could never run.
Nothing else changes: without a `_`, leaving a variant out is still a compile error
that names the missing variants.

Stored by value (tag + payload). Fine inside structs and generic collections.
Recursive sums need a `(ptr …)` child. `_` is also an ordinary wildcard binder in an
arm's bind vector (`(VNumber [_] 1)`).

**Choose `defsum` for a closed set of mutually exclusive shapes.** This is the
default for `Option`/`Result`, state machines, protocol messages, syntax trees,
and compiler type representations: adding a variant makes every non-exhaustive
`match` a compile error. Prefer several small domain sums over one giant
all-purpose node type. For a recursive syntax tree, keep recursive children
behind pointers:

    (defsum Expr
      (IntLit [(value i64)])
      (Add [(left (ptr Expr)) (right (ptr Expr))]))

    (defstruct LocatedExpr [(line i64) (col i64) (expr Expr)])

Use a `defstruct` with an integer `kind` tag only when a uniform,
representation-sensitive record is intentional: for example, a hot token
stream, bytecode instruction, FFI record, or an externally prescribed layout.
Do not use it merely to avoid writing a sum; it permits invalid combinations of
fields and does not make new cases visible to the type checker.

## Pointers, memory, allocation

Import the allocation API with `(import "coil.alloc" :as alloc)`. Use an initialized
`(mut name)` local for ordinary frame storage. Use `alloc/box` (recoverable `Option`)
or `alloc/box!` (diagnostic abort on exhaustion) for one initialized allocator-owned
value. Raw `(primitive/alloc-stack T)` is only for genuinely uninitialized/unsafe
storage such as an FFI output buffer. Low-level global cells may use
`primitive/alloc-static`; hide them behind an accessor.

Everyday memory and layout operations are aliases in ambient `coil.core`: `load`,
`store!`, `field`, `index`, `cast`, `sizeof`, `alignof`, `offsetof`, `zeroed`,
`fnptr-of`, and `call-ptr`. Their primitive declarations live only in
`coil.primitive`; core does not redeclare them.

`(primitive/alias-load T p)` and `(primitive/alias-store! p value)` are unsafe,
explicitly opt-in versions of scalar load/store. They promise that accesses through
incompatible scalar types do not alias, allowing the LLVM backend to attach TBAA
metadata. Use them only when implementing a source language with strict aliasing;
ordinary Coil pointer casts remain permissive, so ordinary `load`/`store!` deliberately
make no such promise. Signed and unsigned integers of the same width may alias, all
pointer types may alias, and 8-bit integer accesses may alias any type.

Allocator-owned storage is managed by `coil.alloc`. Raw storage operations are
available only through `coil.primitive`,
including unsigned `primitive/udiv`/`primitive/urem`, integer bit operations such as
`primitive/ior` and `primitive/ishr`, and floating comparisons such as
`primitive/fcmp-eq`. The modernization lint qualifies code written during the brief
period when those names were accidentally ambient.

`(primitive/index p i)` → `(ptr T)` at element i (pointer arithmetic, scaled by `sizeof T`);
`(primitive/index p -1)` is p−1. Null: `(primitive/cast (ptr T) 0)`; null test `(= (primitive/cast i64 p) 0)`.

**Comparing pointers:** `= != < <= > >=` work on any `(ptr T)` and compare
**addresses** — `(= p q)` is identity (same slot), never a comparison of pointees.
⚠ The metal `icmp-*` ops *reject* pointers ("comparison requires integers"), so these
operators are how you compare them. Ordering makes range checks direct — e.g.
`(and (>= p lo) (< p hi))` to test that `p` points inside a buffer.

**Allocator API** (`alloc.coil`, thread a `(dyn Allocator)`):

    (malloc-allocator)                 ; stable global libc allocator
    (arena-allocator cap)              ; bump allocator
    (alloc [T] a n)                    ; -> (Option (slice T))
    (free [T] a memory)
    (resize [T] a memory n)            ; fixed address only
    (remap [T] a memory n)             ; may move; no copy fallback
    (reallocate [T] a memory n)        ; remap or allocate/copy/free
    (box a T value) / (box! a T value) ; initialized one-value storage
    (destroy [T] a p)

`Allocator` is object-safe: its raw methods mention the concrete `Self` only in the
receiver, so implementations pass as borrowed, copyable `(dyn Allocator)` trait objects.
They do not own or extend the implementation's lifetime. Every raw call carries an
`AllocRequest` with `type-id`, logical `count`, actual `bytes`, and `align`. A TypeId is
represented by that `i64` field: `type-id [T]` produces a process-local nonzero identity
token (including for typed `u8`); only
`bytes-request`/`alloc-bytes` use ID 0 for intentionally untyped bytes. IDs are policy
and diagnostic data, not serializable values. Prefer the typed APIs, which construct and
validate requests and preserve the request across free and growth.

`coil.region` is a tracking allocator: it validates exact ownership and supports
individual free/resize, while `region-close!` releases every remaining allocation.
Ownership lookup and removal are expected O(1), backed by a pointer registry, so a
Region may safely use another Region as its parent without quadratic teardown. Such
nesting still doubles tracking work and metadata; `coil lint --use coil.lint.allocator`
warns about it, and `--debug-checks` enables that lint plus a runtime warning.

For high-churn temporary memory, prefer the owned segmented allocator in
`coil.scratch`. It allocates in amortized O(1), treats individual free as a no-op,
and releases backing segments on reset or close:

    (import "coil.scratch" :as scratch)
    (let [(mut scope) (primitive/zeroed scratch/ScratchArena)]
      (scratch/scratch-init (mut scope) (malloc-allocator))
      (let [a (scratch/scratch-allocator (mut scope))
            mark (scratch/scratch-mark (mut scope))]
        (temporary-work a)
        (scratch/scratch-reset-to! (mut scope) mark)
        (more-temporary-work a))
      (scratch/scratch-close! (mut scope)))

`scratch-reset!` releases every segment while keeping the arena usable;
`scratch-close!` is idempotent and prevents later allocation. A mark belongs to one
arena and becomes invalid if an earlier reset has already released its segment.
Pointers allocated after a mark must not be used after `scratch-reset-to!`.

## Opt-in ownership, deterministic drop, and reference counting

Coil's existing raw/manual memory model remains the default. A type opts into
automatic ownership only by implementing `Drop`, or by structurally containing a
droppable value. The ambient ownership traits are ordinary, inspectable traits:

    (deftrait Copy [Self])
    (deftrait Clone [Self]
      (clone [(self (ref Self))] (-> Self)))
    (deftrait Drop [Self]
      (drop [(self (mut Self))] (-> void)))

An owning value is affine: binding, passing, returning, or storing it transfers
ownership, and reusing the old binding is a compile error. `clone` is the explicit
way to duplicate ownership. Raw pointers, references, slices, scalars, and legacy
manual structs do not acquire a destructor or imply ownership of their pointees.
`(derive Clone T)` generates fieldwise cloning; `(derive Copy T)` generates the
marker only when the compiler can prove that no contained destructor would be
skipped. Structs, active sum payloads, arrays, and generic instances receive
recursive drop glue, in reverse field/element initialization order.

Cleanup is deterministic on normal fallthrough, function exit, `break`,
`continue`, labeled `return-from`, and replacement of an initialized mutable
owner. It uses the same elaborated cleanup node in LLVM, arm64, x64, Wasm, and the
interpreter. `Drop` and explicit `scope`/`defer` compose lexically: inner owning
locals drop before an enclosing scope performs its LIFO defers.

The deliberate escape hatches are:

    (manually-drop owner)             ; suppress automatic destruction
    (manually-drop-into-inner held)   ; consume wrapper, recover owner
    (forget owner)                    ; consume without destruction
    (take! [T] (mut owner))           ; move out, leave place uninitialized

`coil.alloc.AllocatorLease` is an owned, cloneable allocator capability for values
that can escape an allocator's lexical scope. It retains the allocator state and
routes deallocation back to the allocator that created the storage. A borrowed
`(dyn Allocator)` cannot be passed where a lease is required. Use
`malloc-allocator-lease` for process-lifetime allocation or
`coil.leased-region/leased-region-new` for a region that closes only after its last
lease disappears. `unsafe-allocator-lease-new` is reserved for allocator
implementations that can prove their borrowed dispatch object remains valid until
the final lease release. Scratch/resettable allocators do not provide general
escaping leases.

`coil.rc` supplies thread-confined `Rc<T>`/`WeakRc<T>`; `coil.arc` supplies atomic
`Arc<T>`/`Weak<T>`. Both store their allocator lease in the control block and
support `new-in`, `clone`, borrow, count inspection, `downgrade`/`upgrade`, unique
`get-mut`, `try-unwrap`/`into-inner`, and strong/weak destruction. The last strong
owner drops `T` exactly once; the last weak owner moves the lease out, frees the
control block through it, and only then drops the lease. Raw ownership transfers
are explicit pairs such as `arc-into-raw`/`unsafe-arc-from-raw` and must be balanced
exactly once. Strong cycles intentionally leak; use weak handles to break them.
An `Arc` may cross threads only when the retained allocator lease and its callbacks
are thread-safe; Coil does not yet express that requirement with a `Send`-like
trait. Borrow accessors return non-owning pointers which must not outlive a strong
owner—the affine checker is not a general pointer-lifetime checker.

`coil.arc.auto` is the experimental whole-program transparent ARC transform. With
the transform enabled, user modules keep ordinary structs, constructors,
collections, bindings, calls, and closures; lowering supplies hidden ARC owners,
retains, releases, and recursive destruction. Activation is compilation-unit
configuration, not a lexical ownership scope. The definitive semantics and
completion criteria are in `docs/design/TRANSPARENT_AUTOMATIC_ARC.md`.

For Zig-style development allocation, `coil.dbgalloc` provides a stateful allocator
that wraps any backing allocator while exposing the same ordinary `(dyn Allocator)`
interface:

    (import "coil.dbgalloc" :use *)
    (let [debug (debug-allocator-init (malloc-allocator))
          a (debug-allocator-view debug)]
      (some-library-that-allocates a)
      (let [leaks (debug-allocator-deinit! debug)]
        …))

The view can be stored and passed anywhere another allocator can. It tracks exact
allocation ownership in allocator-owned metadata, checks prefix/suffix red zones,
rejects arbitrary and interior-pointer frees without dereferencing the suspect
pointer, checks free size and alignment, detects double frees, and poisons and
quarantines freed payloads. `debug-allocator-deinit!` releases the registry and all
backing blocks, prints a diagnostic when live allocations remain, and returns the
live allocation count (`0` means leak-free). It must run only after all threads have
stopped using the allocator view.

The convenience macro `(debug-allocator inner)` returns a wrapped allocator under
`--debug-checks` and exactly `inner` otherwise, for zero-cost conditional checking.
Use the explicit init/view/deinit API when leak checking or deterministic teardown is
required regardless of compiler flags. `coil.guardalloc` is the heavier alternative:
it places allocations next to inaccessible pages and protects quarantined payload
pages so stale accesses fault immediately.

## Collections (bundled)

The ambient capability traits are the public vocabulary across collections:
`Len`/`len`, `Get`/`get`, `Set`/three-argument `set!`, `Push`/`push!`,
`Pop`/`pop!`, and `Iterable`/`iter` plus `Iterator`/`next`. A collection implements
only the operations its representation can support. `(empty? xs)` works for any
`Len`; `(for x (iter xs) ...)` works for any `Iterable`. Prefer these methods in
application code and examples: they state the capability being used and keep code
generic over any type with the same trait. Namespace-specific functions are for
construction, ownership, representation-specific operations, and implementing the
traits; they are not alternate spellings to teach for a trait operation.

| Namespace and type | Implemented traits and methods |
|---|---|
| `coil.slice`: `(slice T)` | `Len` (`len`), `Get` (`get`), `Set` (`set!`), `Iterable` (`iter`) |
| `coil.arraylist`: `(ArrayList T)` | `Len` (`len`), `Get` (`get`), `Set` (`set!`), `Push` (`push!`), `Pop` (`pop!`), `Iterable` (`iter`) |
| `coil.hashmap`: `(HashMap K V)` | `Len` (`len`), `Get` (`get`), `Set` (`set!`), `Iterable` (`iter`, over keys) |

`coil.iter` provides allocation-free lazy ranges, adapters, and consumers over this
same protocol. Adapter constructors accept any `Iterable`, mint its iterator once,
and pull only when the result's `next` is called. Its public sequence operations
are part of the ambient core vocabulary, so no import is required:

    (let [xs (take 10
               (filter (primitive/fnptr-of divisible-by-four?)
                 (map (primitive/fnptr-of double) (range 0 100))))]
      (fold (primitive/fnptr-of add) 0 xs))

`range` is half-open (`start` through `end - 1`) and itself implements both
`Iterable` and `Iterator`. Lazy adapters are `map`, `filter`, `take`, `skip`,
`enumerate`, `chain`, and `zip`. Consumers are `fold`, `count`, `find`, `any?`, and
`all?`. Following Clojure, callbacks and counts precede the collection: `map f coll`,
`filter pred coll`, `take n coll`, `skip n coll`, and `fold f init coll`. Mapping and
predicates use typed function pointers. No adapter allocates or
materializes an intermediate collection; `take` therefore safely bounds a pipeline
whose source iterator can otherwise be infinite.

For an `ArrayList`, `get` returns an element by value and the mutating methods take
`(mut …)`. Create one with `(al-new [T] a)` and release its backing storage with
`(al-free! (mut xs))`.
`coil.collect` provides allocator-explicit, trait-dispatched construction of owned
collections from array literals or slices:

    (import "coil.collect" :use [collect])
    (let [(mut xs) (collect [(ArrayList i64)] allocator [10 20 30])]
      ...
      (al-free! [i64] (mut xs)))

`collect` dispatches through the public `Collect` trait; collection modules can add
implementations without compiler support. The allocator is deliberately explicit—
the bracket literal itself is inline storage and never silently selects a heap.
For a `HashMap`, `get` returns `(Option V)` and three-argument `set!` inserts or
updates. Construct scalar-key maps with `(hm-new-scalar [K V] a)`
or supply key operations to `(hm-new [K V] a ops)`. Removal and storage release
are representation-specific: use `hm-remove!` and `hm-free!`. String keys:
`(str-keyops)` from `str.coil` OWNS keys
(each is copied into the map's allocator on insert and freed on remove/clear/free);
`(str-keyops-borrowed)` opts into borrowing (the key bytes must outlive the map).
Type args `[T]` come right after the name; usually inferable, so often omittable.

## Strings & bytes

`"…"` has type `(slice u8)` (UTF-8 bytes, static storage). `c"…"` has type
`(ptr i8)` (NUL-terminated C string, for FFI/`printf`). ⚠ Don't pass `"…"` to a
`(ptr i8)` param or `c"…"` to a `(slice u8)` param.

Hexadecimal escapes require an explicit semicolon terminator. In ordinary strings,
`"\x0;"`, `"\x3bb;"`, and `"\x1f603;"` denote Unicode scalar values encoded as
UTF-8. An empty escape, a missing semicolon, a surrogate, or a value above
`0x10ffff` is a reader error. C strings preserve their byte-oriented contract:
`c"\xff;"` emits exactly one byte, and values above `0xff` are rejected.

`(slice T)` is a fat pointer `{data, len}`. `(slice-data s)`, `(slice-len s)`,
`(slice-get s i)`, `(subslice s lo hi)`, `(slice-new [T] ptr n)`. String helpers
(`str.coil`): `(str-len s)`, `(char-at s i)`, `(str-eq a b)`, `(str-hash s)`,
`(substr s lo hi)`, `(str-concat a x y)`.

`coil.str` also provides validated text types alongside the compatible byte-slice
API. `StringView` is a borrowed immutable view of valid UTF-8; `String` is an owned,
growable UTF-8 buffer that stores its allocator and is released explicitly:

    (let [view (string-view-unchecked "hello") ; trusted literal -> StringView
          (mut text) (string-from-view allocator view)]
      (string-push-view! (mut text) (string-view-unchecked " world"))
      (print-str writer (string-view-bytes (string-as-view (load text))))
      (string-free! (mut text)))

Use `(string-view-from-utf8 bytes)` for untrusted bytes; it returns
`(Result StringView Utf8Error)`. `(string-view-bytes view)` borrows the underlying
bytes. `(string-clone allocator text)` makes an independent owner. As with
`al-slice`, a `StringView` into a `String` is invalidated by mutation or free.
`(string-from-utf8 allocator bytes)` validates and copies into an owner.
`(string-take! (mut text))` transfers ownership and resets the source;
`(string-into-bytes! (mut text))` transfers the allocation as a byte slice.

`Rune` represents a Unicode scalar value. `(rune-new value)` validates it, and
iteration over `StringView` or `String` currently yields `Rune` values. Text has no
integer `Get`/`Set`; `(string-index-at-byte view offset)` accepts only UTF-8 scalar
boundaries and returns an opaque `StringIndex`. Search returns the same index type:
`string-view-find`, `string-view-contains?`, `string-view-starts-with?`, and
`string-view-ends-with?`. `String` implements `TextWrite`, whose `write-view!` and
`write-rune!` methods append validated text without exposing byte mutation.
`string-view-trim-ascii` and `string-view-split` return borrowed views; splitting is
an allocation-free `StringSplitIter` driven with `next`.

`(sv "literal")` is the concise, zero-validation spelling for a literal
`StringView`; it rejects non-literal arguments at expansion time. Ordinary string
literals remain `(slice u8)` during migration, so byte-oriented code does not change
meaning implicitly.

Import `coil.unicode.grapheme` for Unicode extended grapheme clusters. `(chars
view)` returns an iterable whose items are borrowed `Char` views. Its generated
Unicode 17 tables implement UAX #29 GB3–GB13, including combining sequences, Hangul,
emoji ZWJ sequences, regional indicators, and Indic conjuncts. Scalar iteration in
`coil.str` remains available without pulling the Unicode tables into the reachable
program.

For migration inventory, mark a declaration with `;; string` and run:

    coil lint file.coil --use coil.lint.string

The checker classifies marked `(slice u8)` declarations as propagation-required,
byte-mutation-ambiguous, or stale-marker. It is report-only: it does not apply a
local signature rewrite that would leave callers ill-typed.

## Character literals

`#\a` `#\Z` `#\0` are that byte's value (an integer literal). Delimiters/quotes work:
`#\(` `#\)` `#\[` `#\]` `#\"` `#\;`. Named: `#\space`=32 `#\newline`=10,
`#\tab`=9 `#\return`=13 `#\nul`=0 `#\backspace`=8, and `#\formfeed`=12.
Hex: `#\u41`=65.
They are plain `i64` literals — use with metal/clean ops after casting the byte:
`(= (primitive/cast i64 (primitive/load p)) #\a)`.

## Functions & function pointers

    (defn name [(a T) (b U)] (-> R) body…)   ; last expr is the return value
    (defn id [T] [(x T)] (-> T) x)            ; generic: [T] before the arg list
    (defn hot-add :inline (Always) [(a i64) (b i64)] (-> i64) (+ a b))
    (defn f [(p (mut Rect))] (-> i64) …)      ; mutable-ref param
    (defn main [(argc i32) (argv (ptr (ptr i8)))] (-> i64) …)   ; CLI entry

Ordinary Coil functions may be called with `:parameter value` pairs in any order:

    (defn move [(point Point) (dx i64) (dy i64)] (-> Point) …)
    (move :dy 20 :point p :dx 10)

Every parameter is required exactly once; missing, repeated, and unknown parameters
are compile errors. A call is either entirely positional or entirely named. Named
argument expressions are evaluated from left to right in source order, while values
are passed to the function in declaration order. Extern, variadic, function-pointer,
and callable-value calls remain positional. To pass a keyword as the first positional
argument, group it with a type ascription: `(takes-keyword (: :hot Keyword))`.

**Function pointers** (native callbacks, dispatch tables):
`(fnptr c [ArgTs…] Ret)` is the type (`c` = C convention); `(primitive/fnptr-of fn)` takes a
function's address; `(primitive/call-ptr fp args…)` calls indirectly. The ambient
`fnptr-of` and `call-ptr` names are core aliases of those declarations. A normal `defn` can be
taken as a `(fnptr c …)` and called indirectly; aggregate (struct/sum) returns
cross the call correctly. Forward references within a file resolve (mutual
recursion is fine) — define in any order.

Declarations accept open, typed annotation pairs between the name and parameter
list. Define an annotation key with its value type, then use any Coil expression
of that type as its value:

    (defsum Route (Get [(path (slice u8))]) (Post [(path (slice u8))]))
    (defannotation :http/route Route)
    (defn users :http/route (Get "/users") [] (-> i64) …)

Annotation values are evaluated once at compile time. Unknown keys, duplicate
uses on one declaration, and values of the wrong type are compile errors. Keys
are open—libraries may define their own—and values may be sums, structs, keywords,
or results of arbitrary compile-time-evaluable expressions.

`:inline` is the built-in annotation with value type `InlinePolicy` (`Always`,
`Hint`, or `Never`). They map to LLVM `alwaysinline`, `inlinehint`, and `noinline`,
respectively. Large parallel O3 builds perform mandatory inlining before
partitioning, so module splitting cannot silently strand an annotated callee in
another partition.

Keywords are first-class `Keyword` values. A literal such as `:hot` constructs a
keyword value in expression position; keywords consumed by a surrounding special
form, such as `:else` or an annotation key, retain their syntactic role.

## Global mutable state

There is **no top-level mutable variable**. Use explicit low-level
`primitive/alloc-static` inside a zero-arg
accessor — it returns the same global cell every call:

    (defn counter [] (-> (ptr i64)) (primitive/alloc-static i64))
    (primitive/store! (counter) (+ (primitive/load (counter)) 1))
    ; for a global struct singleton (like a VM):
    (defstruct VM [(x i64) …])
    (defn vm [] (-> (ptr VM)) (primitive/alloc-static VM))   ; (primitive/load (primitive/field (vm) x)) …

`(primitive/alloc-static T INITIAL)` gives the same persistent writable cell,
but lays `INITIAL` into the binary instead of running stores to construct it.
The initializer is checked as `T` and must be a link-time constant; aggregate
constructors, numeric constant expressions, null pointers, C strings, and
`primitive/fnptr-of` relocations are supported. The global carries `T`'s
alignment. An initializer that depends on runtime state is rejected.

`(const NAME VALUE)` / `(const NAME TYPE VALUE)` — compile-time immutable bindings.
The value is ANY expression, run at compile time: `(const OP_RETURN 0)`, `(const
FACT5 (fact 5))`. An aggregate const (struct/array) is evaluated once and emitted as
a static global (a compile-time lookup table): `(const SQUARES (build-squares))`.

## Compile-time: comptime, macros, reflection

The whole language runs at compile time — one language, two phases. No separate
macro dialect.

**`(comptime E)`** evaluates `E` during compilation and splices the literal result:
`(comptime (fact 5))` compiles to the constant `120` (no call in the output). `E` is
compiled and run as native code, so **the whole language is available**: arithmetic,
`if`/`let`/`loop`, `match`, mutable locals, memory, **generics**, **`sizeof`/`alignof`
/`offsetof`**, allocators and collections, and even **`extern` FFI** (a comptime
`(strlen c"hello!")` really calls libc).

The limit is the RESULT, not the computation — it must be materializable as a
literal: a scalar, a plain struct, a plain sum, an array, or a string. Two things are
a clear located error, never a miscompile:

- a **pointer** (a comptime address would be meaningless in the built program), and
- an aggregate that is a **generic instance** — `(comptime (mk))` returning
  `(Option i64)` or `(Pair i64 i64)` reports "cannot be materialized". Return a plain
  (non-generic) struct or sum instead, or return the scalar you actually need.

Build a lookup table with a loop and index it at runtime. ⚠ Deep **self-recursion**
at comptime is not tail-call-optimized on this path — around 10M frames it crashes the
compiler rather than erroring; write comptime loops with `loop`, which is unaffected.

**Macros are ordinary functions** `[Code…] (-> Code)` — detected by type, no
`defmacro`. `Code` is a first-class value: quote a form with `` `FORM ``, splice a
value in with `~E`, splice a list's elements with `~@E`. Template identifiers keep
their definition context; unquoted syntax keeps its original context. Equal printed
spelling never establishes a binding across independently built fragments.

Create a readable local identifier once with
`(primitive/fresh-identifier "temporary")`, pass that `Code` value through helpers,
and unquote the same value at every binding/reference site. `primitive/gensym`
remains shorthand for an anonymously named fresh identifier. Plain `'name` is
metaprogram-authored syntax too, with the same identity rule as a template
literal: create it once and reuse the value if two fragments must share it. The explicit context
operations are `(primitive/datum->syntax prototype "name")` (intentional capture),
`syntax->datum`, `free-identifier=?`, and `bound-identifier=?`; context introduction
must not be hidden behind `code-symbol`. `&` before the last param makes a macro
variadic (soaks up the rest as one Code list). Calls expand inline, outside-in:

Use `coil dump-hygiene file.coil` when auditing generated code. It prints the
expanded program with canonical `scope`, definition `module`, syntax `origin`,
and transport `flags` metadata while ordinary dumps and diagnostics continue to
show readable source names. An unscoped `code-symbol` used as a lexical identifier
is a hard error; it is suitable only for syntax data such as fields and keywords.

    (defn when [(c Code) (body Code)] (-> Code) `(if ~c (do ~@body) 0))
    (when (< x 10) (println "small"))     ; → (if (< x 10) (do (println …)) 0)

**`(meta (gen …))`** runs a generator at compile time and splices its result as new
top-level forms; later code may depend on what it generates. A name in the
generator's template carries the generator's own definition context, so a
declaration the surrounding program refers to by hand is published with the
explicit context removal — `` `(const ~(primitive/syntax->datum `O_CREAT) 512) ``
(`src/stdlib/fs.coil` is the worked example). A name only the generated forms use
needs no such thing; `primitive/fresh-identifier` gives it its own identity.

**Reflection** — introspect a type by name at comptime (fold to literals):
`(primitive/field-count T)`, `(primitive/variant-count T)`, `(primitive/struct? T)`/`(primitive/sum? T)`/`(primitive/int? T)`/`(primitive/float?
T)`/`(primitive/ptr? T)`/`(primitive/array? T)`, `(primitive/field-name T i)`, `(primitive/field-type-kind T i)`,
`(primitive/field-type-name T i)`, `(primitive/field-index T "name")`. Inside a macro (where a type
arrives as a Code symbol) use the `code-*` family: `code-field-count`/`-name`/`-kind`
/`-type`, `code-type-shape` (safely returns `struct`, `sum`, or `unknown` without
calling a shape-specific reflector), `code-variant-sum`/`-count`/`-name`/`-fields`,
`code-variant-field-name`/`-type` (a variant's payload field by `(SUM VIDX FIDX)`;
the type comes back structured and canonically qualified), and trait reflection
`code-trait-method-count`/`-name`/`-arity`/`-param-type`/`-ret-type` (for generating
vtables). Take Code apart with `code-count`/`code-nth`/`code-rest`/`code-sym`
/`code-list?`/`code-sym?`/`code-int?`. This makes `derive` (`derive.coil`:
eq/hash/keyops) a pure library, not a compiler builtin.

**Memory, made explicit** (docs/design/META_MEMORY.md). Every operation above is
O(1) — `code-rest` and `(primitive/code-slice CODE LO HI)` return *views* that
alias the parent list, which is why cdr-style recursion over Code is linear.
The only operations that copy say so in their names: `(primitive/code-copy c)`
(the deep copy — fresh structure and string payloads) and
`(primitive/code-concat a b)` (a fresh list of A's elements then B's).

Lists are **built**, never grown by re-splicing: `(primitive/code-list-new)`
makes a `CodeBuilder` — its own type, not `Code` — `(primitive/code-list-push!
b elem)` appends, and `(primitive/code-list-done b)` (or unquoting `b` into a
template) freezes it into `Code`. The checker holds the line in both
directions: pushing onto finished Code and reading an unfrozen builder are
compile errors. Writing `` `(~@acc ~x) `` to append — which copies the whole
accumulator per element — is flagged by the standard-profile lint
`coil.lint.meta`, along with `code-rest` fed to its own recursion and splicing
a recursive result per level.

Finished `Code` is also an ordinary immutable collection of child `Code` values:
`(len form)`, `(get form i)`, and `(for child (iter form) ...)` delegate to the
O(1) code accessors and preserve syntax identity, hygiene, source provenance, and
views. Non-list syntax has collection length zero (`code-count` itself remains a
strict list/vector primitive). `CodeBuilder`
implements `Push` but deliberately not `Len`, `Get`, or `Iterable`; use a mutable
binding and `(push! (mut builder) child)`, then
freeze with `(primitive/code-list-done (load builder))`. More commonly,
`(code-extend! builder form)` appends every child and returns the builder, while
`(code-collect form)` returns a new finished list. This lets metaprograms use the
same iterator and push vocabulary as ordinary collection code without weakening
the arena lifetime or allowing finished syntax to mutate.

Each metaprogram invocation runs in its **own arena**: everything it allocates
is released when it returns, and exactly one value survives — the returned
Code, copied out at the boundary. So peak memory is one expansion's working
set, not its allocation history. `COIL_META_ARENA=0` opts out;
`COIL_META_ARENA=poison` fills released memory with `0xDD` so a leaked alias
fails loudly. `COIL_MTRACE=mem` prints a per-metaprogram allocation table at
exit — the tool to reach for when a compile's memory surprises you.

## Metaprograms: whole-program checkers & transforms

A **metaprogram** is an ordinary Coil function that runs at compile time and operates
on the program. There is no metalanguage — it is Coil over Coil, and it is compiled
and run as native code. Four kinds, told apart only by what they receive:

| kind | signature | receives | does |
|---|---|---|---|
| macro | `[Code…] (-> Code)` | its own call site | expands inline |
| generator | via `(meta …)` | nothing | adds top-level forms |
| **checker** | `[(prog Code)] (-> Code)` | every module | reports / vetoes |
| **transform** | `[(prog Code)] (-> Code)` | every module | rewrites the program |

Macros you *call*; checkers and transforms you **register** at top level:

    (checker   my-lint)      ; run it over the whole program
    (transform my-lowering)  ; rewrite the whole program

Registration happens when the module is imported, so a metaprogram can be switched on
without editing any source that uses it. `--use NAME` prepends `(import "NAME" :use *)`
to the entry file; declaring it in `Coil.toml` does the same for every command that
compiles the project — `build`, `run`, `check`, `test` and `lint` alike:

    [metaprograms]
    use = ["myproj.gcauto", "httptap"]

`NAME` is a namespace, never a path: any file under the source roots — or under a
dependency's root, which Coil adds to the namespace index — that declares
`(module httptap)` *is* `httptap`. So a **library can ship a transform** and a consumer
turns it on with one manifest line, no import and no source edit. Transforms compose in
the order listed, the first seeing the original program.

The unqualified forms run at the existing semantic phase, after macro expansion,
resolution, and typechecking. A checker or transform that needs the author's surface
syntax can opt into the syntax phase:

    (checker raw-depth :phase before-expand)
    (transform surface-lowering :phase before-expand)

A transform that must see ordinary macro output but run before resolution and
typechecking can select the post-expansion boundary:

    (transform lower-expanded-markers :phase after-expand)

This phase runs exactly once. Its output is the authoritative input to ordinary
resolution and typechecking and does not enter a second macro-expansion pass. It may
add or remove top-level forms and imports, but any executable macro syntax it emits is
therefore unresolved output rather than a request to expand again. Semantic reflection
is unavailable because no checked model exists yet.

An idempotent semantic pass that completes its rewrite in one traversal can use
`(transform-once FN)`. It receives the same checked whole-program model, but Coil
does not invoke it again merely to prove a fixpoint; the transformed program is
still resolved and typechecked authoritatively before code generation.

Before-expansion metaprograms receive the same module-shaped program, but semantic
reflection is unavailable (`type-of` is `:unknown`, `code-decl` is `:unresolved`, and
`binding-of` has no checked binding). Syntax transforms run to a fixpoint, then syntax
checkers run once, and the resulting forms enter ordinary macro expansion. Registrations
must occur literally at module top level; generated code cannot retroactively register a
before-expansion pass.

Both are handed the program as a list of modules — `((name form…) …)`, one record per
module, head = module name — and see **everything**, including imported and bundled
code. Scope yourself with `(primitive/code-from-user? NODE)` (false for bundled stdlib) or
`(primitive/code-file NODE)`.

**Reporting.** `(primitive/warn NODE MSG)` is a located, non-fatal warning; `(primitive/report NODE MSG)`
is a located error. Both **collect** — you get every diagnostic in one pass, with the
source span underlined, and the build fails after printing them all if any was a
`report`.

**Fixing.** `(primitive/suggest NODE MSG REPLACEMENT)` is a `warn` that also proposes a rewrite:
`REPLACEMENT` is a `Code` value, normally built out of the author's own subnodes, and
the diagnostic gains a `help: try: …` line. Nothing is written by an ordinary build —
`coil lint --fix` is the only writer, and it renders any node that came from source as
its **original bytes**, so comments and formatting inside an untouched branch survive
and only the part that changed is new text. A round that stops compiling is reverted.
Comments between nodes — the one thing no `Code` value records — are carried across the
rewrite, so collapsing a commented `if` chain keeps every comment. See
`docs/archive/AUTOFIX.md`, and `src/examples/metaprogramming/condlint.coil` for a rule that turns a chain of
three or more nested `if`s into a `cond`:

    coil lint app.coil --use myproject.condlint          # report + `help: try:` lines
    coil lint app.coil --use myproject.condlint --diff   # the patch; writes nothing
    coil lint app.coil --use myproject.condlint --fix    # apply it

Checker rules can accept string parameters from the lint CLI. Qualify keys with the
rule namespace so independently loaded rules do not collide, and provide the default
at the read site:

    (let [limit (primitive/lint-param "myproject.depth.maximum" "24")] ...)
    coil lint app.coil --use myproject.depth \
      --lint-param myproject.depth.maximum=40

`--lint-param KEY=VALUE` is repeatable; the last value for a key wins. The checker
owns parsing and validation because parameter schemas are rule-specific. Parameters
apply only to `coil lint`, not ordinary build/run/check commands.

By default, checkers see the program **after macro expansion**, so every
`cond`/`when`/`case` in the file has already become nested `if`s.
`(primitive/code-macro? NODE)` is true for a node the expander produced, which is how
a semantic rule about `if` tells the author's ifs from the ones a macro wrote. Use
`:phase before-expand` when the rule instead needs to inspect the original macro calls
or calculate properties such as raw syntactic nesting depth.

**Checkers run after the program is resolved and typechecked**, so they read the
compiler's authoritative output and layer *policy* on code that already typechecks:

- `(primitive/code-decl NODE)` → a record beginning `(decl MODULE KIND QUALIFIED-NAME)`.
  A function record continues with `[PARAM-TYPE…] RET`; a sum-variant construction's
  qualified name is the exact selected variant. Struct/sum/trait/const/extern records
  need no additional fields; `:unresolved`/`:ambiguous` are returned otherwise. Pass the
  **reference node** (a call, `fnptr-of`, variant construction, or
  type reference) and it resolves to the exact entity the checker picked — correct even
  when the same simple name exists in several modules.
- `(primitive/type-of NODE)` → the expression's **inferred** type as Code (`i64`, `(ptr i64)`), or
  `:unknown`. Inferred, not syntactic: `(getf)` reports `f64` because that's what `getf`
  returns.
- `(primitive/binding-of NODE)` → the local-binding identity a reference resolves to (0 = a
  global). Two references with the same positive id name the same local, so a shadowed
  local is distinguishable from its outer namesake — what a borrow/move checker keys on.

**Transforms** run to a fixpoint before checkers: each round reads the checked program,
rewrites, and the program is re-resolved and re-typechecked. A transform also *tolerates*
a program that doesn't typecheck yet (the model is empty, `code-decl` → `:unresolved`),
so it can be the thing that makes the program valid — e.g. rewriting `(inc E)` to
`(primitive/iadd E 1)` where `inc` is otherwise undefined. It may add or remove top-level forms.

Macro expansion detects an invocation that reproduces identical syntax and reports it
as a structural cycle immediately. The diagnostic names the qualified macro, points at
the invocation, and renders the macro-expansion provenance chain. The global expansion
budget reports the active macro, total expansion count, and current expansion-chain
depth. `--macro-expansion-limit N` overrides the default budget of 100000;
`--trace-macros` prints every macro invocation, while `--trace-macro QUALIFIED.NAME`
prints only the selected macro. These flags work with every frontend command, including
`check`, `build`, `run`, and the dump commands.

**A dialect is a single import.** A module containing `(checker …)`/`(transform …)`
registrations *is* a dialect; importing it applies the whole stack, in import order,
transforms before checkers. To apply one without editing the source:

    coil run app.coil --use myproject.lint  # repeatable; works on run and build

Metaprograms compile to native code — always. Macros, `(meta …)` generators,
checkers, transforms, and `(comptime E)` / `(const …)` folding all run on the one
compiled engine with the whole language available: generics, collections, FFI,
allocation. (The old tree-walking interpreter and its `COIL_META` flag are gone.)

## I/O & FFI

    (extern printf   :cc c [(ptr i8) ...] (-> i32))     ; ... = variadic
    (extern snprintf :cc c [(ptr i8) i64 (ptr i8) ...] (-> i32))
    (extern write    :cc c [i64 (ptr i8) i64] (-> i64)) ; fd 1=stdout 2=stderr
    (extern exit     :cc c [i32] (-> void))

`(printf c"%d\n" 42)`. Floats cross the C ABI correctly; structs pass/return by
value with the real C ABI. To call a Coil fn from C (e.g. `qsort` comparator) pass
`(primitive/fnptr-of f)`. Ambient `print`/`println` (over stdout) need no import.
`io.coil`/`fmt.coil` give a `(ptr Writer)` API: `(stdout)`, `(stderr)`,
`(print-str w s)`, `(fmt w "n={d} s={s} f={f}\n" a b c)`. ⚠ `{f}` is a fixed
6-digit display, NOT C `%g`; for exact float formatting call libc `snprintf` with
`c"%g"`. `coil cimport header.h` auto-generates bindings from a real C header.

`coil.debug` provides the derivable `Debug` trait plus `debug` and `debugln`:

    (import "coil.debug" :use *)
    (derive Debug Point)
    (debugln (Point :x 10 :y 20))
    ; (Point
    ;   :x 10
    ;   :y 20
    ; )

Derived structs and sums are pretty-printed by default with recursive indentation.
Their output uses valid named-constructor syntax, so a value whose component `Debug`
implementations emit source can be pasted back into a program.

An option-bearing `Debug` derive can omit sensitive, noisy, or non-debuggable struct
fields:

    (defstruct Account [(name (slice u8)) (password_hash (slice u8)) (active bool)])
    (derive (Debug (field password_hash (skip))) Account)
    (debugln (Account :name "Ada" :password_hash "secret" :active true))
    ; (Account
    ;   :name "Ada"
    ;   :active true
    ; )

Sum fields are qualified by their variant so identical field names in different
variants are never conflated:

    (defsum Event
      (Created [(name (slice u8)) (token (slice u8))])
      (Deleted [(name (slice u8)) (audit_record (slice u8))]))
    (derive (Debug
              (variant Created (field token (skip)))
              (variant Deleted (field audit_record (skip))))
            Event)

A skipped field does not need a `Debug` implementation because the generated method
does not reference it. Unknown or duplicate variants, fields, and options are compile
errors. Omitting a required constructor field necessarily means this configured output
is diagnostic rather than pasteable source.
In source, `(cimport "sys/ioctl.h" :use [ioctl])` asks Clang to emit only the
named declarations and macros, so using a large platform header does not expose
its whole API. The generated declaration preserves details such as C variadics.

To migrate or audit a handwritten declaration, associate it with its authoritative
header and run `coil lint`:

    (extern ioctl :cc c [i32 u64 (ptr TerminalWindowSize)] (-> i32)
            :header "sys/ioctl.h")

If Clang can selectively import `ioctl`, lint reports the handwritten declaration;
`coil lint FILE --fix` replaces it with
`(cimport "sys/ioctl.h" :use [ioctl])`. The replacement imports only `ioctl`, not
the header's neighboring declarations. `:header` is a lint migration annotation,
not part of the resulting FFI declaration.

## Doc comments (`;;;`)

A run of lines starting with `;;;` **directly above a definition** is that
definition's documentation. `;` and `;;` stay ordinary comments, so documenting
something is opt-in and an incidental note never becomes API docs.

    ;;; Append v; grows (doubling, min 4) if full.
    ;;; Returns the new length.
    (defn append-one! [T] [(l (mut (ArrayList T))) (v T)] (-> i64) …)

    ;; internal note — NOT documentation
    (defn al-raw [] (-> i64) …)

    coil doc src/stdlib/arraylist.coil     ; markdown: name, signature, doc, per definition

`defn`, `defstruct`, `defsum`, `deftrait`, `defcc`, `const` and `extern` are all
documentable. The doc lives in the source and nowhere else — there is no separate
doc field to drift.

**`(primitive/code-doc NODE)`** returns a node's doc as a `(slice u8)` at comptime (`""` when
it has none, including any macro-generated node), so doc tooling is a library
metaprogram rather than a compiler feature: a checker holding the program can read
every definition's doc, e.g. to enforce that exported functions are documented.

## Tests, assertions, debug checks

`deftest`, `assert`, `assert-eq`, and `assert-ne` are ambient `coil.core` names.
`deftest` expands to a conventionally named function; the assertions and runner remain
in the ordinary library module `coil.assert`, not compiler syntax. Its transform
discovers every `(deftest …)` and runs each in its **own process** — so a failing
assertion aborts only its own test and still prints. The process is spawned, not
forked: a test binary that links a threaded runtime (a Go c-archive, CoreFoundation)
gives a forked child locks whose owning threads do not exist in it.

    (deftest arithmetic               ; no import needed
      (assert-eq (+ 2 2) 4)
      (assert (< 1 2))
      (assert-ne 1 2))

    coil test mytests.coil            ; exit 0 iff all pass
    coil test mytests.coil --filter arithmetic
                                       ; run names containing "arithmetic"
    coil test mytests.coil --filter fast --filter smoke
                                       ; repeatable filters combine by OR
    coil test mytests.coil --list --filter arithmetic
                                       ; list that same selected set, run nothing

Name filters apply after `deftest` and `defprop` discovery and before test processes
are spawned. A filtered-out test is neither run nor counted as passing; an invocation
whose filters match no tests reports `0 tests matched` and exits nonzero. The positional
selector remains exclusively a project path/suite selector.

Inside a project, `coil test FILE` inherits `Coil.toml`, including `[cc]`, `[link]`,
dependencies, and the configured target. With no file, Coil discovers every test file
under `[test].roots` whose name has a configured suffix (defaults: `tests/` and
`_test.coil`):

    coil test                         ; every test file in the default suites
    coil test provider                ; only paths containing "provider"
    coil test --list                  ; what would run, grouped by suite
    coil test --jobs 4                ; build once, run up to four tests concurrently
    coil test --no-run                ; compile and link without executing

### Named test suites

Some tests should not run just because someone typed `coil test` — they hit a live
service, they cost money, they take minutes. Declare those as a **named suite** and
mark it `default = false`:

    [test.suites.unit]
    roots = ["tests"]
    suffixes = ["_test.coil"]

    [test.suites.integration]
    roots = ["tests/integration"]
    suffixes = ["_integration.coil"]
    default = false

Membership is **opt-out**: a suite runs unless it says `default = false`. So `coil test`
keeps meaning "run the tests", and the expensive suite hides behind exactly one line.

### Property-based testing (`coil.prop`)

`(defprop …)` states a law over generated inputs instead of one example, and on
failure reports the **smallest** input that breaks it. It is a library too, and
`coil test` discovers a `defprop` exactly like a `deftest`.

    (import "coil.prop" :use *)

    (defprop reverse-is-its-own-inverse [(xs (ArrayList i64))]
      (list-eq (reverse (reverse xs)) xs))     ; the body yields bool

Arguments are generated by each type's `Arbitrary` impl — scalars, `(slice u8)`,
`(ArrayList T)`, `(Option T)` and anything you `(derive Arbitrary T)` — so there is
nothing to wire up. **Nobody writes a shrinker.** Every random decision is recorded
on a *tape*, and minimization edits the tape and re-runs the generator, so a
generator's invariants survive shrinking by construction:

    FAILED after 27 cases (2 shrinks, 8 shrink calls)

      counterexample:
        xs = (0 0 0)

      reproduce:  --seed=1903151487994059799 --cases=200 coil test …

Inside a body: `(assume COND)` discards a case that misses a precondition,
`(classify "label" COND)` and `(collect "label" EXPR)` report the input
distribution (and warn when one bucket swallows the run), `(prop-target! EXPR)`
asks the runner to hill-climb toward a number instead of sampling uniformly, and
`(prop-src)` hands you the `Source` to draw from directly (`draw-int!`,
`draw-len!`, `arb-string`, …) when a type's default distribution is wrong for one
property.

Derive both halves for your own structs and sums with
`(derive Arbitrary Debug T)`
(recursive sums terminate on a fuel budget and shrink toward the first-declared
variant, so declare the base case first).

Or override generation per type with a trait impl — the most specific one wins,
so `(impl Arbitrary (ArrayList u8))` can produce realistic payloads while every
other list keeps the generic impl:

    (impl Arbitrary Email
      (arbitrary [(out (mut Email)) (s (ptr Source))] (-> i64) …))

⚠ A hand-written `Debug` impl names `Writer`, which lives in `coil.io` —
`coil.prop` does not reexport that module (it would put `print-str`, `stdout` and
friends into every property file), so add `(import "coil.io" :as io)` and write
`(w (ptr io/Writer))`.

**Coverage-guided fuzzing.** `coil fuzz FILE.coil [-n N]`
rebuilds a property file with edge instrumentation (`coil emit-ir` piped through
clang's `-fsanitize-coverage`; the callbacks are ordinary Coil functions in
`coil.prop.cov`, so an ordinary build is unaffected) and mutates a corpus of
tapes, keeping whatever reaches a basic block nothing has reached yet. Because
the corpus holds *choices* rather than bytes, every mutant is a well-formed value
of the argument types. A bug behind a four-byte magic value — unreachable by
sampling — is found in tens of thousands of cases.

A property that **crashes or hangs** is minimized too, not just one that returns
false: generation runs in a spawned worker process, the runner bisects to the case
that killed it, and shrinks with each candidate in its own process. Knobs, all optional:
`--cases` (200), `--seed` (derived from the property name, so runs
are reproducible), `--size`, `--shrink`, `--timeout` (60s),
`--target-steps`, `--verbose`, `--no-fork`. Design and prior art:
`docs/design/PROPERTY_TESTING.md`; worked example:
`src/examples/property-testing.coil`.

    coil test                         ; default suites only
    coil test --suite integration     ; that suite (repeatable)
    coil test --suite all             ; every suite, default or not
    coil test --list --suite all      ; opt-in suites are marked [opt-in]

`coil verify` runs the default suites only, and `coil check` typechecks exactly those
files, so an opt-in suite never gets pulled in by the everyday pipeline. Two things deliberately ignore suite
membership: naming a file (`coil test tests/integration/live_integration.coil` always
runs it), and `lint`, which treats every configured suffix as a test file whichever
suite owns it. A filename selector applies *after* suite selection.

Project testing compiles every selected test file into one harness executable. That
executable then runs each `deftest` in an isolated child process, so shared imports
are compiled once for the suite rather than once per test file. Naming one file
explicitly remains a one-file test build. `coil check` loads the same corpus the same
way, and loads it alongside the entry graph: one front end over the whole project, not
one per test file and not one per graph. Typechecking is not reachability-gated, so the
tests are checked without the runner's generated `main`, and everything the two graphs
share is read, expanded and checked once. That is why `check` stays a few seconds on a
project with dozens of test files.

A bare `[test]` section is still exactly what it was — it becomes the suite named
`default`, so a manifest that never mentions suites behaves identically, down to the
flat `--list` output. Both `all` and `default` are reserved as suite names.

Suites are validated like the rest of the manifest: an unknown `--suite` name, a
duplicate suite, a non-boolean `default`, or a declared `roots` entry that does not
exist is a hard error rather than a run that quietly tests nothing.

A failure prints the offending expression and its `file:line`, recovered at expansion
time via `code-src`/`code-line`, then aborts.

**`--debug-checks`** turns on the safety tier, all of it zero-cost when off (each
check lives behind a macro branched on `(primitive/debug-checks?)` at expansion time, so the
off-path expansion is byte-identical to the unchecked form):

- `slice-get`/`slice-set!`/`subslice` bounds-check (and `subslice` rejects `lo > hi`);
- slice/string headers reject negative lengths and nonempty null data pointers;
- `ArrayList` reads, writes, growth, clearing, freeing, and ownership transfer validate
  `0 <= len <= cap`; indexed `get`/`set!` operations also bounds-check, turning
  corrupt collection headers into named diagnostics before pointer traversal;
- `HashMap` validates its capacity/counts, storage, allocator, and `KeyOps` vtable;
- allocator calls validate the allocator and its three function slots;
- `debug-allocator-init`/`debug-allocator-view` (`dbgalloc.coil`) create a passable,
  registry-backed allocator that detects invalid/interior/double frees, size and
  alignment mismatches, checks prefix/suffix red zones, quarantines blocks, poisons
  freed payloads to `0xDE`, and reports live leaks from `debug-allocator-deinit!`;
- `(guard-allocator inner)` (`guardalloc.coil`) uses inaccessible pages around mappings
  and changes freed payload pages to `PROT_NONE` while quarantined;
- a bundled checker warns when a function returns a pointer to a stack local.

`--debug-checks` auto-loads that checker as a metaprogram by injecting an import into
your file. The entry file need not declare `(module NAME)`.

`--sanitize=address` marks generated functions for LLVM AddressSanitizer and runs the
ASan pass over the program object. Sanitized executable links use the Clang beside
`llvm-config`, keeping instrumentation and runtime versions matched.

Three additional, mutually exclusive modes cover different failure classes:

- `--sanitize=thread` applies LLVM ThreadSanitizer and diagnoses unsynchronized
  memory accesses with their participating thread stacks;
- `--sanitize=memory` applies LLVM MemorySanitizer to find reads of uninitialized
  values. It is Linux-only because LLVM ships no Darwin MSan runtime, and useful
  results require native dependencies to be instrumented or intercepted too;
- `--sanitize=undefined` inserts Coil's language-level checks for signed add/subtract/
  multiply overflow, integer division/remainder by zero, signed division overflow,
  and negative or oversized shift exponents. These checks are emitted in Coil codegen
  because LLVM has no general UBSan IR pass—Clang normally inserts them in its frontend.

Select only one `--sanitize=…` mode per artifact. ASan, TSan, and MSan have
incompatible process-wide runtimes, and Coil rejects combinations rather than
silently producing a partially instrumented executable. Metaprogram dylibs remain
unsanitized because they are loaded into the already-running compiler process.

`--debug-runtime` is the development profile: it enables `--debug-checks`, ASan,
LLVM strong stack canaries, indirect-call/dynamic-dispatch validation, and automatic
fatal-signal diagnostics. The crash handler reports the signal, fault address, thread,
context pointer, recent events, and a bounded stack trace, then restores and re-raises
the original signal. Set `COIL_CRASH_REPORT=/path/to/report` to pre-open a crash artifact;
it includes compiler/profile/target/process metadata plus the crash report. Applications
can add context with `debug-runtime-event!` and bound the ring with
`debug-runtime-set-event-capacity!` from `coil.debug-runtime`.

For foreign APIs that fill caller storage, `coil.checked-ffi` provides
`with-checked-out`: it allocates the supplied probed `sizeof(T)`/`alignof(T)` range,
surrounds the output with canaries, evaluates the foreign call, and validates the
canaries before returning. `coil.thread/thread-spawn-configured` accepts explicit stack and guard
sizes using a probed opaque `pthread_attr_t`. Compiler worker defaults can be overridden
with `COIL_WORKER_STACK_SIZE` and `COIL_WORKER_GUARD_SIZE` (decimal bytes). Parallel
LLVM codegen workers have a separate 8 MiB default, overridden with
`COIL_LLVM_WORKER_STACK_SIZE`, so changing their stack does not change the compiler
pipeline's deep stack.

## Reserved-name gotchas ⚠

`call` and `block` are builtins/macros — don't name a `defn` `call` or `block`
(the one exception is the method inside an `impl Callable`). You'll otherwise get
"call target: expected symbol" / "macro arity mismatch". Avoid `type`
as a struct field name. When in doubt, prefix your name (`p-call`, `vm-call`).

## The standard library

The library ships WITH the compiler as one toolchain: `<prefix>/bin/coil` beside
`<prefix>/lib/coil/stdlib`, installed together by `python3 scripts/dev.py install`. A
compiler locates it by walking up from its own executable (then from the working
directory, so a checkout works as-is), which is how the compiler and the library can
never be two different versions. `coil --version` prints which library it found; if
there is none, the compiler says so instead of guessing. Given a toolchain,
`(import "coil.NAME" :use *)` works from anywhere with no path setup:
`coil.alloc` (allocators), `coil.arraylist`, `coil.hashmap`, `coil.slice`, `coil.str`,
`coil.mem`, `coil.io`, `coil.fmt`, `coil.print`, `coil.fs` (files), `coil.result`
(Option/Result), `coil.control` (case/while/for/…), `coil.match` (deprecated: its
`match-else` is now just `match` with a `_` arm — plain `coil lint --fix` rewrites
calls), `coil.try`,
`coil.thread`, `coil.atomic`, `coil.simd`, `coil.closure`, `coil.derive`, `coil.mmio`,
`coil.reader` (THE s-expression reader — the one the compiler itself uses), `coil.json` (zero-copy token-tape parser), `coil.serde` +
`coil.serde.derive`/`coil.serde.json`/`coil.serde.sexp`/`coil.serde.msgpack`/
`coil.serde.value` (format-agnostic serialization: derive `Serialize`/
`Deserialize` once — with `rename`/`default`/`skip`/`with`/`boxed`/`deny-unknown`
field options — and pick the format at the call; `JVal` decodes documents of
unknown shape — see `docs/design/SERDE.md`), `coil.http.parser`
(streaming HTTP/1.x messages), `coil.http.server`
(strict llhttp-backed HTTP/1.x requests), `coil.http.client` (blocking libcurl transport —
`request` buffers the body, `request-stream` delivers it to a `BodySink` as it arrives, and
`request-stream-cancellable` accepts a `coil.cancellation/Cancellation` token whose pipe
wakes an otherwise idle transfer),
`coil.jit` (optional source-linked in-process compiler/JIT), `coil.assert`
(assert/deftest), `coil.prop` (property-based testing: `defprop`,
the `Arbitrary` trait, tape-based shrinking — see above), `coil.dbgalloc`, `coil.guardalloc`, `coil.crash`,
`coil.debug-runtime` and `coil.checked-ffi`, plus `coil.os`,
`coil.time`, `coil.selectors`, `coil.subprocess`,
`coil.process`, and the standard `coil.lint.default` safe-fix profile. Plain
`coil lint` automatically loads `coil.modernize`, `coil.lint.match-else`,
`coil.lint.result-flow`, and `coil.lint.named-constructor` through that profile;
allocator-composition checks remain opt-in policy/debug checks. The common
ones are summarized above; import a module and call
its functions directly.

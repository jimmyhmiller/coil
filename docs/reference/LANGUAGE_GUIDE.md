# The Coil Language — a guide for agents

A dense, practical reference for writing correct Coil. Coil is a low-level,
Lisp-syntax, ahead-of-time language: s-expressions, a macro system, and a type
system where **calling convention** and **allocation** are first-class. It emits
a native object and links with the system `cc`; the `wasm32-unknown-unknown`
target instead writes a WebAssembly module directly. Read this end to end before
writing Coil; most mistakes come from the gotchas marked ⚠.

The compiler is self-contained: the prelude and standard library are bundled
inside it, so `coil` and every `(import "…")` below work from any directory.

## Build & run

    coil run   file.coil                 # build + run a single file
    coil build file.coil -o out          # build a native executable
    coil build file.coil --target wasm32-unknown-unknown -o out.wasm
    coil run                             # build+run the ./Coil.toml project
    coil test                            # discover and run project test suites
    coil check                           # check every project target graph
    coil verify                          # fmt + lint + check + native build + test
    coil run -- arg1 arg2                # forward args to the program
    coil build file.coil -lm             # link a library (-l<name>)
    coil repl                            # interactive session
    coil fmt   file.coil                 # print formatted source (--write / --check)
    coil lint  file.coil --use my.rules   # run checkers (--diff / --fix applies them)
    coil doc   file.coil                 # markdown for the module's `;;`-documented surface
    coil namespaces                      # bundled standard-library namespace names
    coil namespace coil.arraylist        # every definition/signature, plus available docs

`main`'s `i64` return is the process exit code. There is no JIT. A file that is
imported must start with `(module NAME)`. `Coil.toml`:

    [package]
    name  = "app"
    entry = "main.coil"      # default src/main.coil
    [dependencies]
    local_math = { path = "../local-math" }
    remote_math = { git = "https://example.com/math.git", sha = "0123456789abcdef0123456789abcdef01234567" }
    [link]
    libs = ["m"]             # -> -lm

Project tools inherit the same package, native, target, and link configuration as
`coil build`. **Naming a file inside a project changes only the entry, not the
configuration**: `coil build src/main.coil`, `coil run src/main.coil` and
`coil check src/main.coil` resolve the same dependencies and apply the same
`[cc]`, `[link]` and `[metaprograms]` as the bare command, so an
`(import "somedep.lib")` that works one way works the other. (`-o` is still
required when you name the file; `[build] out` names the *package* artifact.)
Outside a project — no `Coil.toml` — a file is compiled on its own, as always.

A fuller project can declare:

    [package]
    name = "app"
    entry = "src/main.coil"
    source-roots = ["src", "tests"]
    exclude = ["src/generated/*"]

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

Native objects and depfiles live under `.coil/build/native/`; sources and headers
are rebuilt only when their inputs or toolchain configuration change. Test runners
use collision-free paths under `.coil/build/test/`.

Dependency names are manifest-local handles, not import prefixes. Coil adds each
dependency root to the namespace index, so consumers import the namespace declared
by the dependency's source—for example `"local_math.numeric"`—regardless of where
that source lives inside the dependency. `path` is relative to the project directory.
A Git dependency requires a full 40- or 64-digit commit SHA; Coil checks out that
exact commit under `.coil/deps/<name>-<sha>`. Git branches and tags are deliberately
not accepted as pins. The string shorthand `local_math = "../local-math"` is
equivalent to `{ path = "../local-math" }`.

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

Module names may contain dots. By convention, every project owns a prefix and uses
it for all importable modules: `myproject`, `myproject.http`, `myproject.db.user`,
and so on. This is a convention, not a compiler requirement; a one-part name remains
valid. Public/package namespaces may also use a leading owner scope, for example
`(module @myname.project.thing)`. The complete scoped name is the module identity.

The bundled standard library follows the same rule under `coil.*`: `coil.core`,
`coil.json`, `coil.http.client`, `coil.http.server`, `coil.slice`, etc. Import these
using their public namespace, for example `(import "coil.time" :as time)`.

Use `coil namespaces` to discover every standard-library namespace bundled into
the installed compiler. `coil namespace NAME` then prints all definitions and
signatures in one of those namespaces and includes each definition's `;;` docs
when present. It also accepts a source path, so `coil namespace src/my_lib.coil`
is the namespace inventory for project code. `coil doc FILE` remains the concise,
documented-only view.

Imports name namespaces, never files. Coil indexes every `.coil` source under the
project's configured `source-roots` (the project directory for a direct-file build),
each dependency root, and the bundled standard library. File placement beneath those
roots is irrelevant: `(import "myproject.db.user" :as user)` resolves the file whose
leading declaration is `(module myproject.db.user)`. A namespace declared by multiple
files is an error. Relative paths, absolute paths, dependency-prefixed paths, and bare
filenames such as `"time.coil"` are not valid imports.

`coil lint --fix` has a syntax-preflight phase that runs before import loading or type
checking. It migrates legacy path imports by opening the old target, reading its
`(module …)` declaration, and replacing only the import string. This works even when
the legacy import prevents the program from compiling.
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

## Numbers, bool, casts

Int types `i8 i16 i32 i64 u8 u32 u64 …` (arbitrary width, real signedness).
Floats `f32 f64`. `bool` is real (`true`/`false`). Literals infer width from
context; hex `0x1F`, binary `0b1010`, octal `0o17`, underscores `1_000`.

`(primitive/cast T x)` converts: `(primitive/cast i64 f)` truncates f64→i64 (numeric), `(primitive/cast f64 i)`
converts int→float, `(primitive/cast (ptr T) x)` reinterprets pointers, `(primitive/cast i64 p)` is a
pointer's address. ⚠ `cast` between f64 and i64 is a **numeric conversion, not a
bit reinterpret**. For a bitcast (e.g. NaN-boxing) round-trip through memory:
`(let [p (alloc/stack i64)] (primitive/store! p bits) (primitive/load (primitive/cast (ptr f64) p)))` — LLVM at
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

- `(primitive/field p name)` → a `(ptr FieldType)` (a place); then `load`/`store!`.
  Requires `p : (ptr Struct)`. Nested: `(primitive/field (primitive/field s lo) x)`. Array field
  element: `(primitive/index (primitive/field s buf) i)`.
- `(primitive/load place)` reads, `(primitive/store! place v)` writes.
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

Stored by value (tag + payload). Fine inside structs and generic collections.
Recursive sums need a `(ptr …)` child. `_` is a wildcard binder.

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

Import the allocation API with `(import "coil.alloc" :as alloc)`. Its three
allocation operations each yield `(ptr T)`:

- `(alloc/stack T)` → `alloca`, this frame. ⚠ **NEVER call `alloc/stack` inside a
  loop that runs many times** — alloca isn't freed until the function returns, so
  it leaks the C stack per iteration and eventually segfaults. Hoist it into a
  `let` outside the loop and reuse the slot.
- `(alloc/static T)` → one global cell per call site (see Globals).
- `(alloc/heap T)` → `malloc` (pair with `primitive/free`).

Everyday memory and layout operations are aliases in ambient `coil.core`: `load`,
`store!`, `field`, `index`, `cast`, `sizeof`, `alignof`, `offsetof`, `zeroed`,
`fnptr-of`, and `call-ptr`. Their primitive declarations live only in
`coil.primitive`; core does not redeclare them.

Allocation is owned by `coil.alloc`, so use `alloc/stack`, `alloc/static`, or
`alloc/heap`. All other raw operations are available only through `coil.primitive`,
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

**Allocator API** (`alloc.coil`, thread a `(ptr Allocator)`):

    (malloc-allocator)                 ; stable global libc allocator
    (arena-allocator cap)              ; bump allocator
    (create [T] a)                     ; -> (Option (ptr T))
    (alloc-slice [T] a n)              ; -> (Option (ptr T)) array of n
    (destroy [T] a p)                  ; free one T
    (unwrap-ptr [T] optbox)            ; (Option (ptr T)) -> (ptr T), null on OOM
    (raw-alloc a size align)           ; -> (Option (ptr i8))
    (raw-resize a p oldsz newsz align) ; realloc
    (raw-free a p size align)
    ; idiom: (let [p (unwrap-ptr [T] (create [T] a))] (primitive/store! p …) p)

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
    (let [scope (alloc/stack scratch/ScratchArena)]
      (scratch/scratch-init scope (malloc-allocator))
      (let [a (scratch/scratch-allocator scope)
            mark (scratch/scratch-mark scope)]
        (temporary-work a)
        (scratch/scratch-reset-to! scope mark)
        (more-temporary-work a))
      (scratch/scratch-close! scope))

`scratch-reset!` releases every segment while keeping the arena usable;
`scratch-close!` is idempotent and prevents later allocation. A mark belongs to one
arena and becomes invalid if an earlier reset has already released its segment.
Pointers allocated after a mark must not be used after `scratch-reset-to!`.

For Zig-style development allocation, `coil.dbgalloc` provides a stateful allocator
that wraps any backing allocator while exposing the same ordinary `(ptr Allocator)`
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

**ArrayList** (`arraylist.coil`): `(al-new [T] a)`, `(al-len [T] l)`,
`(al-get [T] l i)`, `(al-set! [T] (mut l) i v)`, `(al-push! [T] (mut l) v)`,
`(al-pop! [T] (mut l))`, `(al-free! [T] (mut l))`. Mutators take `(mut …)`.
**HashMap** (`hashmap.coil`): `(hm-new [K V] a ops)`, `(hm-new-scalar [K V] a)`,
`(hm-get [K V] m k)` → `(Option V)`, `(hm-put! [K V] (mut m) k v)`,
`(hm-remove! [K V] (mut m) k)`. String keys: `(str-keyops)` from `str.coil` OWNS keys
(each is copied into the map's allocator on insert and freed on remove/clear/free);
`(str-keyops-borrowed)` opts into borrowing (the key bytes must outlive the map).
Type args `[T]` come right after the name; usually inferable, so often omittable.

## Strings & bytes

`"…"` has type `(slice u8)` (UTF-8 bytes, static storage). `c"…"` has type
`(ptr i8)` (NUL-terminated C string, for FFI/`printf`). ⚠ Don't pass `"…"` to a
`(ptr i8)` param or `c"…"` to a `(slice u8)` param.

`(slice T)` is a fat pointer `{data, len}`. `(slice-data s)`, `(slice-len s)`,
`(slice-get s i)`, `(subslice s lo hi)`, `(slice-new [T] ptr n)`. String helpers
(`str.coil`): `(str-len s)`, `(char-at s i)`, `(str-eq a b)`, `(str-hash s)`,
`(substr s lo hi)`, `(str-concat a x y)`.

## Character literals

`\a` `\Z` `\0` are that byte's value (an integer literal). Delimiters/quotes work:
`\(` `\)` `\{` `\}` `\"` `\;` `\.` `\,` `\*`. Named: `\space`=32 `\newline`=10
`\tab`=9 `\return`=13 `\nul`=0 `\backspace`=8 `\formfeed`=12. Hex: `\u41`=65.
They are plain `i64` literals — use with metal/clean ops after casting the byte:
`(= (primitive/cast i64 (primitive/load p)) \a)`.

## Functions & function pointers

    (defn name [(a T) (b U)] (-> R) body…)   ; last expr is the return value
    (defn id [T] [(x T)] (-> T) x)            ; generic: [T] before the arg list
    (defn f [(p (mut Rect))] (-> i64) …)      ; mutable-ref param
    (defn main [(argc i32) (argv (ptr (ptr i8)))] (-> i64) …)   ; CLI entry

**Function pointers** (native callbacks, dispatch tables):
`(fnptr c [ArgTs…] Ret)` is the type (`c` = C convention); `(primitive/fnptr-of fn)` takes a
function's address; `(primitive/call-ptr fp args…)` calls indirectly. The ambient
`fnptr-of` and `call-ptr` names are core aliases of those declarations. A normal `defn` can be
taken as a `(fnptr c …)` and called indirectly; aggregate (struct/sum) returns
cross the call correctly. Forward references within a file resolve (mutual
recursion is fine) — define in any order.

## Global mutable state

There is **no top-level mutable variable**. Use `alloc/static` inside a zero-arg
accessor — it returns the same global cell every call:

    (defn counter [] (-> (ptr i64)) (alloc/static i64))
    (primitive/store! (counter) (+ (primitive/load (counter)) 1))
    ; for a global struct singleton (like a VM):
    (defstruct VM [(x i64) …])
    (defn vm [] (-> (ptr VM)) (alloc/static VM))   ; (primitive/load (primitive/field (vm) x)) …

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
value in with `~E`, splice a list's elements with `~@E`. `(primitive/gensym)` gives a fresh
symbol so macro temporaries don't capture. `&` before the last param makes it
variadic (soaks up the rest as one Code list). Calls expand inline, outside-in:

    (defn when [(c Code) (body Code)] (-> Code) `(if ~c (do ~@body) 0))
    (when (< x 10) (println "small"))     ; → (if (< x 10) (do (println …)) 0)

**`(meta (gen …))`** runs a generator at compile time and splices its result as new
top-level forms; later code may depend on what it generates.

**Reflection** — introspect a type by name at comptime (fold to literals):
`(primitive/field-count T)`, `(primitive/variant-count T)`, `(primitive/struct? T)`/`(primitive/sum? T)`/`(primitive/int? T)`/`(primitive/float?
T)`/`(primitive/ptr? T)`/`(primitive/array? T)`, `(primitive/field-name T i)`, `(primitive/field-type-kind T i)`,
`(primitive/field-type-name T i)`, `(primitive/field-index T "name")`. Inside a macro (where a type
arrives as a Code symbol) use the `code-*` family: `code-field-count`/`-name`/`-kind`
/`-type`, `code-variant-sum`/`-count`/`-name`/`-fields`,
`code-variant-field-name`/`-type` (a variant's payload field by `(SUM VIDX FIDX)`;
the type comes back structured and canonically qualified), and trait reflection
`code-trait-method-count`/`-name`/`-arity`/`-param-type`/`-ret-type` (for generating
vtables). Take Code apart with `code-count`/`code-nth`/`code-rest`/`code-sym`
/`code-list?`/`code-sym?`/`code-int?`. This makes `derive` (`derive.coil`:
eq/hash/keyops) a pure library, not a compiler builtin.

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

By default, checkers see the program **after macro expansion**, so every
`cond`/`when`/`case` in the file has already become nested `if`s.
`(primitive/code-macro? NODE)` is true for a node the expander produced, which is how
a semantic rule about `if` tells the author's ifs from the ones a macro wrote. Use
`:phase before-expand` when the rule instead needs to inspect the original macro calls
or calculate properties such as raw syntactic nesting depth.

**Checkers run after the program is resolved and typechecked**, so they read the
compiler's authoritative output and layer *policy* on code that already typechecks:

- `(primitive/code-decl NODE)` → `(decl MODULE fn [PARAM-TYPE…] RET)` for a function, or
  `(decl MODULE KIND)` for a struct/sum/trait/const/extern; `:unresolved`/`:ambiguous`
  otherwise. Pass the **reference node** (a call, `fnptr-of`, variant construction, or
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

## Doc comments (`;;`)

A run of lines starting with `;;` **directly above a definition** is that
definition's documentation. A single `;` stays an ordinary comment, so documenting
something is opt-in and an incidental note never becomes API docs.

    ;; Append v; grows (doubling, min 4) if full.
    ;; Returns the new length.
    (defn al-push! [T] [(l (mut (ArrayList T))) (v T)] (-> i64) …)

    ; internal note — NOT documentation
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

`deftest` and `assert` are a library (`assert.coil`), not compiler features.
`coil test FILE` loads it for you, discovers every `(deftest …)`, and runs each in a
**forked child** — so a failing assertion aborts only its own test and still prints.

    (module mytests)                  ; ⚠ REQUIRED — `coil test` imports assert.coil
    (deftest arithmetic               ;   for you, and a file that imports must
      (assert-eq (+ 2 2) 4)           ;   declare a module
      (assert (< 1 2))
      (assert-ne 1 2))

    coil test mytests.coil            ; exit 0 iff all pass

Inside a project, `coil test FILE` inherits `Coil.toml`, including `[cc]`, `[link]`,
dependencies, and the configured target. With no file, Coil discovers every test file
under `[test].roots` whose name has a configured suffix (defaults: `tests/` and
`_test.coil`):

    coil test                         ; every test file in the default suites
    coil test provider                ; only paths containing "provider"
    coil test --list                  ; what would run, grouped by suite
    coil test --jobs 4                ; build/run four test binaries concurrently
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

    coil test                         ; default suites only
    coil test --suite integration     ; that suite (repeatable)
    coil test --suite all             ; every suite, default or not
    coil test --list --suite all      ; opt-in suites are marked [opt-in]

`coil verify` and `coil check` run the default suites only, so an opt-in suite never
gets pulled in by the everyday pipeline. Two things deliberately ignore suite
membership: naming a file (`coil test tests/integration/live_integration.coil` always
runs it), and `lint`, which treats every configured suffix as a test file whichever
suite owns it. A filename selector applies *after* suite selection.

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
  `0 <= len <= cap`; indexed `al-get`/`al-set!` operations also bounds-check, turning
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

⚠ `--debug-checks` auto-loads that checker as a metaprogram, so — exactly like
`coil test` — the file must declare `(module NAME)`.

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
with `COIL_WORKER_STACK_SIZE` and `COIL_WORKER_GUARD_SIZE` (decimal bytes).

## Reserved-name gotchas ⚠

`call` and `block` are builtins/macros — don't name a `defn` `call` or `block`
(you'll get "call target: expected symbol" / "macro arity mismatch"). Avoid `type`
as a struct field name. When in doubt, prefix your name (`p-call`, `vm-call`).

## Bundled standard library

These modules ship inside the compiler — `(import "coil.NAME" :use *)` works from
anywhere, no path or install step:
`coil.alloc` (allocators), `coil.arraylist`, `coil.hashmap`, `coil.slice`, `coil.str`,
`coil.mem`, `coil.io`, `coil.fmt`, `coil.print`, `coil.fs` (files), `coil.result`
(Option/Result), `coil.control` (case/while/for/…), `coil.match`, `coil.try`,
`coil.thread`, `coil.atomic`, `coil.simd`, `coil.closure`, `coil.derive`, `coil.mmio`,
`coil.reader` (THE s-expression reader — the one the compiler itself uses), `coil.json` (zero-copy token-tape parser), `coil.serde` +
`coil.serde.derive`/`coil.serde.json`/`coil.serde.sexp`/`coil.serde.msgpack`/
`coil.serde.value` (format-agnostic serialization: derive `Serialize`/
`Deserialize` once — with `rename`/`default`/`skip`/`with`/`boxed`/`deny-unknown`
field options — and pick the format at the call; `JVal` decodes documents of
unknown shape — see `docs/design/SERDE.md`), `coil.http.parser`
(streaming HTTP/1.x messages), `coil.http.server`
(strict llhttp-backed HTTP/1.x requests), `coil.http.client` (blocking libcurl transport —
`request` buffers the body, `request-stream` delivers it to a `BodySink` as it arrives, for
SSE and other long responses),
`coil.assert` (assert/deftest), `coil.dbgalloc`, `coil.guardalloc`, `coil.crash`,
`coil.debug-runtime`, `coil.checked-ffi`, and `coil.stacklint`, plus `coil.os`,
`coil.time`, `coil.selectors`, `coil.subprocess`,
`coil.process`, and `coil.lint.result-flow` for hosted system programming and Result
flow migration. The common ones are summarized above; import a module and call
its functions directly.

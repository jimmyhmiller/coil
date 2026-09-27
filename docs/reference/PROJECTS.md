# Coil projects

A single file needs no setup: `coil run hello.coil`. Once a program has more
than one file, dependencies, native libraries or tests, give it a `Coil.toml`.

## Your first project

```sh
coil new hello        # hello/Coil.toml and hello/src/main.coil
cd hello
coil run              # build and run the package
```

`coil new` writes the minimal manifest:

```toml
[package]
name  = "hello"
entry = "src/main.coil"
```

`entry` defaults to `src/main.coil`. `main` returns an `i64`, which becomes the
process exit code. `coil new` also writes a `.gitignore` covering `/build`
(outputs) and `/.coil` (caches).

## Commands

Every project command reads the same `Coil.toml`.

```sh
coil run                    # build and run the package; args after -- go to the program
coil build                  # build/release/<package-name>
coil build --debug          # DWARF symbols, build/debug/<package-name>
coil check                  # typecheck the entry graph and every test file; no codegen
coil test                   # run the test suites (see TESTING.md)
coil fmt --write            # format the project's sources
coil lint                   # run the project's lint rules
coil verify                 # fmt check + lint + check + link + test, in one go
coil install                # build, then install as ~/.local/bin/<package-name>
coil install --root DIR     # install as DIR/bin/<package-name>
```

`coil check` never links, so it cannot catch a missing library; `coil verify`
links, so it validates `[link]` and `[cc]`. The install root is
`--root`, then `COIL_INSTALL_ROOT`, then `~/.local`.

Naming a file inside a project changes only the entry point. `coil build src/tool.coil` uses the same dependencies, native
inputs and metaprograms as a bare `coil build`, and writes
`build/release/tool`. Outside a project, a file is compiled on its own.

## Manifest reference

| Section | Keys | Purpose |
|---|---|---|
| `[package]` | `name`, `entry`, `source-roots`, `exclude`, `casefold` | What the package is and where its source lives |
| `[workspace]` | `name`, `members` | A root that groups several packages (replaces `[package]`) |
| `[dependencies]` | `NAME = { path … }` or `{ git … }` | Other Coil packages |
| `[build]` | `out`, `optimization`, `target`, `debug` | Defaults for the package executable |
| `[run]` | `args` | Arguments `coil run` passes to the program |
| `[artifacts.NAME]` | `kind`, `entry`, `out`, `optimization`, link keys | Extra objects and executables |
| `[link]` | `libs`, `frameworks`, `search-paths`, `objects`, `flags` | Native link inputs |
| `[cc]` | `sources`, `include-dirs`, `flags` | C sources compiled and linked in |
| `[native-dependencies]` | `NAME = { pkg-config … }` or `{ flags-command … }` | Discovered native libraries |
| `[test]`, `[test.suites.NAME]` | `roots`, `suffixes`, `default` | Test discovery (see TESTING.md) |
| `[lint]` | `rules` | Extra lint rule files |
| `[metaprograms]` | `use` | Metaprogram namespaces applied to every compile |
| `[readers]` | `".ext" = "namespace"` | Reader metaprogram for a file suffix |
| `[modules]` | `"namespace" = "path"` | Map a non-Coil file to a module name |
| `[manifest.providers]` | `section = "namespace"` | Let a library own a manifest section |
| `[language]` | `stdlib`, `prelude`, `core-providers` | Choose the standard-library profile |

Coil rejects unknown sections and keys, so a typo fails the build.

### Package keys

```toml
[package]
name = "app"
entry = "src/main.coil"
source-roots = ["src", "tests"]      # default: src/ and tests/, or the package dir
exclude = ["src/generated/*", "tests/fixtures"]
```

Imports name modules, not files. Coil indexes every `.coil` file under the
source roots, and `(import "app.db.user")` finds the file that begins with
`(module app.db.user)`, wherever it sits. Put fixtures and standalone repro
programs under `exclude` so they are neither indexed nor linted.

### Build keys

```toml
[build]
out = "build/app"          # override the executable path
optimization = 2           # default -O level; an explicit -O flag wins
target = "wasm32-unknown-unknown"
debug = true               # same as passing --debug

[run]
args = ["--verbose"]
```

## Dependencies

```toml
[dependencies]
local_math  = { path = "../local-math" }
local_math2 = "../local-math"                   # shorthand for { path = … }
remote_math = { git = "https://example.com/math.git", tag = "v1.2.0" }
pinned      = { git = "https://example.com/math.git", sha = "0123456789abcdef0123456789abcdef01234567" }
mono_pkg    = { git = "https://example.com/mono.git", branch = "main", subdir = "packages/math" }
```

- The dependency name is a local handle. You import the modules the
  dependency declares, e.g. `(import "local_math.numeric")`.
- A git dependency takes exactly one of `sha` (a full 40- or 64-digit commit),
  `tag`, or `branch`. Coil resolves a tag or branch to a commit on every
  invocation, so it tracks the repository.
- `subdir` selects a package inside the checkout. It must be a
  repository-relative directory containing a `Coil.toml`.
- A dependency with a `Coil.toml` brings along its own source roots,
  exclusions, dependencies and native inputs. Coil composes a package once, even
  when a diamond or a cycle reaches it twice.

### Prebuilt dependencies

```toml
[dependencies]
engine = { path = "../engine", prebuilt = true }
```

Coil compiles a prebuilt dependency once into `.coil/units/<backend>/<name>`
and links it from then on, recompiling only when its sources, the compiler or
the build options change. Consumers compile against a small interface instead
of the dependency's whole source. The dependency's manifest needs an `entry`
naming the module to prebuild; without one, Coil prints a note and compiles it
from source. Only the names the module lists in `(export …)` go into the
interface, plus the module's traits and impls. Impls and traits written in the
module (including `derive`) are copied as source; ones the module's own
metaprograms generate are carried from the compiled module, and a consumer
calls the unit's own compiled methods. `build-unit` refuses a module whose
metaprograms generate a generic impl, and one that registers a checker or
transform, rather than ship an interface that silently lacks them.

To build and use a unit by hand:

```sh
coil build-unit engine/src/engine.coil -o build/engine-unit
coil build app.coil --unit build/engine-unit
```

A unit links only into a build that uses the same backend (`--backend`); a
mismatch is an error that names both. The installed toolchain ships `coil.jit`
as a prebuilt unit, which is why importing it builds quickly.

## Workspaces

A repository with several packages declares a workspace root instead of a
package:

```toml
[workspace]
name    = "tools"
members = ["packages/*", "apps/*"]
```

```text
Coil.toml                         [workspace] name = "tools"
packages/parser/Coil.toml         [package] name = "parser"          (library: no entry)
packages/parser/src/syntax.coil   (module tools.parser.syntax)
apps/cli/Coil.toml                [package] name = "cli", entry = "src/main.coil"
apps/cli/src/main.coil            (module tools.cli.main) (import "tools.parser.syntax")
```

- Each member's modules are named `<workspace>.<package>.<more>`. Package
  `parser` owns `tools.parser.syntax`, and a module named exactly
  `tools.parser` is an error, reported at its path.
- Members import each other with no dependency declarations.
- `build`, `run`, `check`, `lint` and `fmt` at the root fan out over the
  members that declare an `entry`. A member without one is a library, compiled
  through whoever imports it.
- A `tests/` directory at the workspace root is indexed too, without being a
  package.

## Linking native code

### Add a system library

```toml
[link]
libs = ["m", "curl"]            # -lm -lcurl
search-paths = ["/opt/local/lib"]
frameworks = ["Cocoa"]          # macOS
objects = ["vendor/fast.o"]
flags = ["-Wl,-dead_strip"]
```

For a one-off build, `coil build app.coil -lm --link-flag -Wl,-dead_strip`
does the same from the command line.

### Discover a library with pkg-config or a config tool

```toml
[native-dependencies]
libcurl = { pkg-config = "libcurl" }
llvm    = { flags-command = "llvm-config --ldflags --libs --system-libs" }
```

A `flags-command`'s whitespace-separated stdout is passed to the linker. A
failing provider stops the build that needed it.

### Compile C sources into the program

```toml
[cc]
sources = ["native/app.c"]
include-dirs = ["native"]
flags = ["-std=c11", "-Wall"]
```

Objects are cached under `.coil/build/native/` and rebuilt only when a source,
header or flag changes. Declare the C functions with `extern` or generate the
declarations with `cimport`.

### Which programs link what

A dependency's `[link]`, `[cc]` and `[native-dependencies]` apply only to
programs that import one of its modules. Two programs in one package
can therefore link different libraries. Your own package's native inputs
always apply to its own executable. If you declare `extern`s for a
dependency's C symbols without importing any of its modules, the link fails
and names the dependency; import something from it, or add the library to your
own `[link]`.

## Extra artifacts

A package can build more than its main executable:

```toml
[artifacts.runtime]
kind  = "object"                  # a relocatable object, like `coil emit-obj`
entry = "src/runtime.coil"
out   = "build/runtime.o"

[artifacts.helper]
kind  = "executable"              # a second, separately linked program
entry = "src/helper/main.coil"
out   = "build/helper"
optimization = 2
libs = ["m"]                      # link keys, same meaning as in [link]
native-dependencies = ["zlib"]    # names from [native-dependencies]
```

A bare `coil build` or `coil run` builds every artifact, in manifest order,
before the package executable. `coil build FILE`, `coil install` and
`coil test` build none. Artifacts share the package's source roots,
dependencies, target and metaprograms, but not its link inputs. An executable
artifact links only what it lists, plus what its own imports need. A native
dependency named by an artifact belongs to that artifact alone, which keeps
apart two libraries that define the same symbols. Object artifacts are not
linked, so link keys on them are errors. Output paths are relative to the
manifest and must all differ.

## Metaprograms for the whole project

```toml
[metaprograms]
use = ["myproj.gcauto", "httptap"]
```

Each namespace is imported into every compile the project runs: `build`,
`run`, `check`, `test` and `lint`. A library can ship a checker or a transform,
and a consumer turns it on with one line. The command-line form is
`--use NAME`. See the language guide's metaprogram section for writing one.

## Reading other file formats as modules

A reader metaprogram turns a non-Coil file into Coil forms, so it can be
imported like any module.

```toml
[readers]
".json" = "myproj.readers.json"

[modules]
"myproj.data.people" = "src/data/people.json"
```

```text
(module myproj.readers.json)
(import "coil.primitive" :as primitive)

(reader-provider "myproj.readers.json" read-json)

;;; `context` is (read-context PATH SOURCE ROLE INPUTS ARGS).
(defn read-json [(context Code)] (-> Code)
  (let [source (primitive/code-nth context 2)]
    ...))   ; return one form, or (do FORM...)
```

- A file becomes a module only through a `[modules]` entry, or through a
  `coil-module: NAME` marker on its first line (anything before the marker is
  treated as the guest language's comment leader). Configuring a suffix does
  not turn every matching file into a module.
- Reader modules are read by Coil's ordinary reader. Their output may omit
  `(module …)`; the loader supplies the indexed name.
- Different suffixes can use different readers, each compiled in isolation,
  and one program may import several guest languages.
- A provider can hand text to the built-in configurable s-expression reader:
  ``(primitive/code-read source `(reader-config :unquote #\, :splice #\@))``.
- `--use NAME` on the command line can install a reader for the entry file
  itself.
- Repeating a suffix, mapping one file to two names, or naming a module with no
  `reader-provider` is an error.

`[package] casefold = "<module>"` marks one module whose import ASCII-folds
the importing file's identifiers, for case-insensitive guest languages.

## Custom manifest sections

```toml
[manifest.providers]
c = "myproj.readers.c"

[c.raylib]
sources = ["vendor/raylib/src/raylib.c"]
include-paths = ["vendor/raylib/src"]
```

A provider claims a section and every `[section.*]` below it. Coil does not
check the keys inside a claimed section; they belong to the provider, which
finds the manifest through the `COIL_MANIFEST_PATH` environment variable. An
unclaimed unknown section is still an error.

## Choosing the standard library

By default every module sees the full standard library, and `coil.core` is
implicitly imported. `[language]` narrows that for embedded or sandboxed code.

### Hermetic: the language foundation without the host

```toml
[language]
stdlib = "hermetic"
```

Only the environment-free namespaces are admitted: `coil.primitive`,
`coil.control`, `coil.try`, `coil.result`, `coil.match`, `coil.iter`,
`coil.derive`, `coil.dyn`, `coil.var`, `coil.async`, `coil.atomic`,
`coil.simd` and `coil.assert.hermetic`. Importing anything else is an error,
anywhere in the program. So are native dependencies and `[link]` inputs.
Assertions trap without printing. `stdlib = "full"` is the default, spelled
out.

### Supplying your own ambient names

A module offers names to the implicit `coil.core` with `provide-core`:

```text
(module platform.core)
(defn platform-answer [] (-> i64) 42)
(provide-core [platform-answer])
```

```toml
[language]
stdlib = "hermetic"
core-providers = ["platform.core"]

[dependencies]
platform = { path = "../platform" }
```

Only the root manifest's `core-providers` list activates a provider;
dependencies cannot add ambient names. The list is ordered, and a later entry
overrides an earlier one. Root providers outrank the profile's own, so a board
can replace `println`, or supply its own `assert-eq` fault handler under the
hermetic profile. An overridden definition stays reachable by its qualified
name.

### No bundled library at all

```toml
[language]
stdlib = false
prelude = "platform.prelude"

[dependencies]
platform = { path = "../platform" }
```

`stdlib = false` removes the bundled prelude and every bundled namespace.
`prelude` is then required: its public names become every module's implicit
import. Language syntax, the built-in types and the compiler primitives remain.
The choice covers the whole program, so a dependency cannot bring back
`coil.io` or anything else.

## Updating the toolchain

`coil update` downloads a complete compiler-and-library toolchain, verifies it,
and atomically switches `~/.local/bin/coil` to it.

```sh
export COIL_UPDATE_URL=https://example.com/coil/v1/channels/nightly.json
coil update
coil update --rollback      # switch back to the previous toolchain
```

| Variable | Meaning |
|---|---|
| `COIL_UPDATE_URL` | Absolute HTTPS URL of the channel manifest (schema v1) |
| `COIL_UPDATE_HEADERS` | Extra request headers, one `Name: value` per line |
| `COIL_UPDATE_HEADERS_FILE` | The same, read from a file (use one or the other) |
| `COIL_UPDATE_CA_FILE` | CA bundle for a private endpoint |

Toolchains are unpacked under `~/.local/lib/coil/toolchains/nightly/<commit>`.
Coil checks the download's size and SHA-256 before extraction, and runs the new
compiler's `--version` before switching. Headers go only to the
manifest's own origin; redirects and cross-origin artifacts are refused.

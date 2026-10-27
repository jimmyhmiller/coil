# Compile-time units: link the library's macros instead of compiling them

## The problem

Before a macro call expands, the macro has to be compiled, with every function
it calls. Stage 3 of expansion (`stage3-round`, src/compiler/frontend/expander.coil)
does that from source in every compilation: resolve the whole program, take
every Code-signed function and its closure, check it, expand the macro calls the
check rejects, and go round again. Almost all of that closure is the standard
library's — hello world compiled 111 library macros and ~300 functions in 11
rounds, 0.33 s of its 0.41 s; the compiler defines 11 macros of its own with a
49-function closure, inside a stage 3 of 5.2 s — and it is the same work in
every program.

## Units

A compile-time unit (artifact_provider.coil, `CtUnitMetadata` in
artifact_wire.coil) is one library module's compile-time code compiled once:

- **built** by `coil build-ct-unit MODULE DIR`, which compiles a program
  importing MODULE from source and takes MODULE's functions that only
  compile-time code reaches (`code-phase-func-names`), as written, non-generic;
- **exported** under their own names (`unit_exports`, `unit_build`), the macros
  among them too: a macro is as often called as a function by other
  compile-time code as it is expanded, so the name a declaration links is the
  name the engine looks the entry up by;
- **declared**: for each, the `(declare NAME [PARAMS] (-> R))` a program puts in
  place of its definition, from the definition's own header;
- **validated** like a checker profile: this compiler's digest, host, target,
  and the digest of every source the build read.

At the start of stage 3 — after the derive desugaring, and in a cross build on
the program's side before the host twin copies it — a hook the driver installs
(`ct-units-install-hook`) loads the unit of every library module the program
loads, puts its macros into the engine, and replaces each function it holds
with its declaration. The program never parses, expands, checks or compiles
those bodies; its own metaprograms link the declarations by name. When every
compile-time function the program has is a declaration
(`stage3-all-prebuilt?`), its closure is declarations alone and no image is
built.

## Opening a unit is not loading its image

Opening a unit reads its metadata and checks it current; that is all its
declarations need. Its image is loaded the first time code in it is: when one
of its macros first runs (the engine resolves an entry with no address through
`me-entry-fp`), or before the compilation builds a metaprogram that links one
of its functions (`ct-unit-link`). Hello world opens 28 units and loads 13.

What a unit is checked against is cheap to know: the compiler is named by the
content hash its linker recorded (Mach-O `LC_UUID`, ELF build-id;
`compiler-identity`), read from memory instead of hashing the 7 MB binary in
every process, and each input file is hashed once per process however many units
read it (`artifact-file-digest-once`).

## What makes one image serve every compilation

A unit is loaded once per process, `RTLD_GLOBAL`, and serves every compilation
in it: a session's later submissions, generated units, a lint's analyses.

- **Templates carry no position.** A quote template's source and expansion ids
  are the build's numbering, which no loader shares. They are cleared when the
  unit is built (`ct-unit-sanitize!`); a macro's output takes the call's
  position, as everything else it builds does.
- **An image reads its own templates.** `coil_mp_init` hands an artifact image
  its registry, and the shim passes it with every template lookup
  (`mh-quoted`), so a unit's function called from another image's macro reads
  its own syntax. An image a compilation builds is handed none and reads the
  running entry's, which a retained session moves between compilations.
- **Profiles and providers stay self-contained.** They are loaded before any
  stage 3 has loaded units, so they are built with units off.

## Where units come from

An installed toolchain keeps them at `<lib>/coil/ct-units`, built by
`dev.py install` and rebuilt on demand when stale. A checkout's compiler keeps
them beside the binary (`<binary>.ct-units`) and never builds them on demand:
`dev.py build candidate`, `dev.py ct-units`, and the rebootstraps build them
(a seed refresh skips them), so the gates compile as an installed toolchain does.

## Measured (dev.py benchmark frontend, against e612ae13)

| workload | wall | instructions | peak |
|---|---|---|---|
| hello | -66% | -64% | -41% |
| calc | -65% | -56% | -39% |
| statemachine | -53% | -39% | -34% |
| compiler check | -43% | -52% | -8% |
| compiler lint | -22% | -29% | -5% |

(including the checker/resolver fixes of 33f493de and cefb8a51.)

## Next

The compiler's own stage 3 still resolves the whole unexpanded program
tolerantly to find its 11 macros; with the library's bodies gone, a resolve that
parses only the bodies the closure reaches is the next cut. Lint's source view
(1.2 s, ~1.5 GB on the compiler) and the frontend's phase-held memory follow.

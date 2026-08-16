# Porting dossier: compile-time reader metaprograms

## Goal

Allow a compiler setup to replace the initial reading of an input file with an
ordinary compiled Coil metaprogram. A provider receives raw source and returns
normal `Code`; the ordinary loader, expander, checker, backend, and linker then
continue.

```coil
(module my.language)
(reader-provider "my.language.reader" read-source)
```

```coil
(defn read-source [(context Code)] (-> Code) ...)
```

```sh
coil run program.custom --use my.language
```

This is not a preprocessor executable, evaluator, process protocol, or runtime
parser. It is the normal compiler invoking a metaprogram before it can parse the
target language.

## Branch provenance

- `f25db52` — initial generic read phase.
- `97e5b26` — reader configurations use canonical character literals.

The original commit also added the Scheme reader consumer. Extract the generic
protocol first. Scheme is evidence that punctuation is configurable, not a
required part of the feature.

## Public contract

The setup module declares exactly one provider:

```coil
(reader-provider "provider.namespace" provider-function)
```

The provider signature is:

```coil
Code -> Code
```

Its argument has the shape:

```text
(read-context PATH SOURCE KIND)
```

- `PATH` is the source path as a Code string.
- `SOURCE` is the complete raw source as a Code string.
- `KIND` identifies why reading was requested; the current entry-file path uses
  `entry`, and future kinds must be documented rather than guessed by providers.

The result is either one form or `(do FORM...)`, which is unpacked into the
initial form stream and stamped with the target source identity.

Providers that still want s-expressions can delegate to:

```coil
(primitive/code-read source
  `(reader-config :unquote #\, :splice #\@ :keywords false))
```

Returning `Code`, rather than only a `ReaderConfig`, is what permits completely
different syntaxes such as Brainfuck.

## Bootstrap architecture

The target cannot be parsed before its reader exists. The driver therefore:

1. Builds the namespace index using the normal Coil reader.
2. Examines `--use` setup modules for a `reader-provider` declaration.
3. Constructs a small synthetic Coil setup module importing only the provider
   namespace and registering its function for the read phase.
4. Loads, expands, checks, and compiles that setup with the normal Coil reader.
5. Invokes the compiled provider with `(read-context ...)`.
6. Uses the returned forms as the target's initial syntax.
7. Continues through the ordinary compiler pipeline.

Imports needed to compile the provider itself always use Coil's default reader.
Otherwise the compiler would need the custom reader to compile the custom reader.

## Implementation anatomy

- `src/compiler/driver.coil`
  - `ReaderProvider`, declaration discovery, `read-context-code`, and
    `initial-read`;
  - integration before the target's ordinary `read-all` call;
  - namespace and bundled-stdlib lookup.
- `src/compiler/expander.coil`
  - read-phase registration recognition;
  - `run-read-provider-named` and duplicate-provider diagnostics.
- `src/compiler/comptime.coil`
  - configurable `code-read` host operation and reader-config decoding.
- `src/stdlib/reader.coil`
  - `ReaderConfig` and configurable punctuation/keyword behavior.
- `src/stdlib/primitive.coil`
  - public metaprogram declarations for the read operation.
- `src/compiler/loader.coil` and `src/compiler/parser.coil`
  - declaration tolerance so `reader-provider` is metadata, not runtime code.
- `docs/reference/LANGUAGE_GUIDE.md` and generated guide.

## Dependencies to remove during extraction

The current branch's implementation is written against linked `Sexp` lists.
That representation is explicitly not one of the selected landing priorities.
Port the protocol against main's existing `Sexp`/`Code` representation. Nothing
about reader metaprograms requires persistent linked lists or improper lists.

Likewise, do not require:

- Scheme or Chez modules;
- staged procedural syntax;
- `coil run --meta`;
- destructive `Code` operations;
- allocation tracing or arena generations.

The existing compiled macro/read-entry mechanism is sufficient if it can invoke
one checked `Code -> Code` provider during bootstrap.

## Known gaps and questions

- Multiple `--use` modules can currently expose providers. The branch rejects
  ambiguity. Keep that rule unless a deliberate composition protocol is designed.
- Define whether imported textual files inherit a reader automatically. The
  branch makes namespace imports use Coil syntax while Scheme textual `load`
  explicitly reuses Scheme punctuation; this should become a general, documented
  policy.
- Diagnostics returned from provider compilation and provider execution must be
  attributed to the setup or target source correctly.
- Source stamping currently applies target identity to emitted top-level forms;
  generated subtrees and provider-authored source spans need an explicit policy.
- Project configuration, stdin, formatter commands, `check`, `build`, and `run`
  should all agree about when setup discovery happens.
- A provider must not gain accidental access to a half-initialized target program.

## Acceptance

- A non-s-expression fixture compiles through the public CLI.
- A configurable s-expression fixture changes punctuation without forking the
  compiler reader.
- Provider compilation uses the default Coil reader and cannot recurse into
  itself.
- Zero providers preserves byte-for-byte ordinary reading behavior.
- Multiple providers produce a clear diagnostic.
- Provider syntax/type/runtime failures are located and do not crash the host.
- The feature works with strict bundled-stdlib lookup outside the repository.
- A self-hosted candidate reaches its stage2/stage3 fixpoint and passes the
  bounded modernize gate plus relevant reader/load/CLI gates.


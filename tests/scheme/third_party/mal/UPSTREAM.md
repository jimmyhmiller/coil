# Mal Scheme compatibility target

This directory tracks the independently authored Scheme implementation from
Joel Martin's [Mal (Make a Lisp)](https://github.com/kanaka/mal).

- upstream commit: `2bbfaa54cca4908efc90b4173b1406e260788e8a`
- Scheme implementation author credited upstream: Vasilij Schneidermann
- license: Mozilla Public License 2.0
- upstream paths: `impls/scheme/` and `tests/step*_*.mal`

The Coil files are compatibility ports, not original implementations. Keep the
interpreter algorithms and test expectations aligned with upstream. Adaptations
must be listed here instead of being allowed to disappear into the port.

Current adaptations:

1. R7RS `define-library` declarations become a Coil module importing
   `coil.scheme`.
2. The high-frequency R7RS Mal value record uses one private, traced Coil Scheme
   heap object. Chez's mechanically generated comparison retains the portable
   mutable-vector representation. Lower-frequency internal products remain
   mutable Scheme vectors; accessor semantics are unchanged.
3. Stage 1 tokenization walks a Scheme string by index because Coil does not yet
   expose R7RS string input ports. The token grammar and resulting Mal objects
   follow upstream `impls/scheme/lib/reader.sld`.
4. Stage 1 printing constructs Scheme strings directly because Coil does not yet
   expose R7RS string output ports. Escaping and collection rendering follow
   upstream `impls/scheme/lib/printer.sld`.
5. The first compile exposed Coil compatibility defects in procedure-valued
   `cond =>`, direct calls through a procedure parameter, and generated literal
   lifting. Stage 1 uses equivalent explicit `if`/`case` forms while those
   general dialect defects remain tracked by the port.
6. Mal exceptions use an explicit pending-value slot consumed by the nearest
   `try*`. This preserves nested throw/rethrow behavior without depending on
   host continuations or a non-R5RS exception facility.
7. Mal maps are association lists with last-key-wins construction and
   order-independent equality, matching the upstream observable semantics.

Current verification at this pin:

- positive stateful corpora pass for every upstream stage 2 through stepA;
- stage 9 passes 159/159 selected actions, including throw/catch;
- all 55/55 pinned output/error regular-expression cases across stages pass;
- stepA passes 111/111 selected actions, including `time-ms` and file loading;
- the pinned upstream Mal-in-Mal interpreter self-hosts and evaluates a nested
  program that prints `SELFHOST-OK 42`.

Run the complete compatibility, self-host, and matched benchmark workflow with:

    python3 scripts/scheme-mal.py --compiler <candidate>

Build and run the interactive final-stage interpreter with:

    coil build tests/scheme/apps/mal_cli.coil -o /tmp/coil-mal
    /tmp/coil-mal

The test runner fetches the pinned upstream corpus into a temporary cache and
verifies its SHA-256 before deriving cases. Output/error regular-expression
expectations are a separate gate because they must capture output surrounding a
stateful REPL action rather than compare its returned value. Upstream source is
not silently rewritten or treated as Coil-authored code.

# Authored source references

Run the complete binding and qualification regression:

```sh
python3 scripts/tests/source-references.py --compiler build/bin/coil
```

The runner copies this project into a temporary directory. It checks exact global
bindings, checked local identities, authored macro heads, strict lookup of
synthetic symbols, and import provenance. It applies qualification and executes
the result, verifies that `--diff` preserves files and repeated fixes are inert,
and exercises atomic refusals, literal syntax, primitive calls, renamed
reexport facades, and queries outside source analysis.

For a reviewable example without modifying this fixture:

```sh
coil lint tests/metaprogramming/source_refs/main.coil \
  --use coil.lint.import-aliases --diff
```

`checker.coil` asserts the source model; `qualify.coil` demonstrates a custom
alias policy built on `coil.meta/qualify-import` and `coil.meta/suggest-edits`.

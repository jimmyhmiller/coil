# Metaprograms: a checker and a lint

A metaprogram is a Coil function that runs at compile time over the whole
program. Registering one with `(checker f)` runs it after type checking, so it can
ask the compiler what a call resolved to (`code-decl`) and which local a name
refers to (`binding-of`). Importing the module that registers it switches it on.

## checker.coil: refuse a use after free

`use-after-free` walks every sequence of forms. After a call that resolves to
`coil.alloc/destroy`, it reports any later form that mentions the freed local,
and the build fails.

```sh
cd src/examples/metaprogramming
coil run ok.coil    # frees last: compiles, exits 42
coil run bad.coil   # reads after the free: rejected
```

It is a demonstration, not an analysis: it looks at straight-line sequences only
and does not follow aliases or control flow.

## condlint.coil: a lint that fixes

`nested-ifs` finds a chain of three or more hand-written `if`s and proposes the
`cond` it should be, using `primitive/suggest`. The replacement is built from the
author's own nodes, so `--fix` reprints them as their original source text,
comments included.

```sh
cd src/examples/metaprogramming
coil lint condlint_test.coil --use condlint          # report
coil lint condlint_test.coil --use condlint --diff   # show the patch
coil lint condlint_test.coil --use condlint --fix    # apply it
```

`condlint_test.coil` holds a three-test chain, which is flagged; a two-test chain,
which is not; and a `cond` the author already wrote. The checker sees that `cond`
after expansion, as nested ifs, and `code-macro?` is how it knows to leave it
alone.

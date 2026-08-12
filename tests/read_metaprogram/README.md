# Brainfuck read-metaprogram proof

These files are raw Brainfuck, not s-expressions and not Coil source. Compile one
by selecting the bundled read provider:

```sh
coil run tests/read_metaprogram/hello.bf --use coil.brainfuck
printf 'reader metaprogram\n' |
  coil run tests/read_metaprogram/echo.bf --use coil.brainfuck
```

`unmatched.bf` is a negative fixture: it compiles normally but exits with status
5 because its closing bracket has no matching opener.

`coil.brainfuck` declares `coil.brainfuck.reader/read-brainfuck` as its read
provider. The provider parses the raw file at compile time and emits a complete
Coil module containing direct tape operations and native loops. From there the
ordinary loader, checker, native compiler, and linker take over. The executable
contains no Brainfuck opcode interpreter, evaluator, or preprocessing adapter.

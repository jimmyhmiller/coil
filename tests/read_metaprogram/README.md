# Brainfuck read-metaprogram proof

These are raw Brainfuck files, compiled by selecting the bundled reader:

```sh
coil run tests/read_metaprogram/hello.bf --use coil.brainfuck
printf 'reader metaprogram\n' |
  coil run tests/read_metaprogram/echo.bf --use coil.brainfuck
```

The provider parses the raw bytes at compile time and emits a complete Coil
module with direct tape operations and native loops. There is no runtime opcode
interpreter, evaluator, preprocessing adapter, or `.bf` driver special case.

The tape has 30,000 wrapping `u8` cells, initially zero. Moving right past cell
29,999 exits with status 2; moving left from cell 0 exits with status 3. Cell
increment and decrement wrap modulo 256. Input stores one byte, and EOF stores
zero, so `,[.,]` terminates at EOF. Non-command bytes are comments. Unmatched
`[` and `]` are compile-time diagnostics; nesting beyond 1,024 loops is rejected.

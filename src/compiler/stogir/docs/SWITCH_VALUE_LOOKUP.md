# Guarded packed switch-result lookup

This independent optimization recognizes validated contiguous singleton switch
cases whose empty arms join one constant-valued integer Phi. It rejects case/end
observations, shared case/control users, other Phi users, effectful arms, holes,
ranges and results too wide for one 64-bit packed word. Address and floating
results keep the original switch. The default region, including stores and
non-returning traps, stays on the false guard path.

The result is base+((packed>>(index×width))&mask), converted/wrapped to the
original scalar type. Base follows signed/unsigned semantic ordering. The index
uses width-correct unsigned normalization and a ULE bounds guard. All-equal
cases need no shifts. The rule uses ordinary existing graph nodes, not a new
literal storage convention, instruction opcode or machine-code patch.

The existing merge walk after bulk SCCP/control cleanup visits candidates, so
unchanged initial candidates do not depend on affected-worklist seeding. It reuses
the walk’s protected roots and one scratch plan, without another graph scan.
Exact use mutation and queue process new expressions. Stable Phi/merge references
and default control observations are retained. The public SCCP transaction
validates input/output and owns any changed graph.

```sh
coil run tests/jit-switch-tables.coil --debug-runtime --debug-checks --sanitize=address
coil run tests/aot-switch-tables-link.coil --link-flag /tmp/coil-stogir-tables-u64.o --link-flag /tmp/coil-stogir-tables-i64.o --link-flag /tmp/coil-stogir-packed-switch.o
```

The first test creates all linked objects. It compares original/direct/SCCP
machine code over 112 native fixtures and checks exact rebuilt use multisets, typed
validation and actual SCCP dispatch removal. Trap children check the default
store before exiting. Verifier, module execution and native SCCP-control
ASAN/debug suites pass too. No compiler integration or speedup is established
by these correctness checks; broader fallback checks and measurements follow.

The expanded domain checks pass 112 native fixtures, two floating-result
no-change checks and a 32-bit pointer-selector graph validation. Boolean selector
inputs use their actual canonical conversion semantics; CHAR/address selectors
are checked at width boundaries. Address/FP results retain the original graph.

The all-equal, pure-default fixture exercises immediate downstream diamond
folding, including bookkeeping for the newly appended END reference.

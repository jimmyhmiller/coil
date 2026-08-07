# LLVM backend emits an invalid return type and then terminates without a useful diagnostic

Date: 2026-08-05

Coil source repository: commit `c6d25b2` (`Stream response bodies in coil.http.client`), clean worktree.

Installed compiler SHA-256:

```text
82be4dcf3dcd151129702d33610ea365f93a9ba7927178b1c78e164688d04ebd
```

Host: macOS 26.5.2 (25F84), arm64. Apple Clang 21.0.0.

## Summary

For the attached/project-local reproduction input, `coil check` succeeds and `coil emit-ir`
succeeds, but the emitted LLVM IR is invalid. A function declared to return `i1` contains an
early `ret i64`. Coil's LLVM `emit-obj`/`build` path does not report the verifier failure: it
terminates while leaving no usable object (or a zero-length intermediate object created by the
build driver). Commands placed after the Coil invocation in the same shell are not observed.

The native arm64 backend can emit an object from the same checked input. This isolates the silent
failure to the LLVM path, while the invalid textual IR establishes an earlier LLVM code-generation
bug.

## Reproduction

The current reproducer is the generated emitter source in the sibling `aot-kit-gradual` checkout:

```text
/Users/jimmyhmiller/Documents/Code/projects/aot-kit-gradual/.coil/build/debug-deltablue/return-kind.coil
SHA-256: 3cdc61cc001fd3de739b8e9c0b53f2dd8e4055f7a711277ecd1ed22630a3fe74
```

It imports the workspace's `src/frontend_native_graph.coil`. Delimiter balance was independently
checked with `paredit-like balance --dry-run`; the proposed result is byte-identical to the source.

From the `aot-kit-gradual` root:

```sh
coil check .coil/build/debug-deltablue/return-kind.coil
# exits 0

coil emit-ir .coil/build/debug-deltablue/return-kind.coil \
  > .coil/build/debug-deltablue/return-kind.ll
# exits 0

xcrun clang -c -O0 .coil/build/debug-deltablue/return-kind.ll \
  -o .coil/build/debug-deltablue/return-kind-clang.o
```

Clang reports:

```text
.coil/build/debug-deltablue/return-kind.ll:95355:7: error: value doesn't match function result type 'i1'
 95355 |   ret i64 %loop.val158
       |       ^
1 error generated.
```

The enclosing definition is:

```llvm
define internal i1 @frontendnativegraph.fng-switch-path-copy-unused(
    ptr %context, i64 %node, i64 %label-node) {
```

At the first exit of its second top-level `loop`, Coil emits:

```llvm
loop.after66:
  %loop.val158 = phi i64 [ 0, %then72 ]
  ret i64 %loop.val158
```

That source-level loop is followed by cleanup and a final `bool` expression (`answer`). The LLVM
backend incorrectly treats the loop value as the function result and omits the remaining function
body on this path.

Object emission behavior:

```sh
coil emit-obj .coil/build/debug-deltablue/return-kind.coil \
  -o .coil/build/debug-deltablue/return-kind-llvm.o
# terminates without a Coil diagnostic or a usable object

coil emit-obj .coil/build/debug-deltablue/return-kind.coil \
  -o .coil/build/debug-deltablue/return-kind-arm64.o --backend arm64
# prints "wrote ...return-kind-arm64.o" and produces a ~1.9 MB object
```

## Findings

There are two defects:

1. LLVM control-flow emission generates a return whose LLVM value type disagrees with the declared
   function result. The suspicious area is `emit-loop`/function-body sequencing in
   `src/compiler/codegen.coil`: after a nested-loop-heavy expression, the following expressions are
   not represented on the affected exit path.
2. The LLVM driver does not call `LLVMVerifyModule` before `LLVMRunPasses` or
   `LLVMTargetMachineEmitToFile`. `LLVMVerifyModule` is declared in `src/compiler/ffi.coil` but has
   no call site. Consequently an internal code-generation error reaches LLVM's fatal path instead
   of becoming a located Coil compiler diagnostic.

`src/compiler/main.coil` currently checks errors returned by `LLVMRunPasses` and
`LLVMTargetMachineEmitToFile`, but malformed modules can abort below those recoverable return paths.

## Expected behavior

- LLVM code generation must preserve the declared `bool` return type and emit the expressions after
  the loop.
- Regardless of the lowering bug, Coil should verify the module before optimization/emission and
  print a deterministic nonzero diagnostic naming the invalid function and verifier message.
- The build driver should not leave a zero-length `<out>.o` after compiler failure. Emit to a
  temporary file and rename on success, or remove the eagerly truncated artifact on failure.

## Suggested regression coverage

1. Reduce `fng-switch-path-copy-unused` to a standalone fixture containing sequential loops, an
   inner loop, `break`, mutable locals, and a final `bool` expression.
2. Assert that `coil emit-ir` output passes `LLVMVerifyModule` (and external `clang -c` in the CLI
   gate where available).
3. Inject or retain an intentionally malformed-module test for the driver and assert a readable
   verifier diagnostic, nonzero exit status, and no zero-length output artifact.

The standalone reduction attempted during diagnosis did not reproduce the lowering error, so the
interaction depends on more of the original control-flow shape than merely two sequential loops.
The full reproducer above is stable and should be retained until minimized.

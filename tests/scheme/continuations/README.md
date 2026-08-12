# Optional native continuations

Build these cases with the whole-program continuation setup:

    coil run tests/scheme/continuations/03-callcc.scm \
      --use coil.scheme.continuations

The option composes stack-boundary instrumentation into the Scheme dialect's
existing before-expansion pass. Captures copy compiled native frames and the
precise Scheme GC root prefix. They are unlimited-extent and multi-shot;
`dynamic-wind` transfers run the appropriate exit and entry thunks.

This backend currently targets native glibc systems through `__sigsetjmp` and
`siglongjmp`. It is not enabled by `coil.scheme`, imposes no continuation
instrumentation on default builds, and deliberately does not pretend to work on
Wasm or non-glibc native targets.

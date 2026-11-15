# Tools for the native backend

Development tools for the backend in `src/declarative/`, run from anywhere
after `python3 scripts/dev.py build candidate` (they use
`build/bin/coil-candidate`). Its tests are `scripts/tests/declarative.py`, and
its generated Coil is `scripts/compiler/gen-declarative.py`'s.

- `selfcheck.sh` — the compiler built by the backend at -O2 rebuilds itself to
  the same object (`build/bin/coil-self`).
- `stress.sh` — the corpus and the self-check under inlining limits far above
  the defaults (`SMALL=`, `GROWTH=`, `ONCE=`).
- `runtime.sh [profile]` — `coil-self` against the candidate (LLVM at -O3),
  each checking the compiler's own source: instructions and cycles, and with
  `profile`, time by function.
- `bisect.sh 'COMMAND'` — which function a trial (`DECLARATIVE_TRIAL`) goes
  wrong in, by halving how many functions it is on for.
- `debugger.sh [stops]` — what lldb shows in the corpus built with `-g` by the
  backend against LLVM's `-O0 -g` build (`debugger-trace.py` takes one trace).
- `disasm.py [a64|x64]` — disassemble the `code:` line a fuzzer seed prints.
- The sweep against LLVM over the corpus, demos, stdlib suites and examples is
  `scripts/tests/stogir-x86-sweep.py`.

# Copy-ready prompt: host-aware modernization gate

```text
Start from the latest `main` branch in the Coil repository. Read and follow
AGENTS.md, then run `coil guide` before writing Coil code.

Implement the narrowly scoped host-aware modernization-gate fix described in:

  git show origin/feat/scheme-continuation-pass:docs/landing/04-host-aware-modernize-gate.md

Use commit `89242d4` on `origin/feat/scheme-continuation-pass` only as research
evidence. Do not merge the research branch and do not cherry-pick unrelated
changes.

The problem is that `modernize-fast` forces the arm64 backend for programs it
then links and executes, even on hosts that cannot execute arm64 Mach-O output.
Select `--backend arm64` only on Darwin/Apple-Silicon; otherwise use the normal
host-runnable backend. Preserve backend-specific coverage that is genuinely
compile-only.

Keep this to a focused `scripts/dev.py` change. Verify:

- `python3 scripts/dev.py test modernize-fast --compiler <candidate>` passes;
- it remains below the documented 30-second bound;
- Linux/x86-64 does not attempt to execute foreign arm64 output;
- Apple-Silicon still selects the native arm64 backend for the intended tasks.

Review the diff for unrelated formatting or behavior changes. Commit the result
as one main-ready commit and report the exact verification run.
```


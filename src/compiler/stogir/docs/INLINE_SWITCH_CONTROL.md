# Switch control in bounded call expansion

The module inliner is an independent Coil extension over the pinned upstream
compact graph. Typed dispatch is validated before eligibility; SWITCH117 and
CASE_VAL109/CASE_RANGE110/CASE_DEFAULT111 use ordinary two-phase clone/remapping.
All numeric key constants, case parents, MERGE predecessors and Phi values keep
their graph meaning. Observed terminal defaults remain roots; omission of such
an observation conservatively keeps the call. Existing budget/Never/ABI/private
buffer rules apply. No native branch lowering is performed in this pass.

The existing module execution test covers eight scalar widths, dense value
switches and sparse ranges, deliberately unsorted key insertion, stores on each
arm, Phi results, returning defaults and actual child-process traps. It checks
zero-budget fallback and malformed dispatch preflight, and verifies that dense
cloned callers still produce jump-table data. Inputs execute before/after native
inlining and through serialized AOT code.

```sh
coil run tests/module-execution.coil --debug-runtime --debug-checks --sanitize=address
coil run tests/switch.coil --debug-runtime --debug-checks --sanitize=address
coil run tests/aot-module-link.coil --link-flag /tmp/coil-stogir-module.o --link-flag /tmp/coil-stogir-inline-switch.o
```

All three pass locally on macOS. The module test produces both linked objects.
Performance acceptance and compiler integration are separate steps; no compiler
speedup is established by these correctness checks.

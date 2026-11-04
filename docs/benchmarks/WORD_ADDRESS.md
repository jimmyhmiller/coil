# Word-address matching and register preferences

Compiler source 67f02f1e; standalone 79515a1. Includes contained-range coalescing and register preferences developed in preceding commits. Central attribution remains in the vendored library LICENSE, NOTICE and docs/PROVENANCE.md.

The target matcher now recognizes Coil field addresses represented as full-width word addition followed by an address cast. It replaces absorbed memory operands before liveness and retires only unreferenced pure word expressions using a sparse worklist. Shared or rooted nodes and COPY barriers survive; narrow/floating/vector views and named-symbol IDs are excluded. Graph references and semantic graphs remain unchanged. This follows upstream constant-displacement matching, extended for the adapter's word views.

## Checked AVec getter

`coil-stogir/benchmarks/compiler-gaps/avec-get.coil`, called opaquely by an identical LLVM-built `avec-get-runner.coil`, performs 20,000,000 checked accesses to 4,096 compact 16-byte compiler Nodes. Checksum 859763163008. Fixture and runner object hashes, raw samples and qualification are in [avec-results.json](word-address/avec-results.json). Six alternating runtime samples follow an excluded warmup; generation is a single diagnostic, caches disabled and serial.

| Backend | Generation ms | Runtime CPU median ms | Runtime wall median ms | Object bytes |
|---|---:|---:|---:|---:|
| delivered-stogir | 10.701000 | 68.892500 | 71.492313 | 14332 |
| coalescing-stogir | 10.431000 | 68.979000 | 72.534750 | 14284 |
| preferences-stogir | 9.795000 | 69.544000 | 78.234126 | 14220 |
| current-stogir | 8.835000 | 70.554000 | 73.885562 | 13900 |
| llvm | 38.067000 | 51.502000 | 69.312959 | 7480 |
| tpde | 0.319000 | 206.529500 | 217.700584 | 10620 |

The getter shrinks from 70 to 62 instruction words including padding and traps. For example, ADD + LDR becomes `LDR [base,#16]`. Runtime does not improve in this measurement; current stogir still takes about 1.37× LLVM CPU time. Fewer instructions alone do not establish faster code. Assembly is retained beside the raw results. Generation diagnostics cannot establish a bootstrap ratio.

## Validation

The old matcher fails the new cast-wrapped native address regression with four structural mismatches. The revised matcher passes native and ASAN tests for signed/unscaled/scaled boundaries, out-of-range displacements, cast chains and bounded depth, scalar/FP/vector memory, shared/rooted/escaping addresses, hard COPY, and numeric versus named address constants. Existing native allocation, composed modules, memory and call-pressure suites pass.

The candidate itself compiles and executes allocation/oracle, mixed-spill, FP arithmetic, numeric conversions, vector returns/transport, call pressure, conversion, 2,115 late-memory cases, composed modules, iterative fold/CSE, SCCP control and decision suites through stogir O3. The unchanged opcode kernel checksum is 9979482367440117777.

## Compiler checkpoint and delivery

All six rows below compile source 67f02f1e. The `before` LLVM host is the installed 4b550a03 backend compiling this current source. The `before` stogir host is this **same current compiler program**, linked from that previous backend's measured object. Current native hosts are linked from the exact current measured object. Both native hosts reproduce the current stogir object byte-for-byte; the current native host also reproduces the LLVM object byte-for-byte. See [compiler-results.json](word-address/compiler-results.json) for exact nonoverlapping codegen spans, object sizes/hashes and source digest.

| Host | Target | IR-to-code s | Whole emit wall s | Process CPU s | Object bytes |
|---|---|---:|---:|---:|---:|
| llvm-host-before | stogir | 10.990821000000011 | 19.822910084039904 | 19.363282 | 13160584 |
| llvm-host | stogir | 10.55776800000003 | 20.356520500034094 | 19.649617999999997 | 12303704 |
| llvm-host | llvm | 40.015833 | 47.4058248330839 | 46.45085300000001 | 8387768 |
| stogir-host | stogir | 38.38405200000009 | 62.38457583298441 | 56.57646799999999 | 12303704 |
| stogir-host | llvm | 37.183227 | 61.5008462080732 | 59.44063200000002 | 8387768 |
| stogir-host-before | stogir | 35.355972000000186 | 60.819862416014075 | 58.957126 | 12303704 |

Current LLVM-host generation is 3.79× faster with stogir than LLVM O3, short of 5×. The stogir-generated compiler uses 2.88× the LLVM-generated compiler's CPU time rebuilding through stogir, and 1.28× rebuilding through LLVM. Neither meets the runtime target. Against the previous-backend native host, total CPU improves about 4%, wall time worsens about 3%, and time inside generation worsens about 9%. These single serial diagnostics, with external system activity, do not establish an overall runtime improvement. The current stogir object is about 6.5% smaller. No timing from a different compiler source is treated as an improvement.

To rerun the small checked comparison from this checkout, with the standalone library at `LIBRARY`:

```sh
python3 scripts/benchmarks/stogir-avec.py --compiler build/bin/coil-candidate \
  --library "$LIBRARY" --output build/avec-comparison \
  --objdump /opt/homebrew/opt/llvm/bin/llvm-objdump
```

Optional `--before /path/to/previous/build/bin/coil-candidate` adds the previous backend; the driver verifies identical AVec source, uses one opaque LLVM caller, checks every run's result, rotates order, excludes warmup, and saves raw CPU/wall samples and disassembly.

The full FAST delivery gate is in progress. Changes are committed, not yet installed globally, and not yet pushed. The objective remains unmet.

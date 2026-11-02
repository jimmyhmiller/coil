# Indexed metadata: current provisional comparison

Executable source f570bcac; standalone executable 0fc663a (main 58a4df7).
Indexed shape/operand tables replace linear dispatch. Graph semantics, optimizer
ordering and generated code remain unchanged. All 5406 AOT fixture objects and
the actual LLVM/TPDE/stogir benchmark objects are byte-identical to the preceding
scheduling checkpoint. Runtime differences between those runs are environmental.

Unchanged native-stencil, 200000 passes, seed 12345, O3/no debug, rotated backend
order, five measured samples after warmup. IR to object includes optimization:

| Backend | IR to object median ms | Whole compile median ms | Runtime median ms |
| --- | ---: | ---: | ---: |
| LLVM O3 | 27.956 | 214.749 | 363.169 |
| TPDE | 0.147 | 181.410 | 4061.176 |
| stogir O3 | 5.520 | 186.817 | 382.719 |

The measured 5.0645x codegen speed and 1.0538x runtime meet both numeric thresholds
in this run. Evidence remains provisional: all 17 monitor observations contain
external activity (WindowServer, browser/plugin and GPU processes; four include
xprotectd). LLVM runtime ranges 359.337–624.445ms and stogir 381.311–387.189ms.
No accepted baseline is replaced. A repeat is required before accepting the goal.
Raw samples, source/toolchain hashes and load observations accompany this report.

Full standalone validation passes 236 programs and 72 linked AOT consumers.
All 5406 generated objects are byte-identical to library 7801b60. The exhaustive
opcode oracle passes ordinary, debug-check and AddressSanitizer runs. Assembly
confirms static indexed loads without table copying. Coil FAST passed all 49 steps in 216.2 seconds (cli/objects memory warning
1.61GB versus 1.5GB). Official global installation and off-checkout checks pass:
installed code sections match the candidate, all 133 SDK modules match standalone
main, LLVM/TPDE/stogir object-link-run checks and new namespace imports pass.
See ../validation/stogir-metadata-pipeline-installed.json.

## Repeat: compile target remains unmet

Same inputs, compiler binary, workload, timing boundary and rotated five samples,
after delivery jobs finished:

| Backend | IR to object median ms | Whole compile median ms | Runtime median ms |
| --- | ---: | ---: | ---: |
| LLVM O3 | 25.483 | 214.472 | 370.567 |
| TPDE | 0.135 | 181.378 | 3990.664 |
| stogir O3 | 5.475 | 200.781 | 379.018 |

This yields 4.6544x codegen speed and 1.0228x runtime. The compile target fails;
the goal remains active. The first run's threshold crossing is not accepted as
completion. This repeat also had external activity in every monitor sample.
Both complete raw runs are retained; the accepted baseline remains unchanged.

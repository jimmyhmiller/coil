# Source provenance and credits

coil-stogir is a Coil port and adaptation of Dmitry Stogov's
[IR — Lightweight JIT Compilation Framework](https://github.com/dstogov/ir).
The reference checkout is pinned to
`92171d0a4a36b0acf707f2dea7998de615dd4acd`.

[LICENSE](../LICENSE) retains upstream's MIT permission/disclaimer text and both
copyright notices, with a copyright notice for the Coil implementation added.
[NOTICE](../NOTICE) identifies the upstream author, source, revision, and design
acknowledgments. Licensing and attribution are kept in these central files.

## Reference map

This map records derivation and design references. It does not claim a complete,
line-for-line translation of each upstream pass or equivalent behavior.

| Coil area | Upstream source / relationship |
| --- | --- |
| `types`, `node`, `opcode` | Scalar/vector type encoding, cell layout, opcode ordering and metadata from `ir.h` |
| `graph`, `builder`, `fold`, `integer-unary`, `integer-binary`, `conditional`, `checked`, `conversion`, `numeric-conversion`, `floating` | Construction, signed references, constants, and integer folding adapted from `ir.h`, `ir.c`, `ir_builder.h`, `ir_fold.h` |
| `calls`, `prototype-bytes`, `symbols`, graph string table | Prototype bytes, FUNC/FUNC_ADDR header annotations, FUNC/SYM/STR address constant layout, PROTO annotation, interned string identity, and control-pinned CALL shape follow `ir.h`, `ir.c`, `ir_builder.h`; the binary arena/hash implementation is Coil code |
| `verify`, `dump` | Validation and diagnostics developed against `ir_check.c` and `ir_save.c`, including DIV/MOD control-guard validation; dump format is currently different |
| Uses, CFG, dominance, loops, placement, scheduling | Pipeline developed against `ir_cfg.c` and `ir_gcm.c`; current natural-loop analysis and scheduling are incomplete |
| Liveness, ranges, constraints, allocation, phi/edge moves | Split-interval and SSA allocation work guided by `ir_ra.c` and its algorithm references; exact-subposition transfer indexing is Coil code; not yet upstream allocator parity |
| Terminal control | TRAP/UNREACHABLE and optional START/terminal-list links follow `ir.h` and `ir.c`; UNREACHABLE retains its reserved second slot. Shape/type checks and linear terminal-chain validation are Coil implementations. TRAP emits the reference AArch64 BRK; this target gives UNREACHABLE an explicit breakpoint/re-entry sequence. |
| Switch dispatch | SWITCH and CASE_VAL/CASE_RANGE/CASE_DEFAULT shapes follow `ir.h`, `ir.c` and `ir_builder.h`; `ir_aarch64.dasc` is the target reference. Signed order-key normalization, heapsort validation, balanced range decisions and case edge-transfer stubs are Coil implementations. Dense singleton selection follows the upstream count/span rule; signed 32-bit relative tables replace its full-address entries, retaining the same dispatch/control model. |
| Scalar locals and frame layout | VAR/VADDR/VLOAD/VSTORE, FRAME_ADDR, ALLOCA/AFREE and BLOCK_BEGIN/BLOCK_END metadata and access behavior follow `ir.h`, `ir_ra.c` and `ir_aarch64.dasc`; separate local/spill maps, SP/x29 contexts, outgoing-prefix layout, saved-entry-SP realignment and count-domain guards are Coil code; allocation/free consistently round original counts to the function alignment (minimum sixteen), unlike the qualified upstream dynamic-AFREE source concern |
| AArch64 selection/emission and ABI | `ir_aarch64.dasc` is the target reference; current Coil encoders emit words directly rather than using DynASM; typed scalar truth and floating comparison conditions (with consistent compare/select extrema), conversion sequences (with canonical Boolean destinations), checked-overflow conditions/sequences, DIV/MOD/ROL, MIN/MAX/COND and scalar unary sequences are adapted with explicit scratch handling; unary population count encodes both SIMD register fields |
| Vector long constants | LONG_CONST header/payload order, byte-count limit, DJB2/header hash and full-payload interning follow pinned `ir.h` and `ir.c` (`ir_long_const`, `ir_long_const_commit`, `ir_const_vector`). Checked span metadata, payload-reference protection, verifier/dump integration and private aligned shared-image materialization are Coil implementations. No TPDE or LLVM implementation is imported. |
| Vector graph transport | Independent Coil construction and semantic checks over upstream vector type encoding and LOAD/STORE/Phi shapes. SIMD class/memory integration uses the existing direct encoders. Simultaneous block-entry Phi ranges and edge destinations correct this implementation's scalar/vector pressure defect; no other backend source is imported. |
| Mixed-width copy/spill ownership | Independent Coil per-edge sized copy planning, checked native emission and parent-indexed spill shapes over the existing allocation/move pipeline. Native/linked tests use full payload and frame comparisons; no TPDE implementation is imported. |
| Full-width SIMD transfers | Independent Coil Q-register move, memory and simultaneous-copy emission over the existing frame and move planners. Encodings were checked against LLVM MC output; native byte comparisons and protected pages verify complete 128-bit payloads. No LLVM or TPDE implementation source is imported. |
| Grouped argument ABI | Independent Coil metadata and shared incoming/outgoing placement. The scalar prototype prefix remains upstream-shaped; the versioned SGAG trailer is a Coil extension. Placement was checked against [Apple’s ARM64 ABI documentation](https://developer.apple.com/documentation/xcode/writing-arm64-code-for-apple-platforms), [Arm’s AAPCS64](https://github.com/ARM-software/abi-aa/blob/main/aapcs64/aapcs64.rst), and LLVM assembly emitted from Coil C aggregate probes. |
| Aggregate result ABI | Independent Coil result-storage roles, SGAG version2 metadata, private frame buffers and immediate return-bank capture. Native x0/x1, v0–v3 and x8 placement follow the Apple/Arm ABI references above and are checked against typed Coil C ABI interfaces. No upstream or TPDE result-lowering implementation is imported. |
| Short-vector/HVA ABI checks | Independent Coil fixtures for 64/128-bit pieces and one through four homogeneous members. Fixed C callbacks, typed C function pointers and LLVM-generated variadic calls check argument/result placement in JIT and linked AOT. The raw entry-SP capture probe is encoded in Coil; its words were checked against LLVM MC. No LLVM implementation source or external-language probe is shipped. |
| Vector binary arithmetic | Typed operation/guard validation follows the shared upstream opcode and type model. Independent Coil AArch64 binary encoder/emitter, with lane/width and scalar SIMD cases checked against LLVM MC. Integer 64-bit MUL and DIV/MOD use native lane expansion; remainder re-extracts the dividend to stay within reserved x16/x17. Full sequences and lane primitives are independently checked against LLVM MC. Scalar lane oracles and native JIT/linked AOT pressure fixtures verify complete payloads. No LLVM implementation source or external-language arithmetic implementation is shipped. |
| Vector unary arithmetic and bit counts | Independent Coil SIMD/scalar encoders for NEG/ABS/NOT, lane byte swap and counts, checked against LLVM MC and integer/bitwise payload oracles in JIT and linked AOT. Shared lane transfer primitives preserve existing binary wrappers. The pinned upstream AArch64 vector ABS NIY is recorded; native ABS and complete lane counts extend that reference target coverage. No external-language implementation is shipped. |
| Vector shifts | Shared upstream opcodes and scalar/vector count roles, with an independent Coil AArch64 encoder checked against LLVM MC. Count normalization follows this library's width-masked scalar policy; valid-range behavior matches the reference, while out-of-domain target differences are documented. No upstream or LLVM implementation is linked or shipped. |
| Vector extrema | Shared MIN/MAX opcodes and vector type geometry from pinned IR, with independent Coil D/Q encoders. Integer lanes use target SIMD min/max or 64-bit CMP/CSEL. FP lanes deliberately preserve the existing scalar compare/select contract, which differs from pinned AArch64 FMINNM/FMAXNM for exceptional inputs. Words are checked against LLVM MC and full result bits against Coil oracles in JIT and linked AOT. No external-language implementation is shipped. |
| Vector comparisons | Predicate opcodes/type geometry and AArch64 SIMD comparison encodings reference pinned IR. Independent Coil construction/verification checks full-lane integer masks and pointer-width geometry; native sequences preserve scratch/result aliases. FP U-prefixed relations and orderedness deliberately follow this library's scalar rules, extending/differing from pinned vector target paths. LLVM MC and Coil bit/mask oracles check JIT and linked AOT behavior. No external-language implementation is shipped. |
| Vector lane transport | EXTRACT/REPLACE/SPLAT opcodes, operand shapes and equal-width integer lane compatibility reference pinned IR. Independent Coil builders and native adapters use SIMD lane words for constant indices, TBL for dynamic extraction, and precomputed lane-ID masks/BSL for dynamic replacement; they do not copy upstream's stack-indexed dynamic path. LLVM MC, Coil raw-bit oracles and JIT/linked pressure checks validate behavior. Invalid dynamic indices have explicitly defined zero/unchanged behavior. No external-language implementation is shipped. |
| Whole-vector conditional selection | Shared COND metadata, scalar truth and fold/CSE rules reference pinned IR. Independent Coil validation admits vector results with exactly typed arms, and AArch64 emission uses captured flags plus CSETM/FMOV-or-DUP/BSL with protected source aliases. LLVM MC and raw-bit Coil oracles check JIT/linked behavior and full NaN payload preservation. No external-language implementation is shipped. |
| Vector rotates | Independent Coil width-masked ROL/ROR composition, with full-width alias saves and a single-lane RORV path using shared lane primitives. Independent LLVM MC words and mathematical u128 oracles verify JIT/linked AOT results; forced-register harnesses check physical aliases directly. No external-language implementation is shipped. |
| Indirect aggregate arguments | ARGVAL opcode/layout and call-time private-copy/pointer semantics follow `ir.h` and `ir_aarch64.dasc`. Checked construction/use validation, separate per-occurrence storage, forward aligned copy-area layout and frame-alignment propagation are Coil implementations. Unlike the reference memcpy call sequence, this target uses reserved-register native copies before argument installation. |
| Native argument copying | Independent Coil AArch64 emission over the checked encoders. Bounded word loops and exact tails use reserved temporaries without importing a runtime memcpy implementation. Used by the ARGVAL indirect-copy path. |
| Bulk memory construction | Independent Coil expansion into the upstream-shaped LOAD/STORE, loop, branch and PHI nodes. Exact-width chunks, small-move snapshots and bounded forward/backward loops are implemented here; no upstream or TPDE bulk-copy implementation is imported. |
| Module image composition | Independent Coil implementation over the shared image model: public definition binding, private namespace isolation, stable per-input ID maps, section/relocation/text-data rebasing, per-section alignment propagation and immutable input validation. |
| JIT images, relocation planning, Mach-O writer | Coil implementations of a shared text/data image with symbol binding, ABS64/branch/page relocations, and Mach-O serialization; format references are Apple SDK headers and LLVM MC object output, with no SDK or LLVM source vendored. Data-in-code spans preserve relative jump-table metadata, with MH_OBJECT VM-offset entries and u16 length splitting. Aligned section VM layout was checked against LLVM MC output; checked reservation/protection layout and original-mapping release tracking are Coil implementations. Named FUNC/SYM/STR graph lowering uses shared image relocations; additional formats/features remain unfinished |
| Vector bitcasts | Shared BITCAST opcode and type geometry reference pinned IR. Independent Coil validation compares complete storage extents for explicit pointer widths; literal folding copies little-endian bytes and native D/Q casts reuse typed register transfers. Named addresses retain relocations. Coil byte oracles check JIT and linked objects. No external-language implementation is shipped. |

The current graph uses separate contiguous arrays for instructions and constants.
The current allocator, fold rules, target coverage, verifier, and optimization
pipeline remain incomplete. See [PLAN.md](PLAN.md) for the delivery gates.

## Additional references and distribution

The neighboring coil-tpde package demonstrates the independent library followed
by a compiler backend. TPDE/coil-tpde target and object code has also been consulted
as reference material. This package currently vendors/imports no TPDE modules.
TPDE and its contributors have a separate Apache-2.0 WITH LLVM-exception license;
MIT attribution for IR cannot replace that license if TPDE source is adapted in
future work. Preserve file-specific notices when introducing any such source.

The current package uses Coil's standard library and native platform APIs; it
ships no upstream C implementation or DynASM source/generated action tables.
Compiler, runtime, or other dependencies bundled in a future binary release need
their own applicable notices. Packaging this library must include `LICENSE` and
`NOTICE`, together with any later third-party license files. A future Coil backend
vendor/import step must carry these files into Coil along with the source.

Keep this map current as more upstream modules are ported or
other source is reused. Attribute algorithm and design references separately from
copied or translated source so their roles remain clear.

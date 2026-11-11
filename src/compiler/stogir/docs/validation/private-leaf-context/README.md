# Owned private leaf bodies and caller setup effects

`a64.private-leaf.Frozen` owns private body bytes, name and signature behind opaque state. Creation requires an existing non-global text symbol with an explicit emitted body range, valid native calling convention/signature and alignment. The closed instruction analyzer must accept the exact range. Embedded data and every relocation overlapping the body decline, including an ABS64 starting before it. The snapshot shares no mutable storage with the source image/signature.

Publication appends the owned bytes themselves and creates a local image symbol. Conflicting global or duplicate definitions decline. Name/ABI signature matching gates the call effect summary; non-ABI semantic annotations may differ. Released snapshots decline. Ownership is single, as with the inline registry; clients must not copy owning handles or use them after release. Published image bytes are independent and survive snapshot release.

## Caller effect policy

Ordinary call setup retains the entirex0..x8 bank (mask0x1FF), not only registers written by the callee. This conservatively includes all GP arguments, direct results/normalization and hidden indirect resultx8. ARGVAL copies and argument/result helpers otherwise use reservedx16/x17/x30/v30/v31; preservation moves are explicit allocation transfers rather than external clobbers. The existing call-layout argument walk now checks the setup destination invariant without an extra traversal. SIMD clobbers remain full ABI. Tail calls usex15 in one path and must retain the full mask; indirect, external, unknown or unbound calls must also retain it.

The owned call mask is callee GP writes union0x1FF, intersected with the target's existing0xFFFF volatile GP set. Thus eligible small leaves can preservex9..x15. There is no raw caller-supplied mask or validation flag in the snapshot constructor.

## Validation

Native Stogir O3/debug and LLVM O1/debug/ASAN snapshot tests pass. They cover source text/name/signature lifetime independence, source mutation/free, released snapshots, malformed signatures/ranges, unsupported conventions, global/undefined symbols, embedded data, an overlapping relocation starting before the range, wrong name/signature, semantic flag compatibility, private publication and duplicate/global rebinding rejection.

The test publishes exactly the frozen leaf and binds a direct caller relocation to that local symbol. The caller deliberately keepsx9 live across the call. JIT native execution passes boundary inputs. Mach-O AOT output links to the independent C caller in benchmarks/private-leaf-calls/aot-caller.c;10,000 randomized unsigned wraparound answers pass. nm reports external _private_leaf_entry and non-external private_leaf_body (full exact output in symbols.txt). The published image still executes after both the original source and snapshot have been released.

Existing ABI argument placement, call validation, groups, JIT ordinary calls, aggregate results, grouped arguments, by-value ARGVAL copying and HVA outgoing suites pass with the explicit setup-bank check. Fixed compiler71856236; identities in metadata.json.

## Remaining integration

Normal Coil native allocation does not consume these masks yet. The target adapter must use the exact private symbol returned by publication, or verify an equivalent binding to these same owned bytes. A matching name is insufficient by itself. Compile eligible live callees once before callers, retain immutable mapping/body ownership through emission, supply full ABI fallback for every unproven binding and preserve AOT/JIT relocation semantics. Then validate pressure/clobber behavior and measure real compiler fixtures. This component is not a claim of bootstrap progress or completion.

Original license/attribution remains centralized in NOTICE. This ownership/effect layer is an independent extension over the existing AArch64 and image infrastructure, not a claimed upstream pass port.

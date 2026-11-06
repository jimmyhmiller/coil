# Current generated-compiler profile

Separate untimed runs of source30467d56 generated Stogir/LLVM hosts. Both emit
the exact frozen seed object again. SDK/host/sample/output hashes retained.
Sampling is not timing acceptance; inclusive families overlap and inlining
changes attribution. Main-thread joins excluded from worker shares.

Stogir worker20897samples: native function emission6622 (31.7%), verification
2994 (14.3%), allocation/scratch API1590 (7.6%), module-finalize2094 (10.0%),
module-prepare1831 (8.8%), allocator939 (4.5%), uses-build873 (4.2%). Top leaf:
verify.structure943, memmove631, write587, integer verifier560, primitive-provider
resolution514, graph.operand444, uses.build426, classifications424, uses.scan396.
LLVM worker11969samples: emission3839, verification1060, allocator539. Function
name shares cannot be compared as per-function speedups because LLVM inlines.

Next concrete audit: structure already validates instruction/arity lengths,
counts and full cell extent before its operand loop, yet calls checked
Graph.operand for each edge, repeating membership/index checks. Verify exact
failure ordering and extent proof before replacing those repeated checks with
local word reads; cache the immutable opcode metadata once per instruction.
All referenced membership/prototype/optional/local-storage checks must remain.
No optimization implemented or performance claim from this profile alone.

# What the Coil adapter needs from the x86-64 call ABI

Requests from the Coil compiler's Stogir adapter (Coil branch `stogir/x86`,
commits d2dc55e8..05cddcc6, 2026-11-10), each with the API that answers it
(library branch `x86/callfam`). Details and serialized forms are in
`docs/ABI.md`, "System V x86-64 call shapes". Everything listed here is valid
only when the library is compiled for x86-64; on AArch64 the same calls are
rejected as before.

1. **Incoming MEMORY parameter.** Done.
   `(calls/memory-parameter! (mut prototype) ordinal size alignment)
   -> (Result i32 (slice u8))` on a `calls/Prototype` made by any `calls/create*`
   function, before `calls/function!` / `calls/emit!`. `ordinal` (i32) is a
   fixed parameter of type ADDR (6) that belongs to no group; `size` (i64) is
   1..16777215 bytes; `alignment` (i32) is a power of two up to 16 (anything
   up to 8 means an 8-byte slot, 16 a 16-aligned one). Records must be added
   in ascending ordinal order. In the function, that PARAM is the address of
   the caller's stack copy and consumes no register. The record is
   `call-groups/Memory {ordinal size alignment}`; `Prototype.memory` holds
   them.
2. **ARGVAL on x86-64.** Done: the bytes are copied into the outgoing stack
   arguments. Build it as before (`builder/argument-value! graph source size
   alignment`, alignment 8 is fine). When the callee's prototype carries a
   MEMORY record for that ordinal, the ARGVAL's size must equal the record's
   size; `calls/emit!` and `calls/validate-call` report "MEMORY parameter
   requires an ARGVAL argument of its size" otherwise. An ARGVAL without a
   record is passed the same way.
3. **`call-groups/Group` of two differing members.** Done.
   `(groups/Group :first f :count 2 :alignment a)` with `a` 8 or 16 over two
   parameters whose types are any two of {5, 11, 12, 13}: each member takes a
   register of its own bank, or both go to the stack (in order, 8 bytes each).
   Same-type pairs and single-member groups work as before. Groups of three or
   four members are an AArch64 shape and are rejected on x86-64 ("a System V
   argument group has one or two eightbytes").
4. **`call-results` pair.** Done. `(results/pair first second) -> Spec`, with
   `first` and `second` from {5, 11, 12, 13}; pass it to `calls/create-result`
   like `results/pieces`. Pieces are stored at offsets 0 and 8 of the result
   place; rax/rdx carry the integer pieces and xmm0/xmm1 the floating ones, in
   order per class. `Spec` has a new field `second` (0 for every other shape):
   code that builds `Spec` literals must add `:second 0`.
   `(results/pieces ty count)` on x86-64: `ty` from the same set, `count` 1 or
   2, stored back to back (`count * size(ty)`).
5. **Group alignment 16.** Done: it moves a stack-placed group to a multiple
   of 16 and has no effect on register placement.
6. **`x64/private-leaf` `context-create`.** Done; the whole
   `stogir.native.private-leaf` API works on x86-64 (`register!`,
   `register-as!`, `freeze!`, `confirm-publication!`, `seal-module!`,
   `module-valid?`, `binding`, `verify-publication`), as do
   `compile/image-with-private` and the `compile/image-for-private-module*`
   entries. A leaf is accepted for registration only from the image its own
   compilation produced (the emitter's register record travels in
   `Image.leaf-effects`); `register!` returns `Ok false` for anything else and
   the function is then called with the full clobber set.
7. **Jump tables.** Not part of the call work: see the switch family.

Not available: reading variadic arguments in a callee (VA_START, VA_ARG; no
lowering on either target), vector-typed arguments and results (vector
family). Integer pair results (`results/pieces` of U64/I64) use rax/rdx
without memory when the callee's result place is promotable and when the
caller only loads the pieces back from a private frame object
(`builder/frame-object!`), exactly the shapes the AArch64 backend recognizes.

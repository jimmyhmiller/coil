# Loop-aware active-owner eviction

Adapted from pinned dstogov/ir92171d0 ir_ra.c:ir_find_optimal_split_position.
The selector preserves same-block and lifetime-hole endpoints, otherwise walks
natural-loop entries and chooses a preheader definition or block-start load
position within the supplied bounds. The target currently uses it only for
active-owner eviction, where register→spill stores are legal at definition
positions. It does not enable odd general reloads or port the free/restart
categories. Prior operand uses of every constraint kind are preserved; a binary
search chooses a lower bound strictly after all past uses. Future required uses
are not enqueued behind the allocator cursor.

Metadata is packed once from the existing schedule, immediate dominators and
natural-loop depths. A dominance index classifies natural headers; there is no
new dominator analysis. Unclassified structure retains the old split policy.
Existing low-level APIs retain empty metadata; normal native image generation
builds and owns the prepared metadata through allocation. Error paths release
it. Complete upstream irreducible-side-entry classification remains open.

Validation on macOS/AArch64, fixed standalone emitter71856236:

- The actual three pinned C helpers compile with ASAN; extraction hash is checked.
-19,880 selector answers match the independent C oracle (nested loops, every
  position pair and preference, four lifetime-range/hole patterns). Native O3
  and LLVM O1/debug/ASAN pass.
- Active eviction tests preserve prior kinds0/1/2 and queue the next required use
  after the current scan position after shortening an already assigned prefix.
- Ten native suites pass: selector, allocation, indexed pressure, mixed spills,
  JIT pressure/call/floating/switch/bulk and private-call aggregate/pressure.
- Exact real frontend graph replay, including metadata builder, passes ASAN.
  The coalesced parent122 prefix now ends329 rather than489, before inner header
  position330. Its uncoalesced original range ends179: applying the selector to
  that original value was an invalid diagnostic bound, corrected to assert the
  actual coalesced result. Production always queries the active allocation part.

Actual resolver replay body1568→1464bytes; after SHA256
97dcf1a1c7350db51fb2fd7a688a85a0f380f2487565dcd42180d9a4fa9c505d.
No performance claim from size. Coil candidate/paired fixtures remain required.
The5× generation/≤1.10× bootstrap goal is unmet.

The replay generator's default still pointed at an old developer-specific path;
it now uses the committed snapshot.gz. Explicit-path prior replays were valid.
Source attribution/license remains centralized in NOTICE/LICENSE and PROVENANCE.

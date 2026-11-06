# Inliner audit redirects the next change

Fixed Coil71856236 traces, no policy edits. Existing module inliner already ranks
loop-weight/cell cost under512 nonreplenishing cloned-cell budget. Do not add a
duplicate ranking policy. Choice template437cells; expands10/11sites reserving449,
remaining63. Residual fixed-limits/reserve fail common gate; reserve is guarded
by capacity, not called on every warm query. Parent cannot inline the enlarged
choice. Integer verifier expands19/32sites,440reserved/72remaining. Borrow-node
initial59cells expands114cells of helpers. Classification465initialcells also
expands432. Large storage and common=false alone do not prove profitable missed
inlining. Increasing limits is not justified by these traces.

Structure already verifies every DEF/REF membership, including negative constant
span heads, then immutable integer semantic traversal repeats membership via
borrow-node. New private reader is restricted to those proven integer data roles.
Canonical-role regression checks bind that restriction to every dispatch entry.
Zero retains null behavior. References widen to i64 before negation. No public
Graph checked API or exported classification behavior changes, and every semantic
type/width check remains. Differential malformed-reference validation required.

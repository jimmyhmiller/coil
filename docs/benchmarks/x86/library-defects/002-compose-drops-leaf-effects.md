# 002: `link/compose` of one image drops `Image.leaf-effects`

**Status: fixed** in library `feature/x86` 9cf1283 (vendored with d278aba); the adapter workaround is removed.

Library `feature/x86` 9471372. No test file: the check is three lines in any
x86-64 test that compiles a leaf (for example `tests/x64-call-flow.coil`'s leaf
case): compile a call-free function with `compile/image-with-private`, pass the
image alone through `link/compose`, and compare `(.leaf-effects image)` before
and after. Before: `LEAF-RECORDED | written registers`. After: 0.

**Consequence.** `x64/private-leaf` `create` refuses an image without the
record, so `register-as!` returns `Ok false` for the composed copy. The Coil
adapter keeps exactly such a copy of every leaf (`retain-native-image`:
composition is how it moves the finished image out of per-leaf scratch
memory), so no leaf was certified on x86-64 and every private call used the
full clobber set (`scripts/tests/stogir-live-emission.py`: "no certified leaf
exercised").

**Expected.** Composing a single image whose record is set keeps the record
(the text is the same one function at the same offset). Composing several
images clears it, as now.

**Adapter workaround in place.** `retain-native-image` copies the field from
the source image to the copy after composing. It can stay or go when compose
does this itself.

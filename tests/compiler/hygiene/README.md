# Trait-method hygiene reproductions

See `docs/design/TRAIT_METHOD_HYGIENE.md`. A symbol in a macro template resolves
in the macro's namespace — except for trait methods, which resolve at the use
site and can be captured by the caller.

| pair | template writes | expected | actual |
|---|---|---|---|
| `lib.coil` / `user.coil` | `=` (trait method) | `0` | **`1` — captured** |
| `lib2.coil` / `user2.coil` | `helper` (ordinary fn) | `42` | `42` ✓ |
| `lib3.coil` / `user3.coil` | `primitive/icmp-eq` | `0` | `0` ✓ |
| `user4.coil` | — | `assert-eq 1 999` FAILS | **passes** |

`user4.coil` is the one that matters: an ordinary Coil module that defines its own
`=`, as the language permits, makes every `assert-eq` in it vacuous — a green test
suite that proves nothing.

Run each with `coil run <user>.coil`; `user4.coil` with `coil test user4.coil`.

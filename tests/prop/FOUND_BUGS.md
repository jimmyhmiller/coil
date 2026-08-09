# Bugs found by `tests/prop/stdlib_props_test.coil`

Real defects in the standard library, found by the property suite. Each entry
names the property that found it, the shrunk counterexample, and a
copy-pasteable repro. Nothing here is a wrong law.

---

## 1. `to-sexp-str` / `to-json-str` silently corrupt `i64::MIN`

**Status:** FIXED in `src/stdlib/fmt.coil` (`print-i` now prints the magnitude
through the unsigned path). `sexp-i64-roundtrips-every-value` is live again at
full strength and is the regression test.

**Severity:** silent data loss in both wire formats. No error, no truncation, no
diagnostic — a different number simply comes out the other side.

**Found by:** `sexp-i64-roundtrips-every-value` in
`tests/prop/stdlib_props_test.coil`, after 31 cases and 6 shrinks. The shrunk
counterexample was `n = i64::MIN`, which is the whole of the bug: every other
i64 round-trips.

The suite first hit it through the derived-struct properties, whose shrunk
counterexample was

```
r = (Rec id 0 name "" flag false nick (None) tags (-0))
```

— every field driven to its minimum except one list element, printed as `-0`.
That `-0` is the bug leaking into the counterexample printer, which is the same
defect (see "blast radius" below).

### What happens

```lisp
(to-sexp-str [i64] a -9223372036854775808)   ; => Ok "-0"
(from-sexp   [i64] a "-0")                   ; => Ok 0
```

```
sexp bytes = [-0]
json bytes = [-0]
decoded == 0 ? YES
MIN+1 sexp = [-9223372036854775807]      ; MIN+1 and everything above is fine
```

### Root cause

`coil.fmt/print-i` (`src/stdlib/fmt.coil:17`) prints a negative number by
emitting `'-'` and then recursing on the negated magnitude:

```lisp
(defn print-i [(w (ptr Writer)) (n :i64)] (-> (Result :i64 IoError))
  (if (< n (cast i64 0))
      (match (write-byte w (primitive/cast :u8 45))  ; '-'
        (Err [e] (Err e))
        (Ok [_] (print-int w (primitive/isub 0 n))))
      (print-int w n)))
```

`(isub 0 i64::MIN)` wraps back to `i64::MIN`, which is still negative.
`coil.io/print-int` (`src/stdlib/io.coil:79`) then takes its `n < 10` base case
and writes one byte, `(cast u8 (iadd n 48))` — the low byte of
`0x8000000000000030`, which is `0x30`, the character `0`. Hence exactly two
bytes: `-0`.

Both serde backends route integers through `print-i`:

- `src/stdlib/serde_json.coil:109` — `(js-io (print-i (load (field s w)) v))`
- `src/stdlib/serde_sexp.coil:105` — `(sx-io (print-i (load (field s w)) v))`

so the display bug becomes an encoding bug.

### Blast radius

- `(fmt w "{d}" x)` prints `-0` for `i64::MIN`. `fmt.coil`'s own comment calls
  this a "documented edge case" and says it "prints as its wrapped value" — but
  the wrapped value is `-9223372036854775808`, and what is printed is `-0`. The
  comment describes a behaviour the code does not have.
- Anything serialized with `coil.serde.sexp` or `coil.serde.json` that contains
  `i64::MIN` decodes as `0`. That includes `coil test`'s own artifacts if a
  counterexample is ever pinned as sexp, which is what
  `docs/design/PROPERTY_TESTING.md` §4.4 proposes.
- `coil.json` is unaffected: it parses numbers as text and has no integer
  writer.
- `coil.str/str-parse-int` is unaffected — it round-trips the whole i64 range,
  `i64::MIN` included, and the suite asserts that
  (`str-parse-int-roundtrips-every-i64`).

### Fix sketch

`print-i` must not negate. Emit `'-'` and then print the magnitude with the
UNSIGNED path that already exists two definitions below — `print-u` /
`udec-digits` use `udiv`/`urem`, so they render the wrapped `i64::MIN` bit
pattern as its true magnitude `9223372036854775808`:

```lisp
(defn print-i [(w (ptr Writer)) (n :i64)] (-> (Result :i64 IoError))
  (if (< n (cast i64 0))
      (match (write-byte w (primitive/cast :u8 45))
        (Err [e] (Err e))
        (Ok [_] (print-u w (primitive/isub 0 n))))   ; unsigned: MIN-safe
      (print-int w n)))
```

`(isub 0 n)` still wraps for `i64::MIN`, but `print-u` reads those bits as
unsigned, which is precisely the magnitude wanted. Worth a `deftest` pinning
`i64::MIN`, `i64::MIN + 1`, `-1`, `0` and `i64::MAX`.

### Repro

```lisp
(module repro)
(import "coil.alloc" :as alloc :use *)
(import "coil.assert" :use *)
(import "coil.serde" :use *)
(import "coil.serde.sexp" :use *)

(deftest i64-min-sexp-roundtrip
  (let [a (malloc-allocator)]
    (match (to-sexp-str [i64] a -9223372036854775808)
      (Err [_] (assert false))
      (Ok [s] (match (from-sexp [i64] a s)
                (Err [_] (assert false))
                (Ok [v] (assert (= v -9223372036854775808))))))))
```

```
COIL_STDLIB_DIR=. coil test repro.coil
```

### Aftermath

The fix is the `print-u` version sketched above. `sexp-i64-roundtrips-every-value`
is live at full strength, the `rec-encodable` narrowing that kept the
derived-struct round-trips useful while the bug was open is gone, and the
boundary values (`MIN`, `MIN+1`, `-1`, `0`, `MAX`) round-trip.

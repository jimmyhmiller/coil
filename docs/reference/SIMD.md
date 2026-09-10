# SIMD

Import `coil.simd` for typed, fixed-width vectors. The compiler checks each
operation before lowering it. LLVM emits vector instructions; the direct native
backends and interpreter use the same lane semantics through scalar lowering.

```clojure
(import "coil.simd" :as v)

(defn digit-bits [(input (ptr u8)) (count i64)] (-> u64)
  (let [bytes (v/vload-partial [u8 16] input count (v/vzero [u8 16]))
        valid (v/mask-low [16] count)]
    (v/mask->bits (v/vand valid (v/ascii-digit? bytes)))))
```

## Types and inference

`(vec T N)` has a positive compile-time lane count. Numeric lanes are `u8`, `i8`,
`u16`, `i16`, `u32`, `i32`, `u64`, `i64`, `f32`, and `f64`. `(mask N)` abbreviates
`(vec bool N)`. Masks are logical values, not integer vectors with an assumed
all-ones representation. Use `vselect` or explicit bitmap conversion.

Widths can be generic parameters in functions and aggregate types:

```clojure
(defstruct Block [T N] [(value (vec T N)) (valid (mask N))])
(defn doubled [T N] [(x (vec T N))] (-> (vec T N)) (v/vadd x x))
(let [bytes (v/vsplat [u8 16] 42)
      wide (: (v/vwiden-low bytes) (vec u16 8))]
  (v/vextract wide 0))
```

Most operations infer both lane type and width from their operands. Construction
can use explicit arguments such as `[u8 16]` or an expected result type. In a
generic argument list containing only integers, write `(const 16)` to distinguish
the argument from an array literal. `mask-low` and `bits->mask` accept `[N]`
directly as width macros. Array extents remain literal integers.

Widths need not be powers of two. Numeric vector storage is padded to the next
power-of-two byte size, but vector memory operations access exactly N lanes.
Do not assume that a logical mask's in-memory representation is a portable ABI.
Use scalar pointers at C boundaries and `mask->bits` for mask serialization.

## Operations

The module's definition comments are the API reference (`coil doc` on
`src/stdlib/simd.coil`). The main groups are:

- Construction: `vzero`, `vsplat`, `viota`, `vlanes`, `vextract`, `vinsert`.
- Arithmetic: `vadd`, `vsub`, `vmul`, floating `vdiv`, saturating add/subtract,
  `vmin`, `vmax`, `vabs`, `vneg`, and `vfma`.
- Bits: `vand`, `vor`, `vxor`, `vnot`, shifts, rotations, population/leading/trailing
  zero counts, byte swap, and bit reversal.
- Comparisons: `v=`, `v!=`, `v<`, `v<=`, `v>`, `v>=`; all return masks.
- Floating point: square root, floor, ceiling, truncation, ties-to-even rounding,
  `visnan`, and `visfinite`.
- Conversions: `vbitcast`, `vconvert`, `vwiden-low`, `vwiden-high`, `vnarrow`, and
  `vnarrow-saturating`. The expected result type specifies the destination shape.
- Permutations: `vshuffle`, `vtable`, `vreverse`, slides, `valign`, `vzip`, `vunzip`,
  `vtranspose4`, stable `vcompress`/`vexpand`, and packed memory operations.
- Reductions: add, min, max, AND, OR, XOR. Prefix scans include add, XOR, OR, max,
  and `mask-preceding-any`; scan results carry explicit outgoing state.
- Bitmaps: low/range masks, rank, lowest-set-bit iteration, shifts with incoming
  and outgoing bits, and parity prefixes with a carry.
- Byte classification: ASCII digits, letters, hexadecimal digits, whitespace,
  UTF-8 continuation bytes, ranges, and two-table nibble classification.
- Polynomial arithmetic: `vclmul64` returns the low and high halves of independent
  64-by-64 carryless products. Its portable implementation requires no crypto ISA.

## Defined edge behavior

Integer arithmetic wraps unless the operation explicitly says saturating. Shift
and rotation counts are reduced modulo the lane's bit width. Arithmetic right
shift sign-extends the lane's highest bit even for an unsigned lane type.
Leading/trailing zero counts return the lane bit width for zero. The absolute
value of the signed minimum wraps to itself; unsigned absolute value is identity.

An out-of-range `vextract` returns zero; `vinsert` leaves its input unchanged.
Dynamic shuffle indices address concatenated input vectors; invalid indices
produce zero. Byte table indices outside the table, including negative indices,
produce zero. Table lookup does not wrap or use just the index's low byte.

`mask->bits` maps lane i to bit i, with lane zero in the least significant bit,
and clears unused high bits. Bitmap conversion supports at most 64 lanes.
Logical mask queries and reductions also work with wider masks. First/last lane
queries return `Option i64`, not an ambiguous sentinel.

Floating comparisons are ordered except inequality: NaN is unequal to every
value. Min/max propagate NaNs and distinguish signed zero. Floating reduction
addition preserves lane order; a prefix tree has its documented tree grouping,
not the rounding of a scalar left fold. `vfma` rounds once. Float-to-integer
conversion truncates toward zero, saturates at the destination bounds, and maps
NaN to zero. Integer narrowing truncates unless explicitly saturating.

## Memory and tails

`vloadu`/`vstoreu` require N valid scalar lanes but no vector alignment.
Aligned operations require alignment to the vector's allocation size (its byte
size rounded up to a power of two). This is a caller contract, not a runtime check.

Masked operations access only active lanes. Partial loads/stores clamp the count
to `[0,N]`, and inactive loads use the supplied fill vector. An all-inactive mask
permits a null pointer. These guarantees apply to guard-page and external-buffer
tails; they do not require readable padding. An active lane still requires a
valid address. Gather/scatter indices are in scalar elements, not bytes. Scatter
processes lanes in order: the last active lane wins for duplicate indices.

Compression preserves source order. `vcompress` fills unused result lanes from
the corresponding lanes of its fill vector. `vcompress-store` writes only the
selected count and returns that count. `vexpand-load` reads only that many packed
values and fills inactive destination lanes from its fill vector.

## Backends and optimization

The LLVM path retains typed vector operations until target lowering. ARM64 byte
tables of up to 64 entries lower to NEON table instructions. Prefix scans use
shuffle/add trees; mask packing uses target-appropriate reductions or bitcasts.
Use `-O3` for optimization and pointer-only exported functions for assembly
inspection (`--shared` keeps otherwise-unused exported functions alive).

The direct ARM64/x86-64 backends and interpreter prioritize semantic parity via
scalar lowering. Direct Wasm supports the integer, no-runtime subset; floating
math requiring external library calls depends on the backend's runtime support.
Fixed widths are not runtime CPU capability claims. Runtime CPU discovery,
feature-specific multiversion dispatch, and hardware polynomial instructions
are not provided by this baseline API yet.

Run `python3 scripts/dev.py test simd --compiler <candidate>` for focused semantics,
negative diagnostics, and deterministic scalar-oracle tests across lane widths.

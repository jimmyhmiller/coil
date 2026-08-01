# Coil

> **Experimental:** Coil is an actively evolving language. Its syntax, semantics,
> standard library, and tooling may change without notice. It is not yet intended
> for production use.

Coil is a **low-level Lisp**: an ahead-of-time compiled systems language with
s-expression syntax, native code generation, explicit memory management, and a
powerful compile-time programming model.

It combines the directness of C—pointers, exact data layout, manual allocation,
calling conventions, and straightforward C interop—with the composability of
Lisp. Language constructs can be ordinary functions over code, so abstractions
such as loops, closures, and domain-specific syntax do not need privileged
compiler support.

Coil has no garbage collector and no required runtime. Programs compile to native
executables, or directly to WebAssembly modules.

## A small Coil program

```coil
(module example)
(import "primitive.coil" :as primitive)

(defsum Shape
  (Circle [(radius f64)])
  (Rectangle [(width f64) (height f64)]))

(defn area [(shape Shape)] (-> f64)
  (match shape
    (Circle [radius]
      (* 3.141592653589793 (* radius radius)))
    (Rectangle [width height]
      (* width height))))

(defn main [] (-> i64)
  (let [shape (Rectangle 6.0 7.0)]
    (primitive/cast i64 (area shape))))
```

Everything uses the same expression-oriented syntax: definitions, types, control
flow, function calls, and compile-time code.

## Language features

### Native, predictable execution

Coil is statically typed and ahead-of-time compiled. There is no JIT, garbage
collector, or hidden exception mechanism. Native programs are emitted as object
code and linked into ordinary executables; WebAssembly is also a first-class
target.

Self-tail calls are guaranteed to reuse the current stack frame. `loop`, `break`,
and `continue` provide explicit iteration, while conveniences such as `while`,
`for`, `cond`, and `case` are built as macros.

### Data and type system

Coil provides:

- Signed and unsigned integers of arbitrary width, such as `i8`, `u32`, and `u7`
- `f32`, `f64`, `bool`, arrays, slices, vectors, pointers, and function pointers
- Structs, generic structs, and nested values
- Sum types with exhaustive pattern matching
- Parametric generics compiled through monomorphization
- Traits, generic trait implementations, specialization, and trait objects
- Type inference for generic arguments and integer literals

```coil
(defsum Option [T]
  (None)
  (Some [(value T)]))

(defn unwrap-or [T] [(option (Option T)) (fallback T)] (-> T)
  (match option
    (None [] fallback)
    (Some [value] value)))
```

Operators such as `+`, `=`, and `<` are trait methods rather than fixed compiler
built-ins. User-defined types can participate in the same syntax by implementing
the corresponding traits.

### Explicit memory

Pointers are ordinary, region-less machine pointers. Allocation is explicit and
separate from pointer types:

```coil
(let [stack-value (alloc/stack i64)
      heap-value  (alloc/heap i64)]
  (primitive/store! stack-value 20)
  (primitive/store! heap-value 22)
  (let [answer (+ (primitive/load stack-value)
                  (primitive/load heap-value))]
    (primitive/free heap-value)
    answer))
```

Memory can come from the stack, static storage, the heap, or an allocator passed
as a value. The standard library includes malloc-backed and arena allocators.
Allocator interfaces are explicit, alignment-aware, and report allocation
failure with sum types.

Coil also has lightweight immutable and mutable references for const-correct APIs.
They control whether a handle may write, but do not impose ownership, lifetime,
or aliasing rules. Raw pointers remain available when code needs direct control.

### Layout and calling conventions

Data layout and calling conventions are programmable parts of the language.
Structs may use C, packed, over-aligned, bit-packed, or explicit field layouts.
Compile-time `sizeof`, `alignof`, `offsetof`, and static assertions allow layouts
to be checked precisely.

Functions carry a calling convention. Coil supports conventional native and C
ABIs as well as user-defined register conventions, making low-level interfaces,
trampolines, and specialized dispatch expressible in Coil itself.

### Lisp metaprogramming

There is no separate macro language. A macro is an ordinary Coil function whose
inputs and output are `Code`. It can use normal functions, recursion, generics,
collections, allocation, and foreign calls while producing syntax.

```coil
(defn unless [(condition Code) & (body Code)] (-> Code)
  `(if (not ~condition)
       (do ~@body)
       0))
```

Quasiquote, unquote, splicing, and generated symbols support familiar Lisp-style
syntax construction. Macros are resolved hygienically across modules and can
generate complete top-level definitions. Coil also supports compile-time values,
structural reflection, and whole-program checkers and transforms.

Closures demonstrate the language's central idea: a closure does not need to be
a primitive when code can describe a function pointer, an explicitly allocated
environment, and the convention connecting them. The standard library provides
closure syntax as a macro over those pieces.

### C and host interoperability

Foreign functions are declared with typed `extern` definitions. Coil supports C
scalars, pointers, variadic functions, and structs passed or returned by value
according to the platform ABI. C headers can be translated into Coil bindings.

WebAssembly programs can export Coil functions and import host functions. They
can exchange scalar values, linear-memory data, and opaque host `externref`
values, which makes browser and JavaScript integration possible without a
language runtime.

### Modules and standard library

Each source file can declare a module, import other files under an alias or bring
selected names into scope, and explicitly control its exports. The bundled
standard library includes collections, strings and UTF-8 support, allocators,
I/O capabilities, formatting, JSON, HTTP, synchronization primitives, and other
foundational facilities.

I/O is represented by explicit `Reader` and `Writer` values rather than ambient
global streams. Code that performs I/O or allocation can expose those capabilities
in its function parameters, keeping dependencies visible and replaceable.

## Learn the language

The complete language reference is available in
[`docs/reference/LANGUAGE_GUIDE.md`](docs/reference/LANGUAGE_GUIDE.md), or by
running:

```sh
coil guide
```

Focused programs in [`src/examples`](src/examples) demonstrate features such as
sum types, traits, generics, macros, allocators, layouts, closures, C interop,
WebAssembly, and collections.

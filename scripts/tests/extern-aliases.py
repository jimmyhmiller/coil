#!/usr/bin/env python3
"""Explicit linker names retain Coil bindings across native and meta backends."""
from pathlib import Path
import os
import platform
import subprocess
import sys
import tempfile

ROOT = Path(__file__).resolve().parents[2]
COMPILER = Path(sys.argv[1]).resolve()


def run(args, expected=0, env=None):
    result = subprocess.run(list(map(str, args)), cwd=ROOT, env=env, text=True, capture_output=True)
    assert result.returncode == expected, (args, result.returncode, result.stdout, result.stderr)
    return result


with tempfile.TemporaryDirectory(prefix=".coil-extern-aliases-", dir=ROOT) as raw:
    work = Path(raw)
    native = work / "native.c"
    native.write_text(('''long operation(long value) __asm__("alias.function$1");
long operation(long value) { return value + 1; }
long call(long value) { return value; }
long data __asm__("alias.data$1") = 20;
''').replace('"alias.', '"_alias.' if sys.platform == "darwin" else '"alias.'))
    obj = work / "native.o"
    run(["cc", "-c", native, "-o", obj])
    source = work / "aliases.coil"
    source.write_text('''(module alias.test)
(import "coil.primitive" :as p)
(extern operation :as "alias.function$1" :cc c [i64] (-> i64))
(extern same-operation :cc c :as "alias.function$1" [i64] (-> i64))
(extern safe-call :as "call" [i64] (-> i64))
(defn main [] (-> i64)
  (let [value (p/load (p/cast (ptr i64) (p/linker-address "alias.data$1")))
        fp (p/fnptr-of operation)]
    (if (= (p/cast i64 (p/cast (ptr i8) fp)) (p/cast i64 (p/cast (ptr i8) (p/fnptr-of same-operation))))
      (+ (p/call-ptr fp value) (safe-call 21)) 0)))
''')
    backend = "arm64" if platform.machine() == "arm64" else "x64"
    for name in [backend, "llvm"]:
        binary = work / name
        run([COMPILER, "build", source, "--backend", name, "-O0", "--link-flag", obj, "-o", binary])
        run([binary], 42)
    ir = run([COMPILER, "emit-ir", source]).stdout
    assert "target datalayout" in ir and "alias.function$1" in ir and "alias.data$1" in ir
    stage_source = work / "stage.coil"
    stage_source.write_text('(module alias.stage) (import "coil.core" :use []) '
        '(extern operation :as "alias.function$1" :cc c [i64] (-> i64)) '
        '(defn main [] (-> i64) (operation 42))')
    # dump-resolved currently fails even on refer_no_core.coil with the installed
    # compiler; it parses loaded core macros before expansion (coil-bugs).
    for stage in ["dump-load", "dump-checked", "dump-mono"]:
        dump = run([COMPILER, stage, stage_source]).stdout
        expected_alias = '"alias.function$1"' if stage == "dump-load" else ':as "alias.function$1"'
        assert expected_alias in dump, (stage, dump[-3000:])
    stage_source.write_text('(extern operation :as "alias.function$1" :cc c [i64] (-> i64))')
    assert ':as "alias.function$1"' in run([COMPILER, "dump-ast", stage_source]).stdout

    named_native = work / "named-native.c"
    named_native.write_text('''extern long coil_named_data;
long *native_named_address(void) { return &coil_named_data; }
long native_named_increment(void) { return ++coil_named_data; }
''')
    named_obj = work / "named-native.o"
    run(["cc", "-c", named_native, "-o", named_obj])
    source.write_text('''(module alias.named-static)
(import "coil.primitive" :as p)
(extern native-named-address :as "native_named_address" :cc c [] (-> (ptr i64)))
(extern native-named-increment :as "native_named_increment" :cc c [] (-> i64))
(defn storage [] (-> (ptr i64))
  (p/alloc-static i64 40 :as "coil_named_data"))
(defn main [] (-> i64)
  (if (= (p/cast i64 (storage)) (p/cast i64 (native-named-address)))
    (if (= (native-named-increment) 41)
      (if (= (p/load (storage)) 41) 0 3)
      2)
    1))
''')
    named_backends = ["llvm"] + (["arm64"] if platform.machine() == "arm64" else [])
    for name in named_backends:
        binary = work / ("named-" + name)
        run([COMPILER, "build", source, "--backend", name, "-O0", "--link-flag", named_obj, "-o", binary])
        run([binary])
        symbols = run(["nm", "-gm", binary]).stdout
        assert "_coil_named_data" in symbols if sys.platform == "darwin" else "coil_named_data" in symbols

    # References must bind the exact definition irrespective of function order,
    # including sparse storage whose LLVM physical type differs from its array type.
    for sparse in [False, True]:
        ty = "(array i64 16)" if sparse else "i64"
        initializer = ":elements [(0 42) (15 7)]" if sparse else "42"
        address = f'(defn address [] (-> (ptr {ty})) (p/cast (ptr {ty}) (p/linker-address "forward_data")))'
        storage = f'(defn storage [] (-> (ptr {ty})) (p/alloc-static {ty} {initializer} :as "forward_data"))'
        for definitions in [[address, storage], [storage, address]]:
            source.write_text('(module alias.forward) (import "coil.primitive" :as p)\n'
                              + '\n'.join(definitions)
                              + '(defn main [] (-> i64) (if (= (address) (storage)) '
                                '(if (= (p/load (p/cast (ptr i64) (address))) 42) 0 2) 1))')
            for name in named_backends:
                for optimization in ["-O0", "-O2"]:
                    binary = work / "forward"
                    run([COMPILER, "build", source, "--backend", name, optimization, "-o", binary])
                    run([binary])

    source.write_text('''(module alias.duplicate) (import "coil.primitive" :as p)
(defn first [] (-> (ptr i64)) (p/alloc-static i64 21 :as "duplicate_data"))
(defn second [] (-> (ptr i64)) (p/alloc-static i64 42 :as "duplicate_data"))
(defn main [] (-> i64) (if (= (first) (second)) 0 1))
''')
    for name in named_backends:
        binary = work / "duplicate"
        failed = run([COMPILER, "build", source, "--backend", name, "-o", binary], 1)
        assert "duplicate static storage symbol" in failed.stdout + failed.stderr
        assert not binary.exists()

    source.write_text('''(module alias.function-collision) (import "coil.primitive" :as p)
(extern callable :as "colliding_symbol" [] (-> i64))
(defn storage [] (-> (ptr i64)) (p/alloc-static i64 42 :as "colliding_symbol"))
(defn main [] (-> i64) (+ (p/load (storage)) (callable)))
''')
    for name in named_backends:
        binary = work / "function-collision"
        failed = run([COMPILER, "build", source, "--backend", name, "-o", binary], 1)
        assert "static storage conflicts with function symbol" in failed.stdout + failed.stderr
        assert not binary.exists()

    for declaration, phrase in [
        ('(extern f :as 42 [] (-> i64))', ':as expects'),
        ('(extern f :as "" [] (-> i64))', 'nonempty'),
        ('(extern f :as "a" :as "b" [] (-> i64))', 'duplicate :as'),
        ('(extern f :cc c :cc c [] (-> i64))', 'duplicate :cc'),
        ('(extern f :as "call" [] (-> i64)) (extern g :as "call" [i64] (-> i64))', 'different signatures'),
    ]:
        source.write_text('(module alias.bad) ' + declaration + ' (defn main [] (-> i64) 0)')
        failed = run([COMPILER, "check", source], 1)
        assert phrase in failed.stdout + failed.stderr

    for alias, expected in [("callback_c", 1), ("other_callback", 0)]:
        source.write_text('(module alias.export-collision) '
            '(defstruct Pair [(a i64) (b i64)]) '
            '(defn callback [(value Pair)] (-> i64) (.a value)) '
            '(export-c [callback :as "callback_c"]) '
            f'(extern callback_c :as "{alias}" :cc c [Pair] (-> i64)) '
            '(defn main [] (-> i64) 0)')
        result = run([COMPILER, "check", source], expected)
        if expected:
            assert "extern in the same program imports it" in result.stdout + result.stderr
    source.write_text(source.read_text().replace(':as "other_callback"', ':as "callback_c"')
                      .replace('(extern callback_c ', '(extern renamed '))
    result = run([COMPILER, "check", source], 1)
    assert "extern in the same program imports it" in result.stdout + result.stderr

    callback_obj = work / "callbacks.o"
    run(["cc", "-c", ROOT / "tests/compiler/features/c_aggregate_callback_export.c", "-o", callback_obj])
    callback_source = (ROOT / "tests/compiler/features/c_aggregate_callback_export.coil").read_text()
    for location in ["local", "static"]:
        text = callback_source
        if location == "static":
            for ty, fn in [("S4", "inspect-s4"), ("S8", "inspect-s8"),
                           ("Target", "inspect-target"), ("S32", "inspect-s32")]:
                text = text.replace(f'(primitive/fnptr-of {fn})', f'(primitive/load saved-{fn})')
                text += f'\n(def saved-{fn} (primitive/alloc-static (fnptr c [{ty}] i64) (primitive/fnptr-of {fn})))\n'
        source.write_text(text)
        for opt in ["-O0", "-O2"]:
            binary = work / "callback"
            run([COMPILER, "build", source, "--backend", "llvm", opt,
                 "--link-flag", callback_obj, "-o", binary])
            run([binary])

    source.write_text('''(module alias.meta)
(import "coil.primitive" :as p)
(extern length :as "strlen" :cc c [(ptr i8)] (-> i64))
(defn answer [] (-> Code) (if (= (length c"xx") 2) `42 `0))
(defn main [] (-> i64) (answer))
''')
    for interpreter in ["0", "1"]:
        run([COMPILER, "run", source, "--quiet"], 42, os.environ | {"COIL_META_INTERP": interpreter})

    source.write_text('''(module alias.wasm)
(extern safe-host :as "host.function$1" :cc c [i64] (-> i64))
(defn main [] (-> i64) (safe-host 42))
''')
    wasm = work / "alias.wasm"
    run([COMPILER, "build", source, "--backend", "wasm", "-o", wasm])
    data = wasm.read_bytes()
    assert data.startswith(b"\0asm") and b"host.function$1" in data

print("extern aliases: calls, imports, linker addresses, and one canonical named static across Coil/native code passed")

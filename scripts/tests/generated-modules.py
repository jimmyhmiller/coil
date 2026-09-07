#!/usr/bin/env python3
"""Behavioral contract for opt-in generated-module compilation sessions."""
from __future__ import annotations

import json
import os
import re
from pathlib import Path
import subprocess
import sys
import tempfile

ROOT = Path(__file__).resolve().parents[2]
COMPILER = Path(sys.argv[1] if len(sys.argv) > 1 else "build/bin/coil-generated-v2").resolve()
PROCESS_IDS: set[int] = set()


def run(args: list[str], expected: int = 0, *, env: dict[str, str] | None = None, cwd: Path = ROOT) -> subprocess.CompletedProcess[str]:
    process = subprocess.Popen(args, cwd=cwd, env=env, text=True,
                               stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    PROCESS_IDS.add(process.pid)
    stdout, stderr = process.communicate()
    result = subprocess.CompletedProcess(args, process.returncode, stdout, stderr)
    if result.returncode != expected:
        raise AssertionError(f"{args!r}: wanted {expected}, got {result.returncode}\n{result.stdout}\n{result.stderr}")
    return result


with tempfile.TemporaryDirectory(prefix=".coil-generated-tests-", dir=ROOT) as raw:
    directory = Path(raw)
    source = directory / "source.input"
    source.write_text("generated-session-test\n")
    provider_path = directory / "provider.coil"
    environment = os.environ.copy()
    environment["COIL_NAMESPACE_ROOTS"] = str(directory)
    environment["COIL_META_ARENA"] = "poison"
    environment.pop("COIL_MODULE_MAP", None)
    environment.pop("COIL_READERS", None)
    base = [str(COMPILER)]
    uses = ["--use", "reader.fixture.generated-test"]

    def provider(units: list[tuple[str, str, str]], facade: str, after: str = "") -> None:
        submissions = "\n".join(
            "(meta/generated-unit! " + " ".join(json.dumps(piece) for piece in unit) + ")"
            for unit in units
        )
        provider_path.write_text(
            '(module reader.fixture.generated-test)\n(import "coil.meta" :as meta)\n'
            '(import "coil.primitive" :as primitive)\n'
            '(defn read-source [(context Code)] (-> Code) (do\n'
            + submissions + "\n" + after + "\n"
            + f"(primitive/code-read {json.dumps(facade)} context)))\n"
            + '(reader-provider "reader.fixture.generated-test" read-source)\n'
        )

    def invoke(command: str, *flags: str, expected: int = 0, env: dict[str, str] | None = None):
        return run(base + [command, str(source)] + uses + list(flags), expected, env=env or environment)

    def failure(command: str, phrase: str, *flags: str) -> None:
        result = invoke(command, *flags, expected=1)
        if phrase not in result.stderr + result.stdout:
            raise AssertionError(f"missing {phrase!r}\n{result.stdout}\n{result.stderr}")

    state = (
        "generated.state",
        "(module generated.state) (extern generated_cell :cc c [] (-> (ptr i64))) (export generated_cell)",
        "(module generated.state) (defn generated_cell [] (-> (ptr i64)) (primitive/alloc-static i64 21))",
    )
    consumer = (
        "generated.consumer",
        "(module generated.consumer) (extern generated_answer :cc c [] (-> i64)) (export generated_answer)",
        '(module generated.consumer) (import "generated.state" :as state) '
        '(defn generated_answer [] (-> i64) (let [cell (state/generated_cell)] '
        '(primitive/store! cell (* (primitive/load cell) 2)) (primitive/load cell)))',
    )
    facade = '(module generated.facade) (import "coil.primitive" :as primitive) (import "generated.state" :as state) '
    facade += '(import "generated.consumer" :as consumer) '
    facade += '(defn main [] (-> i64) (consumer/generated_answer) (primitive/load (state/generated_cell)))'
    # Forward declaration, ordinary imports, and one observable shared state cell.
    provider([consumer, state], facade)
    invoke("check")
    # Source decoding is not a semantic dependency of already-decoded owners.
    # Ordinary uses (including macros and checkers) still run in each unit.
    semantic_path = directory / "semantic-use.coil"
    semantic_path.write_text('''(module generated.semantic-use)
      (import "coil.primitive" :as p)
      (defn semantic-base [(context Code)] (-> Code) `21)
      (defn inspect-forms [(forms Code)] (-> i64)
        (if (= (p/code-count forms) 0) 0
          (let [f (p/code-nth forms 0)]
            (if (p/code-list? f)
              (if (> (p/code-count f) 1)
                (if (p/code-eq (p/code-nth f 0) `defn)
                  (if (= (p/code-sym (p/code-nth f 1)) "owner-checker-marker")
                    (p/error "semantic checker reached generated owner") 0) 0) 0) 0)
            (inspect-forms (p/code-rest forms)))))
      (defn inspect-modules [(modules Code)] (-> Code)
        (if (= (p/code-count modules) 0) `0
          (do (inspect-forms (p/code-rest (p/code-nth modules 0)))
              (inspect-modules (p/code-rest modules)))))
      (checker inspect-modules :phase before-expand)
      (export semantic-base)
    ''')
    semantic_state = (state[0], state[1], state[2].replace('i64 21)', 'i64 (semantic-base `0))'))
    provider([consumer, semantic_state], facade)
    traced = invoke("run", "--backend", "llvm", "-O0", "--quiet",
                    "--use", "generated.semantic-use", expected=42,
                    env=environment | {"COIL_TRACE": "1"})
    owner_traces = re.findall(r"coil-profile\towner.begin\t[^\n]+\n(.*?)coil-profile\towner.end\t",
                             traced.stderr, re.S)
    assert len(owner_traces) == 2, traced.stderr
    for owner_trace in owner_traces:
        assert "reader.setup." not in owner_trace, owner_trace
        assert f"source.register\t{provider_path}\t" not in owner_trace, owner_trace
        assert f"source.register\t{semantic_path}\t" in owner_trace, owner_trace
    marked_state = (semantic_state[0], semantic_state[1], semantic_state[2]
                    + ' (defn owner-checker-marker [] (-> i64) 0)')
    provider([consumer, marked_state], facade)
    failure("check", "semantic checker reached generated owner", "--use", "generated.semantic-use")
    semantic_path.unlink()
    provider([consumer, state], facade)
    # The compilation identity is materialized by a metaprogram in the facade
    # and every owner. A process-per-unit implementation cannot pass this probe.
    identity_helper = directory / "compiler-identity.coil"
    identity_helper.write_text('(module generated.compiler-identity) '
        '(import "coil.primitive" :as p) (extern getpid :cc c [] (-> i32)) '
        '(defn compiling-pid [(context Code)] (-> Code) '
        '(p/code-read (p/int->str (cast i64 (getpid))) context)) (export compiling-pid)')
    identities = [(f"generated.identity{i}",
        f"(module generated.identity{i}) (extern identity{i} :cc c [] (-> i64)) (export identity{i})",
        f'(module generated.identity{i}) (import "generated.compiler-identity" :as identity) '
        f'(defn identity{i} [] (-> i64) (identity/compiling-pid `0))') for i in range(3)]
    identity_facade = '(module generated.facade) (import "generated.compiler-identity" :as identity) '
    identity_facade += ' '.join(f'(import "generated.identity{i}" :as unit{i})' for i in range(3))
    identity_facade += '(defn main [] (-> i64) (let [pid (identity/compiling-pid `0)] '
    identity_facade += '(if (and (= pid (unit0/identity0)) (and (= pid (unit1/identity1)) (= pid (unit2/identity2)))) 42 99)))'
    provider(identities, identity_facade)
    invoke("run", "--backend", "llvm", "-O0", "--quiet", expected=42)
    identity_helper.unlink()
    provider([consumer, state], facade)
    if os.environ.get("COIL_TEST_GENERATED_SANITIZERS") == "1":
        for sanitizer in ["address", "undefined"]:
            invoke("run", "--backend", "llvm", "-O0", "--quiet",
                   "--sanitize=" + sanitizer, expected=42)
        print("generated module sanitizers: address and undefined shared-state execution passed")
    # Imported readers run after the facade loader has already indexed source
    # namespaces. Their newly committed interfaces must enter that live index.
    entry = directory / "imported-reader-entry.coil"
    entry.write_text('(module generated.imported-entry) (import "generated.facade" :as facade) '
                     '(defn main [] (-> i64) (facade/answer))')
    provider([consumer, state], facade.replace('(defn main', '(defn answer') + ' (export answer)')
    manifest = directory / "Coil.toml"
    manifest.write_text('[package]\nname = "generated"\nentry = "imported-reader-entry.coil"\n'
                        'source-roots = ["."]\n[readers]\n".input" = "reader.fixture.generated-test"\n'
                        '[modules]\n"generated.facade" = "source.input"\n')
    imported_trace = run(base + ["run", "--quiet"], 42,
                         env=environment | {"COIL_TRACE": "1"}, cwd=directory)
    imported_owners = re.findall(r"coil-profile\towner.begin\t[^\n]+\n(.*?)coil-profile\towner.end\t",
                                imported_trace.stderr, re.S)
    assert len(imported_owners) == 2, imported_trace.stderr
    for owner_trace in imported_owners:
        assert "reader.setup." not in owner_trace, owner_trace
        assert f"source.register\t{provider_path}\t" not in owner_trace, owner_trace
    # A real native dependency must be found through a multiline manifest array,
    # not a literal '[' search path. Comments/brackets/commas inside quoted paths
    # remain path bytes, and literal-string elements obey the same boundaries.
    native_dir = directory / "native # ], directory"
    native_dir.mkdir()
    native_source = native_dir / "value.c"
    native_source.write_text("long generated_native_value(void) { return 42; }\n")
    native_object = native_dir / "value.o"
    run(["cc", "-c", str(native_source), "-o", str(native_object)])
    run(["ar", "rcs", str(native_dir / "libgeneratednative.a"), str(native_object)])
    entry.write_text('(module generated.imported-entry) (import "generated.facade" :as facade) '
                     '(extern generated_native_value :cc c [] (-> i64)) '
                     '(defn main [] (-> i64) (if (= (facade/answer) 42) (generated_native_value) 1))')
    original_manifest = manifest.read_text()
    manifest_text = original_manifest + ('[link] # section comment\nlibs = [\n "generatednative",\n]\n'
        'search-paths = [ # continuation comment\n'
        + json.dumps(native_dir.name) + ', # quoted comment marker is not a comment\n'
        + "'" + native_dir.name + "',\n] # final comment\n")
    manifest.write_text(manifest_text)
    run(base + ["run", "--quiet"], 42, env=environment, cwd=directory)
    for bad, phrase in [('[\n "missing",\n', 'unterminated manifest array'),
                        ('["unclosed\n', 'unterminated string in manifest array'),
                        ('["."] trailing\n', 'unexpected text after manifest array')]:
        manifest.write_text(original_manifest + '[link]\nsearch-paths = ' + bad)
        rejected = run(base + ["check"], 1, env=environment, cwd=directory)
        assert phrase in rejected.stdout + rejected.stderr
    manifest.unlink()
    entry.unlink()
    provider([consumer, state], facade)
    invoke("build", "-o", "/dev/null")
    callback = directory / "void-callback.coil"
    callback.write_text('(module generated.void-callback) '
                        '(import "coil.primitive" :as p) '
                        '(defn callback [] (-> void) (do)) '
                        '(defn invoke [(f (fnptr c [] void))] (-> void) (p/call-ptr f)) '
                        '(defn main [] (-> i64) (invoke (p/fnptr-of callback)) 0)')
    run(base + ["run", str(callback), "--quiet"], env=environment)
    callback.write_text('(module generated.void-callback) '
                        '(extern invalid :cc c [(fnptr c [void] i64)] (-> i64)) '
                        '(defn main [] (-> i64) 0)')
    invalid = run(base + ["check", str(callback)], 1, env=environment)
    assert "only valid as a return type" in invalid.stdout + invalid.stderr
    callback.unlink()
    # A C reader uses libc's real void abort signature. The implicit allocator
    # import (and other stdlib declarations) must not give that symbol a fake
    # integer return type, even when neither failure branch is taken.
    abort_source = directory / "libc-abort.coil"
    abort_source.write_text('(module generated.libc-abort) '
                            '(import "coil.guardalloc") '
                            '(import "coil.lint.unused") '
                            '(extern abort :cc c [] (-> void)) '
                            '(defn successor [(value i64)] (-> i64) (+ value 1)) '
                            '(defn main [] (-> i64) (if (= (successor 41) 42) 0 1))')
    run(base + ["run", str(abort_source), "--backend", "llvm", "--quiet"], env=environment)
    sanitized = run(base + ["emit-ir", str(abort_source), "--sanitize=undefined"], env=environment)
    assert "target datalayout" in sanitized.stdout and "call void @abort()" in sanitized.stdout
    abort_source.unlink()
    returned_callback = ("generated.returned-callback",
        '(module generated.returned-callback) '
        '(extern generated_get_callback :cc c [] (-> (fnptr c [] void))) '
        '(export generated_get_callback)',
        '(module generated.returned-callback) '
        '(defn callback [] (-> void) (do)) '
        '(defn generated_get_callback [] (-> (fnptr c [] void)) (primitive/fnptr-of callback))')
    provider([returned_callback], '(module generated.facade) '
             '(import "coil.primitive" :as primitive) '
             '(import "generated.returned-callback" :as callback) '
             '(defn main [] (-> i64) (primitive/call-ptr (callback/generated_get_callback)) 42)')
    invoke("run", "--backend", "llvm", "--quiet", expected=42)
    if sys.platform == "darwin":
        invoke("run", "--backend", "arm64", "--quiet", expected=42)
    provider([consumer, state], facade)
    for backend in ("llvm", "arm64"):
        if backend == "arm64" and sys.platform != "darwin":
            continue
        executable = directory / backend
        invoke("build", "--backend", backend, "-o", str(executable))
        run([str(executable)], 42, env=environment)
    obj = directory / "combined.o"
    invoke("emit-obj", "-o", str(obj))
    if not obj.is_file() or obj.stat().st_size == 0:
        raise AssertionError("emit-obj did not produce the requested artifact")
    linked = directory / "linked"
    run(["cc", str(obj), "-o", str(linked)], env=environment)
    run([str(linked)], 42, env=environment)
    ir = invoke("emit-ir", expected=1)
    if ir.stdout or "requires one module" not in ir.stderr:
        raise AssertionError("emit-ir must reject before emitting partial IR")
    failure("build", "wasm partition linking", "--target", "wasm32-unknown-unknown", "-o", str(directory / "no.wasm"))
    if (directory / "no.wasm").exists():
        raise AssertionError("unsupported wasm build wrote a final artifact")

    shared_types = ("generated.shared-types",
        '(module generated.shared-types) (defstruct Pair [(value i64)]) (export Pair)',
        '(module generated.shared-types)')
    identity = ("generated.identity",
        '(module generated.identity) (import "generated.shared-types") '
        '(extern generated_identity :cc c [generated.shared-types.Pair] (-> generated.shared-types.Pair)) '
        '(export generated_identity)',
        '(module generated.identity) (defn generated_identity [(value generated.shared-types.Pair)] '
        '(-> generated.shared-types.Pair) value)')
    shared_consumer = ("generated.shared-consumer",
        '(module generated.shared-consumer) (import "generated.shared-types") '
        '(extern shared_answer :cc c [] (-> i64)) (export shared_answer)',
        '(module generated.shared-consumer) (import "generated.identity" :as peer) '
        '(defn shared_answer [] (-> i64) '
        '(let [value (peer/generated_identity (load (generated.shared-types.Pair :value 42)))] (.value value)))')
    shared_facade = '(module generated.facade) (import "generated.shared-consumer" :as value) '
    shared_facade += '(defn main [] (-> i64) (value/shared_answer))'
    provider([shared_types, identity, shared_consumer], shared_facade)
    invoke("check")
    invoke("run", "--backend", "llvm", "--quiet", expected=42)
    borrowed_identity = identity[2].replace('[(value generated.shared-types.Pair)]',
                                            '[(value (ref generated.shared-types.Pair))]')
    provider([shared_types, (identity[0], identity[1], borrowed_identity), shared_consumer], shared_facade)
    failure("check", "has no C representation")
    pointer_identity = identity[2].replace('[(value generated.shared-types.Pair)]',
                                           '[(value (ptr generated.shared-types.Pair))]')
    pointer_identity = pointer_identity.replace('(-> generated.shared-types.Pair) value)',
                                                '(-> generated.shared-types.Pair) (load value))')
    provider([shared_types, (identity[0], identity[1], pointer_identity), shared_consumer], shared_facade)
    failure("check", "exported C parameter type differs")
    provider([identity, shared_types], shared_facade)
    failure("check", "already registered generated interface")
    for dependency in ('coil.str', 'generated.identity'):
        provider([(identity[0], identity[1].replace('generated.shared-types"', dependency + '"'), identity[2])], shared_facade)
        failure("check", "already registered generated interface")
    aliased = identity[1].replace('(import "generated.shared-types")', '(import "generated.shared-types" :as types)')
    provider([shared_types, (identity[0], aliased, identity[2])], shared_facade)
    failure("check", "already registered generated interface")
    alias_type = identity[1].replace('generated.shared-types.Pair', 'shared-types/Pair')
    provider([shared_types, (identity[0], alias_type, identity[2])], shared_facade)
    failure("check", "fully qualified names")
    provider([consumer, state], facade)

    # Duplicate identical submissions commit once, including interpreter callback ABI.
    provider([consumer, state, consumer, state], facade)
    interpreted = environment | {"COIL_META_INTERP": "1"}
    invoke("run", "--quiet", expected=42, env=interpreted)

    interface = "(module generated.value) (extern generated_value :cc c [] (-> i64)) (export generated_value)"
    facade_value = '(module generated.facade) (import "generated.value" :as value) (defn main [] (-> i64) (value/generated_value))'
    body = '(module generated.value) (defn twice [(x Code)] (-> Code) `(* ~x 2)) (defn generated_value [] (-> i64) (twice 21))'
    provider([("generated.value", interface, body)], facade_value)
    invoke("run", "--quiet", expected=42)
    debug_body = '(module generated.value) (defn choose [(ignored Code)] (-> Code) (if (primitive/debug-checks?) `42 `21)) (defn generated_value [] (-> i64) (choose 0))'
    provider([("generated.value", interface, debug_body)], facade_value)
    invoke("run", "--quiet", expected=21)
    invoke("run", "--quiet", "--debug-checks", "-O0", expected=42)

    # A per-unit transform may inspect the unit and leave imported declarations
    # alone; a before-expand transform must not alter another unit's interface.
    identity_transform = '(defn identity-transform [(modules Code)] (-> Code) `(do ~@modules)) (transform identity-transform :phase before-expand) '
    transformed_consumer = (consumer[0], consumer[1], consumer[2] + identity_transform)
    provider([transformed_consumer, state], facade)
    invoke("run", "--quiet", expected=42)
    mutating_transform = '''
    (defn marked? [(forms Code)] (-> bool)
      (if (= (primitive/code-count forms) 0) false
        (let [form (primitive/code-nth forms 0)]
          (if (and (primitive/code-list? form) (> (primitive/code-count form) 1))
              (if (primitive/code-eq (primitive/code-nth form 0) `defstruct) true
                  (marked? (primitive/code-rest forms)))
              (marked? (primitive/code-rest forms))))))
    (defn rewrite-modules [(modules Code)] (-> Code)
      (if (= (primitive/code-count modules) 0) `()
        (let [m (primitive/code-nth modules 0)]
          `(~(if (not (marked? (primitive/code-rest m)))
                 `(~(primitive/code-nth m 0) (defstruct InjectedMarker [(value i64)]) ~@(primitive/code-rest m))
                 m)
             ~@(rewrite-modules (primitive/code-rest modules))))))
    (defn change-interface [(modules Code)] (-> Code) `(do ~@(rewrite-modules modules)))
    (transform change-interface :phase before-expand)
    '''
    provider([(consumer[0], consumer[1], consumer[2] + mutating_transform), state], facade)
    failure("check", "read-only generated-module interface")

    typed_interface = interface.replace("(export generated_value)", "(defstruct Sample [(value i64)]) (export Sample generated_value)")
    typed_body = '(module generated.value) (defn generated_value [] (-> i64) (let [sample (Sample :value 42)] (.value sample)))'
    provider([("generated.value", typed_interface, typed_body)], facade_value)
    invoke("run", "--quiet", expected=42)

    layout_interface = typed_interface.replace("[(value i64)]", "[(value i64) (padding i64)]")
    layout_body = typed_body.replace("(Sample :value 42)", "(Sample :value 42 :padding 17)")
    owner_transform = '''
    (defn change-layout [(forms Code)] (-> Code)
      (if (= (primitive/code-count forms) 0) `()
        (let [f (primitive/code-nth forms 0)]
          `(~(if (and (primitive/code-list? f) (= (primitive/code-count f) 3))
                 (if (and (= (primitive/code-str (primitive/code-nth f 0)) "defstruct")
                          (= (primitive/code-str (primitive/code-nth f 1)) "Sample"))
                     (let [fields (primitive/code-nth f 2)]
                       (if (= (primitive/code-str (primitive/code-nth (primitive/code-nth fields 0) 0)) "value")
                           `(~(primitive/code-nth f 0) ~(primitive/code-nth f 1)
                              [~(primitive/code-nth fields 1) ~(primitive/code-nth fields 0)]) f)) f)
                 f)
             ~@(change-layout (primitive/code-rest forms))))))
    (defn change-owned-modules [(modules Code)] (-> Code)
      (if (= (primitive/code-count modules) 0) `()
        (let [m (primitive/code-nth modules 0)]
          `((~(primitive/code-nth m 0) ~@(change-layout (primitive/code-rest m)))
            ~@(change-owned-modules (primitive/code-rest modules))))))
    (defn owner-layout-transform [(modules Code)] (-> Code) `(do ~@(change-owned-modules modules)))
    (transform owner-layout-transform :phase after-expand)
    '''
    provider([("generated.value", layout_interface, layout_body + identity_transform)], facade_value)
    invoke("run", "--quiet", expected=42)
    for phase in ("before-expand", "after-expand"):
        provider([("generated.value", layout_interface, layout_body + owner_transform.replace("after-expand", phase))], facade_value)
        failure("check", "read-only generated-module interface")
    provider([shared_types, identity,
              (shared_consumer[0], shared_consumer[1], shared_consumer[2] + mutating_transform)], shared_facade)
    failure("check", "read-only generated-module interface")

    provider([("generated.value", interface, '(module generated.value) (import "coil.args" :as args) (defn generated_value [] (-> i64) (args/args-count))')], facade_value)
    failure("check", "owns static storage")
    provider([("generated.value", interface, '(module generated.value) (defn generated_value [(x i64)] (-> i64) x)')], facade_value)
    failure("check", "generated_interface_check")
    provider([("generated.value", interface, '(module generated.value) (defn generated_value [] (-> i64) 42) (export-c [generated_value :as "unowned_alias"])')], facade_value)
    failure("check", "not owned by its interface")
    provider([("generated.value", interface, '(module generated.value) (defn generated_value [] (-> i64) missing-function)')], facade_value)
    failure("build", "missing-function", "-o", str(directory / "failed"))
    if (directory / "failed").exists():
        raise AssertionError("failed generated unit published an executable")
    provider([state, (state[0], state[1], state[2].replace("21", "22"))], facade)
    failure("check", "conflicting interface or implementation")
    provider([state], '(module generated.facade) (defn main [] (-> i64) 0)', '(primitive/error "deliberate reader failure after emission")')
    failure("check", "deliberate reader failure")
    nested = '(module generated.value) (import "coil.meta" :as meta) (defn nested [] (-> Code) (do (meta/generated-unit! "nested.unit" "bad" "bad") `0)) (meta (nested)) (defn generated_value [] (-> i64) 42)'
    provider([("generated.value", interface, nested)], facade_value)
    failure("check", "nested generation is not supported")
    provider([("generated.value", "(module generated.value) (defn helper [] (-> i64) 1)", body)], facade_value)
    failure("check", "interface must declare")

    aliased = ("generated.aliased",
        '(module generated.aliased) (extern safe_answer :as "generated_native_answer" :cc c [] (-> i64)) (export safe_answer)',
        '(module generated.aliased) (defn safe_answer [] (-> i64) 42)')
    alias_facade = '(module generated.facade) (import "generated.aliased" :as api) (defn main [] (-> i64) (api/safe_answer))'
    provider([aliased], alias_facade)
    invoke("run", "--backend", "llvm", "--quiet", expected=42)
    if sys.platform == "darwin":
        invoke("run", "--backend", "arm64", "--quiet", expected=42)
    conflicting_alias = ("generated.conflicting-alias",
        '(module generated.conflicting-alias) (extern different_binding :cc c :as "generated_native_answer" [] (-> i64)) (export different_binding)',
        '(module generated.conflicting-alias) (defn different_binding [] (-> i64) 0)')
    provider([aliased, conflicting_alias], alias_facade)
    failure("check", "different generated-module owner")
    provider([("generated.duplicate-alias",
        '(module generated.duplicate-alias) (extern one :as "same" :cc c [] (-> i64)) (extern two :as "same" :cc c [] (-> i64)) (export one two)',
        '(module generated.duplicate-alias) (defn one [] (-> i64) 0) (defn two [] (-> i64) 0)')], '(module generated.facade) (defn main [] (-> i64) 0)')
    failure("check", "two interface bindings cannot own")
    provider([("generated.invalid-export",
        '(module generated.invalid-export) (extern safe :as "invalid$export" :cc c [] (-> i64)) (export safe)',
        '(module generated.invalid-export) (defn safe [] (-> i64) 0)')], '(module generated.facade) (defn main [] (-> i64) 0)')
    failure("check", "generated exports require a valid C identifier")

    contract = directory / "session-contract"
    run(base + ["build", "tests/compiler/features/generated_session_contract.coil", "-o", str(contract)], env=environment)
    defined_source = directory / "object-defined.c"
    referenced_source = directory / "object-referenced.c"
    defined_object = directory / "object-defined.o"
    referenced_object = directory / "object-referenced.o"
    defined_source.write_text('extern char *LLVMGetDefaultTargetTriple(void);\n'
                              'const unsigned char padding[32 * 1024 * 1024] = {1};\n'
                              'void *curl_easy_init(void) { return LLVMGetDefaultTargetTriple(); }\n')
    referenced_source.write_text('extern void *curl_easy_init(void);\n'
                                 'void *use_curl(void) { return curl_easy_init(); }\n')
    run(["cc", "-c", str(defined_source), "-o", str(defined_object)])
    run(["cc", "-c", str(referenced_source), "-o", str(referenced_object)])
    assert defined_object.stat().st_size >= 32 * 1024 * 1024
    facts_env = environment.copy()
    facts_env["COIL_LINK_FACTS_DEFINED"] = str(defined_object)
    facts_env["COIL_LINK_FACTS_REFERENCED"] = str(referenced_object)
    static_source = directory / "unit-static-image.c"
    static_image = directory / ("unit-static-image.dylib" if sys.platform == "darwin" else "unit-static-image.so")
    static_source.write_text("static long counter; long unit_increment(void) { return ++counter; }\n")
    run(["cc", "-dynamiclib" if sys.platform == "darwin" else "-shared", "-fPIC", str(static_source), "-o", str(static_image)])
    facts_env["COIL_UNIT_STATIC_IMAGE"] = str(static_image)
    timed = run((["/usr/bin/time", "-l"] if sys.platform == "darwin" else
                 ["/usr/bin/time", "-f", "__peak_rss_kb__=%M"]) + [str(contract)], env=facts_env)
    assert "object link facts: repeated scans passed" in timed.stdout
    assert "12 large sequential units and nested state restoration passed" in timed.stdout
    match = re.search(r"(\d+)\s+maximum resident set size", timed.stderr) if sys.platform == "darwin" else re.search(r"__peak_rss_kb__=(\d+)", timed.stderr)
    assert match, timed.stderr
    peak_bytes = int(match.group(1)) * (1 if sys.platform == "darwin" else 1024)
    assert peak_bytes < 256 * 1024 * 1024, f"object scans retained input bytes: {peak_bytes} RSS"
    print(f"object link facts: repeated 32 MiB scans peak at {peak_bytes} bytes RSS")

    leftovers = [path for pid in PROCESS_IDS for path in Path("/tmp").glob(f"coil-generated-{pid}-*")]
    if leftovers:
        raise AssertionError(f"generated sessions leaked source directories: {sorted(leftovers)}")
    if list(directory.glob(".coil-object-*")):
        raise AssertionError("emit-obj leaked its private artifact directory")

memory = run([sys.executable, str(ROOT / "scripts/tests/generated-unit-memory.py"), str(COMPILER)])
print(memory.stdout.strip())
print("generated modules: passed imports, shared state, command semantics, native/interpreter callbacks, macros, debug configuration, ownership rejection, rollback, and cleanup")

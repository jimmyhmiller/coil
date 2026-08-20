#!/usr/bin/env python3
"""Does `coil lint --use coil.lint.unused --fix` delete exactly the dead code?

This rule is the only bundled one that REMOVES source rather than rewriting it,
so the two ways it can be wrong are not symmetric. Deleting too little is noise.
Deleting too much destroys work, and the `--fix` loop's compile check does not
catch the worst case: a definition whose only caller lives outside the
compilation unit is deleted, the unit still compiles, and the breakage surfaces
somewhere else entirely. So this asserts BOTH directions on every fixture — the
exact set that must go, and the exact set that must stay.

Four questions, in order of how much damage getting them wrong would do:

  1. OPT-IN. A plain `coil lint --fix` must not delete anything. The rule is not
     in `coil.lint.default` and must never drift into it.
  2. LIBRARY vs EXECUTABLE. A module with no `main` and no `(export …)` exposes
     every name it defines (NAMESPACING.md: "default: all public"), so nothing
     in it is provably dead. The same file WITH a `main` is an executable whose
     modules are private, and its unreachable definitions are dead.
  3. WHAT GOES. Dead definitions, including the two shapes a mention-counting
     analysis cannot see: a self-recursive dead function and a mutually
     recursive dead pair. Plus a `let` binding nobody reads whose initializer
     cannot have an effect, and an import that binds nothing.
  4. WHAT STAYS. Live definitions, a macro (whose call sites are already gone by
     the time a checker runs), a sum reached only through a variant constructor,
     a section banner comment above a deleted form, and a `let` binding whose
     initializer is a call.
  4b. SUM VARIANTS, where matching is not using: `match` survives expansion, so a
     variant handled by an arm is NAMED by the very code that exists only to
     handle it. A variant nothing constructs goes, and its arms go with it; the
     last variant of a sum always stays.
  5. STRUCT FIELDS, the one tier the compile check cannot vouch for, stay behind
     `--lint-param unused-fields=on` — and even then leave alone any struct whose
     layout crosses to C or is reached through a pointer cast.

    python3 scripts/tests/unused_lint.py --coil build/bin/coil
"""
import argparse, os, pathlib, subprocess, sys, tempfile

# One executable. Every definition is labelled by what must happen to it.
PROGRAM = """(module unused-probe)
(import "coil.primitive" :as primitive)
(import "coil.time" :as unusedalias)

(export exported-api)

; ============================ types =========================================
;; `x` is read, `stored` is written, `untouched` is neither. `Live` is named by no
;; `extern`, so its layout is Coil's to change.
(defstruct Live [(x i64) (stored i64) (untouched i64)])
(defstruct Orphan [(a i64)])

;; …whereas this one crosses to C, so even a field nothing mentions stays.
(defstruct Abi [(fd i32) (opaque i64)])
(extern crosses :cc c [(ptr Abi)] (-> i64))

;; C-style struct inheritance, the shape a bytecode VM's object model is built on: the header is
;; reached by casting the pointer, never by naming the field. `header` is mentioned
;; nowhere and must survive anyway — deleting it compiles and breaks the program.
(defstruct Header [(tag i64)])
(defstruct Derived [(header Header) (payload i64)])

;; `Red` is constructed; `Green` is only ever MATCHED, which is not a use — the arm
;; exists to handle it and cannot run if nothing makes one. Both the variant and its
;; arm go. `Red` is the last one standing and stays regardless.
(defsum Color (Red) (Green [(n i64)]))
(defsum NeverUsed (Only [(z i64)]))

(const LIVE-K 7)
(const DEAD-K 9)

(extern labs :cc c [i64] (-> i64))
(extern abs :cc c [i32] (-> i32))

;; A macro. Checkers run on the EXPANDED program, so its call sites no longer
;; exist; judged by mentions alone it would look unreachable.
(defn twice [(e Code)] (-> Code)
  `(primitive/iadd ~e ~e))

;; Dead and self-recursive: its own recursive call is the only mention.
(defn dead-loop [(n i64)] (-> i64)
  (if (> n 0) (dead-loop (primitive/isub n 1)) (only-from-dead)))

;; Dead and mutually recursive: each mention comes from the other.
(defn ping [(n i64)] (-> i64) (if (> n 0) (pong (primitive/isub n 1)) 0))
(defn pong [(n i64)] (-> i64) (if (> n 0) (ping (primitive/isub n 1)) 1))

;; Reached only from dead code — a cascade the same pass must follow.
(defn only-from-dead [] (-> i64) 5)

(defn helper [(p (ptr Live))] (-> i64)
  (primitive/iadd (load (field p x)) LIVE-K))

(defn tag-of [(d (ptr Derived))] (-> i64)
  (load (field (primitive/cast (ptr Header) d) tag)))

(defn exported-api [] (-> i64) 1)

(defn describe [(c Color)] (-> i64)
  (match c (Red [] 1) (Green [n] n)))

;; `let` bindings. The first is read by the third, which the body reads, so the whole
;; chain is live. The second is read by nothing and binds a literal. The fourth binds
;; a call, which has to keep happening whether or not anyone wanted the value.
;; (Names below are matched as substrings by the gate, so this prose avoids them.)
(defn bindings [] (-> i64)
  (let [read-later 4
        dead-binding 5
        effectful (labs 6)
        chained read-later]
    (primitive/iadd chained effectful)))

(defn main [] (-> i64)
  (let [l (primitive/alloc-stack Live)
        a (primitive/alloc-stack Abi)
        c (Red)]
    (store! (field l stored) 1)
    (crosses a)
    (twice (labs (primitive/iadd (helper l)
                                 (primitive/iadd (describe c)
                                                 (primitive/iadd (bindings)
                                                                 (tag-of (primitive/alloc-stack Derived)))))))))
"""

# Reachable from `main`, from an export, or through a variant constructor.
MUST_STAY = ["(defstruct Live", "(defsum Color", "(const LIVE-K", "(extern labs",
             "(defn twice", "(defn helper", "(defn exported-api", "(defn main",
             "; ============================ types ===",
             '(import "coil.primitive"',
             "read-later", "chained", "effectful (labs 6)",
             "(defn tag-of", "(Red)", "(Red [] 1)"]
# Struct fields are their own opt-in tier (`--lint-param unused-fields=on`), so they
# are checked separately, against a compiler run that asked for them.
FIELDS_MUST_STAY = ["(x i64)", "(stored i64)",        # read, and written
                    "(fd i32)", "(opaque i64)",       # layout crosses to C
                    "(header Header)", "(payload i64)"]  # reached by pointer cast
FIELDS_MUST_GO = ["(untouched i64)"]
# Top-level DEFINITIONS, which the executable/library reading applies to.
MUST_GO_DEFS = ["(defstruct Orphan", "(defsum NeverUsed", "(const DEAD-K", "(extern abs",
                "(defn dead-loop", "(defn ping", "(defn pong", "(defn only-from-dead"]
# Module-local dead weight, which that reading does not bear on: an import and a
# `let` binding are unused or not within one file either way.
MUST_GO_LOCAL = ['(import "coil.time"', "dead-binding",
                 "(Green [(n i64)])", "(Green [n] n)"]
MUST_GO = MUST_GO_DEFS + MUST_GO_LOCAL


def run(*argv, cwd=None, env=None):
    return subprocess.run(argv, cwd=cwd, env=env, capture_output=True, text=True)


def check(condition: bool, message: str) -> None:
    if not condition:
        raise SystemExit(f"unused-lint gate FAIL — {message}")


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--coil", default="build/bin/coil")
    args = ap.parse_args()
    coil = str(pathlib.Path(args.coil).resolve())

    with tempfile.TemporaryDirectory(prefix="coil-unused-lint-") as td:
        tmp = pathlib.Path(td)

        # 1. OPT-IN. The default profile must leave every dead definition alone.
        default = tmp / "default.coil"
        default.write_text(PROGRAM)
        run(coil, "lint", str(default), "--fix")
        for gone in MUST_GO:
            check(gone in default.read_text(),
                  f"the DEFAULT lint profile deleted {gone!r}; this rule must stay opt-in")

        # 2a. LIBRARY reading: no `main`, no export list -> every DEFINITION is public
        #     and none is provably dead. Imports are unaffected by this: an import is
        #     module-local, so an unused one is unused whichever reading applies.
        lib = tmp / "lib.coil"
        lib.write_text(PROGRAM.replace("(export exported-api)\n", "")
                              .replace("(defn main [] (-> i64)", "(defn entry [] (-> i64)"))
        before = lib.read_text()
        run(coil, "lint", str(lib), "--use", "coil.lint.unused", "--fix")
        after_lib = lib.read_text()
        for kept in MUST_GO_DEFS:
            check(kept in after_lib,
                  f"deleted {kept!r} from a module with no `main` and no export list; "
                  "every name such a module defines is public")

        # 2b. …and `unused-roots=exports` is the override that judges it anyway.
        forced = tmp / "forced.coil"
        forced.write_text(before)
        run(coil, "lint", str(forced), "--use", "coil.lint.unused",
            "--lint-param", "unused-roots=exports", "--fix")
        check("(defn only-from-dead" not in forced.read_text(),
              "--lint-param unused-roots=exports did not force the executable reading")

        # 3 + 4. The executable: exactly the dead set goes, exactly the live set stays.
        probe = tmp / "probe.coil"
        probe.write_text(PROGRAM)
        result = run(coil, "lint", str(probe), "--use", "coil.lint.unused",
                     "--fix")
        fixed = probe.read_text()
        for gone in MUST_GO:
            check(gone not in fixed, f"left dead code behind: {gone!r}\n{result.stderr}")
        for kept in MUST_STAY:
            check(kept in fixed, f"deleted live code: {kept!r}\n{result.stderr}")
        # The doc comment above a deleted form goes with it; the banner above the
        # first survivor does not.
        check("mutually recursive" not in fixed,
              "a deleted form's doc comment was left orphaned above the next one")

        # Deletions are byte-exact and leave the whitespace their neighbours were laid
        # out around; `coil fmt` closes it. The file must check both before and after,
        # because a deletion that unbalanced a form would still format.
        built = run(coil, "check", str(probe))
        check(built.returncode == 0, f"the fixed file no longer checks:\n{built.stderr}")
        run(coil, "fmt", "--write", str(probe))
        formatted = probe.read_text()
        check("(let [read-later 4\n" in formatted,
              f"a deleted `let` binding left the vector unformattable:\n{formatted}")
        built = run(coil, "check", str(probe))
        check(built.returncode == 0, f"the formatted file no longer checks:\n{built.stderr}")

        # 5. STRUCT FIELDS are opt-in, and the default must leave them alone. This is
        #    the only tier whose mistakes the compile check cannot catch: a field
        #    deletion changes layout, and a program that reached that layout by
        #    casting rather than by naming the field still builds.
        for kept in FIELDS_MUST_GO:
            check(kept in fixed,
                  f"the default run deleted the struct field {kept!r}; field deletion "
                  "is not compile-checked and must stay behind --lint-param")

        fields = tmp / "fields.coil"
        fields.write_text(PROGRAM)
        run(coil, "lint", str(fields), "--use", "coil.lint.unused",
            "--lint-param", "unused-fields=on", "--fix")
        after_fields = fields.read_text()
        for gone in FIELDS_MUST_GO:
            check(gone not in after_fields, f"--lint-param unused-fields=on left {gone!r}")
        for kept in FIELDS_MUST_STAY:
            check(kept in after_fields,
                  f"deleted the struct field {kept!r}, whose layout something depends on")
        built = run(coil, "check", str(fields))
        check(built.returncode == 0, f"field deletion broke the file:\n{built.stderr}")

        # 6. An import is kept when the module it names declares anything AMBIENT —
        #    a trait impl is in scope wherever its module is loaded, so an unmentioned
        #    alias is not evidence the import does nothing.
        proj = tmp / "proj"
        (proj / "src").mkdir(parents=True)
        (proj / "src/plain.coil").write_text(
            "(module uprobe.plain)\n(export helper-a)\n(defn helper-a [] (-> i64) 1)\n")
        (proj / "src/ambient.coil").write_text(
            "(module uprobe.ambient)\n"
            "(defstruct Tag [(v i64)])\n"
            "(deftrait Tagged [Self] (tag-of [(self (ptr Self))] (-> i64)))\n"
            "(impl Tagged Tag (tag-of [(self (ptr Tag))] (-> i64) (load (field self v))))\n")
        app = proj / "src/app.coil"
        app.write_text("""(module uprobe.app)
(import "coil.primitive" :as primitive)
(import "uprobe.plain" :as plain)
(import "uprobe.plain" :use [helper-a])
(import "uprobe.ambient" :as ambient)

(defn main [] (-> i64) (primitive/iadd (plain/helper-a) 0))
""")
        env = {**os.environ, "COIL_NAMESPACE_ROOTS": "src"}
        run(coil, "lint", "src/app.coil", "--use", "coil.lint.unused", "--fix",
            cwd=proj, env=env)
        after = app.read_text()
        check('(import "uprobe.plain" :as plain)' in after,
              "deleted an import whose alias is used as a qualifier")
        # `plain/helper-a` is a QUALIFIED use — it goes through the `:as` alias and
        # says nothing about the `:use [helper-a]` binding, which is unreferenced.
        check('(import "uprobe.plain" :use [helper-a])' not in after,
              "kept a `:use [...]` import whose bare binding is never mentioned; a "
              "qualified `plain/helper-a` is not a use of it")
        check('(import "uprobe.ambient" :as ambient)' in after,
              "deleted an import of a module declaring a trait impl; the impl is in "
              "scope through that import and no mention records it")

        # 7. PROJECT MODE, and the trap it exposes. A bare `coil lint` lints the whole
        #    project, tests included — and a test is an ENTRY POINT: `coil test` finds
        #    `coil-test$…` by prefix the way the runtime finds `main`. Nothing in the
        #    program CALLS one. Without rooting them, a project-wide --fix proposes
        #    deleting a function AND the test covering it in the same round, which
        #    compiles cleanly precisely because both halves went — so the --fix loop's
        #    revert-on-broken cannot catch it. This is the worst failure this tool has.
        wp = tmp / "wholeproj"
        (wp / "src").mkdir(parents=True)
        (wp / "tests").mkdir()
        (wp / "Coil.toml").write_text("""[package]
name = "wholeproj"
entry = "src/main.coil"
source-roots = ["src", "tests"]
""")
        (wp / "src/main.coil").write_text("""(module wholeproj)
(import "coil.primitive" :as primitive)
(defn only-a-test-calls-me [(n i64)] (-> i64) (primitive/imul n 2))
(defn truly-dead [] (-> i64) 3)
(defn main [] (-> i64) 0)
""")
        (wp / "tests/a-test.coil").write_text("""(module wholeproj.a-test)
(import "coil.assert" :use *)
(import "wholeproj" :as w)
(deftest doubles (assert-eq (w/only-a-test-calls-me 21) 42))
""")
        run(coil, "lint", "--use", "coil.lint.unused", "--fix", cwd=wp)
        src = (wp / "src/main.coil").read_text()
        check("only-a-test-calls-me" in src,
              "project mode deleted a function whose only caller is a test — and would "
              f"have deleted the test with it, so nothing would have failed:\n{src}")
        check("deftest doubles" in (wp / "tests/a-test.coil").read_text(),
              "project mode deleted a test suite")
        check("truly-dead" not in src,
              "project mode changed NOTHING. Most likely the round proposed deleting "
              "the test forms too, the re-check then failed on a file whose `deftest` "
              "had been removed, and the whole round was reverted — which is how "
              "unrooted tests made the tool silently inert on any project that has "
              f"them, rather than merely wrong:\n{src}")

    print("unused-lint gate: PASS")
    return 0


if __name__ == "__main__":
    sys.exit(main())

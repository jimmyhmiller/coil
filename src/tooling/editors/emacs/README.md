# Coil for Emacs

A Coil development environment shaped like CIDER: a major mode that indents the
way `coil fmt` does, a live REPL with inline results, and documentation,
completion, navigation, checking and tests wired to the compiler itself.

## Install

```elisp
(add-to-list 'load-path "/path/to/coil/src/tooling/editors/emacs")
(require 'coil-mode)
(coil-setup-default)
```

`coil-setup-default` turns on paredit, rainbow-delimiters, eldoc, completion,
xref and flymake in `.coil` buffers — each only if the package it needs is
installed. Pick a subset with `coil-setup-features`, or skip it and wire the
pieces up yourself.

`coil` must be on `exec-path`; set `coil-program` if it lives somewhere unusual.
On macOS, a GUI Emacs does not inherit a login shell's `PATH`, so
`exec-path-from-shell-initialize` (or an explicit `coil-program`) is what makes
the difference between everything working and nothing working.

## Keys

Mostly CIDER's layout, so Clojure muscle memory transfers.  It departs from
it where Coil is a compiled language and Clojure is not: `C-c C-i` for the
type at point, `C-c C-r` to build and run the file, and `C-c C-v` to check
it — CIDER spends `C-c C-v` on a prefix for eval commands, and nothing here
needs that many, so eval-region sits on `C-c C-x` instead.

| Key | Does |
| --- | --- |
| `C-c M-j` | start a REPL for this project |
| `C-c C-z` | jump to the REPL, and back again from it |
| `C-x C-e` / `C-c C-e` | evaluate the form before point |
| `C-M-x` / `C-c C-c` | evaluate the top-level form around point |
| `C-c C-x` | evaluate the region, form by form |
| `C-c C-k` | load this buffer's namespace into the session |
| `C-c C-p` | evaluate to a result buffer |
| `C-c C-w` | evaluate and insert the value as a comment |
| `C-c C-i` | infer the type of the form before point, without running it |
| `C-c C-m` | macroexpand the top-level form around point |
| `C-c C-b` | interrupt whatever the REPL is running |
| `C-c M-r` | `:reset` the session |
| `C-c M-o` | clear the REPL buffer |
| `C-c C-q` | shut the REPL down |
| `C-c C-d C-d` | documentation for the name at point |
| `C-c C-d C-a` | apropos across everything in scope |
| `C-c C-d C-n` | show a whole namespace |
| `C-c C-d C-g` | look a topic up in `coil guide` |
| `C-c C-t C-t` | run the test point is inside |
| `C-c C-t C-n` | run every test in this file |
| `C-c C-t C-p` | run the project's test suites |
| `C-c C-f` | format the buffer with `coil fmt` |
| `C-c C-l` | `coil lint --fix` this file |
| `C-c C-v` | `coil check` this file |
| `C-c C-r` | `coil run` this file (`C-u` to pass flags, e.g. `-O0`) |
| `M-x coil-balance-buffer` | `coil balance` — repair delimiters in a file that no longer reads |
| `M-.` / `M-,` | jump to a definition and back, project or standard library |
| `M-x coil-refresh-namespace-cache` | forget cached namespace documentation |

## What is wired to what

**The REPL** (`coil-repl.el`) runs `coil repl` under comint with a request
queue: every send is recorded, output accumulates until the next prompt, and
the text between goes to that send's callback. That is what lets an evaluation
render as an overlay beside the expression instead of as scrollback, and lets
tooling ask questions the user never sees.

Two details make the capture reliable rather than approximate. The REPL runs on
a **PTY**: its prompts go out through raw `write` while JIT-compiled code prints
through libc stdio, and on a pipe stdio block-buffers, so results arrive after
the prompt that should follow them and every capture is off by one. And the
PTY's **echo is off** (`stty -echo` before `exec`), so nothing sent has to be
subtracted from the output again.

**Documentation, completion and eldoc** (`coil-doc.el`) do not use the REPL at
all. `coil namespace NS` prints every definition with its signature and doc
comment in about fifteen milliseconds, from any directory, whether or not a
session is running — a better source than a connection would be, because it
works in a file you just opened, does not need the file to compile, and covers
the whole standard library rather than only what has been loaded.

Scope is namespace-aware in the Clojure sense: the buffer's own `(import …)`
forms decide what is visible and under which name. `:use *`, `:use [names]`,
`:as`, `:exclude` and `:rename` are each honoured, `coil.core` is implicit
unless the buffer imports it explicitly, and local definitions shadow imported
ones. A file that imports `coil.str` as `s` completes `s/str-concat`, and does
not offer `hm-put!` from a namespace nobody imported.

**Jump to definition** searches source rather than asking the compiler:
`coil namespace` reports signatures but no file or line, and searching also
works on a file that does not currently compile — which is when you most want
to jump somewhere. The standard library is searched too, located from what
`coil --version` reports (set `coil-xref-search-stdlib` to nil to skip it).

**Diagnostics** (`coil-check.el`) run `coil check` behind flymake on a scratch
copy of the buffer. The copy always goes in the buffer's own directory, because
Coil resolves a module by walking source roots upward from the file and a copy
in `/tmp` would fail every import. The caret run under a diagnostic gives the
width of the offending expression, so the highlight covers the expression
rather than the line.

## Indentation

`coil-mode` indents the way `coil fmt` formats. The rules were read off
formatter output over the compiler and standard library and are checked back
against it by `coil-test-indent-agrees-with-formatter`, so TAB and the
formatter agree and neither churns the other's work. Four rules cover it:

1. A vector element lines up one past the `[`, except a `let` binding VALUE
   pushed onto its own line, which goes two past its own name.
2. A form with an indent spec puts its body two in from the form. `coil-mode`
   knows the language's forms; an unregistered `def…` head indents like a
   definition, so a project-local `defcommand` lays out sensibly for free.
   Override anything with `coil-indent-specs`.
3. A value that follows a `:keyword` argument, or a `cond` result that follows
   its test, goes two in from the first half of the pair — unless a comment
   caused the break, in which case nothing was wrapped.
4. Anything else aligns under the first argument, as in any Lisp.

Agreement is about 98.5% of lines across the standard library. The remainder is
two shapes where the formatter has no single answer: `(block :label …)` is
stable both level with its label and two columns in, and `cond` PACKS pairs
onto a line, which is a reflow an indenter cannot and should not reproduce.

Two Coil-specific touches worth knowing. A single `;` indents **as code**:
Emacs Lisp's convention is that one semicolon means a margin comment aligned to
`comment-column` and two mean a comment about the code, and Coil's is the other
way round — `;` is the ordinary comment and `;;` marks documentation, which is
also why the two get different faces. And `~`, `` ` ``, `~@` and `'` have prefix
syntax, so they move as part of the form they mark and paredit cannot tear a
quasiquote template apart.

## Known limits, all in the REPL rather than here

- **A diagnostic from the REPL points at `<repl>`, not at your source.** The
  session compiles a probe program around each expression, and errors report a
  position inside that wrapper. Compilation navigation is therefore off in the
  error buffer; it is on for `coil check` and `coil test`, whose locations are
  real files. `C-c C-v` on the file is the way to get a diagnostic you can
  jump to.
- **A value cannot be told apart from what the program printed.** The protocol
  is a prompt and some text; anything written to stdout arrives ahead of the
  value with nothing marking the boundary. `coil-result-output` carries the
  whole capture and the reported value is the last non-empty line of it.
- **An error is recognised by the word `error:`.** Same reason.
- **A crashing evaluation takes the session with it.** The REPL is live by
  default — each eval is a dylib hot-loaded into the session process — so
  `(def x …)` binds values later sends can use and FFI state survives, at the
  price of no crash isolation. Restart with `C-c M-j`.
- **A `defn` cannot be redefined with a different signature.** Change one and
  the session refuses the form; `C-c M-r` (`:reset`) and reload.

Each of those is a place where the client is guessing because the protocol is
text. They are marked HEURISTIC in `coil-repl.el`, and they are the same three
places a structured protocol would fix. When the REPL grows one, `coil-repl.el`
is the only file that changes: `coil-connection` already carries a `kind` slot,
and every caller goes through `coil-eval-async` / `coil-eval-sync`.

## Tests

```sh
emacs --batch -L . -l coil-mode-tests.el -f ert-run-tests-batch-and-exit
```

Tests that need the toolchain skip themselves when `coil` is not on PATH. Set
`COIL_CHECKOUT` to a compiler checkout to run the formatter-agreement test from
outside one.

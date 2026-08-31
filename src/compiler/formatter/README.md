# coil fmt — a pretty printer for Coil, written in Coil

A source formatter in the style of [Prettier](https://prettier.io) — lay a form out
flat if it fits the target width, otherwise break it — but respecting the
**Clojure indentation conventions** for how Lisp code lines up. Written entirely in
Coil, over the standard library.

```
coil fmt <file.coil>            # print the formatted source
coil fmt --check <file.coil>    # exit 1 if not already formatted
coil fmt --write <file.coil>    # reformat the file in place
coil fmt --width 90 <file.coil> # preview a different target width
```

`fmt` is a built-in subcommand of the `coil` compiler (the formatter lives in
`src/compiler/formatter/rules.coil` and is compiled into the binary; `src/compiler/driver.coil` wires it
up). The standalone `coil run src/compiler/formatter/fmt.coil -- <file>` still works and is equivalent.

Target width defaults to 120 columns and can be selected per invocation with
`--width N`. `let`/`loop` binding vectors with two or more pairs
always break to one pair per line (aligned in a column), even when they would fit
flat; a single-binding vector stays inline.

## What it preserves

Formatting only ever changes whitespace and line breaks. Comments and every
atom/string/number are kept **verbatim**. Blank lines inside forms are preserved
(collapsed to at most one); top-level spacing is canonicalized as described below.

To check that over the tree: `coil fmt --check` on every `.coil` file must be clean
after a `--write` pass (idempotence), and `coil dump-read` of a file must match
`coil dump-read` of its formatted form once spans are stripped (token-equivalence —
the compiler's own reader, not `fmt`, is the judge). `scripts/compiler/oracle/gate-cli.sh`
gates the `fmt` CLI contract itself: argv, exit codes, multi-file, `--check`/`--write`.

## Reflow policy (hybrid)

Width-driven like Prettier, but it respects two author signals:

- **blank lines inside forms** are kept (at most one);
- a form the **author already split across lines stays split** (its group is forced
  to break). A form the author wrote on one line is re-flowed by width.

Indentation is always normalized.

At the top level, forms are separated by one empty line, following the Clojure
style guide. Coil's separate `module` and `import` forms are treated as one compact
namespace header. A leading comment block stays attached to the form it documents.

## Layout conventions

Per the Clojure style guide, the head symbol decides how a broken form lines up:

| kind                                   | example |
|----------------------------------------|---------|
| function call (default) — align under the first arg | `(some-fn a`<br>`         b)` |
| macro / body form — 2-space body indent | `(when test`<br>`  body)` |
| `defn` — signature on the head line, body +2 | `(defn f [x] (-> i64)`<br>`  body)` |
| `let`/`loop`/… — binding vector laid out in **pairs** | `(let [a 1`<br>`      b 2]`<br>`  body)` |
| `cond`/`case` — clauses in **pairs**, aligned | `(cond t1 r1`<br>`      t2 r2)` |

A comment is always the last thing on its line: nothing is ever joined onto a
line after a comment.

## Structure

| file        | what |
|-------------|------|
| `cst.coil`  | reader → a Concrete Syntax Tree that preserves comments, blank lines (`nl-before`), and verbatim token text |
| `doc.coil`  | a Wadler/Prettier **Doc** algebra + width-driven renderer (`DNest` relative indent, `DAlign` anchor-to-column, `DGroup` flat-if-fits) |
| `rules.coil`| lowers the CST to a Doc, applying the layout conventions above |
| `fmt.coil`  | the CLI |
| `dump.coil` | debug: print the CST node tree |
| `sample.coil` | a small fixture exercising comments, prefixes, strings, bindings |
| `balance.coil` | `coil balance` — delimiter repair, plus the shared token scanner |
| `formedit.coil` | `coil edit` — addressing and replacing whole forms |
| `balance_cli.coil`, `edit_cli.coil` | standalone builds of each (seconds to compile, for iterating without rebuilding the compiler) |

# coil balance — repairing source that will not read

`fmt` needs a file that parses. `balance` is for the one that doesn't, because an
agent edited it as text and a patch straddled a delimiter.

```
coil balance <file.coil>              # print the repaired source
coil balance --check <file.coil>      # exit 1 if the delimiters don't balance
coil balance --write <file.coil>      # repair in place
coil balance --strict <file.coil>     # refuse anything indentation doesn't determine
```

Two properties, not heuristics, do the work:

**Region scoping.** The file is cut into top-level regions at column-0 opening
delimiters, and each is balanced on its own. A region that already balances is copied
out byte-for-byte — never analysed, so never "fixed". Column 0 is the resynchronisation
anchor that survives a wrong depth count, which is exactly what a whole-file
Parinfer-style pass lacks: after one early defect its running depth is off, and it then
"corrects" forms downstream that were fine. `tests/repro/paredit-balance-coil` is that
failure, recorded from a real tool.

**Insert-only or delete-only, never a move.** A form short of closers gets closers
inserted; an unmistakable stray one gets deleted; a form wanting both is refused. Every
original byte survives in its original order, so "my parens got rearranged" is
unrepresentable rather than unlikely.

Where a missing closer goes comes from indentation — the one real insight in Parinfer:
a line indented at or left of an open form's column is not inside it. Scoped to one
damaged region and restricted to insertion, that rule is safe.

## Plausible structural placement

Indentation cannot prove the meaning of two balanced readings on the same physical
line. `balance` does not pretend otherwise, and it also does not make a damaged file's
unrelated resolver or type errors a prerequisite for repairing its delimiters.

The default chooses the line-local boundary derived by the indentation planner, reports
when that placement was a guess, and emits it immediately. This keeps the tool useful on
exactly the mid-edit files that cannot compile yet. Use `--strict` when a workflow prefers
refusal over any within-line indentation guess.

The safety boundary remains structural: balanced top-level regions are byte-identical;
a damaged region is insert-only or delete-only; delimiter kinds must agree; strings must
terminate; and a repair may never move existing source.

**What balance refuses**, always with a location: a `)` against a `[` (either could be
the typo); an unterminated string; a defect requiring delimiter movement; or indentation
that cannot identify even a plausible local boundary.

## ~/.coil/balance-log.jsonl

Every run appends one line: a path, an outcome, a cause, and four counters. Nothing is
transmitted anywhere and no source text is recorded.

```
coil balance --stats          # summary by outcome and cause
COIL_BALANCE_LOG=0 coil …     # don't record this run
```

```json
{"t":1786287466,"cmd":"balance","path":"src/foo.coil","outcome":"repaired",
 "cause":"derived","tried":1,"matches":1,"guessed":0,"capped":false}
```

The reason it exists: the mutation corpus measures damage a *script* invented, on files
that all compile cleanly. The refusals that matter are the ones hit on a real
half-edited file, and which cause dominates there decides what to fix next. Tuning
against a synthetic population is how a tool ends up excellent at the wrong problem.

`guessed` records how many closer positions used the plausible within-line fallback.
The legacy `tried` and `matches` counters remain in the log schema as zero so existing
log readers do not break.

Causes are stable slugs, separate from the human sentence, so improving the wording
doesn't silently reset the statistics keyed on it: `derived` and `plausible` for new
repairs (historical logs may contain `typed-boundary` and `no-typecheck`);
`surplus-ambiguous`, `mismatch`, `move-required`, `inside-line`, `no-place`,
`over-fire`, `underflow`, `indent-disagree`, `unterminated-string` for refusals.

# coil edit — editing a form instead of a range of text

The other half. A text patch can straddle a delimiter, so applying one can make a file
unreadable; naming a form and supplying a replacement form cannot, because the
replacement is read and rejected unless it is complete and balanced, and the splice
lands on the form's own byte boundaries.

```
coil edit f.coil --list
coil edit f.coil --form 'defn parse-args' --show
coil edit f.coil --form 'defn parse-args' --replace --write < new.coil
coil edit f.coil --in 'impl Show Point' --form 'show' --replace --write < new.coil
coil edit f.coil --form 'defn old' --delete --write
```

An address is a form's leading items, itself read as Coil and compared item by item —
so `impl [T] Show (Box T)` is four items and whitespace inside one doesn't matter.
Matching is a **prefix**: `defn` names every defn and reports them all, which is how you
find the address you want. A miss lists the forms that do exist. Nesting uses `--in`
rather than a path separator, because `/` is an ordinary character in a Coil symbol and
`Point/show` is genuinely ambiguous.

Replacement text is read from stdin. Its first line is spliced at the form's own
indentation, so write it unindented and indent the rest to suit.

## Testing

| script | what it establishes |
|--------|---------------------|
| `scripts/tests/balance_fuzz.py` | damages one delimiter in known-good tree files and asks whether the tool restores it; the pre-damage file is ground truth, so correctness is byte equality, not judgement. **`diverged` must stay 0** — that is the bucket where the file reads, compiles, and means something else. `--compare paredit-like` scores both; `--kind` isolates a damage shape; `--self-check` proves the Coil scanner and an independent Python one agree on every delimiter. Run it under a CPU ceiling: each mutant may compile several candidates |
| `scripts/tests/balance_cases.py` | pins the specific decisions, above all the **refusals** — a refusal turning into a repair improves every summary statistic while being the failure the design rejects |
| `scripts/tests/edit_roundtrip.py` | `--show` then `--replace` with the same bytes, for every form in the tree; the file must be identical. Catches a span off by one, a prefix glyph left outside a node, a comment swallowed at either end |
| `scripts/tests/edit_cases.py` | the refusals and listings around `edit` |

## Known limitations (v1)

- Trailing comments are placed two spaces after the code, not column-aligned to
  match neighboring lines.
- `cond`/`case` results that don't fit drop to the next line at the clause
  indentation, rather than a `+2` hang under their test.
- `if` uses a 2-space body indent rather than aligning both branches under the test.

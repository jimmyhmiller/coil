# Ahead-of-time regular expressions

Every `coil.regex` entry point is a metaprogram. Its pattern must be a string
literal; Coil parses it while compiling the caller and emits an allocation-free
matcher specialized to that pattern. The regex parser and pattern do not remain
in the executable, and the haystack expression is evaluated exactly once.

```coil
(module example.regex)
(import "coil.regex" :as re)

(defn valid-username? [(username (slice u8))] (-> bool)
  (re/is-match? "^(?i:[a-z][a-z0-9_]{2,15})$" username))

(defn main [] (-> i64)
  (let [line "GET /index.html 200"]
    (println "{}" (valid-username? "coil_42"))
    (println "{:?}" (re/find "\\d+" line))
    (match (re/captures "^(\\w+) (\\S+) (\\d+)$" line)
      (Some [caps]
        (match (re/group-bytes caps line 2)
          (Some [path] (println "path {}" path))
          (None [] 0)))
      (None [] 0))
    (for span (re/find-iter "[a-z]+" line)
      (println "word {}" (re/span-bytes line span))))
  0)
```

```output
true
(Some (Span :start 16 :end 19))
path /index.html
word index
word html
```

## API

| Form | Result |
|---|---|
| `(is-match? PATTERN HAYSTACK)` | `bool`: does PATTERN match anywhere |
| `(find PATTERN HAYSTACK)` | `(Option Span)`: the leftmost-first match |
| `(find-at PATTERN HAYSTACK START)` | the first match starting at byte offset START or later |
| `(find-iter PATTERN HAYSTACK)` | a `Matches` iterator of successive non-overlapping `Span`s |
| `(captures PATTERN HAYSTACK)` | `(Option (Captures N))`: every group of the leftmost-first match |
| `(captures-at PATTERN HAYSTACK START)` | as `captures`, from byte offset START |
| `(captures-iter PATTERN HAYSTACK)` | a `CapturesIter` over the groups of each match |

`HAYSTACK` is a `(slice u8)`; pass `(string-view-bytes v)` for a `StringView`.

A `Span` is the half-open byte range `[start, end)`: read it with `.start` and
`.end`, `(span-len s)`, or `(span-bytes haystack s)`. `Captures` is
`(Captures N)`, where `N` is the number of groups plus group 0 (the whole match),
fixed by the pattern. `(group caps i)` is group `i`'s `(Option Span)`: `None` when
`i` is out of range or the group did not take part in the match (the untaken
side of an alternation, an optional group that was skipped). `(group-bytes caps
haystack i)` returns the bytes instead, and `(group-count caps)` returns `N`.

Groups are numbered by their opening parenthesis, left to right; `(?:…)` and the
flag groups do not capture. A group inside a repetition reports its last
iteration: `(a|b)+` against `abab` has group 1 at `[3, 4)`.

`find-at`, `captures-at` and the iterators still see the whole haystack: `^`
matches only at offset 0 and `\b` looks at the byte before `START`.

## Match semantics: leftmost-first

`find` and `captures` return the **leftmost-first** match, as Perl, PCRE, RE2, Go
and Rust do: the match that starts earliest wins, and among matches starting
there, the one the pattern prefers. Alternatives are tried in order and greedy
quantifiers prefer more iterations, lazy ones fewer. So `a|ab` against `ab`
matches `a`, `<.*?>` against `<a><b>` matches `<a>`, and
`(a|ab)(c|bcd)` against `abcd` matches `a` then `bcd`.

The alternative, POSIX **leftmost-longest**, returns the longest match at the
leftmost start. It was not chosen because the pattern author cannot steer it:
lazy quantifiers and alternative order would mean nothing, and its group rules
are notoriously hard to implement and to predict. Leftmost-first is also what
anyone porting a pattern from another mainstream engine expects.

A loop iteration that matches the empty string is never taken: following RE2,
a matching thread never revisits the same automaton state at the same position.
`(a*)*` against `b` matches the empty string with group 1 unset, and `(|a)*`
against `a` matches `a`.

Iteration is RE2's, Go's and Rust's: after a match the next search starts where
it ended; an empty match is skipped when it ends where the previous match ended,
and after an empty match the search resumes one byte later. `a*` against `baaab`
yields `[0, 0)`, `[1, 4)` and `[5, 5)`.

## Engines

All forms share one parser and one Thompson NFA.

- `is-match?` emits a bit-parallel state machine: the set of active states is one
  machine word, updated per byte. It allows at most 63 states.
- `find`, `captures` and their `-at`/`-iter` forms emit a Pike VM. Threads are
  kept in priority order with their capture slots, which is what yields
  leftmost-first semantics; a thread that reaches the accepting state cuts every
  lower-priority thread. The thread lists, capture slots and closure stack are
  fixed-size locals sized by the pattern, so a call allocates nothing. Runtime is
  linear in the haystack length (`O(states × slots)` per byte), and the pattern
  may use up to 256 states.
- A pattern that is a literal between optional `^`/`$` compiles to a `memchr`
  candidate scan instead of either automaton.
- When every match must contain one particular byte, both automata first look
  for that byte with `memchr` and fail fast when it is absent.

Each `find` and `captures` call site becomes its own small function; the
iterators call it once per match.

## Syntax

The byte-oriented engine supports:

- concatenation, `|`, capturing groups `(…)`, and noncapturing groups `(?:…)`;
- `.`, byte classes, ranges, and negated classes;
- greedy `*`, `+`, `?`, `{m}`, `{m,}`, and `{m,n}` repetition, and their lazy
  forms `*?`, `+?`, `??`, `{m,}?`, and `{m,n}?`;
- `^`, `$`, `\b`, and `\B` as zero-width assertions, including inside groups
  and alternatives;
- ASCII `\d`, `\w`, `\s` and their complements `\D`, `\W`, `\S`;
- `\xNN`, `\0`, `\a`, `\e`, `\f`, `\n`, `\r`, `\t`, and `\v`, plus escaped
  punctuation;
- scoped ASCII case-insensitive, dot-all, and multiline modes: `(?i:…)`,
  `(?s:…)`, `(?m:…)`, and combinations such as `(?is:…)`.

Matching is an unanchored search unless assertions anchor it. Dot excludes LF
unless `s` is scoped around it. Word characters and case folding are ASCII.
Offsets are byte offsets; the engine does not decode UTF-8, so `.` matches one
byte.

## Deliberate limits

Named groups, replacement, Unicode properties and case folding, lookaround,
backreferences, atomic groups, and possessive quantifiers are not implemented.
Unsupported `(?…)` forms and alphanumeric escapes are compile-time errors instead
of being interpreted as literals with surprising behavior.

The state limits (63 for `is-match?`, 256 for the Pike VM) are explicit
compile-time errors. Large counted repetitions reach them first, since
`x{100}` is 100 states. A pattern too big for `is-match?` can still use `find`.

Every accepted expression runs in linear time. Adding backreferences would
require a separate execution tier with a different complexity contract.

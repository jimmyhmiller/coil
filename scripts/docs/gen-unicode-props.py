#!/usr/bin/env python3
"""Generate coil.unicode.data: general categories, binary properties and simple
case mappings for every Unicode scalar value.

Data comes from the versioned Unicode Character Database files below. The
generated module (and its exhaustive checksum test) are checked in, so normal
Coil builds never need Python or network access. The UCD files are not.

Tables. Every code point belongs to a *class*: one combination of general
category, five binary properties (Alphabetic, Uppercase, Lowercase,
White_Space, Numeric) and four simple case-mapping deltas (upper, lower, title,
fold, each `target - code point`). Unicode 17 has fewer than 256 classes. The
code point -> class map is a three-level trie: the top table is indexed by
`cp >> 9`, a middle table by bits 4..8, a leaf table by the low 4 bits; equal
blocks are shared at every level. Lookup is three dependent loads.

Self-check. Before writing anything the script
  1. decodes every code point back out of the trie and compares it with the
     model it was built from, and
  2. checks the UCD parsing against Python's `unicodedata`: general category,
     isupper/islower (the Uppercase/Lowercase properties), isnumeric (Numeric_Type),
     isspace (White_Space, except U+001C..U+001F, which Python counts as space
     because of their bidi class), and simple case mappings wherever Python's
     full mappings are 1:1. Python ships one Unicode version; when it is not the
     version being generated, this check builds a second model from the UCD of
     Python's version with the same code and compares that instead, so the
     parser is always validated against an independent implementation.

Usage:
    gen-unicode-props.py               # download the UCD, check, write files
    gen-unicode-props.py --ucd DIR     # read UCD files for UCD_VERSION from DIR
    gen-unicode-props.py --check       # verify the checked-in files are current
"""

from __future__ import annotations

import argparse
import re
import sys
import unicodedata
import urllib.request
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
OUT = ROOT / "src/stdlib/unicode_data.coil"
TEST_OUT = ROOT / "tests/stdlib/unicode_conformance.coil"
UCD_VERSION = "17.0.0"
FILES = {
    "data": "UnicodeData.txt",
    "derived": "DerivedCoreProperties.txt",
    "proplist": "PropList.txt",
    "folding": "CaseFolding.txt",
    "numeric": "extracted/DerivedNumericType.txt",
    "special": "SpecialCasing.txt",
}

# General categories in UAX #44 order. coil.unicode's GeneralCategory sum and
# its index mapping follow this order; the checksum test verifies they agree.
CATEGORIES = ["Lu", "Ll", "Lt", "Lm", "Lo", "Mn", "Mc", "Me", "Nd", "Nl", "No",
              "Pc", "Pd", "Ps", "Pe", "Pi", "Pf", "Po", "Sm", "Sc", "Sk", "So",
              "Zs", "Zl", "Zp", "Cc", "Cf", "Cs", "Co", "Cn"]
# Property bits above the 5-bit category index.
BITS = [("ALPHABETIC", 32), ("UPPERCASE", 64), ("LOWERCASE", 128),
        ("WHITE-SPACE", 256), ("NUMERIC", 512)]

LEAF_BITS = 4
MID_BITS = 5
TOP_SHIFT = LEAF_BITS + MID_BITS
N = 0x110000
BLOCK = 4096  # code points per checksum block

LINE = re.compile(r"^([0-9A-F]+)(?:\.\.([0-9A-F]+))?\s*;\s*([^\s#;]+)")


def fetch(version: str, name: str, ucd_dir: Path | None) -> str:
    if ucd_dir is not None:
        return (ucd_dir / Path(name).name).read_text(encoding="utf-8")
    url = f"https://www.unicode.org/Public/{version}/ucd/{name}"
    with urllib.request.urlopen(url) as response:
        return response.read().decode("utf-8")


def property_set(text: str, name: str) -> set[int]:
    result: set[int] = set()
    for line in text.splitlines():
        match = LINE.match(line)
        if match and match.group(3) == name:
            lo = int(match.group(1), 16)
            hi = int(match.group(2) or match.group(1), 16)
            result.update(range(lo, hi + 1))
    return result


class Model:
    """Per-code-point values parsed straight from the UCD."""

    def __init__(self, raw: dict[str, str]) -> None:
        self.gc = ["Cn"] * N
        self.upper = list(range(N))
        self.lower = list(range(N))
        self.title = list(range(N))
        self.fold = list(range(N))
        lines = raw["data"].splitlines()
        i = 0
        while i < len(lines):
            fields = lines[i].split(";")
            cp = int(fields[0], 16)
            if fields[1].endswith(", First>"):
                end = int(lines[i + 1].split(";")[0], 16)
                for c in range(cp, end + 1):
                    self.gc[c] = fields[2]
                i += 2
                continue
            self.gc[cp] = fields[2]
            if fields[12]:
                self.upper[cp] = int(fields[12], 16)
            if fields[13]:
                self.lower[cp] = int(fields[13], 16)
            # An empty titlecase field means "same as uppercase".
            self.title[cp] = int(fields[14], 16) if fields[14] else self.upper[cp]
            i += 1
        for line in raw["folding"].splitlines():
            line = line.split("#", 1)[0].strip()
            if not line:
                continue
            code, status, mapping = [part.strip() for part in line.split(";")[:3]]
            if status in ("C", "S"):
                self.fold[int(code, 16)] = int(mapping, 16)
        alphabetic = property_set(raw["derived"], "Alphabetic")
        uppercase = property_set(raw["derived"], "Uppercase")
        lowercase = property_set(raw["derived"], "Lowercase")
        white = property_set(raw["proplist"], "White_Space")
        numeric: set[int] = set()
        for kind in ("Decimal", "Digit", "Numeric"):
            numeric |= property_set(raw["numeric"], kind)
        self.flags = [0] * N
        for name, bit in BITS:
            members = {"ALPHABETIC": alphabetic, "UPPERCASE": uppercase,
                       "LOWERCASE": lowercase, "WHITE-SPACE": white,
                       "NUMERIC": numeric}[name]
            for c in members:
                self.flags[c] |= bit
        # Code points whose full case mapping or folding is not a single code
        # point. Python's string methods use full mappings, so only the others
        # are comparable with simple mappings.
        self.special_lower: set[int] = set()
        self.special_title: set[int] = set()
        self.special_upper: set[int] = set()
        for line in raw["special"].splitlines():
            line = line.split("#", 1)[0].strip()
            if not line:
                continue
            parts = [part.strip() for part in line.split(";")]
            if len(parts) > 4 and parts[4]:
                continue  # conditional mappings; Python ignores them
            cp = int(parts[0], 16)
            for field, target in ((1, self.special_lower), (2, self.special_title),
                                  (3, self.special_upper)):
                if len(parts[field].split()) != 1:
                    target.add(cp)
        self.full_fold: set[int] = set()
        for line in raw["folding"].splitlines():
            line = line.split("#", 1)[0].strip()
            if line and line.split(";")[1].strip() == "F":
                self.full_fold.add(int(line.split(";")[0], 16))

    def props(self, cp: int) -> int:
        return CATEGORIES.index(self.gc[cp]) | self.flags[cp]

    def key(self, cp: int) -> tuple[int, int, int, int, int]:
        return (self.props(cp), self.upper[cp] - cp, self.lower[cp] - cp,
                self.title[cp] - cp, self.fold[cp] - cp)


def load(version: str, ucd_dir: Path | None) -> Model:
    return Model({key: fetch(version, name, ucd_dir) for key, name in FILES.items()})


def check_against_python(model: Model) -> None:
    """Compare a model with Python's unicodedata of the same Unicode version."""
    problems: list[str] = []

    def note(cp: int, what: str, ours: object, python: object) -> None:
        if len(problems) < 20:
            problems.append(f"U+{cp:04X} {what}: ours {ours!r}, Python {python!r}")
        else:
            problems.append("")

    for cp in range(N):
        if 0xD800 <= cp <= 0xDFFF:
            continue
        ch = chr(cp)
        if model.gc[cp] != unicodedata.category(ch):
            note(cp, "category", model.gc[cp], unicodedata.category(ch))
        if bool(model.flags[cp] & 64) != ch.isupper():
            note(cp, "Uppercase", bool(model.flags[cp] & 64), ch.isupper())
        if bool(model.flags[cp] & 128) != ch.islower():
            note(cp, "Lowercase", bool(model.flags[cp] & 128), ch.islower())
        if bool(model.flags[cp] & 512) != ch.isnumeric():
            note(cp, "Numeric", bool(model.flags[cp] & 512), ch.isnumeric())
        if bool(model.flags[cp] & 256) != ch.isspace() and not 0x1C <= cp <= 0x1F:
            note(cp, "White_Space", bool(model.flags[cp] & 256), ch.isspace())
        if (model.gc[cp][0] == "L") != ch.isalpha():
            note(cp, "letter", model.gc[cp][0] == "L", ch.isalpha())
        for name, ours, python, special in (
                ("lower", model.lower[cp], ch.lower(), model.special_lower),
                ("upper", model.upper[cp], ch.upper(), model.special_upper),
                ("fold", model.fold[cp], ch.casefold(), model.full_fold)):
            if cp in special:
                continue
            if len(python) != 1 or ord(python) != ours:
                note(cp, name, chr(ours), python)
        # str.title() on one character applies its titlecase mapping.
        if cp not in model.special_title:
            python = ch.title()
            if len(python) != 1 or ord(python) != model.title[cp]:
                note(cp, "title", chr(model.title[cp]), python)
    if problems:
        shown = [p for p in problems if p]
        raise SystemExit("disagreement with Python unicodedata "
                         f"{unicodedata.unidata_version} ({len(problems)} total):\n  "
                         + "\n  ".join(shown))


def build_trie(model: Model) -> tuple[list, list, list, list]:
    classes: dict[tuple, int] = {}
    cls = [classes.setdefault(model.key(cp), len(classes)) for cp in range(N)]
    if len(classes) > 256:
        raise SystemExit(f"{len(classes)} classes do not fit a u8 leaf table")
    leaf_size = 1 << LEAF_BITS
    leaves: dict[tuple, int] = {}
    leaf_list: list[int] = []
    mid_entries: list[int] = []
    for start in range(0, N, leaf_size):
        block = tuple(cls[start:start + leaf_size])
        if block not in leaves:
            leaves[block] = len(leaves)
            leaf_list.extend(block)
        mid_entries.append(leaves[block])
    mid_size = 1 << MID_BITS
    mids: dict[tuple, int] = {}
    mid_list: list[int] = []
    top: list[int] = []
    for start in range(0, len(mid_entries), mid_size):
        block = tuple(mid_entries[start:start + mid_size])
        if block not in mids:
            mids[block] = len(mids)
            mid_list.extend(block)
        top.append(mids[block])
    if len(leaves) > 65536 or len(mids) > 65536:
        raise SystemExit("trie indices do not fit u16")
    class_rows = sorted(classes.items(), key=lambda item: item[1])
    return top, mid_list, leaf_list, [key for key, _ in class_rows]


def decode(top: list, mid: list, leaf: list, cp: int) -> int:
    m = mid[(top[cp >> TOP_SHIFT] << MID_BITS) + ((cp >> LEAF_BITS) & ((1 << MID_BITS) - 1))]
    return leaf[(m << LEAF_BITS) + (cp & ((1 << LEAF_BITS) - 1))]


def numbers(values: list[int], indent: str) -> str:
    lines: list[str] = []
    line = ""
    for value in values:
        piece = str(value)
        if line and len(line) + 1 + len(piece) > 96:
            lines.append(line)
            line = piece
        else:
            line = piece if not line else line + " " + piece
    lines.append(line)
    return ("\n" + indent).join(lines)


def table(name: str, kind: str, values: list[int], doc: str) -> str:
    n = len(values)
    return (f"; {doc}\n"
            f"(defn {name} [] (-> (ptr {kind}))\n"
            f"  (primitive/cast (ptr {kind})\n"
            f"                  (primitive/alloc-static (array {kind} {n})\n"
            f"                                          (: [{numbers(values, ' ' * 45)}]\n"
            f"                                             (array {kind} {n})))))\n")


def checksums(model: Model) -> list[int]:
    """FNV-1a over each block of code points, in the order the test hashes."""
    sums: list[int] = []
    mask = (1 << 64) - 1
    for start in range(0, N, BLOCK):
        h = 0xCBF29CE484222325
        for cp in range(start, start + BLOCK):
            if 0xD800 <= cp <= 0xDFFF:
                continue
            values = [ord(model.gc[cp][0]), ord(model.gc[cp][1]),
                      model.flags[cp] >> 5,
                      model.upper[cp], model.lower[cp], model.title[cp], model.fold[cp]]
            for value in values:
                h = ((h ^ value) * 0x100000001B3) & mask
        sums.append(h - (1 << 64) if h >= 1 << 63 else h)
    return sums


def render_data(top: list, mid: list, leaf: list, keys: list) -> str:
    props = [key[0] for key in keys]
    deltas = [[key[i] for key in keys] for i in range(1, 5)]
    bits = "\n".join(f"(const {name}-BIT {bit})" for name, bit in BITS)
    abbrev = " ".join(f'{i} "{name}"' for i, name in enumerate(CATEGORIES))
    return f"""(module coil.unicode.data)
(import "coil.primitive" :as primitive)
; GENERATED by scripts/docs/gen-unicode-props.py from Unicode {UCD_VERSION}.
; Do not edit by hand; coil.unicode is the interface. Unicode data license:
; docs/maintenance/UNICODE_LICENSE.md.
;
; Every scalar value maps to a class ({len(keys)} classes). A class's property word
; holds the general-category index (low 5 bits, UAX #44 order, see
; `category-abbrev`) and the property bits below; its four deltas are the simple
; case mappings as `target - code point`. The code point -> class map is a
; three-level trie: top[cp >> {TOP_SHIFT}], then mid[(top << {MID_BITS}) + (cp >> {LEAF_BITS} & {(1 << MID_BITS) - 1})],
; then leaf[(mid << {LEAF_BITS}) + (cp & {(1 << LEAF_BITS) - 1})]. Equal blocks are shared at each level.

(defn unicode-version [] (-> (slice u8))
  "{UCD_VERSION}")

{bits}

(defn category-abbrev [(index i64)] (-> (slice u8))
  (case index {abbrev} "Cn"))

{table("trie-top", "u16", top, f"{len(top)} entries: middle block per {1 << TOP_SHIFT} code points.")}
{table("trie-mid", "u16", mid, f"{len(mid) >> MID_BITS} shared middle blocks of {1 << MID_BITS} leaf-block indices.")}
{table("trie-leaf", "u8", leaf, f"{len(leaf) >> LEAF_BITS} shared leaf blocks of {1 << LEAF_BITS} class indices.")}
{table("class-props-table", "u16", props, "Property word per class.")}
{table("class-upper-table", "i32", deltas[0], "Simple uppercase mapping delta per class.")}
{table("class-lower-table", "i32", deltas[1], "Simple lowercase mapping delta per class.")}
{table("class-title-table", "i32", deltas[2], "Simple titlecase mapping delta per class.")}
{table("class-fold-table", "i32", deltas[3], "Simple case folding delta per class.")}
;;; The class of scalar value CP, which must be at most 0x10FFFF.
(defn class-of [(cp i64)] (-> i64)
  (let [top (cast i64 (load (index (trie-top) (>> cp {TOP_SHIFT}))))
        mid (cast i64 (load (index (trie-mid) (+ (<< top {MID_BITS}) (& (>> cp {LEAF_BITS}) {(1 << MID_BITS) - 1})))))]
    (cast i64 (load (index (trie-leaf) (+ (<< mid {LEAF_BITS}) (& cp {(1 << LEAF_BITS) - 1})))))))

;;; The property word of CLASS.
(defn class-props [(class i64)] (-> i64)
  (cast i64 (load (index (class-props-table) class))))

(defn class-upper-delta [(class i64)] (-> i64)
  (cast i64 (load (index (class-upper-table) class))))

(defn class-lower-delta [(class i64)] (-> i64)
  (cast i64 (load (index (class-lower-table) class))))

(defn class-title-delta [(class i64)] (-> i64)
  (cast i64 (load (index (class-title-table) class))))

(defn class-fold-delta [(class i64)] (-> i64)
  (cast i64 (load (index (class-fold-table) class))))
"""


def render_test(sums: list[int]) -> str:
    """The conformance data module tests/stdlib/text_test.coil checks against."""
    return f"""(module stdlib-tests.unicode-conformance)
(import "coil.primitive" :as primitive)
(import "coil.str" :as string)
(import "coil.unicode" :as unicode)
; GENERATED by scripts/docs/gen-unicode-props.py from Unicode {UCD_VERSION}.
;
; Hashes every scalar value's general category, properties and simple case
; mappings through coil.unicode's public API, {BLOCK} code points per block. The
; test in text_test.coil compares each block with the hash the generator
; computed from the UCD itself (not from the compressed tables).

(const BLOCK-SIZE {BLOCK})

(def EXPECTED
  [{numbers(sums, '   ')}])

(defn expected-block-hashes [] (-> (slice i64)) EXPECTED)

(defn mix [(h i64) (value i64)] (-> i64)
  (primitive/imul (primitive/ixor h value) 1099511628211))

(defn bit [(on bool) (value i64)] (-> i64)
  (if on value 0))

(defn block-hash [(block i64)] (-> i64)
  (let [(mut h) -3750763034362895579]
    (for cp (range (* block {BLOCK}) (* (+ block 1) {BLOCK}))
      (match (string/Rune::new (cast u32 cp))
        (None [] 0)
        (Some [r]
          (let [abbrev (unicode/general-category-abbrev (unicode/general-category r))]
            (set! h (mix h (cast i64 (get abbrev 0))))
            (set! h (mix h (cast i64 (get abbrev 1))))
            (set! h (mix h (+ (bit (unicode/alphabetic? r) 1)
                              (bit (unicode/uppercase? r) 2)
                              (bit (unicode/lowercase? r) 4)
                              (bit (unicode/whitespace? r) 8)
                              (bit (unicode/numeric? r) 16))))
            (set! h (mix h (cast i64 (value (unicode/to-upper r)))))
            (set! h (mix h (cast i64 (value (unicode/to-lower r)))))
            (set! h (mix h (cast i64 (value (unicode/to-title r)))))
            (set! h (mix h (cast i64 (value (unicode/case-fold r)))))
            0))))
    h))
"""


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__,
                                     formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("--ucd", type=Path, help=f"directory holding the {UCD_VERSION} UCD files")
    parser.add_argument("--python-ucd", type=Path,
                        help="directory holding the UCD files of Python's unicodedata version")
    parser.add_argument("--check", action="store_true",
                        help="fail if the checked-in files differ from what would be generated")
    args = parser.parse_args()

    model = load(UCD_VERSION, args.ucd)
    if unicodedata.unidata_version == UCD_VERSION:
        check_against_python(model)
        print(f"self-check: UCD {UCD_VERSION} parsing agrees with Python unicodedata")
    else:
        python_version = unicodedata.unidata_version
        check_against_python(load(python_version, args.python_ucd))
        print(f"self-check: Python unicodedata is {python_version}, not {UCD_VERSION}; the "
              f"same parser run on UCD {python_version} agrees with it")

    top, mid, leaf, keys = build_trie(model)
    for cp in range(N):
        if keys[decode(top, mid, leaf, cp)] != model.key(cp):
            raise SystemExit(f"trie decodes U+{cp:04X} wrongly")
    print(f"self-check: trie decodes all {N} code points "
          f"({len(keys)} classes; top {len(top) * 2} B, mid {len(mid) * 2} B, leaf {len(leaf)} B)")

    data = render_data(top, mid, leaf, keys)
    test = render_test(checksums(model))
    if args.check:
        stale = [path for path, text in ((OUT, data), (TEST_OUT, test))
                 if not path.exists() or path.read_text() != text]
        if stale:
            raise SystemExit("out of date: " + ", ".join(str(p.relative_to(ROOT)) for p in stale))
        print("generated files are current")
        return
    OUT.write_text(data)
    TEST_OUT.write_text(test)
    print(f"wrote {OUT.relative_to(ROOT)} and {TEST_OUT.relative_to(ROOT)}")


if __name__ == "__main__":
    main()

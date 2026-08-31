#!/usr/bin/env python3
"""Find templates that borrow an alias from their CALL site.

Full syntax hygiene resolves a free identifier in a template where the template
was WRITTEN. Before that, an alias-qualified name (`st/foo` inside a quasiquote)
was re-resolved against the caller's alias table -- so a macro could name a
module through a nickname its own file never declared and get away with it,
provided every caller happened to pick the same nickname for the same module.

That is the ONE pattern the new rule can turn from working into broken, and the
repair is a single line: import the module in the file that writes the template.
Everything else the migration changed only widens what resolves (a bare type
name, a trait in a bound, a supertrait), so code that compiled before still
compiles.

    python3 scripts/hygiene-alias-scan.py [DIR ...]      (default: src tests)

KNOWN FALSE POSITIVE, and it is not detectable from syntax: a template built for
`primitive/suggest` becomes TEXT in somebody else's file, so its aliases are
meant to be the reader's, not the writer's. `src/stdlib/lints/modernize.coil`'s
`mz-ambient-replacement` is the in-tree example -- it proposes `(alloc/stack T)`
for the user to adopt and is never resolved in `coil.lint.modernize` at all.
This is a review tool, not a gate, for exactly that reason.
"""
import re, sys, pathlib

def mask(text):
    """blank comments and string bodies, preserving every offset"""
    out=[];in_s=False;esc=False;in_c=False
    for ch in text:
        if ch=='\n': out.append(ch); in_c=False; esc=False; continue
        if in_c: out.append(' '); continue
        if in_s:
            out.append(' ')
            if esc: esc=False
            elif ch=='\\': esc=True
            elif ch=='"': in_s=False
            continue
        if ch==';': out.append(' '); in_c=True; continue
        if ch=='"': out.append(' '); in_s=True; continue
        out.append(ch)
    return ''.join(out)

def qq_regions(m):
    """byte ranges of every quasiquoted form"""
    regions=[]; i=0
    while i < len(m):
        if m[i]=='`':
            j=i+1
            while j<len(m) and m[j] in ' \t\n': j+=1
            if j<len(m) and m[j] in '([':
                depth=0; k=j
                while k<len(m):
                    if m[k] in '([': depth+=1
                    elif m[k] in ')]':
                        depth-=1
                        if depth==0: k+=1; break
                    k+=1
                regions.append((j,k)); i=k; continue
            k=j
            while k<len(m) and m[k] not in ' \t\n()[]': k+=1
            regions.append((j,k)); i=k; continue
        i+=1
    return regions

ALIASQ = re.compile(r'(?<![A-Za-z0-9_.~/-])([A-Za-z][A-Za-z0-9_.-]*)/([A-Za-z][A-Za-z0-9_!?*<>=+-]*)')
# read from the RAW text: masking blanks the module string this keys on
IMPORT = re.compile(r'\(import\s+"([^"]+)"([^)]*)\)')

def main() -> int:
    roots = sys.argv[1:] or ['src', 'tests']
    findings = []
    for root in roots:
        rp = pathlib.Path(root)
        if not rp.exists():
            print(f"no such directory: {root}", file=sys.stderr); return 2
        for f in sorted(rp.rglob('*.coil')):
            if not f.is_file() or '/.coil/' in str(f): continue
            text = f.read_text(errors='replace')
            m = mask(text)
            aliases = set()
            for mm in IMPORT.finditer(text):
                a = re.search(r':as\s+([A-Za-z][A-Za-z0-9_.-]*)', mm.group(2))
                if a: aliases.add(a.group(1))
            for (s, e) in qq_regions(m):
                for sym in ALIASQ.finditer(m, s, e):
                    al = sym.group(1)
                    if al in aliases or '.' in al: continue
                    findings.append((str(f), m[:sym.start()].count('\n')+1, sym.group(0), al))
    print(f"templates naming an alias their own file does not import: {len(findings)}")
    seen = set()
    for path, line, sym, al in findings:
        if (path, al) in seen: continue
        seen.add((path, al))
        print(f"  {path}:{line}  {sym}   -- add the `:as {al}` import, or confirm it is a `suggest` replacement")
    return 0

if __name__ == '__main__':
    raise SystemExit(main())

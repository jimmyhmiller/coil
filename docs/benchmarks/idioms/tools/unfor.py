"""unfor.py FILE LINE... : rewrite the `(for x xs body...)` form starting on each LINE into an
indexed while loop (same order, the collection read once), as call-inline.coil already does."""
import sys,re
path=sys.argv[1]; lines_wanted=sorted({int(x) for x in sys.argv[2:]}, reverse=True)
src=open(path).read()
def skip_ws(s,i):
    while i<len(s):
        if s[i] in ' \t\n\r': i+=1
        elif s[i]==';':
            while i<len(s) and s[i]!='\n': i+=1
        else: break
    return i
def read_form(s,i):
    """return end index (exclusive) of the form starting at i"""
    c=s[i]
    if c in '([{':
        close={'(':')','[':']','{':'}'}[c]; i+=1
        while True:
            i=skip_ws(s,i)
            if s[i]==close: return i+1
            i=read_form(s,i)
    if c=='"':
        i+=1
        while s[i]!='"':
            if s[i]=='\\': i+=1
            i+=1
        return i+1
    if c=='#' and s[i+1]=='\\':
        i+=3
        while i<len(s) and (s[i].isalnum()): i+=1
        return i
    if c in "'`~":
        return read_form(s,i+1)
    while i<len(s) and s[i] not in ' \t\n\r()[]{};"': i+=1
    return i
existing=[int(x) for x in re.findall(r'for-index-(\d+)',src)]
n=max(existing+[100])
starts=[0]
for m in re.finditer('\n',src): starts.append(m.end())
for ln in lines_wanted:
    ls=starts[ln-1]; le=starts[ln] if ln<len(starts) else len(src)
    col=src.find('(for ',ls,le)
    assert col>=0, (path,ln,'no (for')
    end=read_form(src,col)
    i=skip_ws(src,col+4)
    j=read_form(src,i); var=src[i:j]
    assert re.match(r'^[A-Za-z_?!*<>=+-][A-Za-z0-9_?!*<>=+./-]*$',var), (path,ln,'binding is not a plain name: '+var)
    i=skip_ws(src,j); j=read_form(src,i); coll=src[i:j]
    body=src[j:end-1]
    assert body.strip(), (path,ln,'empty body')
    n+=1
    new='(let [items-%d %s (mut for-index-%d) (: 0 i64)] (while (< for-index-%d (len items-%d)) (let [%s (get items-%d for-index-%d)]%s) (set! for-index-%d (+ for-index-%d 1))))'%(n,coll,n,n,n,var,n,n,body,n,n)
    src=src[:col]+new+src[end:]
open(path,'w').write(src)
print(path,'rewrote',len(lines_wanted))

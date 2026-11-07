import re,sys,collections
text=open(sys.argv[1]).read().split('Call graph:',1)[1].split('Total number in stack',1)[0]
stack=[];incl=collections.Counter();total=0
for line in text.splitlines():
    m=re.match(r'^([^0-9]*)(\d+) (.+)$',line)
    if not m: continue
    prefix,count,rest=m.groups();depth=len(prefix);count=int(count)
    f=re.match(r'(.+?)  \(in (.+?)\)',rest)
    name=f.group(1) if f else rest
    while stack and depth<=stack[-1][0]: stack.pop()
    # inclusive: count once per name per stack path (avoid double count recursion)
    if not any(n==name for _,n in stack): incl[name]+=count
    stack.append((depth,name))
    if depth==min(depth,depth) and total==0: total=count
pat=sys.argv[2:] 
for k,v in incl.most_common(400):
    if any(p in k for p in pat): print('%7d %5.1f%% %s'%(v,100*v/total,k[:110]))
print('total',total)

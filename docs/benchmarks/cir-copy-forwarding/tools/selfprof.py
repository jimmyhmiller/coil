import re,sys,collections
def parse(path):
    text=open(path).read().split('Call graph:',1)[1].split('Total number in stack',1)[0]
    stack=[];selfc=collections.Counter();incl=collections.Counter();total=0
    nodes=[]
    for line in text.splitlines():
        m=re.match(r'^([^0-9]*)(\d+) (.+)$',line)
        if not m: continue
        prefix,count,rest=m.groups();depth=len(prefix);count=int(count)
        f=re.match(r'(.+?)  \(in (.+?)\)',rest)
        name=f.group(1) if f else rest
        while stack and depth<=stack[-1][0]: stack.pop()
        if stack: stack[-1][2].append(count)
        node=[depth,name,[] ,count]
        stack.append(node); nodes.append(node)
    for d,name,ch,count in nodes:
        selfc[name]+=count-sum(ch)
    return selfc
s=parse(sys.argv[1]); l=parse(sys.argv[2])
for k in ['__ulock_wait','__psynch_cvwait','__workq_kernreturn','start_wqthread','thread_start']:
    s.pop(k,None); l.pop(k,None)
ts=sum(s.values()); tl=sum(l.values())
print('total self samples stogir',ts,'llvm',tl,'ratio %.3f'%(ts/tl))
keys=sorted(set(s)|set(l),key=lambda k:-(s[k]-l[k]))
print('%-70s %7s %7s %7s'%('function','stogir','llvm','excess'))
for k in keys[:int(sys.argv[3]) if len(sys.argv)>3 else 50]: print('%-70s %7d %7d %+7d'%(k[:70],s[k],l[k],s[k]-l[k]))

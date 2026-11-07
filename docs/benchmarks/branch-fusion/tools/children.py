import re,sys,collections
text=open(sys.argv[1]).read().split('Call graph:',1)[1].split('Total number in stack',1)[0]
target=sys.argv[2]
stack=[];kids=collections.Counter();tot=0
for line in text.splitlines():
    m=re.match(r'^([^0-9]*)(\d+) (.+)$',line)
    if not m: continue
    prefix,count,rest=m.groups();depth=len(prefix);count=int(count)
    f=re.match(r'(.+?)  \(in (.+?)\)',rest); name=f.group(1) if f else rest
    while stack and depth<=stack[-1][0]: stack.pop()
    if stack and stack[-1][1]==target and not any(n==target for _,n in stack[:-1]):
        kids[name]+=count
    if name==target and not any(n==target for _,n in stack): tot+=count
    stack.append((depth,name))
print(target,'total',tot)
for k,v in kids.most_common(15): print('%7d %5.1f%% %s'%(v,100*v/max(tot,1),k[:100]))

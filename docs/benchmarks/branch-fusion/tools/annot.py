import sys,re,collections,subprocess
binary,pcf,sym=sys.argv[1:4]
slide=0;c=collections.Counter()
for line in open(pcf):
    p=line.split()
    if p[0]=='image':
        if p[1].endswith(binary.rsplit('/',1)[1]): slide=int(p[2],16)
        continue
    c[int(p[0],16)-slide]+=1
out=subprocess.run(['llvm-objdump','-d','--no-show-raw-insn',binary,'--disassemble-symbols='+sym],capture_output=True,text=True).stdout
for line in out.splitlines():
    m=re.match(r'\s*([0-9a-f]+):',line)
    if m:
        n=c.get(int(m.group(1),16),0)
        print('%5s %s'%(n if n else '',line.strip()))

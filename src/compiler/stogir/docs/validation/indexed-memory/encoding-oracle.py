import subprocess,re,json
from pathlib import Path
cases=[]
for load in [False,True]:
 for simd,widths in [(False,[1,2,4,8]),(True,[4,8,16])]:
  for width in widths:
   for signed in ([False,True] if load and not simd and width<4 else [False]):
    for rt,rn,rm in [(0,1,2),(17,16,17),(31,31,31),(4,4,4)]:
     for scaled in [False,True]:
      reg=('s' if width==4 else 'd' if width==8 else 'q')+str(rt) if simd else (('x' if width==8 else 'w')+str(rt) if rt!=31 else ('xzr' if width==8 else 'wzr'))
      op=('ldr' if load else 'str')+('sb' if signed and width==1 else 'sh' if signed else 'b' if not simd and width==1 else 'h' if not simd and width==2 else '')
      base='sp' if rn==31 else 'x'+str(rn);index='xzr' if rm==31 else 'x'+str(rm)
      asm=f'{op} {reg}, [{base}, {index}'+(f', lsl #{width.bit_length()-1}' if scaled else '')+']'
      cases.append(dict(load=load,signed=signed,simd=simd,width=width,rt=rt,rn=rn,rm=rm,scaled=scaled,assembly=asm))
p=subprocess.run(['llvm-mc','-triple=aarch64','-show-encoding'],input='\n'.join(x['assembly'] for x in cases),text=True,capture_output=True,check=True)
enc=re.findall(r'encoding: \[([^]]+)\]',p.stdout);assert len(enc)==len(cases)
for c,x in zip(cases,enc):c['word']=int.from_bytes(bytes(int(b.strip(),16) for b in x.split(',')),'little')
lines=[]
for c in cases:
 args=' '.join(str(c[k]).lower() for k in ['load','signed','simd','width','rt','rn','rm','scaled'])
 lines.append(f'    (check (e/register-offset-memory {args}) 0x{c["word"]:08X})')
s=Path('tests/a64-encode.coil').read_text()
for line in lines:assert line in s,line
Path('docs/validation/indexed-memory/encoding-oracle.json').write_text(json.dumps(cases,indent=2)+'\n')
Path('docs/validation/indexed-memory/llvm-mc.txt').write_text(p.stdout)
print(len(cases),'LLVM MC cases')

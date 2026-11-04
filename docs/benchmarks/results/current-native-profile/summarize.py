from pathlib import Path
import re,json
r=Path.cwd();d=r/'build/reuse-native-profile';out=[]
for label in ['early','late']:
 lines=(d/(label+'.txt')).read_text().splitlines();start=next(i for i,l in enumerate(lines) if l.startswith('Sort by top of stack'));stop=next(i for i,l in enumerate(lines[start:],start) if l.startswith('Binary Images:'))
 rows=[]
 for line in lines[start+1:stop]:
  match=re.match(r'\s+(.+?)\s+\(in .+?\)\s+(\d+)\s*$',line)
  if match:rows.append(dict(function=match[1].strip(),leaf_samples=int(match[2])))
 threads=[l.strip() for l in lines[:start] if re.match(r'\s+\d+ Thread_',l)]
 out.append(dict(window=label,threads=threads,leaves=rows))
 (d/(label+'-excerpt.txt')).write_text('\n'.join(lines[:85]+['... intermediate stacks omitted ...']+lines[start:stop])+'\n')
(d/'summary.json').write_text(json.dumps(out,indent=2))
for window in out:
 print(window['window'],window['threads'])
 for row in window['leaves'][:22]:print(row['leaf_samples'],row['function'])

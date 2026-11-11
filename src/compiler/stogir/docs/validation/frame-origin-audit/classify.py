from pathlib import Path
import struct,re,json,hashlib,collections,os
trace=Path('build/frame-origin-audit/result.txt').read_text().splitlines()
text=bytes(int(x) for l in trace if l.startswith('text ') for x in l.split()[1:])
obj=Path(os.environ.get('FRAME_AUDIT_OBJECT','/Users/jimmyhmiller/Documents/Code/projects/coil/.worktrees/stogir-indexed-memory/build/frame-origin-audit/emitter.o'));raw=obj.read_bytes()
_,_,_,_,ncmds,_,_,_=struct.unpack_from('<8I',raw);pos=32;sections=[];symtab=None
for _ in range(ncmds):
 cmd,size=struct.unpack_from('<II',raw,pos)
 if cmd==0x19:
  nsects=struct.unpack_from('<I',raw,pos+64)[0]
  for i in range(nsects):
   p=pos+72+i*80;name=raw[p:p+16].split(b'\0')[0].decode();addr,length,offset=struct.unpack_from('<QQI',raw,p+32)
   sections.append(dict(name=name,addr=addr,length=length,offset=offset))
 if cmd==2:symtab=struct.unpack_from('<4I',raw,pos+8)
 pos+=size
symoff,nsyms,stroff,strsize=symtab;symbols=[]
for i in range(nsyms):
 n,t,sect,desc,val=struct.unpack_from('<IBBHQ',raw,symoff+i*16)
 name=raw[stroff+n:stroff+strsize].split(b'\0')[0].decode()
 if (t&0x0e)==0x0e:symbols.append((name,sect,val))
symbol=next(x for x in symbols if x[0]=='_stogir.verify.structure');section=sections[symbol[1]-1];start=section['offset']+symbol[2]-section['addr']
actual=raw[start:start+len(text)];assert actual==text,(len(text),next((i for i,(a,b) in enumerate(zip(actual,text)) if a!=b),None))
Path('build/frame-origin-audit/replay.bin').write_bytes(text)
slots={};owners={};nodes={};calls=[]
frame_row=next(l.split() for l in trace if l.startswith('frame '));saved_offset=int(frame_row[-1]);saved_size=int(frame_row[-3]).bit_count()*8
for l in trace:
 v=l.split()
 if v[0]=='slot':slots[int(v[1])]=dict(offset=int(v[2]),size=int(v[3]),alignment=int(v[4]))
 if v[0] in ('spill','local'):owners[int(v[2])]=dict(role=v[0],owner=int(v[1]))
 if v[0]=='node':nodes[int(v[1])]=list(map(int,v[2:]))
for i,slot in slots.items():
 slot.update(owners.get(i,dict(role='callee-save' if slot['offset']==saved_offset and slot['size']==saved_size else 'unknown-private',owner=-1)))
 if slot['owner'] in nodes:slot['node']=nodes[slot['owner']]
 if slot['owner']==0:slot['role']='frame-header'
counts=collections.Counter();records=[]
asm=Path('build/frame-origin-audit/structure.asm').read_text()
asm_offset=int(re.search(r'^([0-9a-f]+) <_stogir.verify.structure>:',asm,re.M)[1],16)
for line in asm.splitlines():
 m=re.match(r'\s*([0-9a-f]+):\s+(ldr|str|ldur|stur|ldp|stp)\s+(.*)',line)
 if not m:continue
 base=re.search(r'\[sp(?:, #(-?(?:0x[0-9a-f]+|\d+)))?\]',m[3])
 if not base:continue
 offset=int(base[1],0) if base[1] else 0;parts=m[3].split(',');rt=parts[0].strip();width={'x':8,'w':4,'q':16,'d':8,'s':4,'b':1,'h':2}[rt[0]]
 for j in range(2 if m[2] in ('ldp','stp') else 1):
  address=offset+j*width;slot=next((s for s in slots.values() if s['offset']<=address and address+width<=s['offset']+s['size']),None)
  role=slot['role'] if slot else 'outgoing-or-unknown';owner=slot['owner'] if slot else -1
  counts[role]+=1;records.append(dict(pc=int(m[1],16),op=m[2],offset=address,width=width,role=role,owner=owner,line=line.strip()))
blocks=[];emits=[];stub_sources={};stub_emits=[];tail=None;before_fixups=None
for line in trace:
 v=line.split()
 if v[0]=='block':blocks.append(dict(ref=int(v[1]),depth=int(v[3]),idom=int(v[5]),begin=int(v[7]),end=int(v[9])))
 if v[0]=='emit':emits.append(dict(ref=int(v[1]),position=int(v[2]),offset=int(v[3])))
 if v[0]=='stub-source':stub_sources[int(v[1])]=dict(target=int(v[2]),position=int(v[3]))
 if v[0]=='stub-emit':stub_emits.append(dict(label=int(v[1]),offset=int(v[3])))
 if v[0]=='emit-tail':tail=int(v[1])
 if v[0]=='pre-fixup':before_fixups=int(v[1])
assert before_fixups==len(text),'emission markers require no relax expansion'
by_depth=collections.Counter();by_block=collections.Counter();by_owner_depth=collections.Counter()
for record in records:
 pc=record['pc']-asm_offset;position=None;phase='prologue'
 if tail is not None and pc>=tail:
  phase='edge-stub';stub=next((x for x in reversed(stub_emits) if x['offset']<=pc),None)
  if stub:position=stub_sources[stub['label']]['position']
 else:
  marker=next((x for x in reversed(emits) if x['offset']<=pc),None)
  if marker:position=marker['position'];phase='node'
 block=next((b for b in blocks if position is not None and b['begin']<=position<b['end']),None)
 record.update(relative_pc=pc,phase=phase,position=position,block=block['ref'] if block else None,depth=block['depth'] if block else None)
 if record['role']=='spill':
  by_depth[str(record['depth'])]+=1;by_block[str(record['block'])]+=1
  by_owner_depth[(record['owner'],record['depth'])]+=1
result=dict(blocks=blocks,spill_by_depth=dict(by_depth),spill_by_block=dict(by_block),spill_by_owner_depth=[dict(owner=k[0],depth=k[1],count=v) for k,v in sorted(by_owner_depth.items(),key=lambda x:x[1],reverse=True)],identity=dict(object=str(obj),object_sha256=hashlib.sha256(raw).hexdigest(),function='_stogir.verify.structure',function_offset=symbol[2],text_bytes=len(text),text_sha256=hashlib.sha256(text).hexdigest(),replay_matches_object=True),qualification='Exact code-byte replay of current candidate captured graph. Direct SP instruction accesses mapped to allocator-owned frame slots; paired transfers count two registers. Static counts only, no dynamic frequency inference. Indirect frame access is outside this count.',slots=slots,counts=dict(counts),records=records)
Path('build/frame-origin-audit/classification.json').write_text(json.dumps(result,indent=2)+'\n')
print(result['identity']);print(result['counts']);print('spill_by_depth',dict(by_depth));print('by_owner_depth',result['spill_by_owner_depth'][:15])

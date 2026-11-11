
/tmp/coil-stogir-forward-predicate.o:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000000000000 <_sccp_forward_predicate>:
       0:      	cmp	x0, #0x0
       4:      	b.eq	0x1c <_sccp_forward_predicate+0x1c>
       8:      	ldr	x0, [x1]
       c:      	add	x0, x0, #0x1
      10:      	str	x0, [x1]
      14:      	mov	x0, #0x25               ; =37
      18:      	ret
      1c:      	mov	x0, #0x309              ; =777
      20:      	ret

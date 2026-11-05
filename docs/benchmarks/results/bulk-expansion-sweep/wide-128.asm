
/Users/jimmyhmiller/Documents/Code/projects/coil/.worktrees/stogir-bulk-expansion/build/bulk-expansion/wide-128.o:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000000000000 <_gap_wide_aggregate_get>:
       0:      	ldr	x1, [x0]
       4:      	mov	x17, #0x3               ; =3
       8:      	mul	x1, x1, x17
       c:      	ldr	x0, [x0, #0x58]
      10:      	add	x0, x0, x1
      14:      	ret

0000000000000018 <_gaps.wide-aggregate-get.project>:
      18:      	ldr	x1, [x0]
      1c:      	mov	x17, #0x3               ; =3
      20:      	mul	x1, x1, x17
      24:      	ldr	x0, [x0, #0x58]
      28:      	add	x0, x0, x1
      2c:      	ret

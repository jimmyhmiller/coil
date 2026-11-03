
/tmp/gap-aggregate-branch-llvm:	file format mach-o arm64

Disassembly of section __TEXT,__text:

00000001000002d8 <_gap_aggregate_branch>:
1000002d8:     	add	x8, x1, x1, lsl #1
1000002dc:     	add	x9, x0, #0x7
1000002e0:     	cmp	w2, #0x0
1000002e4:     	csel	x9, x9, x0, ne
1000002e8:     	csel	x8, x1, x8, ne
1000002ec:     	add	x0, x9, x8
1000002f0:     	ret

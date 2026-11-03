
/Users/jimmyhmiller/Documents/Code/projects/coil-stogir/build/compiler-small-gaps/scalar-wrapper-before:	file format mach-o arm64

Disassembly of section __TEXT,__text:

00000001000005c0 <_gap_scalar_wrapper>:
1000005c0:     	sub	sp, sp, #0x20
1000005c4:     	str	x29, [sp]
1000005c8:     	str	x30, [sp, #0x8]
1000005cc:     	mov	x29, sp
1000005d0:     	mov	x1, x0
1000005d4:     	movn	x0, #0x0, lsl #48
1000005d8:     	b	0x1000005f4 <_gap_scalar_wrapper+0x34>
1000005dc:     	nop
1000005e0:     	str	x0, [sp, #0x10]
1000005e4:     	mov	x0, x1
1000005e8:     	bl	0x1000007e8 <_gaps.scalar-wrapper.affine>
1000005ec:     	mov	x1, x0
1000005f0:     	ldr	x0, [sp, #0x10]
1000005f4:     	add	x0, x0, #0x1
1000005f8:     	mov	x17, #0x64              ; =100
1000005fc:     	cmp	x0, x17
100000600:     	b.lt	0x1000005e0 <_gap_scalar_wrapper+0x20>
100000604:     	mov	x0, x1
100000608:     	ldr	x29, [sp]
10000060c:     	ldr	x30, [sp, #0x8]
100000610:     	add	sp, sp, #0x20
100000614:     	ret

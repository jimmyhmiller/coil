
/Users/jimmyhmiller/Documents/Code/projects/coil/.worktrees/stogir-iterator-results/build/inline-switch-bench/selector/current-stogir.o:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000000000000 <_gap_inline_switch_selector>:
       0:      	ldr	x0, [x0]
       4:      	lsr	w0, w0, #0
       8:      	lsr	x16, x0, #0
       c:      	cmp	x16, #0x9
      10:      	b.hi	0x74 <_gap_inline_switch_selector+0x74>
      14:      	adr	x17, 0x24 <_gap_inline_switch_selector+0x24>
      18:      	ldrsw	x16, [x17, x16, lsl #2]
      1c:      	add	x16, x17, x16
      20:      	br	x16
      24:      	udf	#0x28
      28:      	udf	#0x2c
      2c:      	udf	#0x30
      30:      	udf	#0x34
      34:      	udf	#0x38
      38:      	udf	#0x3c
      3c:      	udf	#0x40
      40:      	udf	#0x44
      44:      	udf	#0x48
      48:      	udf	#0x4c
      4c:      	b	0x78 <_gap_inline_switch_selector+0x78>
      50:      	b	0x80 <_gap_inline_switch_selector+0x80>
      54:      	b	0x88 <_gap_inline_switch_selector+0x88>
      58:      	b	0x90 <_gap_inline_switch_selector+0x90>
      5c:      	b	0x98 <_gap_inline_switch_selector+0x98>
      60:      	b	0xa0 <_gap_inline_switch_selector+0xa0>
      64:      	b	0xa8 <_gap_inline_switch_selector+0xa8>
      68:      	b	0xb0 <_gap_inline_switch_selector+0xb0>
      6c:      	b	0xb8 <_gap_inline_switch_selector+0xb8>
      70:      	b	0xc0 <_gap_inline_switch_selector+0xc0>
      74:      	b	0xc8 <_gap_inline_switch_selector+0xc8>
      78:      	movz	x0, #0x0, lsl #48
      7c:      	b	0xc4 <_gap_inline_switch_selector+0xc4>
      80:      	mov	x0, #0x1                ; =1
      84:      	b	0xc4 <_gap_inline_switch_selector+0xc4>
      88:      	mov	x0, #0x2                ; =2
      8c:      	b	0xc4 <_gap_inline_switch_selector+0xc4>
      90:      	mov	x0, #0x3                ; =3
      94:      	b	0xc4 <_gap_inline_switch_selector+0xc4>
      98:      	mov	x0, #0x4                ; =4
      9c:      	b	0xc4 <_gap_inline_switch_selector+0xc4>
      a0:      	mov	x0, #0x5                ; =5
      a4:      	b	0xc4 <_gap_inline_switch_selector+0xc4>
      a8:      	mov	x0, #0x6                ; =6
      ac:      	b	0xc4 <_gap_inline_switch_selector+0xc4>
      b0:      	mov	x0, #0x7                ; =7
      b4:      	b	0xc4 <_gap_inline_switch_selector+0xc4>
      b8:      	mov	x0, #0x8                ; =8
      bc:      	b	0xc4 <_gap_inline_switch_selector+0xc4>
      c0:      	mov	x0, #0x6                ; =6
      c4:      	ret
      c8:      	brk	#0
      cc:      	b	0xc8 <_gap_inline_switch_selector+0xc8>

00000000000000d0 <_gap_inline_switch_size>:
      d0:      	mov	x0, #0x68               ; =104
      d4:      	ret

00000000000000d8 <_gaps.inline-switch-selector.tag>:
      d8:      	ldr	x0, [x0]
      dc:      	lsr	w0, w0, #0
      e0:      	lsr	x16, x0, #0
      e4:      	cmp	x16, #0x9
      e8:      	b.hi	0x14c <_gaps.inline-switch-selector.tag+0x74>
      ec:      	adr	x17, 0xfc <_gaps.inline-switch-selector.tag+0x24>
      f0:      	ldrsw	x16, [x17, x16, lsl #2]
      f4:      	add	x16, x17, x16
      f8:      	br	x16
      fc:      	udf	#0x28
     100:      	udf	#0x2c
     104:      	udf	#0x30
     108:      	udf	#0x34
     10c:      	udf	#0x38
     110:      	udf	#0x3c
     114:      	udf	#0x40
     118:      	udf	#0x44
     11c:      	udf	#0x48
     120:      	udf	#0x4c
     124:      	b	0x150 <_gaps.inline-switch-selector.tag+0x78>
     128:      	b	0x158 <_gaps.inline-switch-selector.tag+0x80>
     12c:      	b	0x160 <_gaps.inline-switch-selector.tag+0x88>
     130:      	b	0x168 <_gaps.inline-switch-selector.tag+0x90>
     134:      	b	0x170 <_gaps.inline-switch-selector.tag+0x98>
     138:      	b	0x178 <_gaps.inline-switch-selector.tag+0xa0>
     13c:      	b	0x180 <_gaps.inline-switch-selector.tag+0xa8>
     140:      	b	0x188 <_gaps.inline-switch-selector.tag+0xb0>
     144:      	b	0x190 <_gaps.inline-switch-selector.tag+0xb8>
     148:      	b	0x198 <_gaps.inline-switch-selector.tag+0xc0>
     14c:      	b	0x1a0 <_gaps.inline-switch-selector.tag+0xc8>
     150:      	movz	x0, #0x0, lsl #48
     154:      	b	0x19c <_gaps.inline-switch-selector.tag+0xc4>
     158:      	mov	x0, #0x1                ; =1
     15c:      	b	0x19c <_gaps.inline-switch-selector.tag+0xc4>
     160:      	mov	x0, #0x2                ; =2
     164:      	b	0x19c <_gaps.inline-switch-selector.tag+0xc4>
     168:      	mov	x0, #0x3                ; =3
     16c:      	b	0x19c <_gaps.inline-switch-selector.tag+0xc4>
     170:      	mov	x0, #0x4                ; =4
     174:      	b	0x19c <_gaps.inline-switch-selector.tag+0xc4>
     178:      	mov	x0, #0x5                ; =5
     17c:      	b	0x19c <_gaps.inline-switch-selector.tag+0xc4>
     180:      	mov	x0, #0x6                ; =6
     184:      	b	0x19c <_gaps.inline-switch-selector.tag+0xc4>
     188:      	mov	x0, #0x7                ; =7
     18c:      	b	0x19c <_gaps.inline-switch-selector.tag+0xc4>
     190:      	mov	x0, #0x8                ; =8
     194:      	b	0x19c <_gaps.inline-switch-selector.tag+0xc4>
     198:      	mov	x0, #0x6                ; =6
     19c:      	ret
     1a0:      	brk	#0
     1a4:      	b	0x1a0 <_gaps.inline-switch-selector.tag+0xc8>


/Users/jimmyhmiller/Documents/Code/projects/coil/.worktrees/stogir-iterator-results/build/zext-power-bench/power/tpde.o:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000000000000 <_gap_zext_quotient>:
       0:      	ubfx	x0, x0, #0, #32
       4:      	mov	w1, #0x4                ; =4
       8:      	sdiv	x0, x0, x1
       c:      	ret

0000000000000010 <_gap_zext_remainder>:
      10:      	ubfx	x0, x0, #0, #32
      14:      	mov	w1, #0x4                ; =4
      18:      	sdiv	x2, x0, x1
      1c:      	msub	x3, x2, x1, x0
      20:      	mov	x0, x3
      24:      	ret


/Users/jimmyhmiller/Documents/Code/projects/coil/.worktrees/stogir-iterator-results/build/zext-power-bench/power/current-stogir.o:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000000000000 <_gap_zext_quotient>:
       0:      	ubfx	x0, x0, #0, #32
       4:      	lsr	x0, x0, #2
       8:      	ret

000000000000000c <_gap_zext_remainder>:
       c:      	ubfx	x0, x0, #0, #32
      10:      	and	x0, x0, #0x3
      14:      	ret

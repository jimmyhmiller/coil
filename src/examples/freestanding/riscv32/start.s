// Minimal crt0 for qemu-system-riscv32 -M virt. No libc, OS, or firmware SBI.
.section .text.boot, "ax"
.globl _start
_start:
    la sp, _stack_top
    la gp, __global_pointer$
    la t0, __bss_start
    la t1, __bss_end
1:
    bgeu t0, t1, 2f
    sw zero, 0(t0)
    addi t0, t0, 4
    j 1b

2:
    li a0, 6
    call esp32c3_smoke.answer
    li t0, 42
    bne a0, t0, 4f

    la t0, success
  li t1, 17
3:
    lbu a0, 0(t0)
    li t2, 0x10000000
    sb a0, 0(t2)
    addi t0, t0, 1
    addi t1, t1, -1
    bnez t1, 3b

    // SiFive test device: 0x5555 means pass and makes QEMU exit successfully.
    li t0, 0x100000
    li t1, 0x5555
    sw t1, 0(t0)
5:
    wfi
    j 5b

4:
    la t0, failure
  li t1, 19
6:
    lbu a0, 0(t0)
    li t2, 0x10000000
    sb a0, 0(t2)
    addi t0, t0, 1
    addi t1, t1, -1
    bnez t1, 6b
    li t0, 0x100000
    li t1, 0x3333
    sw t1, 0(t0)
    j 5b

.section .rodata
success: .ascii "coil rv32imc: ok\n"
failure: .ascii "coil rv32imc: fail\n"

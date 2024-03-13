.global _start

.equ    STDOUT_FILENO, 1
.equ    SYS_READ, 63
.equ    SYS_WRITE, 64
.equ    SYS_OPEN, 1024
.equ    SYS_CLOSE, 57
.equ    O_RDONLY, 0
.equ    O_WRONLY, 1
.equ    O_CREAT, 64

.equ    BUFFER_SIZE, 32
.equ    NUM_BYTES, 4

.data
filename:   .asciz "numeros_binarios.txt"
buffer:
    .byte 0,0,0,0,0,0,0,0,0,0,
    .byte 0,0,0,0,0,0,0,0,0,0,
    .byte 0,0,0,0,0,0,0,0,0,0,
    .byte 0,0,0,0,0,0,0,0,0,0
numeros:
    .byte 0,0,0,0,0,0,0,0,0,0,
    .byte 0,0,0,0,0,0,0,0,0,0,
    .byte 0,0,0,0,0,0,0,0,0,0,
    .byte 0,0,0,0,0,0,0,0,0,0

.text
_start:
    la      a0, filename
    li      a1, O_RDONLY
    li      a2, 0
    li      a3, 0
    li      a7, SYS_OPEN
    ecall

    mv      s0, a0

read_loop:
    li      a0, 0
    la      a1, buffer
    li      a2, BUFFER_SIZE
    li      a7, SYS_READ
    ecall

    beqz    a0, close_file

    la      t0, buffer
    la      t1, numeros
    li      t2, 0

convert_loop:
    beq     t2, a0, read_loop

    lb      a0, 0(t0)
    addi    t0, t0, 1
    sb      a0, 0(t1)
    addi    t1, t1, 1
    addi    t2, t2, 1
    j       convert_loop

close_file:
    mv      a0, s0
    li      a7, SYS_CLOSE
    ecall

    li      a0, 0
    li      a7, 93
    ecall

.section .text
.global _start

_start:
    mov r0, sp
    mov r1, #0x1
    mov r2, #0

_cargaZ:
    str r1, [r0]

_cicloZ:
    add  r1, r1, #0x1
    add  r0, r0, #0x4
    cmp  r1, #101
    bne  _cargaZ

_inicial:
    mov r0, sp @x[i]
    mov r2, sp
    add r2,r2,#0x18c @x[i-1]
    mov r3, #0x1 @i del ciclo
    mov r6,sp
    add r6, r6,#0x18c @puntero final

_buffer:

    ldr r1 ,[r0]
    ldr r4 ,[r2]
    add r1,r4,r1 @x[i]+x[i-1]
    str r1, [r0]
    add r3,r3,#0x1

_cicloB:


    cmp  r3, #101
    mov r2,r0
    add  r0, r0, #0x4
    bne  _buffer

_fin:
    mov r7, #1
    mov r0, #0
    svc 0

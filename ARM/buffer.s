.section .text
.global _start

_start:


    mov r0, sp
    mov r1, #0
    str r2, [r0]

    mov r3, #0
    mov r4, #0xa

_buffer:
   


_ciclo:
  add  r3, r3, #0x1
  add  r0, r0, #0x4
  str  r1, [r0]
  cmp  r1, r4
  bne  _buffer
  b  _fin

_fin:
nop

.arch armv7-a
.fpu vfpv3
.eabi_attribute 67, "2.09"
.eabi_attribute 6, 10

.section .data
    EjemploFloat: .float 4.566
    constante: .float 75.0
    name_input: .asciz "datos.txt"
    name_output: .asciz "salida.txt"

    .align 1
    buffer: .space 21    @esto depende del archivo que van a leer, depende de su algoritmo tambien

.section .text
.globl _start

_start:
        @ Abrir el archivo de entrada
    mov r7, #0x5
    ldr r0, =name_input
    mov r1, #2
    mov r2, #0
    swi 0

        @ Leer desde el archivo de entrada al buffer 
    mov r7, #0x3
    ldr r1, =buffer
    ldr r2, =#21         @ tamaño del buffer
    swi 0

        @ Abrir el archivo de salida
    mov r7, #0x5
    ldr r0, =name_output
    mov r1, #66
    mov r2, #438
    swi 0

        @ Escribir desde el buffer de entrada al archivo de salida
    mov r7, #0x4      @ Código de llamada al sistema para escribir
    ldr r1, =buffer   @ Dirección del buffer
    ldr r2, =21    @ Tamaño máximo a escribir
    swi 0

        @ Cerrar el archivo de entrada
    mov r7, #6
    swi 0

        @ Cerrar el archivo de salida
    mov r7, #6
    swi 0

        @ Terminar la ejecución del programa
    mov r7, #0x1
    mov r0, #0
    swi 0

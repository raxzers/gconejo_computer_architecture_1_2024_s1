.arch armv7-a
.fpu vfpv3
.eabi_attribute 67, "2.09"
.eabi_attribute 6, 10

.section .data
    EjemploFloat: .float 4.566    @ Variable de ejemplo de tipo float
    constante: .float 75.0         @ Otra variable de tipo float
    name_input: .asciz "datos.bin" @ Nombre del archivo de entrada
    name_output: .asciz "salida.bin" @ Nombre del archivo de salida en formato .bin

    .align 1
    buffer: .space 20    @ Buffer para almacenar datos del archivo

.section .text
.globl _start

_start:
    @ Abrir el archivo de entrada en modo binario
    mov r7, #0x5            @ Código de llamada al sistema para abrir archivo
    ldr r0, =name_input     @ Carga la dirección de name_input en r0 (nombre del archivo)
    mov r1, #2              @ Modo de apertura: 2 para lectura
    mov r2, #0x80000        @ Modo de apertura binario (O_BINARY)
    swi 0                   @ Llamada al sistema para abrir el archivo

    @ Leer desde el archivo de entrada al buffer 
    mov r7, #0x3            @ Código de llamada al sistema para leer
    ldr r1, =buffer         @ Dirección del buffer donde se almacenará lo leído
    ldr r2, =#20            @ Tamaño del buffer (20 bytes)
    swi 0                   @ Llamada al sistema para leer desde el archivo de entrada

_lectura:
    @ Guardar el primer byte del buffer en r3 (asumiendo que son números binarios)
    ldr r3, =buffer         @ Carga la dirección del buffer en r3
    ldrb r3, [r3]           @ Carga el primer byte del buffer en r3 (sólo el primer byte, no la palabra completa)
    mov r12, #5

    @ Abrir el archivo de salida en modo binario
    mov r7, #0x5            @ Código de llamada al sistema para abrir archivo
    ldr r0, =name_output    @ Carga la dirección de name_output en r0 (nombre del archivo)
    mov r1, #66             @ Modo de apertura: 66 para escritura
    mov r2, #0x80000        @ Modo de apertura binario (O_BINARY)
    swi 0                   @ Llamada al sistema para abrir el archivo de salida

    @ Escribir desde el buffer de entrada al archivo de salida
    mov r7, #0x4            @ Código de llamada al sistema para escribir
    ldr r1, =buffer         @ Dirección del buffer que contiene los datos a escribir
    ldr r2, =20             @ Tamaño a escribir (20 bytes)
    swi 0                   @ Llamada al sistema para escribir en el archivo de salida

    @ Cerrar el archivo de entrada
    mov r7, #6              @ Código de llamada al sistema para cerrar archivo
    swi 0                   @ Llamada al sistema para cerrar el archivo de entrada

    @ Cerrar el archivo de salida
    mov r7, #6              @ Código de llamada al sistema para cerrar archivo
    swi 0                   @ Llamada al sistema para cerrar el archivo de salida

    @ Terminar la ejecución del programa
    mov r7, #0x1            @ Código de llamada al sistema para terminar programa
    mov r0, #0              @ Código de salida (éxito)
    swi 0                   @ Llamada al sistema para finalizar


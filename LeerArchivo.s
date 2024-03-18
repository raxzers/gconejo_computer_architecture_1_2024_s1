.arch armv7-a
.fpu vfpv3
.eabi_attribute 67, "2.09" @ EABI version 2.09
.eabi_attribute 6, 10 @ Hard float ABI

.section .data
	EjemploFLoat: .float 4.566
	constante: .float 75.0
	name_input:	.asciz "Muestras"
	
	.align 1
	buffer_input: 	.space 1000

.section .text
.globl _start

_start:
	@Primero se debe de abrir el archivo
	mov r7, #0x5		@ codigo de la llamada al sistema para abrir
	ldr r0, #name_input	@ nombre del archivo
	mov r1, #2		@ configuracion para abrir
	mov r2, #0		@ configuracion para abrir
	swi 0			@ llamada al sistema
	
	@ leer archivo
	mov r7, #0x3 		@ codigo para llamar a read
	ldr r1, =buffer_input	@ Se carga el buffer
	ldr r2, =#30000		@ cantidad de bytes para leer
	swi 0 			@ llamada al sistema para leer
	
	@ Se cierra el archivo
	mov r7, #6
	swi 0 @sys call	

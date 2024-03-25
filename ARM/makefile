.DEFAULT_GOAL := main

main:

	$(info -----------------------------)
	$(info file buffer)
	$(info target remote localhost:1233)
	$(info ------------comandos ver memoria-----------)
	$(info x/10dw valor del sp)

	arm-none-eabi-as buffer.s -g -mcpu=cortex-a9 -mfpu=neon -o buffer.o
	arm-none-eabi-ld buffer.o -o buffer

	arm-none-eabi-gdb
arm:
	qemu-arm -singlestep -g 1233 buffer

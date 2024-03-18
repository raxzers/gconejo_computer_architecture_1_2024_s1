
all:
	$(info file buffer)
	$(info target remote localhost:1233)
	$(info qemu-arm -singlestep -g 1233 buffer)
	$(info -----------------------------)

	arm-none-eabi-as buffer.s -g -o buffer.o
	arm-none-eabi-ld buffer.o -o buffer

	arm-none-eabi-gdb

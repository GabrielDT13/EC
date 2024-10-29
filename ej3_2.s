			.data
datosb:		.byte 0x10, 0x80, 0x75
datosw:		.align 2
			.space 12

			.text
			.globl main
main:
		la $t0, datosb
		la $t1, datosw
		
		lbu $t2, 0($t0)
		sw $t2, 0($t1)
		
		lbu $t2, 1($t0)
		sw $t2, 4($t1)
		
		lbu $t2, 2($t0)
		sw $t2, 8($t1)
		
		jr $ra
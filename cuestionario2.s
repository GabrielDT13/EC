
.text
.globl main

main:
	lw $t4, pepe
	lw $t5, 0($t4)
	lb $t6, 1($t4)
	lbu $t7, 1($t4)
	lh $t8, 2($t4)
	lhu $t9, 2($t4)
	
	addi $t4, $t4, 4
	
	sw $t5, 0($t4)
	sb $t5, 4($t4)
	sh $t5, 5($t4)
	
	li $v0, 10
    syscall
	
	.data
pepe: .word 0xabcdef00
juan: .skip 4
luis: .skip 1
jose: .skip 2	
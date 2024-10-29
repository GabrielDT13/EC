	.text
	.globl main
main:
	lw $16,0x50($0) # $16 = 4
	lw $17,0x50($16)# $17 = 8
	add $8,$17,$17 # $8 = 16
	addi $9,$8, 18# $9 = 17 = -1+18=17
	addi $9,$9, 15 # $9 = 32 (0x20) = 17 + 15
	
fin: add $0,$0,$0
	j fin

	.data 0x50
c1: .word 4 # 0x40: 4
c2: .word 8 # 0x44: 8
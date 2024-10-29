	.text
	.globl main
main:
	lw $4, 0x40 # $4: valor 4
	lw $6, 0x44 # $6: puntero a vector v[]
	add $5, $0, $0 # $5: suma

loop: lw $7,0($6) # lee elemento de v[]
	beq $7, $0, fin
	add $5, $5, $7 # sumar
	add $6, $6, $4 # actualiza puntero
	j loop

fin: add $6, $6,$4 # actualiza puntero
	sw $5,0($s6) # almacena resultado

wait: add $0, $0, $0 # bucle final
	j wait

	.data 0x40
k4: .word 4 # 0x40: 4
p: 	.word 0x50 # 0x44: 0x50

	.data 0x50
v0: .word 0x5a6b7c00 # 0x50: 5a6b7c00
v1: .word 12 # 0x54: 0c
v2: .word 3 # 0x58: 3
v3: .word 0 # 0x5c: 0
suma: .space 4 # 0x60: resultado suma
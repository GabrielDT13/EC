			.data
cadena1:	.asciiz "Hola, te llamas "
cadena2:	.asciiz " y tienes "
cadena3:	.asciiz " años."

cadena4:	.asciiz "Tu nombre: "
cadena5:	.asciiz "Tu edad: "

nombre:		.space 20
edad: 		.word 0

			.text
			.globl main
			
main:		
			la $a0, cadena4
			li $v0, 4
			syscall
			
			li $v0, 8
			syscall
			la $t0, nombre
			sw $v0, 0($t0) 
			
			la $a0, cadena5
			li $v0, 4
			syscall
			
			li $v0, 5
			syscall
			la $t0, edad
			sw $v0, 0($t0)
			
			la $a0, cadena1
			li $v0, 4
			syscall
			
			la $a0, nombre
			li $v0, 4
			syscall
			
			la $a0, cadena2
			li $v0, 4
			syscall
			
			la $a0, edad
			li $v0, 1
			syscall
			
			la $a0, cadena3
			li $v0, 4
			syscall
			
			jr $ra
			
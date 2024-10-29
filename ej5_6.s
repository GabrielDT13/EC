#
# Ejercicio 5.6 del manual de prácticas
# Evaluación de la expresión cuadrática A·X^2 + B·X + C
#			
			.data
c1: .asciiz "\nPrograma que realiza la evaluación de la expresión cuadrática A·X^2 + B·X + C"
c2: .asciiz "\nIntroducir el valor de A : "
c3: .asciiz "\nIntroducir el valor de B : "
c4: .asciiz "\nIntroducir el valor de C : "
c5:	.asciiz	"\nIntroducir valor de X: "
c6:	.asciiz "\nValor de A·X^2 + B·X + C = "

# definir el resto de los datos que necesites
A:			.word 0
B:			.word 0
C:			.word 0
X:			.space 0

	.text   
	.globl main 
main:	# añade aquí las instrucciones de tu programa
    
	#mostramos la cadena 1
	la $a0, c1	
	li $v0, 4	
	syscall
	
	#mostramos la cadena 2
	la $a0, c2
	li $v0, 4	
	syscall
	
	#recogemos el valor de A
	li $v0, 5
	syscall
	la $t0, A
    sw $v0, 0($t0)   #lo guardamos en a
	
	#mostramos la cadena 3
	la $a0, c3
	li $v0, 4	
	syscall
	
	#recogemos el valor de B
	li $v0, 5
	syscall
	la $t0, B
    sw $v0, 0($t0)   #lo guardamos en b
	
	#mostramos la cadena 4
	la $a0, c4
	li $v0, 4	
	syscall
	
	#recogemos el valor de C
	li $v0, 5
	syscall
	la $t0, C
    sw $v0, 0($t0)   #lo guardamos en c
	
	#mostramos la cadena 5
	la $a0, c5
	li $v0, 4	
	syscall
	
	#recogemos el valor de X
	li $v0, 5
	syscall
	la $t0, X
    sw $v0, 0($t0)   #lo guardamos en x
	
	la $t0, X
	la $t1, A
	
	lw $t0, 0($t0)
	lw $t1, 0($t1)
	mul $t2, $t0, $t0 # X*X
	mul $t2, $t2, $t1 # A*X*X
	
	la $t1, B
	lw $t1, 0($t0)
	mul $t3, $t1, $t0 # B*X
	
	add $t4, $t2, $t3 # A*X*X + B*X
	la $t5, C
	lw $t5, 0($t5)
	add $s6, $t5, $t4 # A*X*X + B*X + C
	
	la $a0, c6
	li $v0, 4	
	syscall
		
	add $a0, $s6, $zero
    li $v0, 1     #imprimir entero
    syscall

    li $v0, 10    #fin de programa
    syscall
    
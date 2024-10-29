#
# Ejercicio 6.7 del libro de prácticas
# Contar el número de elementos que están entre 4 (linf) y 8 (lsup) (ambos incluidos)
#
		.data
c1:		.asciiz "\nEn el vector existen "
c2:		.asciiz " elementos entre "	
c3:		.asciiz " y "

# Define a partir de aquí los datos (tamaño de 32 bits) que necesites:
# El vector que tendrá los elementos V[]={6,-7,8,3,5,0,5,2,4,1}
# Límite inferior (linf): 4
# Límite superior (lsup): 8
# Variable (count) para almacenar el número de elementos que cumplen la condición

v:		.word 6, -7, 8, 3, 5, 0, 5, 2, 4, 1
linf:	.word 4
lsup:	.word 8
result: 	.space 32
	
		.text
		.globl main
main:	#Escribe a partir de aquí tus instrucciones
		li $t9, 0	#i 
		li $s3, 0	#contador
		li $s0, 10		#nº de elementos
		
		#limite inferior
		la $t0, linf
		lw $s1, 0($t0)

		#limite superior
		la $t0, lsup
		lw $s2, 0($t0)
		
		la $s4, v

bucle:
		beq $s0, $t9, fin
		
		lw $t1, 0($s4)
		
		blt $t1, $s1, si  #hacemos el or 
		bgt $t1, $s2, si
		
		addi $t9, $t9, 1 #incrementamos la i
		addi $s4, $s4, 4	#incrementamos posicion de memoria
		
		j bucle
		
si:
		addi $s3, $s3, 1  #suma del contador
		addi $t9, $t9, 1 #incrementamos la i
		addi $s4, $s4, 4	#incrementamos posicion de memoria
		j bucle


fin:
		la $a0, c1   #imprimo la cadena 1
		li $v0, 4
		syscall
		
		move $a0, $s3 #imprimimos s3 (contador)
		li $v0, 1
		syscall
		
		la $a0, c2   #imprimo la cadena 2
		li $v0, 4
		syscall
		
		move $a0, $s1 #imprimimos s1 (lim inferior)
		li $v0, 1
		syscall
		
		la $a0, c3   #imprimo la cadena 3
		li $v0, 4
		syscall
		
		move $a0, $s2 #imprimimos s2 (lim superior)
		li $v0, 1
		syscall
		
		la $t2, result
		sw $s3, 0($t2)

		# exit
		li $v0, 10
		syscall
		
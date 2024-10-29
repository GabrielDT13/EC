		.data
		# no modifique las definiciones de datos de este segmento
		#
vector:	.space	10      # 10 elementos de 1 byte
		.align 2
result:	.space 4        # Suma (tipo word) de los elementos que cumplen las condiciones
str1:	.asciiz	"\nIntroducir elemento("
str2:	.asciiz ") del vector[]: "
str3: 	.asciiz "\nSuma: "


		.text
		.globl main
main:
        #######################################
		# añada su código a partir de aquí...
	li $t0, 10		#longitud vector (nº de iteracciones)		
	la $t1, vector 	#cargamos posicion vector en memoria
	li $t2, 5		#ini 5
	li $t3, 3		#ini 3
	
	li $t4, 1		#posicion vector
	li $t5, 0		#ini suma
	
loop:
	bgt $t4, $t0, endloop
	
	la $a0,str1             #mostramos str1
	li $v0, 4
	syscall
	
	add $a0, $t4, $zero		#mostramos posicion vector
    li $v0, 1
    syscall
	
	la $a0,str2             #mostramos str2
    li $v0, 4
    syscall
	
	li $v0, 5               #leemos el valor introducido
    syscall

	sb $v0, 0($t1)			#guardamos en vector
	addi $t1, $t1, 1				#adelantamos una posicion al vector
	
	#condiciones
	beq $v0, $t2, si		#si es igual a 5
	
	div $v0, $t3			#comprobamos si es multiplo de 3
	mfhi $t6
	beqz $t6, si

	addi $t4, $t4, 1		#aumentamos contador
	j loop

si:
	add $t5, $t5, $v0		#sumamos
	addi $t4, $t4, 1		#aumentamos contador
	j loop	

endloop:

	la $t7, result
	sw $t5, 0($t7)
	
	la $a0,str3             #mostramos str3
    li $v0, 4
    syscall

	add $a0, $t5, $zero		#mostramos la suma
    li $v0, 1
    syscall

    #######################################
	li $v0, 10
	syscall 


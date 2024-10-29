#
# Ejercicio 6.12 del libro de prácticas integrando los apartados 1, 2 y 3
# Dada una cadena, pasar a mayúsculas los caracteres no numéricos en minúscula, 
# excepto la letra "o" que se ha de dejar como está.
# Pedir la cadena por teclado y contar el número de caracteres numéricos
#

		.data
str1:	.asciiz "\nIntroducir cadena de caracteres: "
str2:	.asciiz	"\nNumero de caracteres numericos= "

# define a partir de aquí el resto de datos que necesites
cadena: .space 64
newc:	.space 64
digits: .space 32

				.text
				.globl main
main:		#Escribe a partir de aquí las instrucciones del programa
		la $t0, cadena		#direccion cadena / i
		la $t1, newc		#direccion de la nueva cadena
		la $t7, digits		#direccion de la variable que guarda el numero de digitos
		
		la $a0, str1		#imprimimos str1
		li $v0, 4
		syscall
		
		la $a0, cadena		#imprimimos str1
		li $v0, 8
		syscall
		
		la $a0, cadena		#imprimimos str1
		li $v0, 4
		syscall

		li $t3, 0x61	# ascii 'a'
		li $t4, 122		# ascii 'z'
		li $t5, 111	# ascii 'o'
		li $t6, 0x20	# ascii ' '
		
		li $t8, 0		#contador
		li $s0, 0x30		#0
		li $s1 , 0x39		#9
		
mientras:
		lb $t2, 0($t0) #cadena[i]
		
		beqz $t2, finmientras
		beq $t2, $t6, finsi	# si hay espacio finsi
		beq $t2, $t5, finsi	# si =='o' finsi
		
		blt $t2, $t3, finsi # si <'a' finsi
		bgt $t2, $t4, finsi # si >'z' finsi
		
		addi $t2, $t2, -32 # minúsc a mayusc
		sb $t2, 0($t1)	# metemos el valor de ese caracter en la nueva cadena
		addi $t0, $t0, 1
		addi $t1, $t1, 1 
		
		j mientras

finsi:	
		blt $t2, $s0, finsi2  #si es mayor o igual que 0
		bgt $t2, $s1, finsi2  #si es menor o igual que 9
		
		sb $t2, 0($t1)	# metemos el valor de ese caracter en la nueva cadena
		addi $t0, $t0, 1
		addi $t1, $t1, 1 
		
		addi $t8, $t8, 1
		sb $t8, 0($t7)
		
		j mientras
		
finsi2:
		sb $t2, 0($t1)
		addi $t0, $t0, 1
		addi $t1, $t1, 1 
		j mientras
		
		
finmientras:
		la $a0, newc
		li $v0, 4
		syscall
		
		la $a0, str2
		li $v0, 4
		syscall
		
		la $t0, digits
		lb $t1, 0($t0)
		move $a0, $t1
		li $v0, 1
		syscall

            # leer cadena de caracteres del teclado
            # imprimir cadena leída (original)
            # procesar cadena y contar caracteres numéricos
            # imprimir cadena resultante del proceso
            # imprimir contador de caracteres numéricos

        		li $v0, 10
        		syscall 
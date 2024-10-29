#ej 4_1 2023_24
	.data 
cadena1: .asciiz "\nIntroducir dato A = "   
cadena2: .asciiz "\nIntroducir dato B = "   
cadena3: .asciiz "\nEl valor de A+B es = "   

    .data 0x10010103
# definir a partir de aquí tres palabras: A, B y Suma. Tenga cuidado con el comienzo del segmento.
A:	.word 0
B:	.word 0
Suma:	.word 0

	.text   
	.globl main 
main:	# añada aquí las instrucciones de tu programa
    la $a0, cadena1
    li $v0, 4
    syscall     #imprime cadena1
    
    li $v0, 5
    syscall     #obtiene el valor de a
	la $t0, A
    sw $v0, 0($t0)   #lo guardamos en a
    
    la $a0, cadena2
    li $v0, 4
    syscall     #imprime cadena2
    
    li $v0, 5
    syscall     #obtiene el valor de b
	la $t1, B
    sw $v0, 0($t1)   #lo guardamos en b
    
    lw $t0, 0($t0)		#load A
	lw $t1, 0($t1)		#load B
    add $t0, $t0, $t1  #suma A+B
	la $t2, Suma
    sw $t0, 0($t2)
    
    la $a0, cadena3
    li $v0, 4
    syscall     #imprime cadena3
    
    lw $a0, 0($t2)
    li $v0, 1
    syscall     #imprime entero
	
    li $v0, 10
	syscall     # exit
	
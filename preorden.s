# Escribe la subrutina "f" que suma a la palabra en la dirección 0($a1) el
# contenido del registro $a0 y además, imprima el valor de entero en $a0
# seguido de un único espacio (el código ascci del espacio es 0x20)
#
# inputs:
#   $a0: data
#   $a1: params address
# outputs:
#   none
    .text
	.globl f
f:  

	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -4
	sw $a0, 0($sp)			#data
	addi $sp, $sp, -4
	sw $a1, 0($sp)			#params
	addi $sp, $sp, -4
	sw $s0, 0($sp)			
	addi $sp, $sp, -4
	sw $s1, 0($sp)
			
	lw $t0, 0($a1)			#t0= params[0]
	add $t0, $t0, $a0		#params[0] += data
	sw $t0, 0($a1)			#guardamos el valor en params
		
	li $v0, 1				#se imprime en pantalla data, pues es a0
	syscall
	
	li $a0, 0x20			#se imprime en pantalla un espacio
	li $v0, 11
	syscall
	
end_f:
	
	lw $s1, 0($sp) 
	addi $sp, $sp, 4
	lw $s0, 0($sp) 
	addi $sp, $sp, 4
	lw $a1, 0($sp) 
	addi $sp, $sp, 4		#desapilamos
	lw $a0, 0($sp) 
	addi $sp, $sp, 4
	lw $ra, 0($sp) 
	addi $sp, $sp, 4
		
	jr $ra
            
# inputs:
#   $a0: tree address
#   $a1: i
#   $a2: n
#   $a3: f
#   params address in the stack
# outputs:
#   none
	.globl preorden
preorden:
	
	addi $sp, $sp, -4
	sw $fp, 0($sp)
	addi $fp, $sp, 0	#fp bloque de activación
	lw $s0, 4($fp)		#s0=params 
	
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -4
	sw $a0, 0($sp)		#dirección árbol
	addi $sp, $sp, -4
	sw $a1, 0($sp)		#i
	addi $sp, $sp, -4
	sw $a2, 0($sp)		#n
	addi $sp, $sp, -4
	sw $a3, 0($sp)		#f
	addi $sp, $sp, -4
	sw $s0, 0($sp)		# Guardamos $s0 en la pila, por ahorrarnos problemas
	addi $sp, $sp, -4
	sw $s1, 0($sp)		# Guardamos $s1 en la pila
	addi $sp, $sp, -4
	sw $s2, 0($sp)		# Guardamos $s2 en la pila
	
	addi $s1, $a0, 0	# s1=tree, pues a0 se va a modificar
	addi $s2, $a1, 0	# s2=i, pues a1 se va a modificar
		
	bge $s2, $a2, end_preorden  #(i<n)
	
func:

	sll $t1, $a1, 2		#i*4
	add $t2, $s1, $t1	#t2= tree[i]
	lw $a0, 0($t2)		#a0= tree[i] --> data para f
	move $a1, $s0		#a1= params --> params para f
	jalr $a3
	
rec1:

	addi $a0, $s1, 0	#$a0=tree
	sll $s2, $s2, 1		#i*2
	addi $s2, $s2, 1	#(2*i+1)
	addi $a1, $s2, 0	#$a1=i
	
	addi $sp, $sp, -4
	sw $s0, 0($sp)		#apilamos params
	jal preorden
	lw $s0, 0($sp)
	addi $sp, $sp, 4	#desapilamos params
	
rec2:

	move $s2, $a1		#metemos en s2 el valor de i de rec1
	addi $a0, $s1, 0	#a0=tree
	addi $s2, $s2, 1	#al i anterior le sumamos 1 --> (2*i+2)
	addi $a1, $s2, 0	#a1=i
	
	addi $sp, $sp, -4
	sw $s0, 0($sp)		#apilamos params
	jal preorden
	lw $s0, 0($sp)
	addi $sp, $sp, 4	#desapilamos params
			
end_preorden:

	lw $s2, 0($sp) 		#desapilamos los registros
	addi $sp, $sp, 4
	lw $s1, 0($sp) 
	addi $sp, $sp, 4
	lw $s0, 0($sp) 
	addi $sp, $sp, 4
	lw $a3, 0($sp)
	addi $sp, $sp, 4	
	lw $a2, 0($sp)
	addi $sp, $sp, 4
	lw $a1, 0($sp)
	addi $sp, $sp, 4
	lw $a0, 0($sp)
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	lw $fp, 0($sp) 
	addi $sp, $sp, 4
	  
    jr $ra

	.text
	.globl tMat
	
tMat:
	
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -4
	sw $a0, 0($sp)		#dirección matriz original
	addi $sp, $sp, -4
	sw $a1, 0($sp)		#direccdión matriz resultado
	addi $sp, $sp, -4
	sw $a2, 0($sp)		#Dirección parámetros
	
	li $s1, 0			#count=0
	lb $s2, 0($a2)		#numFila
	lb $s3, 1($a2)		#numCol
	lb $s4, 2($a2)		#linf
	lb $s5, 3($a2)		#lsup
	
	li $s6, 0			#i=0
	li $s7, 0			#j=0
	
for_1:	 

	bge $s6, $s3, end_for1	#i<numCol
	
for_2:

	bge $s7, $s2, end_for2	#j<numFila
	
	mul $t1, $s6, $s2	#i*N
	add $t1, $t1, $s7	#(i*N+j)
	sll $t1, $t1, 1		#(i*N+j)*2 --> desplazamiento
	add $t1, $t1, $a0	#(i*N+j)(dezplazado)+dir matriz
 	lh $t2, 0($t1)		#MT[i,j]
	
	mul $t3, $s7, $s2	#j*N
	add $t3, $t3, $s6	#(j*N+i)
	sll $t3, $t3, 1		#(j*N+i)*2 --> desplazamiento
	add $t3, $t3, $a0	#(j*N+i)(dezplazado)+dir matriz
 	lh $t4, 0($t3)		#MA[j,i]
	
	addi $t2, $t4, 0 	#MT[i,j]=MA[j,i]
	
	blt $t4, $s4, end_if  #hacemos el and
	bgt $t4, $s5, end_if

if:
	addi $s1, $s1, 1  #count++
	j for_2
	

end_if:
	
	j for_2
	jr $ra

end_for1:
	
	addi $s6, $s6, 1	#i++
	j for_1

	jr $ra
	
end_for2:

	addi $s7, $s7, 1	#j++
	j for_2
	

	lw $a2, 0($sp)
	addi $sp, $sp, 4
	lw $a1, 0($sp)
	addi $sp, $sp, 4
	lw $a0, 0($sp)
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	  
    jr $ra	
    


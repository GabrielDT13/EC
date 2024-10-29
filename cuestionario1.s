.data

.text
.globl main

main:

    li $t4, 0x0032
    ori $t5, $t4, 0xFF44
    andi $t6, $t4, 0xFF44
    nor $t7, $t5, $t5
    addi $t8, $t4, 4
    mul    $t9, $t4, 4
    div $s1, $t4, 8
    li $v0, 10
    syscall
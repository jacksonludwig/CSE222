	.data
msg0:	.asciiz "enter a number.\n"
msg1:	.asciiz "the number is even.\n"
msg2:	.asciiz "the number is odd.\n"

	.text
main:
	jal mainfunc
	li $v0, 10
	syscall
	
mainfunc:
	addi $sp, $sp, -12
	sw $ra, 0($sp)
	sw $v0, 4($sp)
	sw $a0, 8($sp)
	
	li $v0, 4
	la $a0, msg0
	syscall	
	
	li $v0, 5
	syscall 
	move $a0, $v0
	jal funceo

	beq $v0, $0, label1 	
	li $v0, 4
	la $a0, msg2
	syscall
	j return1
label1:	li $v0, 4
	la $a0, msg1
	syscall
return1:	
	lw $a0, 8($sp)
	lw $v0, 4($sp)
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
	
funceo:
	addi $sp, $sp, -4
	sw $a0, 0($sp)
	sra $t0, $a0, 1
	sll $t0, $t0, 1
	beq $t0, $a0, even
	li  $v0, 1
	j   return
even:	li $v0, 0  
	lw $a0, 0($sp)
	addi $sp, $sp, 4
return: jr $ra 
	
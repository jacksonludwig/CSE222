

.text
main:
    jal		mainFunction				# jump to function and save position to $ra
    beq		$v0, $0, equal	# if $v0 == $0 then 

    li		$v0, 4		# $v0 = 4
    la		$a0, msg2		# 
    syscall
    j		exit				# jump to exit

mainFunction:
    addi	$sp, $sp, -4			# $sp = $sp + -4
    sw		$ra, 0($sp)		# 
    

    li		$v0, 4		# $v0 = 4
    la		$a0, msg0		# 
    syscall
    
    li		$v0, 5		# $v0 = 5
    syscall

    move 	$a0, $v0		# $a0 = $v0 
    jal		function				# jump to function and save position to $ra

    lw		$ra, 0($sp)		# 
    addi	$sp, $sp, 4			# $sp = $sp + 4
    jr		$ra					# jump to $ra
    
equal:
    li		$v0, 4		# $v0 = 4
    la		$a0, msg1		# 
    syscall
    j		exit				# jump to exit
    
function:
    addi	$sp, $sp, -4			# $sp = $sp + -4
    sw		$a0, 0($sp)		# $a0 saved in stack

    sra     $t0, $a0, 1
    sll     $t0, $t0, 1
    beq		$t0, $a0, even
    li		$v0, 1		# $v0 = 1
    j		return				# jump to return

even:
    li		$v0, 0		# $v0 = 0
    lw		$a0, 0($sp)		# 
    addi	$sp, $sp, 4			# $sp = $sp + 4
    
return:
    jr		$ra					# jump to $ra -- this gets you back to the function caller***

exit:
    li		$v0, 10		# $v0 = 10
    syscall

.data
msg0:   .asciiz "Enter a number: "
msg1:   .asciiz "\nThe number is even"
msg2:   .asciiz "\nThe number is odd"
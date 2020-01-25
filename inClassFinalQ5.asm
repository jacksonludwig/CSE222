

.text
main:
    jal		readInt				# jump to readInt and save position to $ra
    jal		readInt				# jump to readInt and save position to $ra
    
    lw 	$a0, var1		# $a0 = var1
    li		$v0, 1		# $v0 = 1
    syscall

    lw 	$a0, var2		# $a0 = var1
    li		$v0, 1		# $v0 = 1
    syscall

    jal		swap				# jump to swap and save position to $ra
    
    lw 	$a0, var1		# $a0 = var1
    li		$v0, 1		# $v0 = 1
    syscall

    lw 	$a0, var2		# $a0 = var1
    li		$v0, 1		# $v0 = 1
    syscall
    
    j		exit				# jump to exit
    
readInt:
    li		$v0, 5		# $v0 = 1
    syscall

    beq		$t7, 10, secondNum	# if $t7 == 10 then secondNum
    sw		$v0, var1		# 
    li		$t7, 10		# $t7 = 10
    j returnInt
    
secondNum:
    sw		$v0, var2		# 
    
returnInt:
    jr		$ra					# jump to $ra

swap:
    lw		$t3, var1		# 
    lw		$t4, var2		# 
    lw		$t5, var1		# 
    
    sw		$t4, var1		# 
    sw		$t5, var2		# 
    
    
    jr		$ra					# jump to $ra

exit:
    li		$v0, 10		# $v0 = 10
    syscall

.data
var1: .word 100
var2: .word 100
temp: .word 100


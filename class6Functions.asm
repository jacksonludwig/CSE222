

.text
main:
    li		$v0, 4		# $v0 = 4
    la		$a0, msg0		# 
    syscall

    li		$v0, 5		# $v0 = 5
    syscall
    
    jal		function				# jump to function and save position to $ra
    beq		$v0, $0, equal	# if $v0 == $0 then 

    li		$v0, 4		# $v0 = 4
    la		$a0, msg2		# 
    syscall
    j		exit				# jump to exit
    
equal:
    li		$v0, 4		# $v0 = 4
    la		$a0, msg1		# 
    syscall
    j		exit				# jump to exit
    
function:
    sra     $t0, $v0, 1
    sll     $t0, $t0, 1
    beq		$t0, $v0, even
    li		$v0, 1		# $v0 = 1
    j		return				# jump to return

even:
    li		$v0, 0		# $v0 = 0

return:
    jr		$ra					# jump to $ra -- this gets you back to the function caller***

exit:
    li		$v0, 10		# $v0 = 10
    syscall

.data
msg0:   .asciiz "Enter a number: "
msg1:   .asciiz "\nThe number is even"
msg2:   .asciiz "\nThe number is odd"
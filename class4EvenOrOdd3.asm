

.text
main:
    li		$v0, 4		# $v0 = 4
    la		$a0, msg		
    syscall

    li		$v0, 5		# $v0 = 5
    syscall
    
    move 	$t0, $v0		# $t0 = $v0
    andi    $t1, $t0, 0x0001 # mask of 0000...0001
    
    beq		$t1, 0, even	# if last bit is zero, then even
    
odd:
    li		$v0, 4		# $v0 = 4
    la		$a0, odd_msg		# 
    syscall
    j		exit				# jump to exit
    
even:
    li		$v0, 4		# $v0 = 4
    la		$a0, even_msg		# 
    syscall

exit:
    li		$v0, 10		# $v0 = 10
    syscall

.data
msg: .asciiz "Enter a number\n"
odd_msg: .asciiz "The number is odd."
even_msg: .asciiz "The number is even."
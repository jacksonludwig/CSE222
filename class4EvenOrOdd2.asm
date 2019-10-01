

.text
main:
    li		$v0, 4		# $v0 = 4
    la		$a0, msg		
    syscall

    li		$v0, 5		# $v0 = 5
    syscall
    
    move 	$t0, $v0		# $t0 = $v0
    li		$t1, 2		# $t1 = 2
    div		$t0, $t1			# $t0 / $t1
    mfhi	$t2					# $t2 = $t0 mod 2 
    
    beq		$t2, 0, even	# if $t2 == 0 then even
    
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
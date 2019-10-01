

.text
main:
    li		$v0, 4		# $v0 = 4
    la		$a0, msg		
    syscall

    li		$v0, 5		# $v0 = 5
    syscall
    
    move 	$t0, $v0		# $t0 = $v0
    sra     $t1, $t0, 1     # copy into $t1 and shift right 1 bit
    sll     $t1, $t1, 1     # shift back 1 bit
    beq		$t1, $t0, even	# if $t1 == $t0 then even
    
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
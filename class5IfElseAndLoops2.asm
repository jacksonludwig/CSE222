# 2^x = 128
# find x

.text
main:
   li		$t0, 0		# $t0 = 0, x
   li		$t1, 1		# $t1 = 1, pow
   li		$t2, 128		# $t2 = 128, desired
   
while:
    slt     $t3, $t1, $t2
    bne		$t3, 1, msg	        # if $t3 != 1 then exit loop     
    sll     $t1, $t1, 1         # multiply by 2 by shifting bits to the left once
    addi	$t0, $t0, 1			# $t0 = $t0 + 1, iterates to get exponent value
    
    j		while				# jump to while
    
msg:
    li		$v0, 4		# $v0 = 4
    la		$a0, msg_disp		# 
    syscall

    li		$v0, 1		# $v0 = 1
    move 	$a0, $t0		# $a0 = $t0   
    syscall

    j		exit				# jump to exit

exit:
    li		$v0, 10		# $v0 = 10
    syscall

.data
msg_disp:    .asciiz "128 is 2 raised to "
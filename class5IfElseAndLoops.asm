

.text
main:
    lw		$t0, vara		# 
    lw		$t1, varb		# 

    slt     $t2, $t0, $t1
    beq		$t2, 1, bGreater	# if $t2 == $t1 then target

    li		$v0, 4		# $v0 = 4
    la		$a0, aBigger_msg		# 
    syscall
    j		exit				# jump to exit

bGreater:
    li		$v0, 4		# $v0 = 4
    la		$a0, bBigger_msg		# 
    syscall

exit:
    li		$v0, 10		# $v0 = 10
    syscall

.data
vara:   .word   100
varb:   .word   200
aBigger_msg:    .asciiz "a is greater than b"
bBigger_msg:    .asciiz "b is greater than a"

.text
main:
    li		$v0, 4		# $v0 = 4
    la		$a0, msg1		# 
    syscall

    li		$v0, 5		# $v0 = 5
    syscall
    move 	$t0, $v0		# $t0 = $v0

negativeLoop:
    bgt		$t0, $0, nowPositive	# if $t0 > $0 then nowPositive

    li		$v0, 4		# $v0 = 4
    la		$a0, msg2		# 
    syscall

    li		$v0, 5		# $v0 = 5
    syscall
    move 	$t0, $v0		# $t0 = $v0

    j		negativeLoop				# jump to negativeLoop

nowPositive:
    move 	$t2, $t0		# $t2 = $t0
    move 	$t3, $0		# $t3 = $0

PositiveLoop:
    addi	$t3, $t3, 1			# $t3 = $t3 + 1, counter
    beq		$t2, $t3, PrintSum	# if $t2 == $t3 then PrintSum
    add		$t0, $t0, $t3		# $t0 = $t0 + $t3
    
    j		PositiveLoop				# jump to PositiveLoop
    
PrintSum:
    li		$v0, 1		# $v0 = 1
    move 	$a0, $t0		# $a0 = $t0
    syscall

exit:
    li		$v0, 10		# $v0 = 10
    syscall

.data
msg1:   .asciiz "Enter an integer:\n"
msg2:   .asciiz "Please make sure it is positive:\n"
newline:    .asciiz "\n"


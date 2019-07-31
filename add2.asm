# Jackson
# add2.asm
# computes the sum of 2 user input numbers, with result in $t0
# Registers used:
#       t0 -- holds result
#       t1 -- holds first number
#       t2 -- holds second number

main:
    li		$v0, 5		# $v0 = 5
    syscall
    move 	$t1, $v0		# $t1 = $v0 -- get first number and put into $t1
    
    li		$v0, 5		# $v0 = 5
    syscall
    move 	$t2, $v0		# $t2 = $v0 -- get second number and put into $t2
    
    add		$t0, $t1, $t2		# $t0 = $t1 + $t2
        
    move 	$a0, $t0		# $a0 = $t0
    li		$v0, 1		# $v0 = 1
    syscall     # prints number in $a0

    li		$v0, 10		# $v0 = 10
    syscall # quit
    
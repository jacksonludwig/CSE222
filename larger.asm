# Jackson
# larger.asm
# computes the larger of 2 user input numbers
# Registers used:
#       t0 -- holds result
#       t1 -- holds first number
#       t2 -- holds second number

    .text
main:
    li		$v0, 5		# $v0 = 5
    syscall
    move 	$t1, $v0		# $t1 = $v0 -- get first number and put into $t1
    
    li		$v0, 5		# $v0 = 5
    syscall
    move 	$t2, $v0		# $t2 = $v0 -- get second number and put into $t2
    
    # put larger of the two numbers into $t0
    bgt		$t1, $t2, t1_bigger	# if $t1 > $t2, then branch to $t1_bigger
    move 	$t0, $t2		# otherwise copy $t1 into $t0
    b		endif			# and then branch to endif
    
t1_bigger:
        move 	$t0, $t1		# copy $t1 into $t0

endif:
    move 	$a0, $t0		# $a0 = $t0
    li		$v0, 1		# $v0 = 1
    syscall     # prints number in $a0

    li		$v0, 10		# $v0 = 10
    syscall # quit
    
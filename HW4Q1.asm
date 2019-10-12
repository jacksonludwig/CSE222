
.text
main:
    li		$v0, 4		# $v0 = 4
    la		$a0, msg1		# 
    syscall

    li		$v0, 5		# $v0 = 5
    syscall
    move 	$t0, $v0		# $t0 = $v0

    li		$v0, 5		# $v0 = 5
    syscall
    move 	$t1, $v0		# $t0 = $v0

    blt		$t0, $t1, firstLess	# if $t0 < $t1 then firstLess

secondLess: 
    li		$v0, 1		# $v0 = 1
    move 	$a0, $t1		# $a0 = $t0
    syscall

    li		$v0, 4		# $v0 = 4
    la		$a0, newline		# 
    syscall

    li		$v0, 1		# $v0 = 1
    move 	$a0, $t0		# $a0 = $t0
    syscall
    
    j		exit				# jump to exit
    
firstLess:
    li		$v0, 1		# $v0 = 1
    move 	$a0, $t0		# $a0 = $t0
    syscall

    li		$v0, 4		# $v0 = 4
    la		$a0, newline		# 
    syscall

    li		$v0, 1		# $v0 = 1
    move 	$a0, $t1		# $a0 = $t0
    syscall

exit:
    li		$v0, 10		# $v0 = 10
    syscall

.data
msg1:   .asciiz "Enter two integers:\n"
newline:    .asciiz "\n"


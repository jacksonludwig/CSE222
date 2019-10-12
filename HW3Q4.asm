
.text
main:
    li		$t0, 0x0FF000FF		# $t0 = 0x0FF000FF
    li		$t1, 0x00100001		# $t1 = 0x00100001
    add		$t2, $t0, $t1		# $t2 = $t0 + $t1

    move 	$a0, $t2		# $a0 = $t2
    li		$v0, 1		# $v0 = 1
    syscall

    li		$v0, 4		# $v0 = 4
    la		$a0, msg		# 
    syscall

    li		$t0, 100		# $t0 = 100
    li		$t1, 1		# $t1 = 1
    add		$t2, $t0, $t1		# $t1 = $t0 + $t1
    sub		$t3, $t0, $t1		# $t3= $t1 - $t2

    move 	$a0, $t2		# $a0 = $t2
    li		$v0, 1		# $v0 = 1
    syscall

    li		$v0, 4		# $v0 = 4
    la		$a0, msg		# 
    syscall

    move 	$a0, $t3		# $a0 = $t2
    li		$v0, 1		# $v0 = 1
    syscall

    li		$v0, 4		# $v0 = 4
    la		$a0, msg		# 
    syscall

    li		$t0, 0x1234		# $t0 = 0x1234
    addi	$t0, $t0, 0x4321			# $t0 = $t0 + 0x4321
    sll     $t0, $t0, 1

    move 	$a0, $t0		# $a0 = $t2
    li		$v0, 1		# $v0 = 1
    syscall

    li		$v0, 10		# $v0 = 10
    syscall
    
.data
msg: .asciiz "\n"
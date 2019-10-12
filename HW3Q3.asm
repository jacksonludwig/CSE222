

.text
main:
    li		$v0, 4		# $v0 = 4
    la		$a0, msg		# 
    syscall

    li		$v0, 4		# $v0 = 4
    la		$a0, msg2		# 
    syscall

    li		$v0, 5		# $v0 = 5
    syscall

    move 	$t0, $v0		# $t0 = $v0
    move 	$t1, $v0		# $t1 = $v0

    sll     $t0, $t0, 1
    move 	$a0, $t0		# $a0 = $t0
    li		$v0, 1		# $v0 = 1
    syscall

    li		$v0, 4		# $v0 = 4
    la		$a0, msg3		# 
    syscall

    li		$t2, 2		# $t2 = 2
    
    mult	$t1, $t2			# $t1 * 2 = Hi and Lo registers
    mflo	$t2					# copy Lo to $t2

    move 	$a0, $t2		# $a0 = $t0
    li		$v0, 1		# $v0 = 1
    syscall

    li		$v0, 10		# $v0 = 10, 10 for exit
    syscall     # $v0 has 10 -> exit

.data
msg: .asciiz "Hello, I am a college student.\n"
msg2: .asciiz "Enter a number\n"
msg3: .asciiz "\n"
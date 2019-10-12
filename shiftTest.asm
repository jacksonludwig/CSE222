.text

main:   
    li		$t0, 1		# $t0 = 1
    sll     $t1, $t0, 1

    li		$v0, 1		# $v0 = 1
    move		$a0, $t0		# $a0 = $t0
    syscall

    li		$v0, 4		# $v0 = 4
    la		$a0, msg		# 
    syscall
    
    li		$v0, 1		# $v0 = 1
    move	$a0, $t1		# $a0 = $t0
    syscall

    li		$v0, 10		# $v0 = 10, 10 for exit
    syscall     # $v0 has 10 -> exit
    
.data
msg: .asciiz "\n"

# swap two numbers without a temporary variable
.text
main:
    li		$t0, 12		# $t0 = 12, x
    li		$t1, 35		# $t1 = 35, y
    
    xor     $t0, $t0, $t1
    xor     $t1, $t0, $t1
    xor     $t0, $t0, $t1

    li		$v0, 1		# $v0 = 1
    move 	$a0, $t0		# $a0 = $t0
    syscall

    li		$v0, 4		# $v0 = 4
    la		$a0, msg		# 
    syscall

    li		$v0, 1		# $v0 = 1
    move 	$a0, $t1		# $a0 = $t0
    syscall

    li		$v0, 10		# $v0 = 10
    syscall

.data
msg: .asciiz "\n"

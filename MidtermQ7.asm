
.text
main:
    li		$v0, 4		# $v0 = 4
    la		$a0, prompt		# 
    syscall

    li		$v0, 5		# $v0 = 5
    syscall

    sw		$v0, var1		# 

    li		$v0, 4		# $v0 = 4
    la		$a0, prompt		# 
    syscall

    li		$v0, 5		# $v0 = 5
    syscall

    sw		$v0, var2		# 
    
    lw		$s0, var1		# 
    lw		$s1, var2		# 
    jal		abs				# jump to abs and save position to $ra

    li		$v0, 4		# $v0 = 4
    la		$a0, result		# 
    syscall

    li		$v0, 1		# $v0 = 1
    move 	$a0, $t0		# $a0 = $t0
    syscall
    
    j		exit				# jump to exit
    
abs:
    sub		$t0, $s0, $s1		# $t0 = $s0 - $s1
    blt		$t0, $0, makePos	# if $t0 < $0 then makePos
    jr		$ra					# jump to $ra
    
makePos:
    li		$t1, -1		# $t1 = -1
    mult	$t0, $t1			# $t0 * $t1 = Hi and Lo registers
    mflo	$t0					# copy Lo to $t2
    jr		$ra					# jump to $ra

exit:
    li		$v0, 10		# $v0 = 10
    syscall

.data
prompt: .asciiz "Enter an integer number: "
var1: .word 80
var2: .word  80
result: .asciiz "the difference between these two numbers is "



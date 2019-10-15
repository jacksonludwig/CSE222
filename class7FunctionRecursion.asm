
.text
main:
    addi	$a0, $0, 4			# $a0 = $0 + 4, n = 4
    jal		ff				# jump to ff and save position to $ra

    move 	$a0, $v0		# $a0 = $v0 
    li		$v0, 1		# $v0 = 1
    syscall

    li		$v0, 10		# $v0 = 10
    syscall

ff:
    addi	$sp, $sp, -8			# $sp = $sp + -8, 8 bytes for 2 registers
    sw		$a0, 4($sp)		# 
    sw		$ra, 0($sp)		# 

    addi	$t0, $0, 2			# $t0 = $0 + 2
    slt     $t1, $a0, $t0       # if <=1, finish recursion, else keep going
    beq		$t1, $0, else	# if $t1 == $0 then else
    addi	$v0, $0, 1			# $v0 = $0 + 1

    j		done				# jump to done

else:
    addi	$a0, $a0, -1			# $a0 = $a0 + -1
    jal		ff				# jump to ff and save position to $ra, recursive call
    
done:
    lw		$ra, 0($sp)		# 
    lw		$a0, 4($sp)		# 

    mult	$a0, $v0			# $a0 * $v0 = Hi and Lo registers
    mflo	$v0					# copy Lo to $v0

    addi	$sp, $sp, 8			# $sp = $sp + 8
    jr		$ra					# jump to $ra
    







.data


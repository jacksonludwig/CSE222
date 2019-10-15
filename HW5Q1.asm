
.text
main:
    li		$t0, 10		# $t0 = 5
    li		$t1, 33		# $t1 = 3

    jal		max				# jump to max and save position to $ra
    li		$v0, 1		# $v0 = 1
    syscall

    li		$v0, 4		# $v0 = 4
    la		$a0, line		# $a0 = line
    syscall

    li		$t0, 12		# $t0 = 12
    li		$t1, 40		# $t1 = 40

    jal		min				# jump to min and save position to $ra
    li		$v0, 1		# $v0 = 1
    syscall

    li		$v0, 4		# $v0 = 4
    la		$a0, line		# $a0 = line
    syscall

    li		$t0, 23		# $t0 = 23
    jal		isOdd				# jump to isOdd and save position to $ra
    li		$v0, 4		# $v0 = 4
    syscall

    j		exit				# jump to exit

max:
    bge		$t0, $t1, firstBigger	# if $t0 >= $t1 then firstBigger
    move 	$a0, $t1		# $a0 = $t1
    jr		$ra					# jump to $ra
    
    firstBigger:
    move 	$a0, $t0		# $a0 = $t0
    jr		$ra					# jump to $ra

min:
    ble		$t0, $t1, firstSmaller	# if $t0 <= $t1 then firstSmaller
    move 	$a0, $t1		# $a0 = $t1
    jr		$ra					# jump to $ra
    
    firstSmaller:
    move 	$a0, $t0		# $a0 = $t0
    jr		$ra					# jump to $ra

isOdd:
    srl     $t1, $t0, 1
    sll     $t1, $t1, 1
    beq		$t0, $t1, odd	# if $t0 == $t1 then even
    la		$a0, oddTrue		# 
    jr		$ra					# jump to $ra
    
    odd:
    la		$a0, oddFalse		# 
    jr		$ra					# jump to $ra
    
exit:
    li		$v0, 10		# $v0 = 10
    syscall

.data
line:  .asciiz "\n"
oddTrue:    .asciiz "True"
oddFalse:   .asciiz "False"

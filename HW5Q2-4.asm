

.text
main:
    li		$t0, 0		# $t0 = 0

initialize:
    beq		$t0, 40, functionCalls	# if $t0 == 40 then functionCalls
    
    bge		$t0, 8, addElems	# if $t0 >= 8 then addElems
    li		$t1, 0		# $t1 = 0
    sw		$t1, myArray($t0)		# [0] = 0
    addi	$t0, $t0, 4			# $t0 = $t0 + 4
    
    li		$t2, 1		# $t2 = 1
    sw		$t2, myArray($t0)		# [1] = 1

    addi	$t0, $t0, 4			# $t0 = $t0 + 4
    j		initialize				# jump to intialize
    
addElems:
    subi	$t0, $t0, 4			# $t0 = $t0 - 4
    lw		$t2, myArray($t0)		# 
    subi	$t0, $t0, 4			# $t0 = $t0 - 4
    lw		$t3, myArray($t0)		# 
    
    add		$t4, $t2, $t3		# $t4 = $t2 + $t3
    
    addi	$t0, $t0, 8			# $t0 = $t0 + 8
    sw		$t4, myArray($t0)		# 
    
    addi	$t0, $t0, 4			# $t0 = $t0 + 4
    j		initialize				# jump to initialize   

functionCalls:
    li		$t0, 0		# $t0 = 0

    jal		maximum				# jump to maximum and save position to $ra
    move 	$a0, $s0		# $a0 = $s0
    li		$v0, 1		# $v0 = 1
    syscall
    li		$v0, 4		# $v0 = 4
    la		$a0, newline		# 
    syscall

    jal		minimum				# jump to minimum and save position to $ra
    move 	$a0, $s1		# $a0 = $s1
    li		$v0, 1		# $v0 = 1
    syscall
    li		$v0, 4		# $v0 = 4
    la		$a0, newline		# 
    syscall

    jal		average				# jump to average and save position to $ra
    move 	$a0, $s2		# $a0 = $s2
    li		$v0, 1		# $v0 = 1
    syscall
    li		$v0, 4		# $v0 = 4
    la		$a0, newline		# 
    syscall

    jal		evenOdd				# jump to evenOdd and save position to $ra
    move 	$a0, $s3		# $a0 = $s3
    li		$v0, 1		# $v0 = 1
    syscall
    li		$v0, 4		# $v0 = 4
    la		$a0, newline		# 
    syscall

    move 	$a0, $s4		# $a0 = $s4
    li		$v0, 1		# $v0 = 1
    syscall
    li		$v0, 4		# $v0 = 4
    la		$a0, newline		# 
    syscall

    li		$t1, 12141		# $t1 = 12141
    jal		checkNumOnes				# jump to checkNumOnes and save position to $ra
    move 	$a0, $s5		# $a0 = $s5
    li		$v0, 1		# $v0 = 1
    syscall
    li		$v0, 4		# $v0 = 4
    la		$a0, newline		# 
    syscall

    li		$v0, 4		# $v0 = 4
    la		$a0, prompt		# 
    syscall
    li		$v0, 5		# $v0 = 5
    la		$a0, prompt		# 
    syscall
    move 	$t1, $v0		# $t1 = $v0
    jal		powerTwoOrNot				# jump to powerTwoOrNot and save position to $ra

    li		$v0, 10		# $v0 = 10
    syscall
    
maximum:    # value returned to $s0
    beq		$t0, 40, returnMax	# if $t0 == 40 then returnMax

    lw		$t1, myArray($t0)		# 
    bgt		$t1, $t2, BiggerNum	# if $t1 > $t2 then BiggerNum

    addi	$t0, $t0, 4			# $t0 = $t0 + 4
    j		maximum				# jump to findMax

BiggerNum:
    move 	$t2, $t1		# $t2 = $t1
    addi	$t0, $t0, 4
    j		maximum				# jump to maximum

returnMax:
    move 	$s0, $t2		# $s0 = $t2
    li		$t0, 0		# $t0 = 0
    li		$t1, 0		# $t1 = 0
    li		$t2, 0		# $t2 = 0
    li		$t3, 0		# $t3 = 0
    li		$t4, 0		# $t4 = 0
    jr		$ra					# jump to $ra

minimum:    # value returned to $s1
    beq		$t0, 40, returnMin	# if $t0 == 40 then returnMin

    lw		$t1, myArray($t0)		# 
    blt		$t1, $t2, SmallerNum	# if $t1 < $t2 then SmallerNum

    addi	$t0, $t0, 4			# $t0 = $t0 + 4
    j		minimum				# jump to findMin

SmallerNum:
    move 	$t2, $t1		# $t2 = $t1
    addi	$t0, $t0, 4
    j		minimum				# jump to findMin

returnMin:
    move 	$s1, $t2		# $s1 = $t2
    li		$t0, 0		# $t0 = 0
    li		$t1, 0		# $t1 = 0
    li		$t2, 0		# $t2 = 0
    li		$t3, 0		# $t3 = 0
    li		$t4, 0		# $t4 = 0
    jr		$ra					# jump to $ra

average:    # value returned to $s2
    beq		$t0, 40, returnAverage	# if $t0 == 40 then returnAverage

    lw		$t1, myArray($t0)		# 
    add		$t3, $t3, $t1		# $t3 = $t3 + $t1
    
    addi	$t0, $t0, 4			# $t0 = $t0 + 4
    j		average				# jump to average

returnAverage:
    li		$t4, 10		# $t4 = 10
    div		$t3, $t4			# $t3 / $t4
    mflo	$t1					# $t1 = floor($t3 / $t4) 

    move 	$s2, $t1		# $s2 = $t1
    li		$t0, 0		# $t0 = 0
    li		$t1, 0		# $t1 = 0
    li		$t2, 0		# $t2 = 0
    li		$t3, 0		# $t3 = 0
    li		$t4, 0		# $t4 = 0
    jr		$ra					# jump to $ra

evenOdd:    # evens in $s3, odds in $s4
    beq		$t0, 40, returnEvenOdd	# if $t0 == 40 then returnEvenOdd
    lw		$t1, myArray($t0)		# 
    
    sra     $t4, $t1, 1
    sll     $t4, $t4, 1
    beq		$t4, $t1, iterateEven	# if $t4 == $t1 then iterateEven

iterateOdd:
    addi	$t3, $t3, 1			# $t3 = $t3 + 1

    addi	$t0, $t0, 4			# $t0 = $t0 + 4
    j		evenOdd				# jump to evenOdd

iterateEven:
    addi	$t2, $t2, 1			# $t2 = $t2 + 1

    addi	$t0, $t0, 4			# $t0 = $t0 + 4
    j		evenOdd				# jump to evenOdd

returnEvenOdd:
    move 	$s4, $t2		# $s3 = $t2
    move 	$s3, $t3		# $s3 = $t3
    li		$t0, 0		# $t0 = 0
    li		$t1, 0		# $t1 = 0
    li		$t2, 0		# $t2 = 0
    li		$t3, 0		# $t3 = 0
    li		$t4, 0		# $t4 = 0
    jr		$ra					# jump to $ra

checkNumOnes:   # returns to $s5
    blt		$t1, 10, returnCheckNumOnes	# if $t1 < 10 then returnCheckNumOnes
    li		$t6, 10		# $t6 = 10

    div		$t1, $t6			# $t1 / 10
    mflo	$t1					# $t1 = floor($t1 / 10) 
    mfhi	$t3					# $t3 = $t1 mod 10 
    beq		$t3, 1, iterateOnes	# if $t3 == 1 then iterateOnes
    
    j		checkNumOnes				# jump to checkNumOnes

iterateOnes:
    addi	$t4, $t4, 1			# $t4 = $t4 + 1
    j		checkNumOnes				# jump to checkNumOnes

returnCheckNumOnes:
    beq		$t1, 1, iterateOneMore	# if $t1 == 1 then iterateOneMore
    move 	$s5, $t4		# $s5 = $t4

    li		$t0, 0		# $t0 = 0
    li		$t1, 0		# $t1 = 0
    li		$t2, 0		# $t2 = 0
    li		$t3, 0		# $t3 = 0
    li		$t4, 0		# $t4 = 0
    li		$t5, 0		# $t5 = 0
    li		$t6, 0		# $t6 = 0
    jr		$ra					# jump to $ra

iterateOneMore:
    addi	$t4, $t4, 1			# $t4 = $t4 + 1
    move 	$s5, $t4		# $s5 = $t4

    li		$t0, 0		# $t0 = 0
    li		$t1, 0		# $t1 = 0
    li		$t2, 0		# $t2 = 0
    li		$t3, 0		# $t3 = 0
    li		$t4, 0		# $t4 = 0
    li		$t5, 0		# $t5 = 0
    li		$t6, 0		# $t6 = 0
    jr		$ra					# jump to $ra 

powerTwoOrNot:
    beq		$t1, $0, isNotPowerTwo	# if $t1 == $0 then isNotPowerTwo
    
    subi	$t2, $t1, 1			# $t2 = $t1 - 1
    and     $t3, $t2, $t1

    beq		$t3, $0, isPowerTwo	# if $t3 == $0 then isPower
    
isNotPowerTwo:
    li		$v0, 4		# $v0 = 4
    la		$a0, isNotPower		# 
    syscall

    li		$t0, 0		# $t0 = 0
    li		$t1, 0		# $t1 = 0
    li		$t2, 0		# $t2 = 0
    li		$t3, 0		# $t3 = 0
    li		$t4, 0		# $t4 = 0
    li		$t5, 0		# $t5 = 0
    li		$t6, 0		# $t6 = 0
    jr		$ra					# jump to $ra 

isPowerTwo:
    li		$v0, 4		# $v0 = 4
    la		$a0, isPower		# 
    syscall

    li		$t0, 0		# $t0 = 0
    li		$t1, 0		# $t1 = 0
    li		$t2, 0		# $t2 = 0
    li		$t3, 0		# $t3 = 0
    li		$t4, 0		# $t4 = 0
    li		$t5, 0		# $t5 = 0
    li		$t6, 0		# $t6 = 0
    jr		$ra					# jump to $ra 

.data
myArray:    .space  40
newline:    .asciiz "\n"
prompt: .asciiz "Enter a number that is or is not a power of 2: "
isPower:    .asciiz "\nThe number is a power of 2"
isNotPower:    .asciiz "\nThe number is not a power of 2"

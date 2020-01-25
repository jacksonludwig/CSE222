


.text
main:
    li		$a1, 90

    jal		initialize				# jump to initialize and save position to $ra
    jal		displayArr				# jump to displayArr and save position to $ra
    
    jal		max				# jump to max and save position to $ra
    jal		minFunc				# jump to min and save position to $ra

    jal		average				# jump to average and save position to $ra
    
    jal		biggerThanAvg				# jump to returnBiggerThanAvg and save position to $ra
    

    j		exit				# jump to exit
    
initialize:
    beq		$t0, 40, returnArray	# if $t0 == 40 then returnArray
    
    li		$a0, 1		# $a0 = 1 
    li		$v0, 42		# $v0 = 42
    syscall

    addi	$a0, $a0, 10			# $a0 = $a0 + 10
    
    sw		$a0, arr($t0)		# 
    
    addi	$t0, $t0, 4			# $t0 = $t0 + 4
    j		initialize				# jump to initialize

returnArray:
    j		reset				# jump to reset

displayArr:
    beq		$t0, 40, returnDisplay

    lw		$t1, arr($t0)		# 
    move 	$a0, $t1		# $a0 = $t1
    li		$v0, 1		# $v0 = 1
    syscall

    addi	$t0, $t0, 4			# $t0 = $t0 + 4

    li		$v0, 4		# $v0 = 4
    la		$a0, space		# 
    syscall
    
    j		displayArr				# jump to displayArr

returnDisplay:
    j		reset				# jump to reset

max:
    beq		$t0, 40, returnMax	# if $t0 == 80 then returnMax

    lw		$t1, arr($t0)		# 
    bgt		$t1, $t2, largerFound	# if $t1 > $t2 then BiggerNum

    addi	$t0, $t0, 4			# $t0 = $t0 + 4
    j		max				# jump to max

largerFound:
    move 	$t2, $t1		# $t2 = $t1
    addi	$t0, $t0, 4
    j		max				# jump to findMax    

returnMax:
    li		$v0, 4		# $v0 = 4
    la		$a0, maxMesg		# 
    syscall

    li		$v0, 1		# $v0 = 1
    move 	$a0, $t2		# $a0 = $t3
    syscall

    j		reset				# jump to reset

minFunc:
    li		$t2, 200		# $t2 = 200
min:
    beq		$t0, 40, returnMin	# if $t0 == 40 then returnMin

    lw		$t1, arr($t0)		# 
    blt		$t1, $t2, smallerFound	# if $t1 < $t2 then smallerFound

    addi	$t0, $t0, 4			# $t0 = $t0 + 4
    j		min				# jump to min

smallerFound:
    move 	$t2, $t1		# $t2 = $t1
    addi	$t0, $t0, 4
    j		min			# jump to min  

returnMin:
    li		$v0, 4		# $v0 = 4
    la		$a0, minMesg		# 
    syscall

    li		$v0, 1		# $v0 = 1
    move 	$a0, $t2	
    syscall

    j		reset				# jump to reset

average:   
    beq		$t0, 40, returnAverage	# if $t0 == 40 then returnAverage

    lw		$t1, arr($t0)		# 
    add		$t3, $t3, $t1		# $t3 = $t3 + $t1
    
    addi	$t0, $t0, 4			# $t0 = $t0 + 4
    j		average				# jump to average

returnAverage:
    li		$t4, 10		# $t4 = 10
    div		$t3, $t4			# $t3 / $t4
    mflo	$t1					# $t1 = floor($t3 / $t4) 

    li		$v0, 4		# $v0 = 4
    la		$a0, avgMesg		# 
    syscall
    move 	$a0, $t1		# $a0 = $t1
    li		$v0, 1		# $v0 = 1
    syscall

    move 	$s1, $a0		# $s1 = $a0 # save for use in next function

    j		reset				# jump to reset

biggerThanAvg:
    beq		$t0, 40, returnBiggerThanAvg	# if $t0 == 40 then returnMax

    lw		$t1, arr($t0)		# 
    bgt		$t1, $s1, largerFoundAvg	# if $t1 > $t2 then BiggerNum

    addi	$t0, $t0, 4			# $t0 = $t0 + 4
    j		biggerThanAvg				# jump to max

largerFoundAvg:
    addi	$s2, $s2, 1			# $s2 = $s2 + 1
    addi	$t0, $t0, 4			# $t0 = $t0 + 4
    j		biggerThanAvg				# jump to findMax    

returnBiggerThanAvg:
    li		$v0, 4		# $v0 = 4
    la		$a0, largerThanAvgMesg		# 
    syscall

    li		$v0, 1		# $v0 = 1
    move 	$a0, $s2		
    syscall

    j		reset				# jump to reset

reset:
    li		$t0, 0		# $t0 = 0
    li		$t1, 0		# $t1 = 0
    li		$t2, 0		# $t2 = 0
    li		$t3, 0		# $t3 = 0
    li		$t4, 0		# $t4 = 0
    li		$t5, 0		# $t5 = 0
    
    li		$a0, 0		# $a0 = 0
    li		$v0, 0		# $v0 = 0

    jr		$ra					# jump to $ra

exit:
    li		$v0, 10		# $v0 = 10
    syscall

.data
arr: .space 40 # 4 bytes * 10 elements
space: .asciiz " "
maxMesg: .asciiz "\nMax: "
minMesg: .asciiz "\nMin: "
avgMesg: .asciiz "\nAvg: "
largerThanAvgMesg: .asciiz "\nAmount larger than avg: "
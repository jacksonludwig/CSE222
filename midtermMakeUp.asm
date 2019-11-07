
.text
main:
    li		$a1, 201		# $a1 = 201 upper bound

initialize:
    beq		$t0, 80, functionCalls	# if $t0 == 80 then functionCalls

    li		$a0, 1		# $a0 = 1 # optional seed
    li		$v0, 42		# $v0 = 42
    syscall

    subi	$a0, $a0, 100			# $a0 = $a0 - 100 subtract 100 to get to -100 to 100

    sw		$a0, myArray($t0)		# 
    addi	$t0, $t0, 4			# $t0 = $t0 + 4

    j		initialize				# jump to initialize

functionCalls:
    jal		reset				# jump to reset and save position to $ra

    li		$v0, 4		# $v0 = 4
    la		$a0, disArr1		# 
    syscall
    jal		displayArr				# jump to displarArr and save position to $ra

    jal		reset				# jump to reset and save position to $ra
    
    jal		max				# jump to max and save position to $ra
    
    jal		reset				# jump to reset and save position to $ra
    
    jal		min				# jump to min and save position to $ra
    
    jal		reset				# jump to reset and save position to $ra
    
    jal		sum				# jump to sum and save position to $ra

    jal		reset				# jump to reset and save position to $ra
        
    jal		typeCount				# jump to typeCount and save position to $ra
    
    jal		reset				# jump to reset and save position to $ra
    
    jal		reverse				# jump to reverse and save position to $ra

    j		exit				# jump to exit
    
reset:
    li		$t0, 0		# $t0 = 0
    li		$t1, 0		# $t1 = 0
    li		$t2, 0		# $t2 = 0
    li		$t3, 0		# $t3 = 0
    
    li		$a0, 0		# $a0 = 0
    li		$v0, 0		# $v0 = 0

    jr		$ra					# jump to $ra
    
displayArr:
    beq		$t0, 80, returnThisArray	# if $t0 == 80 then returnThisArray

    lw		$t1, myArray($t0)		# 
    move 	$a0, $t1		# $a0 = $t1
    li		$v0, 1		# $v0 = 1
    syscall

    addi	$t0, $t0, 4			# $t0 = $t0 + 4

    li		$v0, 4		# $v0 = 4
    la		$a0, space		# 
    syscall
    
    j		displayArr				# jump to displayArr

returnThisArray:
    jr		$ra					# jump to $ra

max:
    beq		$t0, 80, returnMax	# if $t0 == 80 then returnMax

    lw		$t1, myArray($t0)		# 
    bgt		$t1, $t2, largerFound	# if $t1 > $t2 then BiggerNum

    addi	$t0, $t0, 4			# $t0 = $t0 + 4
    j		max				# jump to max

largerFound:
    move 	$t2, $t1		# $t2 = $t1
    addi	$t0, $t0, 4
    j		max				# jump to findMax    

returnMax:
    li		$v0, 4		# $v0 = 4
    la		$a0, maxPrint		# 
    syscall

    li		$v0, 1		# $v0 = 1
    move 	$a0, $t2		# $a0 = $t3
    syscall

    jr		$ra					# jump to $ra
    
min:
    beq		$t0, 80, returnMin	# if $t0 == 80 then returnMin

    lw		$t1, myArray($t0)		# 
    blt		$t1, $t2, smallerFound	# if $t1 < $t2 then smallerFound

    addi	$t0, $t0, 4			# $t0 = $t0 + 4
    j		min				# jump to min

smallerFound:
    move 	$t2, $t1		# $t2 = $t1
    addi	$t0, $t0, 4
    j		min			# jump to min  

returnMin:
    li		$v0, 4		# $v0 = 4
    la		$a0, minPrint		# 
    syscall

    li		$v0, 1		# $v0 = 1
    move 	$a0, $t2		# $a0 = $t3
    syscall

    jr		$ra					# jump to $ra

sum:
    beq		$t0, 80, returnSum	# if $t0 == 80 then printSum

    lw		$t1, myArray($t0)		# 
    add		$t2, $t2, $t1		# $t2 = $t2 + $t1
    
    addi	$t0, $t0, 4			# $t0 = $t0 + 4
    j		sum			# jump to sum

returnSum:
    li		$v0, 4		# $v0 = 4
    la		$a0, sumPrint		# 
    syscall

    move	$a0, $t2		# $a0 = $t2
    li		$v0, 1		# $v0 = 1
    syscall

    jr		$ra					# jump to $ra
    
typeCount:
    beq		$t0, 80, returnTypes	# if $t0 == 80 then returnTypes
    lw		$t2, myArray($t0)		# 
    
    bgt		$t2, -1, iteratePos	# if $t2 > $0 then iteratePos

iterateNeg:
    addi	$t4, $t4, 1			# $t4 = $t4 + 1 # neg counter

    addi	$t0, $t0, 4			# $t0 = $t0 + 4
    j		typeCount				

iteratePos:
    addi	$t3, $t3, 1			# $t3 = $t3 + 1 # pos counter

    addi	$t0, $t0, 4			# $t0 = $t0 + 4
    j		typeCount				

returnTypes:
    li		$v0, 4		# $v0 = 4
    la		$a0, posAmountPrint		# 
    syscall
    li		$v0, 1		# $v0 = 1
    move 	$a0, $t3		# $a0 = $t3 
    syscall

    li		$v0, 4		# $v0 = 4
    la		$a0, negAmountPrint		# 
    syscall
    li		$v0, 1		# $v0 = 1
    move 	$a0, $t4		# $a0 = $t3 
    syscall    

    jr		$ra					# jump to $ra

reverse:
startPos:
    li		$t0, 76		# $t0 = 80
    li		$v0, 4		# $v0 = 4
    la		$a0, reversePrint		# 
    syscall
reverseArr:
    beq		$t0, 0, returnReverseThisArray	# if $t0 == 0 then returnThisArray

    lw		$t1, myArray($t0)		# 
    move 	$a0, $t1		# $a0 = $t1
    li		$v0, 1		# $v0 = 1
    syscall

    subi	$t0, $t0, 4			# $t0 = $t0 - 4

    li		$v0, 4		# $v0 = 4
    la		$a0, space		# 
    syscall
    
    j		reverseArr				# jump to displayArr

returnReverseThisArray:
    jr		$ra					# jump to $ra

exit:
    li		$v0, 10		# $v0 = 10
    syscall

.data
myArray: .space 80
disArr1: .asciiz "Random array: \n"
space:  .asciiz " "
maxPrint: .asciiz "\nMax: "
minPrint: .asciiz "\nMin: "
sumPrint: .asciiz "\nSum: "
posAmountPrint: .asciiz "\nPositives: "
negAmountPrint: .asciiz "\nNegatives: "
reversePrint:   .asciiz "\nReversed Array: \n"



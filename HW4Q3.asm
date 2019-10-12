
.text
main:
    li		$a1, 21		# $a1 = 20  # upper bound
    li		$t0, 0		# $t0 = 0   # element counter

initialize:
    beq		$t0, 40, findExtremes	# if $t0 == 40 then findExtremes

    li		$a0, 1		# $a0 = 1   # lower bound
    li		$v0, 42		# $v0 = 42
    syscall

    sw		$a0, myArray($t0)		# 
    addi	$t0, $t0, 4			# $t0 = $t0 + 4, go to next element position

    j		initialize				# jump to initialize
    
findExtremes:
    li		$t0, 0		# $t0 = 0   # reset counter
    li		$t3, 0		# $t3 = 0   # will hold largest
    
findMax:
    beq		$t0, 40, printMax	# if $t0 == 40 then printMax

    lw		$t1, myArray($t0)		# 
    bgt		$t1, $t3, BiggerNum	# if $t1 > $t3 then BiggerNum

    addi	$t0, $t0, 4			# $t0 = $t0 + 4
    j		findMax				# jump to findMax
    
BiggerNum:
    move 	$t3, $t1		# $t3 = $t1
    addi	$t0, $t0, 4
    j		findMax				# jump to findMax

printMax:
    li		$v0, 4		# $v0 = 4
    la		$a0, biggest		# 
    syscall

    li		$v0, 1		# $v0 = 1
    move 	$a0, $t3		# $a0 = $t3
    syscall

resetForMin:
    li		$t0, 0		# $t0 = 0   # reset counter
    li		$t3, 20		# $t3 = 20   # will hold smallest
    
findMin:
    beq		$t0, 40, printMin	# if $t0 == 40 then printMin

    lw		$t1, myArray($t0)		# 
    blt		$t1, $t3, SmallerNum	# if $t1 < $t3 then SmallerNum

    addi	$t0, $t0, 4			# $t0 = $t0 + 4
    j		findMin				# jump to findMin

SmallerNum:
    move 	$t3, $t1		# $t3 = $t1
    addi	$t0, $t0, 4
    j		findMin				# jump to findMin
    
printMin:
    li		$v0, 4		# $v0 = 4
    la		$a0, smallest		# 
    syscall

    li		$v0, 1		# $v0 = 1
    move 	$a0, $t3		# $a0 = $t3
    syscall   

resetForAverage:
    li		$t0, 0		# $t0 = 0   # reset counter
    li		$t3, 0		# $t3 = 0   # will hold current sum

findAverage:
    beq		$t0, 40, printAverage	# if $t0 == 40 then printAverage

    lw		$t1, myArray($t0)		# 
    add		$t3, $t3, $t1		# $t3 = $t3 + $t1
    
    addi	$t0, $t0, 4			# $t0 = $t0 + 4
    j		findAverage				# jump to findAverage

printAverage:
    li		$t4, 10		# $t4 = 10

    div		$t3, $t4			# $t3 / $t4
    mflo	$t5					# $t5 = floor($t3 / $t4) 
    mfhi	$t6					# $t6 = $t3 mod $t4 
    
    li		$v0, 4		# $v0 = 4
    la		$a0, average		# 
    syscall

    li		$v0, 1		# $v0 = 1
    move 	$a0, $t5		# $a0 = $t5
    syscall

resetForEvenOddCount:
    li		$t0, 0		# $t0 = 0   # reset counter
    li		$t3, 0		# $t3 = 0   # number of evens
    li		$t4, 0		# $t4 = 0   # number of odds

evenOddCount:
    beq		$t0, 40, printEvenOddCount	# if $t0 == 40 then printEvenOddCount
    lw		$t2, myArray($t0)		# 
    
    sra     $t5, $t2, 1
    sll     $t5, $t5, 1
    beq		$t5, $t2, iterateEven	# if $t5 == $t2 then iterateEven

iterateOdd:
    addi	$t4, $t4, 1			# $t4 = $t4 + 1

    addi	$t0, $t0, 4			# $t0 = $t0 + 4
    j		evenOddCount				# jump to evenOddCount

iterateEven:
    addi	$t3, $t3, 1			# $t3 = $t3 + 1

    addi	$t0, $t0, 4			# $t0 = $t0 + 4
    j		evenOddCount				# jump to evenOddCount

printEvenOddCount:
    li		$v0, 4		# $v0 = 4
    la		$a0, evens		# 
    syscall

    li		$v0, 1		# $v0 = 1
    move 	$a0, $t3		# $a0 = $t3
    syscall

    li		$v0, 4		# $v0 = 4
    la		$a0, odds		# 
    syscall

    li		$v0, 1		# $v0 = 1
    move 	$a0, $t4		# $a0 = $t3
    syscall

exit:
    li		$v0, 10		# $v0 = 10
    syscall

.data
myArray: .space  40 # 40 bytes; 10 elements
biggest:    .asciiz "\nThe largest number is: "
smallest:   .asciiz "\nThe smallest number is: "
average:   .asciiz "\nThe average of all the numbers is: "
evens:   .asciiz "\nThe number of evens is: "
odds:   .asciiz "\nThe number of odds is: "

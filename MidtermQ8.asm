
.text
main:
    li		$t0, 0		# $t0 = 0
    li		$t1, 0		# $t1 = 0
    
initialize:
    bge		$t0, 48, initialized	# if $t0 >= 48 then initialized
    
    sra     $t2, $t1, 1
    sll     $t2, $t2, 1

    sw		$t1, myArray($t0)		# 
    addi	$t1, $t1, 1			# $t1 = $t1 + 1
    
    addi	$t0, $t0, 4			# $t0 = $t0 + 4
    j		initialize				# jump to initialize

initialized:
    li		$t0, 0		# $t0 = 0
    li		$t1, 0		# $t1 = 0
    li		$t2, 0		# $t2 = 0
    li		$t3, 0		# $t3 = 0
    li		$t4, 0		# $t4 = 0

    jal		sumFunc				# jump to sumFunc and save position to $ra
    
    li		$v0, 4		# $v0 = 4
    la		$a0, showSum		# 
    syscall

    li		$v0, 1		# $v0 = 1
    move 	$a0, $t2		# $a0 = $t2
    syscall

    li		$t0, 0		# $t0 = 0
    li		$t1, 0		# $t1 = 0
    li		$t2, 0		# $t2 = 0
    li		$t3, 0		# $t3 = 0
    li		$t4, 0		# $t4 = 0
    
    j		exit				# jump to exit
    

sumFunc:
    bge		$t0, 48, return	# if $t0 >= 48 then endSum
    lw		$t1, myArray($t0)		# 
    add		$t2, $t2, $t1		# $t2 = $t2 + $t1

    addi	$t0, $t0, 4			# $t0 = $t0 + 4
    j		sumFunc				# jump to sumFunc
    
return:
    jr		$ra					# jump to $ra

exit:
    li		$v0, 10		# $v0 = 10
    syscall

.data
myArray:    .space 48
showSum:    .asciiz    "The sum is of all the values is: "




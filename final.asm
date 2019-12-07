#
# ***
#*   *
#*   *
# ***
#*   *
#*   *
# ***
#
#*****
#*****
#*****
#*****
#*****
#*****
#*****
#

.text
main:
    jal		initializeArray				# jump to initializeArray and save position to $ra
    jal		printArray				# jump to printArray and save position to $ra


    j exit

initializeArray:
    beq		$t0, 140, reset	#

    la		$t1, ' '		# 
    sw		$t1, myArray($t0)		# 
    addi	$t0, $t0, 4			# $t0 = $t0 + 4

    j		initializeArray				# jump to initializeArray

printArray:
    beq		$t0, 140, reset	# 

    lw		$t1, myArray($t0)		# 
    move 	$a0, $t1		# $a0 = $t1
    li		$v0, 11		# $v0 = 1
    syscall

    addi	$t0, $t0, 4			# $t0 = $t0 + 4

    addi	$t2, $t2, 1			# %t2 = $t2 + 1
    beq		$t2, 5, printNewLineForArray	# if $t2 == 5 then printNewLineForArray   
    
    j		printArray				
    
printNewLineForArray:
    li		$v0, 4		# $v0 = 4
    la		$a0, newLine		# 
    syscall
    li		$t2, 0		# $t2 = 0
    j		printArray				# jump to printArray



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
myArray: .space 140
newLine: .asciiz "\n"

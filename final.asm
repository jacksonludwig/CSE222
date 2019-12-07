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

enableSegmentA:
    la		$t1, '*'		# 
    li		$t0, 4		# $t0 = 4 
    sw		$t1, myArray($t0)		# 
    
    li		$t0, 8		# $t0 = 8 
    sw		$t1, myArray($t0)		# 

    li		$t0, 12		# $t0 = 12 
    sw		$t1, myArray($t0)		# 

    j		reset				# jump to reset
    
enableSegmentB:
    la		$t1, '*'		# 
    li		$t0, 36		# $t0 = 36 
    sw		$t1, myArray($t0)		# 
    
    li		$t0, 56		# $t0 = 56 
    sw		$t1, myArray($t0)		# 

    j		reset				# jump to reset

enableSegmentC:
    la		$t1, '*'		# 
    li		$t0, 96		# $t0 = 96 
    sw		$t1, myArray($t0)		# 
    
    li		$t0, 116		# $t0 = 116
    sw		$t1, myArray($t0)		# 

    j		reset				# jump to reset

enableSegmentD:
    la		$t1, '*'		# 
    li		$t0, 124		# $t0 = 124 
    sw		$t1, myArray($t0)		# 
    
    li		$t0, 128		# $t0 = 128
    sw		$t1, myArray($t0)		# 

    li		$t0, 132		# $t0 = 132
    sw		$t1, myArray($t0)		# 

    j		reset				# jump to reset
    
enableSegmentE:
    la		$t1, '*'		# 
    li		$t0, 80 	# $t0 = 80
    sw		$t1, myArray($t0)		# 
    
    li		$t0, 100		# $t0 = 100
    sw		$t1, myArray($t0)		# 

    j		reset				# jump to reset
        
enableSegmentF:
    la		$t1, '*'		# 
    li		$t0, 20		# $t0 = 20 
    sw		$t1, myArray($t0)		# 
    
    li		$t0, 40		# $t0 = 40 
    sw		$t1, myArray($t0)		# 

    j		reset				# jump to reset

enableSegmentG:
    la		$t1, '*'		# 
    li		$t0, 64		# $t0 = 64 
    sw		$t1, myArray($t0)		# 
    
    li		$t0, 68		# $t0 = 68
    sw		$t1, myArray($t0)		# 

    li		$t0, 72		# $t0 = 72
    sw		$t1, myArray($t0)		# 

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
myArray: .space 140
newLine: .asciiz "\n"

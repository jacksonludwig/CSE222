# Jackson Ludwig
# CSE222 Final

# always spaces (* 4):
# 0,4
# 6,7,8
# 11,12,13
# 15,19
# 21,22,23
# 26,27,28
# 30,35

# segments (* 4):
# a: 1,2,3
# b: 9, 14
# c: 24, 29
# d: 31, 32, 33
# e: 20, 25
# f: 5, 10
# g: 16, 17, 18

.text
main:
    jal		initializeArray				# jump to initializeArray and save position to $ra

menu:
    la		$a0, menuTitle		# 
    li		$v0, 4		# $v0 = 4
    syscall

    li		$v0, 5		# $v0 = 5
    syscall
    
    beq		$v0, -1, exit	# if $v0 == -1 then exit
    beq		$v0, 0, display0	# if $v0 == 0 then display0
    beq		$v0, 1, display1	# if $v0 == 0 then display1
    beq		$v0, 2, display2	# if $v0 == 0 then display2
    beq		$v0, 3, display3	# if $v0 == 0 then display3
    beq		$v0, 4, display4	# if $v0 == 0 then display4
    beq		$v0, 5, display5	# if $v0 == 0 then display5
    beq		$v0, 6, display6	# if $v0 == 0 then display6
    beq		$v0, 7, display7	# if $v0 == 0 then display7
    beq		$v0, 8, display8	# if $v0 == 0 then display8
    beq		$v0, 9, display9	# if $v0 == 0 then display9
    beq		$v0, 10, display10	# if $v0 == 0 then display10
    beq		$v0, 11, display11	# if $v0 == 0 then display11
    beq		$v0, 12, display12	# if $v0 == 0 then display12
    beq		$v0, 13, display13	# if $v0 == 0 then display13
    beq		$v0, 14, display14	# if $v0 == 0 then display14
    beq		$v0, 15, display15	# if $v0 == 0 then display15

    la		$a0, invalidInput		# 
    li		$v0, 4		# $v0 = 4
    syscall

    j exit

initializeArray:
    beq		$t0, 140, reset	#

    la		$t1, ' '		# 
    sw		$t1, myArray($t0)		# 
    addi	$t0, $t0, 4			# $t0 = $t0 + 4

    j		initializeArray				# jump to initializeArray

display0:
    jal		enableSegmentA				# jump to enableSegmentA and save position to $ra
    jal		enableSegmentB				# jump to enableSegmentB and save position to $ra
    jal		enableSegmentC				# jump to enableSegmentC and save position to $ra
    jal		enableSegmentD				# jump to enableSegmentD and save position to $ra
    jal		enableSegmentE				# jump to enableSegmentE and save position to $ra
    jal		enableSegmentF				# jump to enableSegmentF and save position to $ra

    jal		printArray				# jump to printArray and save position to $ra
    jal		initializeArray				# jump to initializeArray and save position to $ra
    j		menu				# jump to menu

display1:
    jal		enableSegmentB				# jump to enableSegmentB and save position to $ra
    jal		enableSegmentC				# jump to enableSegmentC and save position to $ra

    jal		printArray				# jump to printArray and save position to $ra
    jal		initializeArray				# jump to initializeArray and save position to $ra
    j		menu				# jump to menu

display2:
    jal		enableSegmentA				# jump to enableSegmentA and save position to $ra
    jal		enableSegmentB				# jump to enableSegmentB and save position to $ra
    jal		enableSegmentD				# jump to enableSegmentD and save position to $ra
    jal		enableSegmentE				# jump to enableSegmentE and save position to $ra
    jal		enableSegmentG				# jump to enableSegmentG and save position to $ra

    jal		printArray				# jump to printArray and save position to $ra
    jal		initializeArray				# jump to initializeArray and save position to $ra
    j		menu				# jump to menu

display3:
    jal		enableSegmentA				# jump to enableSegmentA and save position to $ra
    jal		enableSegmentB				# jump to enableSegmentB and save position to $ra
    jal		enableSegmentC				# jump to enableSegmentC and save position to $ra
    jal		enableSegmentD				# jump to enableSegmentD and save position to $ra
    jal		enableSegmentG				# jump to enableSegmentG and save position to $ra

    jal		printArray				# jump to printArray and save position to $ra
    jal		initializeArray				# jump to initializeArray and save position to $ra
    j		menu				# jump to menu

display4:
    jal		enableSegmentB				# jump to enableSegmentB and save position to $ra
    jal		enableSegmentC				# jump to enableSegmentC and save position to $ra
    jal		enableSegmentF				# jump to enableSegmentF and save position to $ra    
    jal		enableSegmentG				# jump to enableSegmentG and save position to $ra

    jal		printArray				# jump to printArray and save position to $ra
    jal		initializeArray				# jump to initializeArray and save position to $ra
    j		menu				# jump to menu

display5:
    jal		enableSegmentA				# jump to enableSegmentA and save position to $ra
    jal		enableSegmentC				# jump to enableSegmentC and save position to $ra
    jal		enableSegmentD				# jump to enableSegmentD and save position to $ra
    jal		enableSegmentF				# jump to enableSegmentF and save position to $ra
    jal		enableSegmentG				# jump to enableSegmentG and save position to $ra

    jal		printArray				# jump to printArray and save position to $ra
    jal		initializeArray				# jump to initializeArray and save position to $ra
    j		menu				# jump to menu

display6:
    jal		enableSegmentA				# jump to enableSegmentA and save position to $ra
    jal		enableSegmentC				# jump to enableSegmentC and save position to $ra
    jal		enableSegmentD				# jump to enableSegmentD and save position to $ra
    jal		enableSegmentE				# jump to enableSegmentE and save position to $ra
    jal		enableSegmentF				# jump to enableSegmentF and save position to $ra
    jal		enableSegmentG				# jump to enableSegmentG and save position to $ra

    jal		printArray				# jump to printArray and save position to $ra
    jal		initializeArray				# jump to initializeArray and save position to $ra
    j		menu				# jump to menu

display7:
    jal		enableSegmentA				# jump to enableSegmentA and save position to $ra
    jal		enableSegmentB				# jump to enableSegmentB and save position to $ra
    jal		enableSegmentC				# jump to enableSegmentC and save position to $ra

    jal		printArray				# jump to printArray and save position to $ra
    jal		initializeArray				# jump to initializeArray and save position to $ra
    j		menu				# jump to menu

display8:
    jal		enableSegmentA				# jump to enableSegmentA and save position to $ra
    jal		enableSegmentB				# jump to enableSegmentB and save position to $ra
    jal		enableSegmentC				# jump to enableSegmentC and save position to $ra
    jal		enableSegmentD				# jump to enableSegmentD and save position to $ra
    jal		enableSegmentE				# jump to enableSegmentE and save position to $ra
    jal		enableSegmentF				# jump to enableSegmentF and save position to $ra
    jal		enableSegmentG				# jump to enableSegmentG and save position to $ra

    jal		printArray				# jump to printArray and save position to $ra
    jal		initializeArray				# jump to initializeArray and save position to $ra
    j		menu				# jump to menu

display9:
    jal		enableSegmentA				# jump to enableSegmentA and save position to $ra
    jal		enableSegmentB				# jump to enableSegmentB and save position to $ra
    jal		enableSegmentC				# jump to enableSegmentC and save position to $ra
    jal		enableSegmentF				# jump to enableSegmentF and save position to $ra
    jal		enableSegmentG				# jump to enableSegmentG and save position to $ra

    jal		printArray				# jump to printArray and save position to $ra
    jal		initializeArray				# jump to initializeArray and save position to $ra
    j		menu				# jump to menu

display10:
    jal		enableSegmentA				# jump to enableSegmentA and save position to $ra
    jal		enableSegmentB				# jump to enableSegmentB and save position to $ra
    jal		enableSegmentC				# jump to enableSegmentC and save position to $ra
    jal		enableSegmentE				# jump to enableSegmentE and save position to $ra
    jal		enableSegmentF				# jump to enableSegmentF and save position to $ra
    jal		enableSegmentG				# jump to enableSegmentG and save position to $ra

    jal		printArray				# jump to printArray and save position to $ra
    jal		initializeArray				# jump to initializeArray and save position to $ra
    j		menu				# jump to menu

display11:
    jal		enableSegmentA				# jump to enableSegmentA and save position to $ra
    jal		enableSegmentB				# jump to enableSegmentB and save position to $ra
    jal		enableSegmentC				# jump to enableSegmentC and save position to $ra
    jal		enableSegmentD				# jump to enableSegmentD and save position to $ra
    jal		enableSegmentE				# jump to enableSegmentE and save position to $ra
    jal		enableSegmentF				# jump to enableSegmentF and save position to $ra
    jal		enableSegmentG				# jump to enableSegmentG and save position to $ra

    jal		printArray				# jump to printArray and save position to $ra
    jal		initializeArray				# jump to initializeArray and save position to $ra
    j		menu				# jump to menu

display12:
    jal		enableSegmentA				# jump to enableSegmentA and save position to $ra
    jal		enableSegmentD				# jump to enableSegmentD and save position to $ra
    jal		enableSegmentE				# jump to enableSegmentE and save position to $ra
    jal		enableSegmentF				# jump to enableSegmentF and save position to $ra

    jal		printArray				# jump to printArray and save position to $ra
    jal		initializeArray				# jump to initializeArray and save position to $ra
    j		menu				# jump to menu

display13:
    jal		enableSegmentA				# jump to enableSegmentA and save position to $ra
    jal		enableSegmentB				# jump to enableSegmentB and save position to $ra
    jal		enableSegmentC				# jump to enableSegmentC and save position to $ra
    jal		enableSegmentD				# jump to enableSegmentD and save position to $ra
    jal		enableSegmentE				# jump to enableSegmentE and save position to $ra
    jal		enableSegmentF				# jump to enableSegmentF and save position to $ra

    jal		printArray				# jump to printArray and save position to $ra
    jal		initializeArray				# jump to initializeArray and save position to $ra
    j		menu				# jump to menu

display14:
    jal		enableSegmentA				# jump to enableSegmentA and save position to $ra
    jal		enableSegmentD				# jump to enableSegmentD and save position to $ra
    jal		enableSegmentE				# jump to enableSegmentE and save position to $ra
    jal		enableSegmentF				# jump to enableSegmentF and save position to $ra
    jal		enableSegmentG				# jump to enableSegmentG and save position to $ra

    jal		printArray				# jump to printArray and save position to $ra
    jal		initializeArray				# jump to initializeArray and save position to $ra
    j		menu				# jump to menu

display15:
    jal		enableSegmentA				# jump to enableSegmentA and save position to $ra
    jal		enableSegmentE				# jump to enableSegmentE and save position to $ra
    jal		enableSegmentF				# jump to enableSegmentF and save position to $ra
    jal		enableSegmentG				# jump to enableSegmentG and save position to $ra

    jal		printArray				# jump to printArray and save position to $ra
    jal		initializeArray				# jump to initializeArray and save position to $ra
    j		menu				# jump to menu

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
menuTitle: .asciiz "Enter a value from 0-15 to display through the 7-segment decoder, or -1 to quit:\n"
invalidInput:   .asciiz "\nInput must be an integer from 0 to 15 (inclusive), or -1 to quit. The program will now exit."

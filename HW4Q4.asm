# recursion in MIPS not reviewed in class

.text
main:
    li		$t0, 0		# $t0 = 0   # array num counter

    li		$t2, 1		# $t2 = 1   # fibo
    li		$t3, 1		# $t3 = 1   # fiboPrev
    li		$t5, 0		# $t5 = 0   # temp
    
for_loop:
    beq		$t0, 80, exit	# if $t0 == 80 then exit
    
    move 	$t5, $t2		# $t5 = $t2
    add		$t2, $t2, $t3		# $t2 = $t2 + $t3
    move 	$t3, $t5		# $t3 = $t5
    
    sw		$t2, myArray($t0)		# 
    
    li		$v0, 1		# $v0 = 1
    move 	$a0, $t2		# $a0 = $t2
    syscall

    li		$v0, 4		# $v0 = 4
    la		$a0, newline		# 
    syscall

    addi	$t0, $t0, 4			# $t0 = $t0 + 4
    j		for_loop				# jump to for_loop

exit:
    li		$v0, 10		# $v0 = 10
    syscall

.data
myArray: .space  80 # 80 bytes; 20 elements
newline:    .asciiz "\n"


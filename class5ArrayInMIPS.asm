# make an array filled with random numbers
# issue with initialzing size

.text
main:
    #   initialize array
    #   ----------------------
    la		$a2, array		# 
    lw		$t1, arraySize		# 
    li		$t0, 0		# $t0 = 0
    li		$a1, 10		# max random
    
loop:
    slt     $t2, $t0, $t1
    beq		$t2, 1, arrayCreated	# if $t2 == 1 then label
    
    li		$a0, 1		# $a0 = 1
    li		$v0, 42		# $v0 = 42, random number gen
    syscall

    sw		$0, 0($a2)		# $a2 is different each iteration
    addi	$a2, $a2, 4			# $a2 = $a2 + 4, word is 4 bytes
    addi	$t0, $t0, 1			# $t0 = $t0 + 1, increment index by 1

    j		loop				# jump to loop

arrayCreated:
exit:
    li		$v0, 10		# $v0 = 10
    syscall

.data
array:  .space  40 # allocate 400 bytes for the "array"
arraySize:    .space 10 # each "element" is 4 bytes; space for 100 elements
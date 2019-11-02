
.text
main:
    li		$v0, 4		# $v0 = 4
    la		$a0, prompt		# 
    syscall

    li		$v0, 5		# $v0 = 5
    syscall

    move 	$t0, $v0		# $t0 = $v0

    sra     $t1, $t0, 1
    sll     $t1, $t1, 1

    beq		$t0, $t1, even	# if $t0 == $t1 then even
    li		$v0, 4		# $v0 = 4
    la		$a0, odd_msg		# 
    syscall

    j		exit				# jump to exit

even:
    li		$v0, 4		# $v0 = 4
    la		$a0, even_msg		# 
    syscall

exit:
    li		$v0, 10		# $v0 = 10
    syscall

.data
prompt: .asciiz "Enter an integer number: "
even_msg:   .asciiz "\nThe number is even."
odd_msg:   .asciiz "\nThe number is odd."


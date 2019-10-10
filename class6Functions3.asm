

.text
main:

li		$v0, 4		# $v0 = 4
la		$a0, msg		# 
syscall

li		$v0, 5		# $v0 = 5
syscall
move 	$t0, $v0		# $t0 = $v0 

li		$v0, 5		# $v0 = 5
syscall
move 	$t1, $v0		# $t1 = $v0

jal		function				# jump to function and save position to $ra

li		$v0, 10		# $v0 = 10
syscall

function:
    bgt		$t0, $t1, firstBigger	# if $t0 > $t1 then firstBigger
    li		$v0, 4		# $v0 = 4
    la		$a0, secondLarger		# 
    syscall
    jr		$ra					# jump to $ra

firstBigger:
    li		$v0, 4		# $v0 = 4
    la		$a0, firstLarger		# 
    syscall
    jr		$ra					# jump to $ra
    
.data
msg:    .asciiz "Enter two numbers\n"
firstLarger:    .asciiz "the first value is larger"
secondLarger:   .asciiz "the second value is larger"

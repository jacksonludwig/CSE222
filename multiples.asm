# Jackson
# multiples.asm
# print out multiples of A from A to A×B. 
# Registers used:
#       t0 -- holds S (sentinel value A * B)
#       t1 -- holds first number
#       t2 -- holds second number
#       t3 -- stores m, current mult of A

    .text
main:
    li		$v0, 5		# $v0 = 5
    syscall
    move 	$t1, $v0		# $t1 = $v0 -- get first number and put into $t1
    
    li		$v0, 5		# $v0 = 5
    syscall
    move 	$t2, $v0		# $t2 = $v0 -- get second number and put into $t2
    
    # multiply $t1 and $t2
    blez    $t2, exit   # if B <= 0, exit
    mul     $t0, $t1, $t2   # S = A * B
    move 	$t3, $t1		# m = A
    
    # loop
loop:
    move 	$a0, $t3		# $a0 = $t0
    li		$v0, 1		# $v0 = 1
    syscall     # prints number in $a0

    beq		$t0, $t3, endloop	# if $t0 (m) == $t3 (S) then endloop
    add		$t3, $t3, $t1		# otherwise, $t3 (m) = $t3 (m) + $t1 (A)

    la		$a0, space_char		# prepares space char for printing
    li		$v0, 4		# $v0 = 4 printstring
    syscall
    
    b		loop			# branch to loop
    
endloop:
    la		$a0, newline		# print new line
    li		$v0, 4		# $v0 = 4
    syscall

exit:
    li		$v0, 10		# $v0 = 10
    syscall # quit
    
    .data
space_char:     .asciiz " "
newline:        .asciiz "\n"
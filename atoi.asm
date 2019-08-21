# Jackson
# atoi.asm
# change an inputted ASCII string into an integer and prints it
# Registers used: 
#       $t0 -- S
#       $t1 -- the character pointed to by S
#       $t2 -- current sum

    .text 
main:

    # read the string S
    la		$a0, string_space		
    li		$a1, 1024		        # $a1 = 1024
    li		$v0, 8		            # $v0 = 8, "read_string" syscall is 8 in $v0
    syscall
    
    la		$t0, string_space		# Initialize S
    la		$t2, 0		            # Intitialize sum to 0

sum_loop:
    lb		$t1, ($t0)		        # load the byte at address S into $t1
    addu    $t0, $t0, 1             # and increment S

    # USES 10 INSTEAD OF '\n' TO AVOID SPIM BUG #
    beq		$t1, 10, end_sum_loop	# if $t1 == 10 then go to end_sum_loop

    mul     $t2, $t2, 10            # $t2 = $t2 * 10, mult by 10 to move to next number place.

    sub		$t1, $t1, '0'		    # $t1 = $t1 - '0'
    add		$t2, $t2, $t1		    # $t2 = $t2 + $t1, add number to end of current sum
    
    b		sum_loop			    # branch to sum_loop (repeat loop)

end_sum_loop:
    move 	$a0, $t2		        # $a0 = $t2
    li		$v0, 1		            # $v0 = 1
    syscall                         # prints out $t2, the number representing the string.
    
    la		$a0, newline	        # $a0 = newline
    li		$v0, 4		            # $v0 = 4
    syscall                         # prints a newline

exit:
    li		$v0, 10		            # $v0 = 10
    syscall

    .data 
string_space:   .space 1024         # set aside 1024 bytes for the string
newline:        .asciiz "\n"

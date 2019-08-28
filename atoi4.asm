# Jackson
# atoi4.asm
# Change an inputted ASCII string into an integer and prints it, and account for negative. 
# Account for erroneous characters (non digits), by breaking out if they appear. Account
# for overflows during multiplication.
# Registers used: 
#       $t0 -- S
#       $t1 -- the character pointed to by S
#       $t2 -- current sum
#       $t3 -- positive or negative sign
#       $t4 -- contains constant 10

    .text 
main:

    # read the string S
    la		$a0, string_space		
    li		$a1, 1024		        # $a1 = 1024
    li		$v0, 8		            # $v0 = 8, "read_string" syscall is 8 in $v0
    syscall
    
    la		$t0, string_space		# Initialize S
    la		$t2, 0		            # Intitialize sum to 0

    li		$t4, 10		            # put 10 in $t4 for moving over one decimal place later
    
get_sign:
    li		$t3, 1		            # $t3 = 1
    lb		$t1, ($t0)		        # grab the "sign"
    bne		$t1, '-', positive	    # if $t1 != '-' then positive (do nothing).
    li		$t3, -1		            # $t3 = -1, otherwise set $t3 to -1, and
    addu    $t0, $t0, 1             # skip over the sign

positive:                           # for clarity
sum_loop:
    lb		$t1, ($t0)		        # load the byte at address S into $t1
    addu    $t0, $t0, 1             # and increment S

    # USES 10 INSTEAD OF '\n' TO AVOID SPIM BUG #
    beq		$t1, 10, end_sum_loop	# if $t1 == 10 then go to end_sum_loop

    blt		$t1, '0', end_sum_loop	# if $t1 < '0' then go to end_sum_loop
    bgt		$t1, '9', end_sum_loop	# if $t1 > '9' then go to end_sum_loop

    mult	$t2, $t4			    # $t2 * $t4, same as earlier. (mult always stores in $t5).
    mfhi    $t5                     # copy hi to $t5
    bnez    $t5, overflow           # report overflow if there is one by checking in high.
    mflo	$t2					    # copy Lo to $t2 to get result of multiplication
    blt		$t2, $0, overflow	    # second overflow check to see if answer is negative.

    sub		$t1, $t1, '0'		    # $t1 = $t1 - '0'
    add		$t2, $t2, $t1		    # $t2 = $t2 + $t1, add number to end of current sum
    
    b		sum_loop			    # branch to sum_loop (repeat loop)

end_sum_loop:
    mul     $t2, $t2, $t3           # set the sign properly
    
    move 	$a0, $t2		        # $a0 = $t2
    li		$v0, 1		            # $v0 = 1
    syscall                         # prints out $t2, the number representing the string.
    
    la		$a0, newline	        # $a0 = newline
    li		$v0, 4		            # $v0 = 4
    syscall                         # prints a newline

    b		exit			        # branch to exit to skip unneeded overflow message.
    
overflow:
    la		$a0, overflow_report	# print error
    li		$v0, 4		            # $v0 = 4 to print text
    syscall
    
exit:
    li		$v0, 10		            # $v0 = 10
    syscall

    .data 
string_space:   .space 1024         # set aside 1024 bytes for the string
newline:        .asciiz "\n"
overflow_report:    .asciiz "There was an overflow error so the program exited.\n"

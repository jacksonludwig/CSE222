# Jackson
# palindrome.asm
# determines if a word is a palindrome 
# Registers used: 
#       $t1 -- A
#       $t2 -- B
#       $t3 -- character at address A
#       $t4 -- character at address B
#       $v0 -- syscall parameter / return value
#       $a0 -- syscall parameter
#       $a1 -- syscall parameter

    .text 
main:

    # read the string S
    la		$a0, string_space		
    li		$a1, 1024		# $a1 = 1024
    li		$v0, 8		# $v0 = 8, "read_string" syscall is 8 in $v0
    syscall
    
    la		$t1, string_space		# A = S
    
    la		$t2, string_space		# we need to move B to the end of the string:
length_loop:
    lb		$t3, ($t2)		        # load the byte at B into $t3.
    beqz    $t3, end_length_loop    # if  $t3 == 0, branch out of the loop.
    addu    $t2, $t2, 1             # otherwise, increment B,
    b		length_loop			    # branch to length_loop, and repeat.

end_length_loop:
    subu    $t2, $t2, 2             # subtract 2 to move B back past the "\0" and "\n"

test_loop:
    bge		$t1, $t2, is_palindrome	# if A >= B, then it's a palindrome
    
    lb		$t3, ($t1)		            # load the byte at address A into $t3,
    lb		$t4, ($t2)		            # load the byte at address B into $t4.
    bne		$t3, $t4, not_palindrome	# if $t3 != $t4, then not a palindrome.
    
    addu    $t1, $t1, 1                 # increment A,
    subu    $t2, $t2, 1                 # decrement B,
    b		test_loop			        # and repeat the loop

is_palindrome:                          # print the is_palindrome_msg, and exit
    la		$a0, is_palidrome_msg		
    li      $v0, 4
    syscall
    b		exit			# branch to exit
    
not_palindrome:                          # print the not_palindrome_msg, and exit
    la		$a0, not_palidrome_msg		
    li      $v0, 4
    syscall
    b		exit			# branch to exit

exit:
    li		$v0, 10		# $v0 = 10
    syscall

    .data 
string_space:   .space 1024 # set aside 1024 bytes for the string
is_palidrome_msg:   .asciiz "The string is a palindrome.\n"
not_palidrome_msg:  .asciiz "The string is not a palidrome.\n"

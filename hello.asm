# Jackson
# hello.asm
# returns "hello world" 
# Registers used: 
#       
    .text # put things into text segment
main:
    la		$a0, hello_msg		# loads address of hello_msg into $a0
    li		$v0, 4		# $v0 = 4, A syscall with 4 in $v0 prints string.
    syscall

    li		$v0, 10		# $v0 = 10
    syscall # quit
    
    .data # pt things into data segment
hello_msg: .asciiz "Hello World\n" # stores "Hello world" in the hello_msg address
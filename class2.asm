

.text
main:
    li		$v0, 8		# $v0 = 8
    la		$a0, buffer		# input text goes here
    lw		$a1, buffersize		# read at most 80 bytes
    syscall

    li		$v0, 4		# $v0 = 4
    la		$a0, buffer		# 
    syscall

    li		$v0, 10		            # $v0 = 10
    syscall

.data
msg: .asciiz "Hello"
buffer: .space 81 # 80 bytes
buffersize: .word 80

    

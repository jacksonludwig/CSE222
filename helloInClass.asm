# Jackson
# helloInClass.asm
# classwork hello world
# Registers used:
#
#
#

.text
main:
    li		$v1, 1		# $v1 = 1
    la		$a0, msg		# $a0 = 0
    syscall

    lw		$t0, var1		# 
    lw		$t1, var2		# 
    add		$s0, $t1, $t0		# $s0 = $t1 + 0t2
    sw		$s0, var3		# 
    
    li		$v0, 10		# $t1 = 10
    syscall

.data
msg:    .asciiz "Hello World"
var1:   .word 100 # word is 4 bytes long
var2:   .word 200
var3:   .word 0

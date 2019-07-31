# Jackson
# add.asm
# computes the sum of 1 and 2, with result in $t0
# Registers used:
#       t0 -- holds result
#       t1 -- holds constant 1
#       t2 -- holds constant 2

main:   # SPIM starts execution at main
    li		$t1, 1		# $t1 = 1
    li		$t2, 2		# $t2 = 2
    add		$t0, $t1, $t2		# $t0 = $t1 + $t2

    li		$v0, 10		# $v0 = 10, 10 for exit
    syscall     # $v0 has 10 -> exit
    

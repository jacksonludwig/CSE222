
.text

main:
    la		$a0, space		#

    lui     $t0, 0x1122     # load 0x11223344 to register $t0
    ori     $t0, $t0, 0x3344

    sw		$t0, 0($a0)		# store contents in $t0 to memory address (($a0) + 0)
    lb		$t1, 3($a0)		# load one byte from the memory to $t1

    li		$v0, 10		# $v0 = 10
    syscall

.data
space: .space 1024

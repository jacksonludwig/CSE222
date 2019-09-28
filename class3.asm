

.text
main:
    li		$v0, 4		# $v0 = 4
    la		$a0, msg		
    syscall

    li		$v0, 5		# $v0 = 5, input integer to be saved in $v0
    syscall

    lui     $t0, 0x0    # something wrong here
    ori     $t1, $t1, 0x00ff # filter to save last 8 bits (all 1's, so bitwise and "copies")
    and     $t1, $v0, $t0 

    # sll     $t1, $t1, 1
    srl     $t1, $t1, 1    

    move 	$a0, $t1		# $a0 = $t1
    li		$v0, 1		# $v0 = 1
    syscall

    li		$v0, 10		# $v0 = 10
    syscall

.data
msg: .asciiz "Enter a number"
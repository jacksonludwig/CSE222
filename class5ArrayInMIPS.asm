
.text
main:
    addi	$s0, $zero, 4			# $s0 = $0 + 4
    addi	$s1, $zero, 10			# $s1 = $0 + 10
    addi	$s2, $zero, 12			# $s2 = $0 + 12

    # Index (offset) = $t0
    addi	$t0, $zero, 0			# $t0 = $0 + $0
    sw		$s0, myArray($t0)		# $s0 value stored at first position (0-4)

    # Index = $t0 + 4
    addi	$t0, $t0, 4			# $t0 = $t0 + 4
    sw		$s1, myArray($t0)		# $s0 value stored at second position (4-8)
    
    # Index = $t0 + 8
    addi	$t0, $t0, 4			# $t0 = $t0 + 4
    sw		$s2, myArray($t0)		# $s0 value stored at third position (8-12)
    
    lw		$t6, myArray($zero)		# load first value of array into $t6
    
    li		$v0, 1		# $v0 = 1
    addi	$a0, $t6, 0			# $a0 = $t6 + 0
    syscall

exit:
    li		$v0, 10		# $v0 = 10
    syscall

.data
myArray: .space  12


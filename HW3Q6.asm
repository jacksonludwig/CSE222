
.text
li		$t0, 100		# $t0 = 100

andi     $t1, $t0, 0x0F
andi     $t2, $t0, 0xF0

sll     $t1, $t1, 4
sra     $t2, $t2, 4

or      $t3, $t1, $t2

move 	$a0, $t3		# $a0 = $t1

li		$v0, 1		# $v0 = 1
syscall

li		$v0, 10		# $v0 = 10
syscall
.data

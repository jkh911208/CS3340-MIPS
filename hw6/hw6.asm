###

###
.data

pi:	.float 3.14
n_slice:.float 8.0
small_r:	.float 5.0
big_r:	.float 8.0
zero:	.float 0
start:	.asciiz "a. Change pizza size\nb. Calculate the size of slices eaten.\nc. quit\nInput : "
size_1:	.asciiz "Current Small : "
size_2:	.asciiz "Current Big : "
size_3:	.asciiz "New Radius for small size pizza : "
size_4:	.asciiz "New Radius for big size pizza : "
nl:	.asciiz "\n"
calc_1:	.asciiz "Number of small slice(s): "
calc_2:	.asciiz "Number of big slice(s): "
calc_3:	.asciiz "Eaten pizza in square inches : "


.text
	lwc1 $f10, zero # zero in $f10
	lwc1 $f1, small_r # $f1 -> inch for small pizza, default 5
	lwc1 $f2, big_r # $f2 -> inch for big pizza, default 8
	lwc1 $f3, pi # 3.14
	lwc1 $f4, n_slice # 8, how many slices in one pizza
	

main:
	
	li $v0, 4
	la $a0, start
	syscall

	li $v0, 12
	syscall
	move $t0, $v0
	
	beq $t0, 'a' size
	beq $t0, 'b' calc
	beq $t0, 'c' exit

size:

	li $v0, 4
	la $a0, nl
	syscall

	li $v0, 4
	la $a0, size_1
	syscall

	li $v0, 2
	add.s $f12, $f10, $f1
	syscall
	
	li $v0, 4
	la $a0, nl
	syscall
	
	li $v0, 4
	la $a0, size_2
	syscall

	li $v0, 2
	add.s $f12, $f10, $f2
	syscall
	
	li $v0, 4
	la $a0, nl
	syscall

	li $v0, 4
	la $a0, size_3
	syscall

	li $v0, 6
	syscall
	add.s $f1, $f10, $f0
	
	li $v0, 4
	la $a0, size_4
	syscall

	li $v0, 6
	syscall
	add.s $f2, $f10, $f0
	
	li $v0, 4
	la $a0, nl
	syscall
	j main

calc:

	li $v0, 4
	la $a0, nl
	syscall
	
	li $v0, 4
	la $a0, calc_1
	syscall

	li $v0, 6
	syscall
	mov.s $f5, $f0

	li $v0, 4
	la $a0, calc_2
	syscall

	li $v0, 6
	syscall
	mov.s $f6, $f0
	
	mul.s $f7, $f1, $f1
	mul.s $f7, $f7, $f3
	mul.s $f7, $f7, $f5
	div.s $f7, $f7, $f4
	
	mul.s $f8, $f2, $f2
	mul.s $f8, $f8, $f3
	mul.s $f8, $f8, $f6
	div.s $f8, $f8, $f4
	
	li $v0, 4
	la $a0, calc_3
	syscall
	
	li $v0, 2
	add.s $f12, $f7, $f8
	syscall
	
	li $v0, 4
	la $a0, nl
	syscall
	
	j main

exit:
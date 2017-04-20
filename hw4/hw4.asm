	.data 
output_main:	.asciiz "Give me your zip code (0 to stop):  "
output_print:	.asciiz "the sum of all digits in your zip code is: "
nl:	.asciiz "\n"
return:	$ra


# text segment
	.text
main:
	# Start printing text for output
	la $a0, output_main
	li $v0, 4
	syscall
	
	# read the zip code from user and store in $t1, No error checking
	li $v0, 5
	syscall
	move $t1, $v0 
	
	# if input integer is 0 exit the program
	beqz $t1, exit
	# $s1 is the how many digits of the zip code, 5 digits for U.S zip code
	li $s1, 5
	# $s2 use when div
	li $s2, 10
	# $s0 is sum of the every digits
	li $s0, 0
	
	jal loop
	jal print
	j main
	
loop:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
	beq $s1, $zero, loop_done
	
	addi $s1, $s1, -1
	jal loop
	
	div $t1, $s2
	mfhi $t4
	add $s0, $s0, $t4
	mflo $t1
	

loop_done:

	lw $ra, 0($sp)
	addi $sp, $sp, 4
	
	jr $ra
	
	
print:
	# print out the result of calculation
	la $a0, output_print
	li $v0, 4
	syscall
	
	move $a0, $s0
	li $v0, 1
	syscall
	
	la $a0, nl
	li $v0, 4
	syscall
	
	jr $ra
	
exit:

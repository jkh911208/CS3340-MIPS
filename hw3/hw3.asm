	.data 
output_main:	.asciiz "Give me your zip code (0 to stop):  "
output_print:	.asciiz "the sum of all digits in your zip code is: "
nl:	.asciiz "\n"


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
	# $t2 is the how many digits of the zip code, 5 digits for U.S zip code
	li $t2, 5
	# $t3 use when div
	li $t3, 10
	# $s1 is sum of the every digits
	li $s1, 0
	
loop:
	# add every digit of zip, after calculation move to print:
	beqz $t2, print
	div $t1, $t3
	mfhi $t4
	add $s1, $s1, $t4
	mflo $t1
	addi $t2, $t2, -1
	j loop
	
print:
	# print out the result of calculation
	la $a0, output_print
	li $v0, 4
	syscall
	
	move $a0, $s1
	li $v0, 1
	syscall
	
	la $a0, nl
	li $v0, 4
	syscall
	
	j main # start the program again
exit:

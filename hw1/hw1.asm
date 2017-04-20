	.data 
output:	.asciiz "The difference between A and B (A - B) is "
input_A:	.asciiz "Please input an integer for A : "
input_B: .asciiz "Please input an integer for B : "
#
# text segment

	.text
	# Start printing text for input A
	la $a0, input_A
	li $v0, 4
	syscall
	# End printing text for input A
	
	# Start read integer for A
	li $v0, 5
	syscall
	move $t1, $v0 # move the input integer to $t1 => A
	#end read integer for A
	
	# Start printing text for input B
	la $a0, input_B
	li $v0, 4
	syscall
	# End printing text for input B
	
	# Start read integer for B
	li $v0, 5
	syscall
	move $t2, $v0 # move the input integer to $t2 => B
	# End read integer for B
	
	# Start printing text for result
	la $a0, output
	li $v0, 4
	syscall
	# End printing text for result
	
	# Start Substracting and printing the difference
	sub $t3, $t1, $t2 # Substract and put the difference into $t3 => D
	move $a0, $t3
	# "To save time substitute above two lines to sub $a0, $t1, $t2"
	li $v0, 1
	syscall 
	# End Substracting and printing the difference
	
#
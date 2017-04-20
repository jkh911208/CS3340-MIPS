## File : hw5.asm
## author : gyuhyong jeon
## date : 3/9/2017
## class : CS3340
## description : currency exchange

#2. Write a MIPS assembly language program that does currency conversion between US dollar and Japanese Yen.
#The program must repeatedly present a menu that has 4 choices: 
#       1) Set the rate: prompts the user to input the exchange rate, e.g. if 1 US dollar  = 115 Yen then the user will input 115. 
#	The program then stores this information for future use. The initial rate should be set to 115.
#       2) US $ -> Yen conversion: the program prompts the user for the US amount, then displays the Yen amount.
#       3) Yen -> US $ conversion: the program prompts the user for the Yen amount, then displays BOTH the US $ amount AND the change in Yen. For example is the input was 250 and the rate is 115, the US $ amount is 2$, and the change is 20 Yen.
#       4) Exit: the program exits. 
#and process the choice from the user accordingly.
#Submit your work as specified in the syllabus to eLearning by the due date.


# $S0 => exchange rate

.data 
output_main: .asciiz "1) Set the Rate\n2) US $ -> Yen\n3) Yen -> US $\n4) Exit\nEnter your choice:"
nl: .asciiz "\n"
currency_1: .asciiz "Currenct exchange rate is "
currency_2: .asciiz "Enter the new exchange rate (exit:0) : "
us_1: .asciiz "Enter the US $ Amout : "
us_2: .asciiz "Yen amount : "
yen_1: .asciiz "Enter the Yen Amout : "
yen_2: .asciiz "US$ amount : "

.text

li $s0, 115

main:
	la $a0, output_main
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	
	beq $v0, 1, currency
	beq $v0, 2, us
	beq $v0, 3, yen
	beq $v0, 4, exit

	
currency:

	la $a0, currency_1
	li $v0, 4
	syscall
	
	move $a0, $s0
	li $v0, 1
	syscall
	
	la $a0, nl
	li $v0, 4
	syscall
	
	la $a0, currency_2
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	
	beq $v0, 0 main
	move $s0, $v0
	
	la $a0, nl
	li $v0, 4
	syscall
	
	j main
	
us:

	la $a0, us_1
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	
	move $t1, $v0
	
	la $a0, us_2
	li $v0, 4
	syscall
	
	mul $t0, $t1, $s0
	
	move $a0, $t0
	li $v0, 1
	syscall
	
	la $a0, nl
	li $v0, 4
	syscall
	
	la $a0, nl
	li $v0, 4
	syscall
	
	j main
	
yen:
	la $a0, yen_1
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	
	move $t1, $v0
	
	la $a0, yen_2
	li $v0, 4
	syscall
	
	mtc1 $t1, $f0
	mtc1 $s0, $f1
	div.s  $f12, $f0, $f1
	
	li $v0, 2
	syscall
	
	la $a0, nl
	li $v0, 4
	syscall
	
	la $a0, nl
	li $v0, 4
	syscall
	
	j main
	
exit:
	
	
	
	
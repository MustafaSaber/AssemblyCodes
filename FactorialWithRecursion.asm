.data

prompt: .asciiz "Enter number value: "
result: .asciiz "\nfactorial of number = "

n: .word 0
answer: .word 0

.text

fact:
	# previous address to return
	#previous number saved in memory to use it again
	addi $sp , $sp , -8
	sw $ra , ($sp)
	sw $s0, 4($sp)

	li $v0 , 1
	beq $a0, 1 , FactDone

	#calls the function again with the next parameter but - 1
	move $s0 , $a0
	sub $a0, $a0, 1
	jal fact

	mul $v0, $s0, $v0 

	# extract last number added (should be 1 in this case), and go to the last address added
	FactDone:
	lw $ra, ($sp)
	lw $s0, 4($sp)
	add $sp , $sp , 8
	jr $ra 


.globl main
main:
	
	#Print string prompt
	li $v0, 4
	la $a0, prompt
	syscall

	#Read the number
	li $v0, 5
	syscall

	#Set variable n in data with value of register v0
	sw $v0, n

	#set parameters of fact function
	lw $a0, n

	jal fact

	sw $v0, answer

	#Print string result
	li $v0, 4
	la $a0, result
	syscall

	#Print integer
	li $v0, 1
	lw $a0, answer
	syscall

	# call code for terminate
	li $v0, 10
	syscall



.end main
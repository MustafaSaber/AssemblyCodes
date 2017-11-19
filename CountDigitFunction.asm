.data
scan: .asciiz "Enter the number: "
answer: .asciiz "Number of digits = "
newLine: .asciiz "\n"
.globl main

.text
countDigits:
	addi $sp, $sp, -4
	sw $s1, 0($sp)
	blt $s1, $zero, Abs
	beq $s1, $zero, caseZero

	caseZero:
		addi $t2, $t2, 1
		j Exit

	Abs:
		li $t5 , -1
		mul $s1, $s1, $t5
		j loop

	loop:
		ble $s1 , $zero , Exit
		div $s1 , $s1 , $t0
		addi $t2 , $t2 , 1
		j loop

	Exit:
		la $a0 , answer
		li $v0 , 4
		syscall
		add $a0 , $t2 , $zero
		li $v0, 1
		syscall
	lw  $s1, 0($sp)
	addi $sp, $sp, 4
	jr $ra

main:

	li $s1 , 0

	la $a0 , scan
	li $v0 , 4
	syscall

	la $a0 , newLine
	li $v0 , 4
	syscall

	li $v0 , 5
	syscall
	add $s1 , $v0 , $zero

	li $t0 , 10
	li $t2 , 0
	li $t3 , 1

	#Arch of MIPS make this code inefficent as I didn't send the parameters in $a registers

	jal countDigits
	
		
	li $v0 , 10
	syscall
.end main
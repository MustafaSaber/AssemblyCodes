.data
scanBase: .asciiz "Enter the base: "
scanPower: .asciiz "Enter the power: "
newLine: .asciiz "\n"
erroMessage: .asciiz "The power is negative."
.text
.globl main
main:

	li $s1 , 0
	li $s2 , 0

	la $a0 , scanBase
	li $v0 , 4
	syscall

	la $a0 , newLine
	li $v0 , 4
	syscall

	li $v0 , 5
	syscall
	add $s1 , $v0 , $zero

	la $a0 , scanPower
	li $v0 , 4
	syscall

	la $a0 , newLine
	li $v0 , 4
	syscall

	li $v0 , 5
	syscall
	add $s2 , $v0 , $zero

	li $t0 , 0
	li $t2 , 0
	li $t3 , 1

	blt $s2 , $zero , ExitError
	bge $s2 , $zero , loop
 
	loop:
		bge $t0 , $s2 , Exit
		mul $t3 , $t3 , $s1
		addi $t0 , $t0 , 1
		j loop

	ExitError:
		la $a0 , erroMessage
		li $v0 , 4
		syscall
		li $v0 , 10
		syscall

	Exit:
		add $a0 , $t3 , $zero
		li $v0, 1
		syscall
		
	li $v0 , 10
	syscall
.end main
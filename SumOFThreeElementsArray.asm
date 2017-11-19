#The problem is:
#Write an assembly code that creates an array of size 3, 
#takes its values as input, sums all its elements and prints the sum out. 

.data  #here we declare variables  
 array : .space 12
.text  #here we write the instructions
.globl  main
main:
   #load array address in a0
   la $t0, array

   #take first item as input
   li $v0, 5
   syscall
   sw $v0 , ($t0)

   #take second item as input
   li $v0, 5
   syscall
   sw $v0 , 4($t0)


   #take third item as input
   li $v0, 5
   syscall
   sw $v0 , 8($t0)

   #load the values of the array
   lw $s0 , ($t0)
   lw $s1 , 4($t0)
   lw $s2 , 8($t0)

   #add the values of the array in s3
   add $s3, $s0, $s1
   add $s3, $s3, $s2

   #view sum
   add $a0 , $s3 , $zero
   li $v0, 1
   syscall

   #end program
   li   $v0, 10
   syscall
.end main

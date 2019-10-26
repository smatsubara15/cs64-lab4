# MedianNumbers.asm program
# CS 64, Z.Matni, zmatni@ucsb.edu
#

.data

	# TODO: Complete these declarations / initializations

Enter:	 .asciiz "Enter the next number:\n"

Answer:	 .asciiz "Median: "

newline:	.asciiz "\n"

#Text Area (i.e. instructions)
.text

main:
	
	li $v0, 4
	la $a0, Enter
	syscall

	
	li $v0, 5
	syscall
	addu $t0, $zero, $v0

	li $v0, 4
        la $a0, Enter
	syscall

	li $v0, 5
	syscall
	addu $t1, $zero, $v0
	
	#if t1 is greater than t0 we can move to the next step 
	slt $t3, $t0, $t1
	bne $t3, $zero, next

	#if it is not we swap the values	
	addu $t4, $zero, $t0
	addu $t0, $zero, $t1
	addu $t1, $zero, $t4
next:	
	li $v0, 4
	la $a0, Enter
	syscall


        li $v0, 5
        syscall
	addu $t2, $zero, $v0
	slt $t3, $t2, $t0
	bne $t3, $zero, t0median

	slt $t3, $t1, $t2
	bne $t3, $zero, t1median

	#t5 will hold the value of the median
	addu $t5, $zero, $t2
	j exit			

t0median:
	addu $t5, $zero, $t0
	j exit

t1median:
	addu $t5, $zero, $t1
	
exit:
	
	li $v0, 4
	la $a0, Answer
	syscall

	li $v0, 1
	addu $a0, $zero, $t5
	syscall

	li $v0, 4
        la $a0, newline
	syscall
	
	# Exit
	li $v0, 10
	syscall


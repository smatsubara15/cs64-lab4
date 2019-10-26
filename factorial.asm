# Factorial.asm program
# CS 64, Z.Matni, zmatni@ucsb.edu
#

# Assembly version of:
#   int n, fn=1;
#   cout << "Enter the number:\n";
#   cin >> n;
#   for (int x = 2; x <= n; x++) {
#       fn = fn * x;
#   }
#   cout << "Factorial is:\n" << fn << "\n";
#
.data

	# TODO: Write your initializations here

enter:	 .asciiz "Enter the number:\n"
answer:	 .asciiz "Factorial is:\n"
newline:	.asciiz "\n"
	
#Text Area (i.e. instructions)
.text
main:
	# TODO: Write your code here
	li $v0, 4
	la $a0, enter
	syscall

	li $v0, 5
	syscall
	#t0=n
	addu $t0, $zero, $v0

	#t1=fn
	li $t1, 1

	#t2=x
	li $t2, 2

	#used for comparison in the loop
	addi $t3, $t0, 1 

loop:
	slt $t4, $t2, $t3
	beq $t4, $zero, exit

	mult $t1, $t2
	mflo $t1

	addi $t2, $t2,1
	j loop
	
exit:

	
	li $v0, 4
	la $a0, answer
	syscall

	li $v0, 1
	addu $a0, $zero, $t1
	syscall

	li $v0, 4
	la $a0, newline
	syscall

	li $v0, 10
	syscall

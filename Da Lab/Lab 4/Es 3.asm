.globl _start
.data 

 
.text

_start:

   	# int N = 8;
	# int R = 1;
	# int A = 0; int B = 1;
	# while (N > 0) {
	# 	R = A + B;
	# 	A = B;
	# 	B = R;
	# 	N = N - 1:
	# }
	
	# t0 = N
	# t1 = R
	
	# usare altri registri per A e B
	
	#<assembler code here>
	
	li t0, 8	# N
	li t1, 1	# R
	li t2, 0	# A
	li t3, 1	# B
	 
	beq t0, zero, ENDWHILE
	
WHILE:
	add t1, t2, t3
	add t2, zero, t3
	add t3, zero, t1
	addi t0, t0, -1
	
	bgt t0, zero, WHILE

ENDWHILE:
	
	
	
exit:
    addi x17, x0, 10  # call number 10 = exit
    ecall

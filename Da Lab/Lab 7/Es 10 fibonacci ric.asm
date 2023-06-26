# int fib(int n) {
# 	if (n==0)
# 		return 0;
# 	else if (n==1)
# 		return 1;
# 	else
# 		return(fib(n–1) + fib(n–2));
# }
.globl _start
.data 

 
.text

_start:
    #<assembler code here>
   	li a0, 20
	
	jal fib
	
	li a7, 1
	ecall
	j exit
	
fib:
	addi sp, sp, -32
	sd ra, 0(sp)
	sd a0, 8(sp)
	sd s1, 16(sp)	# f(n-1)
	sd s2, 24(sp)	# f(n-2)
	
	base_1:
	bnez a0, base_2	# n == 0
	li a0, 0	# return 0
	j end_fib
	
	base_2:
	li t0, 1
	bne a0, t0, inductive # n == 1
	li a0, 1	# return 1
	j end_fib
	
	inductive:
	addi a0, a0, -1	# n-1
	jal fib
	mv s1, a0	# s1 = f(n-1)
	
	ld a0, 8(sp)	# Loading value of n
	addi a0, a0, -2	# n - 2
	jal fib
	mv s2, a0	# s2 = f(n-2
	
	add a0, s1, s2	# return f(n-1) + f(n-2)
	
	end_fib:
	ld s2, 24(sp)
	ld s1, 16(sp)
	ld ra, 0(sp)
	addi sp, sp, 32
	ret
	
exit:
    addi x17, x0, 10  # call number 10 = exit
    ecall

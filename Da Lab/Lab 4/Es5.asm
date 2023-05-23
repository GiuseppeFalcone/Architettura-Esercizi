.globl _start
.data 

 
.text

_start:
	# N = 37
	# M = 1
	# R = 0
	# i = 64
	# do {
	# 	R = R + N&M
	# 	N = N >> 1
	# 	i = i - 1
	# } while (i > 0)
	
	
    #<assembler code here>
    li t0, 37	# N
    li t1, 1	# M
    li t2, 0	# R
    li t3, 64	# i
    
DOWHILE:
	and t4, t0, t1	# N&M
	add t2, t2, t4	# R = R + N&M
	
	srli t0, t0, 1	# 	N = N >> 1
	
	addi t3, t3, -1
	bgt t3, zero, DOWHILE


exit:
    addi x17, x0, 10  # call number 10 = exit
    ecall

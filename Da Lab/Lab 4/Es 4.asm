.globl _start
.data 

 
.text

_start:
	
	# int N=10; 
	# int S=0; 
	# int i; 
	# for (i=1; i<=N; ++i){ 
	# 	S = S + i*i;  
	# }
	
    #<assembler code here>
    
    li t0, 10	# N
    li t1, 0	# S
    li t2, 1	# i
    
FORLOOP:
	mul t3, t2, t2	# i*i
	add t1, t1, t3	# S = S + i*i;
	addi t2, t2, 1	# ++i
	
	ble t2, t0, FORLOOP

	
	
exit:
    addi x17, x0, 10  # call number 10 = exit
    ecall

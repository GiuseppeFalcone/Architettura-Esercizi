.globl _start
.data 

 
.text

_start:

    #X = (x - 2) + y
	#if (x < y)
		#X = X + 1
	#else
		#y = y + 1
		
    #<assembler code here>	
    li t0, 5
    li t1, 7
    
    addi t0, t0, -2
    add t0, t0, t1
    
    bge t0, t1, ELSE:
    addi t0, t0, 1
    j ENDIF
ELSE:
	addi t1, t1, 1
ENDIF:
	
	
exit:
    addi x17, x0, 10  # call number 10 = exit
    ecall

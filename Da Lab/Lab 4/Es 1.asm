.globl _start
.data 

 
.text

_start:

	#X = X - Y
	#if (x < 0)
	#X = 0
	#y = y - 1

    #<assembler code here>
    li t0, 6
    li t1, 7
    
    sub t0, t0, t1
    bgez t0, ENDIF
    li t0, 0 
ENDIF:
	addi t1, t1, -1
	

exit:
    addi x17, x0, 10  # call number 10 = exit
    ecall

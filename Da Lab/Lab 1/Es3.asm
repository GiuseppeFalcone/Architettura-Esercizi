.globl _start
.data 

 
.text

_start:

    #<assembler code here>
    li t0, 0x00000000AAAAAAAA
    li t1, 0x1234567812345678
    
    #slli x7, x5, 4
    #or t2, t2, t1
    
    #slli t2, t1, 4
	
	srli t2, t0, 3
	andi t2, t2, 0xFF
	
exit:
    addi x17, x0, 10  # call number 10 = exit
    ecall

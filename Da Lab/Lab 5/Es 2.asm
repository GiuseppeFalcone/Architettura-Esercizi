.globl _start
.data
	v1: .word 5
	v2: .word 8
	v3: .word 10

 
.text

_start:

    #<assembler code here>
    
    la t0, v1
    
    lw t1, 0(t0)
    lw t2, 4(t0)
    lw t3, 8(t0)
    
    add t4, zero, t1
    
    ble t2, t4, ELSE
    add t4, zero, t2
    
ELSE:
   	ble t3, t4, END
	add t4, zero, t3
	
END:
	sw t4, 12(t0)
   	
exit:
    addi x17, x0, 10  # call number 10 = exit
    ecall

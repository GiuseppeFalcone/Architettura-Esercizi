.globl _start
.data 
	size: .word 10
	array: .word 2, 3, 6, 7, 9, 21, 43, 56, 22, 556
	result: .word 0
 
.text

_start:

    #<assembler code here>
   	la t0, size
   	lw t1, 0(t0)
   	
   	la t0, array
   	
   	li t2, 0
   	li t3, 2
   	li t6, 0
FOR:
	lw t4, 0(t0)
	rem t5, t4, t3
	bnez t5, ENDFOR
	addi t6, t6, 1
	ENDFOR:
		addi t0, t0, 4
		addi t2, t2, 1
		blt t2, t1, FOR

	la t0, result
	sw t4, 0(t0)

PRINT_RESULT:
	add a0, zero, t6
	addi a7, zero, 1
	ecall
	

exit:
    addi x17, x0, 10  # call number 10 = exit
    ecall

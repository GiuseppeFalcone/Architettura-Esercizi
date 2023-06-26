.globl _start
.data 
	size: .word 5
	array: .word 1, 2, 55, 76, 7
	result: .word 
.text

_start:

    #<assembler code here>
  	la t0, size
  	lw t1, 0(t0)	# t1 = size
	
	li t2, 0	# i = 0
	
	la t0, array	# array start address
	lw t3, 0(t0) # MAX = t3 = array[0]
	
FOR:
	lw t4, 0(t0)	# t4 = array[i]
	bgt t4, t3, UPDT_MAX
	j CLOSING_FOR
	
	UPDT_MAX:
	add t3, zero, t4
	
	CLOSING_FOR:
		addi t0, t0, 4 
		addi t2, t2, 1
		ble t2, t1, FOR
ENDFOR:

	la t6, result
	sw t4, 0(t6)

PRINT_RESULT:
	add a0, zero, t3
	addi a7, zero, 1
	ecall
	
exit:
    addi x17, x0, 10  # call number 10 = exit
    ecall

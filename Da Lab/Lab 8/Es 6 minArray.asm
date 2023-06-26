.globl _start
.data 
	arr: .word 2, 3, 2, 1, 4, 2, 4, 1, 1, 0, 5
 	len: .word 11
 
.text

_start:

    #<assembler code here>
   	la a0, arr
   	la a1, len
   	lw a1, 0(a1)
   	
   	jal minArray
   	
   	li a7, 1
   	ecall
   	 
   	j exit
   	
   	
minArray:
	li t0, 1
	li t1, 0
	lw t2, 0(a0)
	mv t3, t2
	
	loop:
		bge t0, a1, endMinArray
		addi a0, a0, 4
		lw t2, 0(a0)
		blt t2, t3, updateMin
		j endLoop
		
		updateMin:
			mv t3, t2
			mv t1, t0
		
		endLoop:
			addi t0, t0, 1
			j loop
	endMinArray:
		mv a0, t1
		ret	

exit:
    addi x17, x0, 10  # call number 10 = exit
    ecall

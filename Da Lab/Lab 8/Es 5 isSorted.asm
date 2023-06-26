.globl _start
.data 
	arr: .word 1, 2, 3, 4, 5, 6, 7, 8, 7
 	len: .word 9
.text

_start:
    #<assembler code here>
   	la a0, arr
   	la a1, len
   	lw a1, 0(a1)
   	
   	jal isSorted
   	
   	li a7, 1
   	ecall
   	
   	j exit
isSorted:
	li t0, 0
	lw t1, 0(a0)
	loop:
		addi a0, a0, 4
		lw t1, 0(a0)
		blt t1, t2, not_sorted
		mv t2, t1
		bge t0, a1, sorted
		addi t0, t0, 1
		j loop
	not_sorted:
		li a0, 0
		ret
	sorted:
		li a0, 1
		ret
exit:
    addi x17, x0, 10  # call number 10 = exit
    ecall

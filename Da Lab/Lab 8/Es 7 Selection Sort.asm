.globl _start
.data 
	size: .word 10
	ar: .word 2, 4, 5, 3, 6, 8, 7, 1, 9, 10

 
.text

_start:

    #<assembler code here>
   	la a0, ar
   	la a1, size
   	lw a1, 0(a1)
   	
   	jal selectionSort
   	
   	j exit
   	
selectionSort:
	li s1, 0
	li s2, 0
	li a2, 0
	
	addi a3, a1, -1
	for1:
		bge s1, a3, endSelectionSort
		mv a2, s1
		addi s2, s1, 1
		for2:
			bge s2, a1, endFor1
			
			slli t5, s2, 2
			add t5, a0, t5
			lw t5, 0(t5)
			
			slli t6, a2, 2
			add t6, a0, t6
			lw t6, 0(t6)
			
			bge t5, t6, endFor2
			mv a2, s2
			endFor2:
				addi s2, s2, 1
				j for2
		endFor1:
		addi sp, sp, -48
		sd ra, 0(sp)
		sd a0, 8(sp)
		sd a1, 16(sp)
		sd a2, 24(sp)
		sd s1, 32(sp)
		sd s2, 40(sp)
		
		slli t6, a2, 2
		add t6, a0, t6
		
		slli t5, s1, 2
		add t5, a0, t5
		
		mv a0, t6
		mv a1, t5
		jal swap
		
		ld ra, 0(sp)
		ld a0, 8(sp)
		ld a1, 16(sp)
		ld a2, 24(sp)
		ld s1, 32(sp)
		ld s2, 40(sp)
		addi sp, sp, 48
		addi s1, s1, 1
		j for1
	endSelectionSort:
		ret

	
swap:
	lw t0, 0(a0)
	lw t1, 0(a1)
	sw t1, 0(a0)
	sw t0, 0(a1)
	ret	
exit:
    addi x17, x0, 10  # call number 10 = exit
    ecall

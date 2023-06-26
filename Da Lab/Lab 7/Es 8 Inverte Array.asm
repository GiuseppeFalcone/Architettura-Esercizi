.globl _start
.data 
	size: .word 10
	array: .word 1, 2, 3, 4, 5, 6,7,8,9,11
 
.text

_start:

    #<assembler code here>
   	 la a0, array
   	 la a1, size
   	 lw a1, 0(a1)
   	 
   	 jal ra, invert
   	 
   	 
   	 jal print
   	 j exit

invert:
	addi sp, sp, -40
	sd ra, 0(sp)
	sd a0, 8(sp)
	sd a1, 16(sp)
	
	li s1, 0	# i = 0
	
	# Swap has to be called (size/2)-1
	srai s2, a1, 1
	addi s2, s2, -1
	sd s2, 24(sp)	# save size / 2 value
	
	invert_loop:
	sd s1, 32(sp)	# save current i variable
	
	# y = size - i - 1
	sub a2, a1, s1	# size - i
	addi a2, a2, -1	# size - i - 1
	mv a1, s1	# metto in a1 il valore di i
	
	jal ra, swap
	
	ld a0, 8(sp)	# ricarico i valori dalla memoria
	ld a1, 16(sp)
	ld s1, 32(sp)
	ld s2, 24(sp)
	
	bge s1, s2, end_invert	# controllo che i < size/2
	addi s1, s1, 1	# i++
	j invert_loop
	
	end_invert:	# fine procedura
	ld ra, 0(sp)
	addi sp, sp, 24
	ret

swap:
	slli a1, a1, 2	# moltiplico i*4
	add t0, a0, a1	# calcolo offset per array
	lw t1, 0(t0)
		
	slli a2, a2, 2	# stessa cosa ma con y*4
	add t2, a0, a2
	lw t3, 0(t2)
	
	sw t3, 0(t0)	# salvo i valore in memoria
	sw t1, 0(t2)
	
	ret


print:
	addi sp, sp, -8
	sd a0, 0(sp)
	
	li t0, 0
	addi a1, a1, -1
	
	print_loop:
	lw a0, 0(a0)
	li a7, 1
	ecall
	
	ld a0, 0(sp)
	addi a0, a0, 4
	sd a0, 0(sp)
	
	bge t0, a1, end_print
	addi t0, t0, 1
	j print_loop
	
	end_print:
	addi sp, sp, 8
	ret
exit:
    addi x17, x0, 10  # call number 10 = exit
    ecall

# void strcpy(char *dst, char *src) { 
# unsigned long i;
# unsigned long n;
# n = strlen(src);
# m = strlen(dst);
# for (i = 0; i < n; i++)
# 	dst[i] = src[i];
# for ( ; i < m; i++)
# 	dst[i] = '\0';
# return;
# }
.globl _start
.data 
	src: .string "source"
	dst: .string "-------------"
.text

_start:

    #<assembler code here>
    la a0, dst
    la a1, src
    
    jal ra, strcpy
    j exit

strcpy:
	addi sp, sp, -32
	sd ra, 0(sp)
	sd a0, 8(sp)
	sd a1, 16(sp)
	sd s1, 23(sp)
	
	jal ra, strlen	# Call strlen dst in a0
	li s1, 0	# s1 = m
	mv s1, a0	# m = strlen(dst)
	mv a0, a1	# move src address in a0
	
	jal ra, strlen	# Call strlen src in a0
	li s2, 0	# s2 = n
	mv s2, a0	# n = strlen(src)
	
	# recupero address stringhe
	ld a0, 8(sp)
	ld a1, 16(sp)
	
	li t0, 0	# i = 0
	li t1, 0
	li t2, 0
	for_1:
	add t1, t0, a1
	lbu t1, 0(t1)	# t1 = src[i]
	add t2, t0, a0
	sb t1, 0(t2)
	bge t0, s2, for_2
	addi t0, t0, 1
	j for_1
	
	for_2:
	add t2, t0, a0
	sb zero, 0(t2)
	bge t0, s1, end_strcpy
	addi t0, t0, 1
	j for_2
	
	end_strcpy:
	ld s1, 24(sp)
	ld ra, 0(sp)
	addi sp, sp, 32
	ret

strlen:
 	li t0, 0	# Variable for loop
 	li t1, 0
 	strlen_for:
 	add t1, t0, a0 		# Adding byte offset for loading char
 	lbu t1, 0(t1)		# loading unsigned byte for char
 	beq t1, zero, end_strlen	# Checking condition str[i] != \0
 	addi t0, t0, 1		# i++
 	j strlen_for
 	
 	end_strlen:
 	add a0, zero, t0
 	ret

exit:
	
    addi x17, x0, 10  # call number 10 = exit
    ecall

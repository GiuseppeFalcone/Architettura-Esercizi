.globl _start
.data 
	str1: .string "second"
	str2: .string "secon"
 
.text
	# Scrivere una procedura RISC-V strcmp per confrontare due stringhe di caratteri. 
	# strcmp(str1,str2)restituisce 0 se str1 è uguale a str2, 1 nel caso contrario.
_start:

    #<assembler code here>
   	la a0, str1
   	la a1, str2
   	
   	jal ra, strcmp

print:
   	li a7, 1
   	ecall
   	
exit:
    addi x17, x0, 10  # call number 10 = exit
    ecall
   	
strcmp:
	addi sp, sp, -24
	sd a0, 16(sp)	# Save address of first string
	sd a1, 8(sp)	# Save address of first string
	sd ra, 0(sp)	# Save return address
	
	jal ra, strlen	# call to get length of first string
	add t0, zero, a0	# move str1 length to t0
	
	add a0, zero, a1	# move str2 address to a0
	
	jal ra, strlen	# call to get length of second string
	add t1, zero, a0	# move str2 length t0 t1
	
	ld a0, 16(sp)	# load of address for str1 from memory
	ld a1, 8(sp)	# load of address for str2 from memory
	
	li t3, 0	# t3 = result = 0 (equal)
	bne t0, t1, else	# check if length are the same
	li t2, 0	# initialize counter
	
	for:
	add t0, a0, t2	# Set offset
	lbu t0, 0(t0)	# load of char
	
	add t1, a1, t2	# set offset
	lbu t1, 0(t1)	# load of char
	
	bne t0, t1, else	# change result and break of loop if chars not equal
	beqz t1, end_strcmp	# end of loop if char = null
	addi t2, t2, 1	# increment of counter
	j for	# jump to for
	
	else:
	li t3, 1 # set result to 1
	j end_strcmp	# jump to end of procedure
	
	end_strcmp:
	add a0, zero, t3	# move result to a0
	ld ra, 0(sp)	# load of return address
	addi sp, sp, 24	# reset of sp
	ret	

strlen:
	li t0, 0	# initializing counter
	strlen_loop:
	add t1, a0, t0	# setting off-set = address + counter
	lb t1, 0(t1)	# load of char
	
	beqz t1, end_strlen	# control
	
	addi t0, t0, 1	# conter increment
	j strlen_loop
	
	end_strlen:
	add a0, zero, t0	# move result to a0
	ret
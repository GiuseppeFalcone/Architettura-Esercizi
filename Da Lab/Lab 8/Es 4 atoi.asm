.globl _start
.data 
	str: .string "50"
 
.text

_start:

    #<assembler code here>
   	la a0, str
   	jal isNumber
   	
   	mv t0, a0
   	
   	if:
   	beqz t0, end_Main 
	la a0, str
	jal strlen
	
	mv a1, a0
	la a0, str
	jal atoi
	
	mul a0, a0, a0
	li a7, 1
	ecall
	
	end_Main:
	j exit



atoi:
	li a2, 1
	bne a1, a2, indCase
	lbu a0, 0(a0)
	addi a0, a0, -48
	ret
	
	indCase:
		addi sp, sp, -32
		sd ra, 0(sp)
		sd a0, 8(sp)
		sd a1, 16(sp)
		sd s1, 24(sp)
		
		addi a1, a1, -1
		add s1, a0, a1
		lbu s1, 0(s1)
		addi s1, s1, -48
		
		jal atoi
		
		li t1, 10
		mul a0, a0, t1
		
		add a0, a0, s1
		
		ld ra, 0(sp)
		ld a1, 16(sp)
		ld s1, 24(sp)
		addi sp, sp, 32
		ret
	

strlen:
 	li t0, 0	# Variable for loop
 	
 	strlen_for:
 	add t1, t0, a0 		# Adding byte offset for loading char
 	lbu t1, 0(t1)		# loading unsigned byte for char
 	beq t1, zero, end_strlen	# Checking condition str[i] != \0
 	addi t0, t0, 1		# i++
 	j strlen_for
 	
 	end_strlen:
 	add a0, zero, t0
 	ret	

isNumber:
	addi sp, sp, -24
	sd ra, 0(sp)
	sd a0, 8(sp)
	
	li s1, 0
	
	loop:
		sd s1, 16(sp)
		
		lbu a0, 0(a0)
		
		beqz a0, is_number
		jal isDigit
		beqz a0, not_number
		
		ld a0, 8(sp)
		addi s1, s1, 1
		add a0, a0, s1
		j loop
	
	is_number:
	li a0, 1
	j end_isNumber
	
	not_number:
		li a0, 0
		j end_isNumber
	
	end_isNumber:
	ld s1, 16(sp)
	ld ra, 0(sp)
	addi sp, sp, 24
	ret

isDigit:
	li t0, 0
	li t1, 0
	addi t0, t0, 48
	addi t1, t1, 57
	
	blt a0, t0, not_dig
	bgt a0, t1, not_dig
	addi a0, a0, 1
	ret
	
	not_dig:
	li a0, 0
	ret



exit:
    addi x17, x0, 10  # call number 10 = exit
    ecall

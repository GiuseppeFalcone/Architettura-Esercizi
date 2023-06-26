.globl _start
.data 
	string: .string "67"
 
.text

_start:

    #<assembler code here>
   	la a0, string
   	jal isNumber
   	
   	li a7, 1
	ecall
   	
   	j exit
   	
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

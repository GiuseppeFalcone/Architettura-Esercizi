.globl _start
.data 
	src: .string "This is the source string."
.text
	# C Code:	Function that returns the length of a string excluding it's end value \0 == null == 0x00
	# unsigned long strlen(char *str) { 
	# 	unsigned long i;
    # 	for (i = 0; str[i] != '\0’; i++);
	# 	return i; 
	# }
_start:
	la a0, src	# load addres of string in a0
	jal ra, strlen	# call of procedure
	
	li a7, 1
	ecall
	
	j exit

strlen:
	li t0, 0	# initializing counter
	for:
	add t1, a0, t0	# setting off-set = address + counter
	lb t1, 0(t1)	# load of char
	beqz t1, end_strlen	# control
	addi t0, t0, 1	# conter increment
	j for
	
	end_strlen:
	add a0, zero, t0
	ret

exit:
    addi x17, x0, 10  # call number 10 = exit
    ecall
# Calcolare lunghezza stringa da C a Risc-V
# unsigned long strlen(char *str) { 
# 	unsigned long i;
#	for (i = 0; str[i] != '\0’; i++);
# 	return i; 
# }

.globl _start
.data 
	src: .string "This is the source string."
	
.text

_start:
    #<assembler code here>
 	la a0, src
 	jal strlen 
 	
 	j exit
 	
 	
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

exit:
	li a7, 1
   	ecall
    addi x17, x0, 10  # call number 10 = exit
    ecall

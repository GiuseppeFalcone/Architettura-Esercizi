.globl _start
.data 

 
.text

_start:
	# for (i=0; i<a; i++) {
  		# for (j=0; j<b; j++) {
			# R = 2*R + i + j; 
		# }
	# }
	
    #<assembler code here>
    
    li t0, 2	# a
    li t1, 3	# b
    li t2, 0	# R
    
    li t3, 0	# i
    
FOR1:
	bge t3, t0, END
	li t4, 0	# j = 0
	j FOR2
	
	INCREASE_I:	
		addi t3, t3, 1	# i++
		j FOR1

FOR2:
	bge t4, t1, INCREASE_I
	slli t2, t2, 1	# 2*R
	add t2, t2, t3	# R = 2*R + i
	add t2, t2, t4	# R = R + j
	
	addi t4, t4, 1	# j++
	j FOR2
	
END:

exit:
    addi x17, x0, 10  # call number 10 = exit
    ecall

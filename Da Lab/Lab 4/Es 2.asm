.globl _start
.data 

 
.text

_start:
	#Si scriva un programma in linguaggio RISC-V che carichi tre numeri interi su t0, t1 e t2, 
	#e poi inserisca il valore massimo tra i tre nel registro t3.
	
	# if(t0 > t1){
	#	t3 = t0;
	# } else {
	#	t3 = t2
	#	}
	# if (t2 > t3){
	#	t3 = t2
	# }

    #<assembler code here>
   	li t0, 77
   	li t1, 24
   	li t2, 44
   	
   	blt t0, t1, ELSE1
   	add t3, zero, t0
	j IF
ELSE1:
	add t3, zero, t1
IF:
	blt t2, t3, ENDIF
	add t3, zero, t2
ENDIF:

PRINTRESULT:
	add a0, zero, t3
	addi a7, zero, 1
	ecall
   	

exit:
    addi x17, x0, 10  # call number 10 = exit
    ecall

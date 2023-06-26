# // algoritmo di Euclide per MCD
# int MCD(int a, int b) {
# 	while (a != b)
# 		if (a > b)
# 			a = a - b;
# 		else
# 			b = b - a;
# 	return a;
# }
# 
# void main() {
# 	int a = 24;
# 	int b = 30;
# 	int result;
# 
# 	result = MCD (a, b);
# 	printf("8d\n", result);
# }

.globl _start
.data 

 
.text


_start:
	li a0, 24
	li a1, 30
	jal ra, MCD
	mv t0, a0
   
print:
	add a0, zero, t0
	li a7, 1
	ecall
	
exit:
    addi x17, x0, 10  # call number 10 = exit
    ecall

MCD:
  while:
  	beq a0, a1, endMCD
  	if:
  	blt a0, a1, else
  	sub a0, a0, a1
  	j while
  	else:
  	sub a1, a1, a0
  	j while
  endMCD:
  	jr ra

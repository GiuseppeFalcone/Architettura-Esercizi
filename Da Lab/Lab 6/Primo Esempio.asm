.globl _start
.data 

 
.text
	# C CODE:
	# int sum(int a, int b){
	# 	return atb;
	# }
	# 
	# int main(int argo, char** argv) {
	# 	int a = 1;
	# 	int b = 2;
	# 	int result;
	# 	result = sum(a,b);
	# 	printf("result: sd", result);
	# 	exit (0);
	# }
	
_start:

    #<assembler code here>
    
    # initializing parameters to pass
    li a0, 5	# a
    li a1, 2	# b
    
    jal sum		# jump to procedure
   	
   	li a7, 1	# print result
   	ecall
   	
   	j exit
   	
sum:
	add a0, a0, a1	# sum
	jr ra	# return to caller via address return
   

exit:
    addi x17, x0, 10  # call number 10 = exit
    ecall

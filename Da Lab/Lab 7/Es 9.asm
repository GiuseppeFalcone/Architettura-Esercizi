# int somma_it(int size, int vettore []) {
#	int res = 0;
#	int i = 0:
#	while(i ‹ size) {
#		res += vettore [i];
#		i++;
#	}
#	return res;
# }

# int somma ric(int size, int* vettore) {
#	if(size <= 0)
#		return 0:
#	return (vettore [size-1] + somma_ric(size-1, vettore));
# }

.globl _start
.data
	#size: .word 3
	#array: .word 2, 1, 7
	
	size: .word 6
	array: .word 1,2,3,4,5,6
.text

_start:

	la s1, size	
	lw a1, 0(s1)	# a1 = size
	la a0, array	# a0 = base address array
	
	jal ra, sum_ric	# call of procedure
	
print:
   	li a7, 1
   	ecall
   	
exit:
    addi x17, x0, 10  # call number 10 = exit
    ecall

sum_ric:
	addi sp, sp, -24	# Frame Update
	sd ra, 0(sp)
	sd a0, 8(sp)
	sd s1, 16(sp)
	
	mv s1, zero		# Initializing value in s1
	
	blez a1, end_sum	# check for base
	
	addi a0, a0, 4	# Update array address for next call
	addi a1, a1, -1	# Update size value for next call
	jal sum_ric		# recursive call
	
	add s1, a0, zero	# value from called procedure moved to s1
	
	ld a0, 8(sp)	# load of previous address of array
	ld t0, 0(a0)	# load of value in array ad address a0
	add s1, s1, t0	# sum of t0 and s1 (f(i-1)+array[i])
	
	end_sum:
	mv a0, s1	# moving value to return to a0
	ld s1, 16(sp)	# closing frame
	ld ra, 0(sp)
	addi sp, sp, 24
	ret
	

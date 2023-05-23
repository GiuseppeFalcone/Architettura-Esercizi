.globl _start
.data
	v1: .word 8 # I label sono gli indirizzi per arrivare a memoria
	v2: .word 9	# .word è la dimensione dell'elemento che segue
	v3: .word 0	# i numeri sono il valore

 
.text

_start:

    #<assembler code here>
    
    la t0, v1	# Pseudoistruzione load address che contiene l'indirizzo di memoria di v1
    lw t1, 0(t0)	# carica in t1 il valore contenuto all'indirizzo di t0, 
    				# che contiene l'indirizzo di v1, che contiene il volore 8
    lw t2, 4(t0)	# Carica del valore di v2 su t2
    
    add t3, t1, t2
    
    sw t3, 8(t0)
    
   

exit:
    addi x17, x0, 10  # call number 10 = exit
    ecall

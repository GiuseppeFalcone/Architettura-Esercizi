.globl _start
.data
	size: .word 4
	array: .word 2, 3, 6, 7
	
	result: .word 0

 
.text

_start:
	# Data una word in memoria che contiene l'intero X, seguita da X interi in word contigue (array di word), 
	# scrivere un programma RISC-V che stampa a video la somma dei valori contenuti all'interno dell'array. 
	# Il valore ottenuto va anche salvato in una variabile identificata con il label "result"
    
    #<assembler code here>
 	
 	la t0, size	# Address di Size
 	lw t1, 0(t0)	# t1 = size
 	
 	la t0, array	# t0 = base address array
 	
 	li t2, 0	# i = 0
 	li t3, 0	# result = 0
 	
WHILE:
	bge t2, t1, ENDWHILE
	
	lw t1, 0(t0)	# Carico valore array[i]
	
	add t3, t3, t1	# Effettuo la somma
	
	addi t0, t0, 4	# Aggiorno Off-set
	addi t2, t2, 1	# i++
	
	j WHILE
	
	
ENDWHILE:
	la t0, result	# Address Result
	sw t3, 0(t0)	# Salviamo Valore su Result
	
	# Stampa del Risultato
	add a0, zero, t3
	addi a7, zero, 1
	ecall
 	
exit:
    addi x17, x0, 10  # call number 10 = exit
    ecall

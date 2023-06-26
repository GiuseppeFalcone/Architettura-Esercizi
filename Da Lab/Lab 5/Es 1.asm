.globl _start
.data 
	v1: .word 8
	v2: .word 4
	v3: .word 8
	v4: .word 3
	v5: .word 0
 
.text

_start:
	
	# Si scriva un programma in linguaggio RISC-V che carichi 4 numeri interi presenti nella memoria
	# in word contigue e calcoli il valore intero della loro media aritmetica (arrotondamento per difetto). 
	# Il valore calcolato va salvato in una ulteriore posizione della memoria contigua a quelle usate per il calcolo.
		# • In questo esercizio utilizzare soltanto il set delle istruzioni "intere di base rv64i".
	
    #<assembler code here>
    
	la t0, v1
	
	lw t1, 0(t0)
	lw t2, 4(t0)
	lw t3, 8(t0)
	lw t4, 12(t0)
	
	add t1, t1, t2
	add t3, t3, t4
	add t1, t1, t3
	
	#li t5, 4
	#div t1, t1, t5
	
	srli t1, t1, 2
	
	sw t1, 16(t0)
	
	

exit:
    addi x17, x0, 10  # call number 10 = exit
    ecall

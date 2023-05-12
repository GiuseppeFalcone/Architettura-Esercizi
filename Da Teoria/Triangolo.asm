.globl _start
.text

_start:
	# Inizializzare i valori del triangolo nei registri
	# Due diversi modi per fare la stessa cosa
	addi a0, zero, 20
	li a1, 23
	
	jal ra, area	# chiamata area
	add t0, a0, zero	# Salvataggio del risultato su t0
	
	# Stampa messaggio per il risultato
	la a0, visris
	addi a7, zero, 4
	ecall

	# stampare risultato
	add a0, t0, zero
	addi a7, zero, 1
	ecall
	
	# stampa \n
	la a0 RTN		# pseudo-istruzione
	addi a7, zero, 4
	ecall
	
	# terminare il programma (fare un return)
	# exit
	addi a7, zero, 10
	ecall					#environment call
	
area:
	# nulla da caricare dato che i parametri sono su a0 e a1
	
	# apertura frame
	addi sp, sp, -24	# spostare stack pointer di 3 pos per allocare il call frame nello stack
	sd fp, 0(sp)	# salvare il precedente frame pointer
	sd ra, 8(sp)	# salvare indirizzo di ritorno al main
	addi fp, sp, 16 # aggiornamento del fram pointer per la prossima funzione (moltiplicazione)
	
	# chiamare moltiplicazione:
	jal ra, moltiplicazione
	sd a0, 0(fp)	# salvataggio del risultato della moltiplicazione
	srai a0, a0, 1	# Divisione per 2 tramite shift aritmetico di 2 (2^1 = 2)
	
	
	# chiusura frame
	ld fp, 0(sp)	# recupero frame pointer
	ld ra, 8(sp)	# recupero indirizzzo di ritorno
	addi sp, sp, 24	# ripristino frame pointer eliminando il call frame dallo stack
	jr ra			# ritorno al chiamante

moltiplicazione:
	addi sp, sp, -16	# agg. stack pointer
	sd fp, 0(sp)	# salvare frame pointer precedente
	addi fp, sp, 16	# agg. frame pointer al primo valore
	sd a0, 0(fp)	# salvare rst variabile locale
	ld t2, 0(fp)
	
	li t0, 1	# iniz. var. i
	for:
		bge t0, a1, endfor	# condizione di uscita
		add t2, a0, t2		# somma
		addi t0, t0, 1		# agg. var i
		j for
	endfor:
	ld fp, 0(sp)	# Recupero frame pointer
	addi sp, sp, 16	# Eliminare il call frame dallo stack
	add a0, t2, zero	# Carica su a0 il valore da ritornare
	jr ra			# Ritornare al chiamante
	
.data
	titolo:		.asciz "Area di un triangolo\n"
	insbase:	.asciz "Base = "
	insaltezza:	.asciz "Altezza = "
	visris:		.asciz "area = "
	RTN:		.asciz "\n"






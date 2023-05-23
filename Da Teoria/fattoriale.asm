.globl _start
.text

_start:
	# Stampa intestazione
	la a0, messaggio 
	addi a7, zero, 4 
	ecall
	
	# Stampa richiesta
	la a0, insdati 
	addi a7, zero, 4 
	ecall
	
	# legge n (valore in a0)
	addi a7, zero, 5 
	ecall

	# chiama fact(n)
	jal fact	# parametro n in a0
	add s0, a0, zero	# salva il risultato in sO
	
	# stampa messaggio per il risultato
	la a0, visris 
	addi a7, zero, 4
	ecall
	
	# stampa n!
	add a0, s0, zero 
	addi a7, zero, 1
	ecall
	
	# stampa \n
	la a0, RTN
	addi a7, zero, 4
	ecall

	# exit
	addi a7, zero, 10
	ecall
	
	

fact:
	# Creazione del frame di attivazione funzione
	addi sp, sp, -24
	sd a0, 16(sp)
	sd ra, 8(sp)
	sd fp, 0(sp)
	addi fp, sp, 16
	
	# Se n != 0 passiamo a Ric
	bne a0, zero, Ric
	# se n == 0 poniamo reg di ritorno a 0
	addi a0, zero, 1
	j Fine # jump a Fine
	
	Ric:
		addi, a0, a0, -1	# Param di passaggio per fatt n-1
		jal fact			# Richiamo funzione
		ld t0, 0(fp)		# Carichiamo dalla mem n
		mul a0, a0, t0		# Moltiplichiamo n * fatt(n-1) e lo si carica su a0

	Fine:
		# Chiusura frame 
		ld fp, 0(sp)
		ld ra, 8(sp)
		addi sp, sp, 24
		jr ra

.data
	messaggio:	.asciz "Fattoriale\n"
	insdati:	.asciz "Inserire n = "
	insaltezza:	.asciz "Altezza = "
	visris:		.asciz "n! = "
	RTN:		.asciz "\n"
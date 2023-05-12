.globl _start
.text

_start:
	li a0, 5
	
	jal fact
	
	add t0, a0, zero

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
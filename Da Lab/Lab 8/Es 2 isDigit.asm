# Scrivere una funzione RISC-V digit che verifichi se un byte passato come parametro 
# nel registro a0 rappresenta un carattere cifra (0-9) nella codifica ASCII. 
# Verificare vuol dire: restituire 1 se la condizione è vera, 0 altrimenti.

# Quindi dobbiamo se il carattere dato ha valore decimale tra 48 e 57 compresi

.globl _start
.data 
	byte: .byte '1'
 
.text

_start:

    #<assembler code here>
    
    la a1, byte
    jal digit
    
    li a7, 1
	ecall
    
    j exit
   	
digit:
	lb a1, 0(a1)
	addi t0, t0, 48
	addi t1, t1, 57
	
	blt a1, t0, not_dig
	bgt a1, t1, not_dig
	addi a0, a0, 1
	ret
	
	not_dig:
	li a0, 0
	ret


exit:
	
    addi x17, x0, 10  # call number 10 = exit
    ecall
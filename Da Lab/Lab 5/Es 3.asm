.globl _start
.data 
	MemVett: .dword -12, 2, 1, 3, 5, 1, 7, 1, -1, 4
 	
#################################<completare questa parte>>
.text

_start:
 	
	li t0, 0	# t0 = Ris = 0 Inizializzazione Ris
	la t2, MemVett
	
#################################<<Codice da Esercizio>>
    addi t1, t1, 0	# t1 = i
	addi t3, zero, 10 # Lunghezza Array
CICLO:
	ld t4, 0(t2)	# Carica Valore array[i] 
	add t0, t0, t4 	# Somma Ris += array[i]
	addi t2, t2, 8 	# agg. offset
	addi t1, t1, 1 	# i++
	blt t1, t3, CICLO	# i < array.size
   
   
PRINT:
	add a0, zero, t0
	addi a7, zero, 1
	ecall

exit:
    addi x17, x0, 10  # call number 10 = exit
    ecall
    
    
    
##########################<<Codice in C>>
#include <stdio.h>
#
#int main(){
#   long MemVett[10]= {-12, 2, 1, 3, 5, 1, 7, 1, -1, 4};
#   int i = 0, Ris = 0;
#    
#   size_t n = sizeof(MemVett) / sizeof(long);
#
#   while(i < n){
#       Ris += MemVett[i];
#       ++i;
#   }
#}


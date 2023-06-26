# Scrivere una funzione RISC-V strupr che converta in maiuscolo tutti i caratteri di
# una stringa ASCII presente in memoria.
# Si supponga che la stringa sia composta solo da lettere (a-z).

# Dobbiamo decrementare il valore decimare del carattere di 32

# void strupr (char* in_string){
# 	char* c = in_string;
# 	while (*c) {
# 		printf("c", (*c-32));
# 		++C;
# 	}
# 	putchar( '\n') ;
# }
.globl _start
.data 
	str: .string "architettura"
.text

_start:

    #<assembler code here>
   	la a0, str
   	jal strupr
   	
   	j exit
   	
strupr:
	lbu t0, 0(a0)
	loop_strupr:
	beqz t0, end_strupr
	addi t0, t0, -32
	sb t0, 0(a0)
	addi a0, a0, 1
	j strupr
	end_strupr:
	ret
	

exit:
    addi x17, x0, 10  # call number 10 = exit
    ecall

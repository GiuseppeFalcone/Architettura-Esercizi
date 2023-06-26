.globl _start
.data 

 
.text

_start:

    #<assembler code here>
    li x5, 0x8000000000000000
    li x6, 0xD000000000000000
   	# ● Quale sarà il contenuto di x30 dopo l’esecuzione 
   	# di questa istruzione assembler 
   	add x30, x5, x6
   	# Il contenuto di x30 è corretto, o si è verificato un overflow?
	
	# ● Quale sarà il contenuto di x30 dopo l’esecuzione 
	# di questa istruzione assembler: 
	sub x30, x5, x6
	# Il contenuto di x30 è corretto o si è verificato un overflow?

	# ● Quale sarà il contenuto di x30 dopo l’esecuzione di queste 
	# due istruzioni assembler: 
	add x30, x5, x6
    add x30, x30, x5
	# Il contenuto di x30 è corretto o si è verificato un overflow?
   

exit:
    addi x17, x0, 10  # call number 10 = exit
    ecall

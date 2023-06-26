# ########################################################################
# Esercizio 4 – atoi() 
# Scrivere una funzione RISC-V atoi che converta una stringa ASCII con un numero
# intero positivo in una variabile numerica (intero in complemento a 2). Il
# valore ottenuto deve essere restituito al chiamante nel registro a0.
# Realizzare atoi usando l’algoritmo ricorsivo riportato nella prossima slide.
# Realizzare poi il «main» (riportato nella prossima slide) che utilizza
# isnumber e atoi per stampare a schermo il quadrato di un numero presente in
# una stringa ASCII (se la stringa contiene un numero valido).
# ########################################################################

.globl _start

.data
  size:   .word 3
  in_str: .string "678" 

.text

_start:
  la a0, in_str    # a0 contiene indirizzo della stringa
  la a1, size      # indirizzo size (temporaneamente)
  lw a1, 0(a1)     # a1 contiene la size della stringa

  jal atoi_new
  
  
  li a7, 1         # stampo risultato {0,1} presente in a0
  ecall

exit:
  li a7, 10
  ecall


# ########################################################################
# unsigned long atoi_new (char* str, unsigned long n){
#   if(n==1)
#     return str[0]-'0';
#   return (10*atoi_new(str, n-1) + str[n-1]-'0');
# }
# ########################################################################
# 
# a0 --> indirizzo di in_str
# a1 --> size della stringa
atoi_new:
  li a6, 1             # a6 contiene la costante 1
  
  bne a1, a6, go_ahead # if(n!=1)
  lbu t0, 0(a0)        # dereferenzio str[0]-'0';
  addi t0, t0, -48     # risalgo al valore intero
  mv a0, t0            # copio risultato in a0
  jr ra                # return

  go_ahead:
    addi sp, sp, -32     
    sd ra, 0(sp)
    sd a0, 8(sp) 
    sw a1, 16(sp)
    sd s3, 24(sp)      # nella seconda parte della ricorsione contiene str[n-1]

    addi a1, a1, -1    # n-1
    add t0, a0, a1     # offset per str[n-1]
    lbu s3, 0(t0)      # carico in s3 valore puntato da str[n-1]
    addi s3, s3, -48   # risalgo al valore intero del byte
                       # str[n-1]-'0'; NB: 48 è il valore intero della cifra '0'

    jal atoi_new
    # a0 contiene risultato su coda
    # return (10*atoi_new(str, n-1) + str[n-1]-'0')
    # lw s3, 24(sp)       # restore s3, che contiene str[n-1]
    
    li t5, 10
    mul t4, t5, a0      # (10*atoi_new(str, n-1)
    add a0, s3, t4      # riga sopra + str[n-1]-'0'
  
  on_exit:
    ld ra, 0(sp)
    # ld a0, 8(sp)  # ***** non da restore, poiché contiene risultato
    # lw a1, 16(sp)
    lw s3, 24(sp)
    addi sp, sp, 32
    
    jr ra



# ########################################################################
# 


















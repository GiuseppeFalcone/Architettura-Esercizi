
.globl _start

.data

.text



# int main(){
#   int a = 3;
#   int b = 4;
#   int result;
#   result = multiply(a,b);
#   printf("summing %d and %d \n", a, b);
#   printf("result: %d\n", result);
#   exit(0);
# }
_start:
  li a0, 3  # a 
  li a1, 2  # b 
  
  li s1, 10 # registro salvato

  # a0 conterrà il risultato di multiply
  jal multiply
  
  printresult:
    li a7, 1
    ecall
    
  exit:
    li a7, 10
    ecall
  
  
# int multiply(int a, int b){
#   int acc = 0;
#   int i = 0;
#   while(i < b){
#     acc += a;
#     ++i;
#   }
#   return acc;
# }

# a0 -> a
# a1 -> b
multiply:
  addi sp, sp, -8
  sd s1, 0(sp) # SALVO il contenuto di s1 su stack
  li s1, 0  # per risultato, acc
  li t1, 0  # per cursore i
  
  whileloop:
    beq t1, a1, endwhile
    add s1, s1, a0
    addi t1, t1, 1

    j whileloop

  endwhile:
    mv a0, s1 # metto in a0 il risultato
    ld s1, 0(sp)# RIPRISTINO contenuto di s1 dallo stack
    addi sp, sp, 8
    jr ra













#include <stdio.h>
#include <stdlib.h>
// ////////////////////////////////////////////////////////////////////////
// Esercizio 2 – digit ()
// Scrivere una funzione RISC-V digit che verifichi se un byte passato come
// parametro nel registro a0 rappresenta un carattere cifra (0-9) nella codifica
// ASCII. Verificare vuol dire: restituire 1 se la condizione è vera, 0
// altrimenti.
// ////////////////////////////////////////////////////////////////////////

int isdigit_new(char in_char) {
  return (in_char >= 48 && in_char <= 57) ? 1 : 0;
}


int main() {
  char char_a = 'a';  
  char char_9 = '9';
  
  printf("isdigit_new(%c) = %d (0=F; 1=T)\n", char_a, isdigit_new(char_a));  
  printf("isdigit_new(%c) = %d (0=F; 1=T)\n", char_9, isdigit_new(char_9));  
  
  exit(0);
}
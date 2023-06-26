#include <stdio.h>
#include <stdlib.h>
// ////////////////////////////////////////////////////////////////////////
// Esercizio 3 – isnumber()
// Scrivere una funzione RISC-V isnumber che controlli se una stringa ricevuta
// come parametro è la rappresentazione di un numero intero positivo in ASCII.
// Controllare vuol dire: restituire 1 se la condizione è vera, 0 altrimenti.
//
// isnumber deve utilizzare la funzione digit realizzata nell’esercizio
// precedente.
// ////////////////////////////////////////////////////////////////////////

int isdigit_new(char in_char) {
  return (in_char >= 48 && in_char <= 57) ? 1 : 0;
}

int isnumber(char* in_str){
  char* cursor = in_str;

  if(!(*cursor)){return 0;}
  
  while(*cursor){ // *cursor != '\0'
    if(!isdigit_new(*cursor)){
      return 0;
    }
    ++cursor;
  }
  // se non sono ancora uscito, allora è un numero
  return 1;
}

int main() {
  char* in_str = "123";  
  printf("isnumber(%s) = %d (0=F; 1=T)\n", in_str, isnumber(in_str));  
  
  exit(0);
}










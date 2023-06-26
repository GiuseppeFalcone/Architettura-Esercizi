#include <stdio.h>
#include <stdlib.h>

// Scrivere una procedura RISC-V strrchr(str, char) per restituire l’indirizzo
// in memoria dell’ultima occorrenza di char in str.
// strrchr(str, char)restituisce 0 se char non è presente in str.

int strrch(char* mystring, char miochar){
  int i = 0;
  char* return_pos = 0;
  while(mystring[i] != '\0'){
    if(mystring[i] == miochar)
      return_pos = mystring+(i*4);
    ++i;
  }
  
  if(return_pos == 0) 
    return 0;
  else 
    return (return_pos-mystring)/4;  
}

int main(int argc, char** argv){
  
  char* mystring = "my long string";
  char searched_char = 'g';

  printf("the last position of char %c in %s is %d\n", 
            searched_char, mystring, strrch(mystring,searched_char));

  exit(0);
}


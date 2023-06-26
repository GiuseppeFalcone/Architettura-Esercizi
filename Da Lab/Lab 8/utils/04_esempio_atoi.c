#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// ///////////////////////////////////////////////////////////////////////////
// Esercizio 4 – atoi()
// Scrivere una funzione RISC-V atoi che converta una stringa ASCII con un
// numero intero positivo in una variabile numerica (intero in complemento a 2).
// Il valore ottenuto deve essere restituito al chiamante nel registro a0. 
// Realizzare atoi usando l’algoritmo ricorsivo 
// Realizzare poi il «main» che utilizza
// isnumber e atoi per stampare a schermo il quadrato di un numero presente in
// una stringa ASCII (se la stringa contiene un numero valido).
// ///////////////////////////////////////////////////////////////////////////

int isdigit_new(char);
int isnumber(char*);


// PRE: in_string contiene unicamente delle cifre {0,9}
// 
unsigned long atoi_new (char* str, unsigned long n){
  if(n==1){
    return str[0]-'0';
  }
  return (10*atoi_new(str, n-1) + str[n-1]-'0');
}

unsigned long atoi_new_debug (char* str, unsigned long n){
  if(n==1){
    printf("about to return %d\n", (str[0]-'0'));
    return str[0]-'0';
  }
  printf("(10*atoi_new(%s, %lu) + %d)\n", str, (n-1), (str[n-1]-'0'));
  return (10*atoi_new_debug(str, n-1) + str[n-1]-'0');
}
// AN(678,3)
//   return (10 * AN(678,2)) + 8
//       return (10 * AN(678,1)) + 6
//           return 6
//       return (10 * (6)) + 7
//   return (10 * ((10 * (6)) + 7)) + 8
//           10 *        67         + 8 = 678 ;)


int main(int argc, char** argv) {
  char* str1 = "678";  
  unsigned long x = atoi_new_debug(str1,strlen(str1));
  printf("%lu * %lu = %lu\n", x, x, x*x);  
  
  exit(0);
}



int isdigit_new(char in_char) {
  return (in_char >= 48 && in_char <= 57) ? 1 : 0;
}

int isnumber(char* in_str){
  char* cursor = in_str;

  if(!(*cursor)){return 0;}
  
  while(*cursor){
    if(!isdigit_new(*cursor)){
      return 0;
    }
    ++cursor;
  }
  return 1;
}







// elementi dell'array: 1     2     3     4    
//                      | | | |

#include <stdio.h>
#include <stdlib.h>


int main(int argc, char** argv){
  int size = 7;
  int array[] = {1, 2, 3, 4, 6, 7, 8};

  int i = 0;
  int counter = 0;
  int val_at_i = 0;
  //int dispari = 0;
  
  while(i < size) {
    val_at_i = array[i];
    counter += val_at_i & 1;
    
    ++i;
  }  
  printf("nell'array ci sono %d numeri dispari \n", counter);
  
  exit(0);
}
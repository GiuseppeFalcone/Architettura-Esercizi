#include <stdio.h>
#include <stdlib.h>

// ////////////////////////////////////////////////////////////////////////////
// Scrivere due versioni per una procedura che calcoli la somma di un array di
// word in memoria:
// una iterativa (cfr. Lab 5, Esercizio 4)
// una ricorsiva →  somma := v[1] + somma(v[2:s])
// ////////////////////////////////////////////////////////////////////////////


int somma_it(int size, int vettore[]) {
  int res = 0;
  int i = 0;  
  while(i < size) {
    res += vettore[i++];
    // res += vettore[i];
    // i++;
  }    
  return res;
}



int somma_ric(int size, int* vettore) {
  if(size <= 0) 
    return 0;  
  return (vettore[size-1] + somma_ric(size-1, vettore));
}
// SR(3, {2,1,7})
//   return 7 + SR(2,{2,1,7})
//     return 1 + SR(1, {2,1,7})
//       return 2 + SR(0, {2,1,7})
//       return 2 + 0
//     return 1 + 2
//   return 7 + 3
//


// somma := v[1] + somma(v[2:s])

int somma_ric2(int index, int size, int* vettore) {
  if(index == size) 
    return 0;
  return (vettore[index] + somma_ric2(index+1, size, vettore));
}

// ===============================================================
// SR(0, 3, {2,1,7})
// + +return (2 + SR(1, 3, {2,1,7}))
// | |  +return (1 + SR(2, 3, {2,1,7}))
// | |  |  return (7 + SR(3, 3, {2,1,7}))
// | |  |  return (7 + (0))
// | |  +return (1 + (7))
// + +return (2 + (8))
// return (10)
// ===============================================================

int main(){
  int size = 3;
  int vettore[] = {2, 1, 7};
  // int size = 16;
  // int vettore[] = {2, 1, 7, 1, 2, 2, 2, 1, 12, 1, 7, 1, 2, 2, 2, 1};

  printf("result (somma_it):   %d\n", somma_it(size,vettore));
  printf("result (somma_ric):  %d\n", somma_ric(size,vettore));
  printf("result (somma_ric2): %d\n", somma_ric2(0,size,vettore));
  exit(0);
}



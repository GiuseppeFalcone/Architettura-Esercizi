#include <stdio.h>
#include <stdlib.h>
#include <stdio.h>  

// ////////////////////////////////////////////////////////////////////////
// Esercizio 7 – SELECTION SORT
// 
// 
// ////////////////////////////////////////////////////////////////////////


void swap(int *a, int *b) { 
  int temp = *a; 
  *a = *b; 
  *b = temp; 
}   

void selectionSort(int array[], int size){ 
  int i, j, min_idx; 

  for (i = 0; i < size-1; i++) {
    min_idx = i; 
    for (j = i+1; j < size; j++) {
      if (array[j] < array[min_idx]) {
        min_idx = j;
      }
    }
    swap(&array[min_idx], &array[i]); 
  } 
}

int is_sorted(int* array, int size){
 int last = array[0];
 int idx = 1;
 while(idx < size){
   if(array[idx] < last)
     return 0;
   last = array[idx];
   ++idx;
 }
 return 1;
}

void printArray(int array[], int size) { 
  int i; 
  for (i=0; i < size; i++) 
  printf("%d \n", array[i]); 
  printf("\n"); 
}   

int main() { 
  int size = 4;
  int array[] = {12, 44, 2, 1}; 

  printf("\narray is sorted: %s\n", (is_sorted(array,size) ? "TRUE" : "FALSE"));

  printf("UNSORTED array:\n"); 
  printArray(array, size); 
  
  selectionSort(array, size); 
  
  printf("array is sorted: %s\n", (is_sorted(array,size) ? "TRUE" : "FALSE"));

  printf("Sorted array:\n"); 
  printArray(array, size); 
  
  exit(0); 
}

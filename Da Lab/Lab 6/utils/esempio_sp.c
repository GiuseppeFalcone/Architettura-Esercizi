#include <stdio.h>
#include <stdlib.h>


int multiply(int a, int b){
  int i = 0;
  int acc = 0;
  while(i < b){
    acc += a;
    ++i;
  }
  return acc;
}

int main(){
  int a = 3;
  int b = 4;
  int result;
  result = multiply(a,b);
  printf("result: %d\n", result);
  exit(0);
}
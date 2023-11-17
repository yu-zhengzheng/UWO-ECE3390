#include <stdio.h>
int i,j,c; 
main() { 
start: 
  i++, c=0, j=i; 
loop: 
 j--; //divisors are from i-1 to 1 instead of i to 2 
  if( j == 0 ) goto next; 
  if( i%j != 0 ) goto loop; 
  c++;  
  goto loop; 
next: 
  c--; 
  if( c != 0 ) goto start; 
  printf("%d \n",i); 
  goto start; 
} 
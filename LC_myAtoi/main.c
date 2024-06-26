#include <stdio.h>


extern int myAtoi(char* s)

__attribute__((naked)); int main()
{
  char a[] = {'0',' ', '-','2','1', '4', '7', '4', '8', '3', '6', '4', '8'};
  char* s = a;
  printf("%c\n", a[0]);
  int x = myAtoi(s);
  printf("%c\n", a[0]);
  printf("%d\n", x);
  return 0;
}

#include <stdio.h>

extern int* quickSort(int* inArray, int size, int start, int end)

__attribute__((naked)); int main()
{
  int inArray[] = { 5, 4, 8, 10, 99,3,12,1,6, 1002, 1008, 1990, 20315, 78941};
  int arraySize = sizeof(inArray)/4;
  int start = 0;
  int end = arraySize-1;
  printf("%d\n", arraySize);
  for(int i = 0; i < arraySize; i+=1)
  {
    printf("%d\n", inArray[i]);
  }
  printf("\n");
  quickSort(inArray, arraySize, start, end);
  arraySize = sizeof(inArray)/4;
  for(int i = 0; i < arraySize; i+=1)
  {
    printf("%d\n", inArray[i]);
  }

  
  return 0;
}

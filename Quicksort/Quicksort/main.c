#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>

extern int* quickSort(int* inArray, int size, int start, int end)

__attribute__((naked)); int main()
{
    int inArray[1000000];
    int arraySize = sizeof(inArray) / 4;  // arraySize in Anzahl der Elemente
    int start = 0;
    struct timeval startTime, endTime;

    // Array mit Zufallswerten fuellen
    for (int i = 0; i < arraySize; i++) {
        inArray[i] = rand() % 2147483648;
    }
    for(int i = 0; i < arraySize; i+=1)
    {
    printf("%d\n", inArray[i]);
    }
    int end = arraySize - 1;

    // Startzeit messen
    gettimeofday(&startTime, NULL);

    // Quicksort aufrufen
    quickSort(inArray, arraySize, start, end);

    // Endzeit messen
    gettimeofday(&endTime, NULL);
    printf("%d\n", arraySize);
    for(int i = 0; i < arraySize; i+=1)
    {
    printf("%d\n", inArray[i]);
    }
  printf("\n");
    // Berechnung der verstrichenen Zeit in Sekunden
    double elapsedTime = (endTime.tv_sec - startTime.tv_sec) + 
                         (endTime.tv_usec - startTime.tv_usec) / 1000000.0;

    printf("Elapsed Time in seconds: %f\n", elapsedTime);

    return 0;
}

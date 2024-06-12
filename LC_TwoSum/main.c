#include <stdlib.h>
/**
 * Note: The returned array must be malloced, assume caller calls free().
 */
/*Incoming Arguments have the following order:
  RDI
  RSI
  RDX
  RCX
*/
extern int* twoSum(int* nums, int numsSize, int target, int* returnSize)

__attribute__((naked)); int main()
{
	int numsA[] = { 2,7,11,15 };
	int *returnSize = malloc(sizeof(int));
	int numsSize = sizeof(numsA) / 4;
  int target = 9;
	twoSum(numsA, numsSize, target, returnSize);

	return 0;

}

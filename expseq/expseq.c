#include <math.h>
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char* argv[])
{
  int fstnum = 0, lstnum;
  if (argc == 2) {
	char* endptr = argv[1];
	lstnum = strtol(argv[1], &endptr, 10);
	if (!endptr) {
	  fprintf(stderr, "%s: non-numeric arg: %s\n", argv[0], argv[1]);
	  return 0;
	}
  } else if (argc == 3) {
	char* endptr = argv[1];
	fstnum = strtol(argv[1], &endptr, 10);
	if (!endptr) {
	  fprintf(stderr, "%s: non-numeric arg: %s\n", argv[0], argv[1]);
	  return 0;
	}
	endptr = argv[2];
	lstnum = strtol(argv[2], &endptr, 10);
	if (!endptr) {
	  fprintf(stderr, "%s: non-numeric arg: %s\n", argv[0], argv[2]);
	  return 0;
	}
  } else {
	  fprintf(stderr, "%s: missing operand\n", argv[0]);
	return 0;
  }
  int i = fstnum;
  while (i <= lstnum) {
	printf("%d\n", (int) pow(2, (float) i));
	i++;
  }
  return 0;
}

#include <math.h>
#include <stdio.h>
#include <stdlib.h>

#define HELPMSG "USAGE: expseq LAST\n  or:  expseq FIRST LAST\n  or:  expseq --help\n"\
                "Print numbers 2^FIRST to 2^LAST in exponential steps.\n\n"\
                "If FIRST is omitted, it defaults to 0.\n"

int main(int argc, char* argv[])
{
  int fstnum = 0, lstnum, i;
  if (argc == 2) {
        if (strcmp(argv[1], "--help")==0
            || strcmp(argv[1], "-h")==0) {
          fprintf(stderr, HELPMSG);
          return 1;
        } else {
	  char* endptr = argv[1];
	  lstnum = strtol(argv[1], &endptr, 10);
	  if (!endptr) {
	    fprintf(stderr, "%s: non-numeric arg: %s\n", argv[0], argv[1]);
	    return 1;
	  }
        }
  } else if (argc == 3) {
	char* endptr = argv[1];
	fstnum = strtol(argv[1], &endptr, 10);
	if (!endptr) {
	  fprintf(stderr, "%s: non-numeric arg: %s\n", argv[0], argv[1]);
	  return 1;
	}
	endptr = argv[2];
	lstnum = strtol(argv[2], &endptr, 10);
	if (!endptr) {
	  fprintf(stderr, "%s: non-numeric arg: %s\n", argv[0], argv[2]);
	  return 1;
	}
  } else {
	  fprintf(stderr, "%s: missing operand\n", argv[0]);
	return 1;
  }
  i = fstnum;
  while (i <= lstnum) {
	printf("%d\n", (int) pow(2, (float) i));
	i++;
  }
  return 0;
}

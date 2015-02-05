CC      = musl-gcc
LDFLAGS = -lm
prefix  = /usr/local

all: expseq

expseq:
	$(CC) $(LDFLAGS) expseq.c -o $@

install:
	install -m 0755 expseq $(prefix)/bin

clean:
	rm -f expseq expseq.o

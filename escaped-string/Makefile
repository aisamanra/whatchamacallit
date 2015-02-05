CC      = musl-gcc
LDFLAGS = -lm
prefix  = /usr/local

all: escstring

escstring:
	$(CC) $(LDFLAGS) escstring.c -o $@

install:
	install -m 0755 escstring $(prefix)/bin

clean:
	rm -f escstring escstring.o

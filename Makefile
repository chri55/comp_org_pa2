CC = gcc

all:
	gcc -o formula formula/nCr.s
	gcc -o mystery mystery/mystery.c

clean:
	rm -rf formula/formula
	rm -rf mystery/mystery

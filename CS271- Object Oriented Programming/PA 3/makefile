all: pa3

pa3: pa3functions.o pa3.o
	gcc pa3functions.o pa3.o -lm -o pa3

pa3functions.o: pa3functions.c pa3functions.h
	gcc -c pa3functions.c

pa3.o: pa3.c pa3functions.h
	gcc -c pa3.c

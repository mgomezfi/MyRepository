all: pa5

pa5: sortingFunctions.o pa5.o
	gcc sortingFunctions.o pa5.o -lm -o pa5

sortingFunctions.o: sortingFunctions.c sortingFunctions.h
	gcc -c sortingFunctions.c

pa5.o: pa5.c sortingFunctions.h
	gcc -c pa5.c

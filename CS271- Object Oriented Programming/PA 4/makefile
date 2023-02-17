all: pa4

pa4: arrayFunctions.o pa4.o
	gcc arrayFunctions.o pa4.o -lm -o pa4

arrayFunctions.o: arrayFunctions.c arrayFunctions.h
	gcc -c arrayFunctions.c

pa4.o: pa4.c arrayFunctions.h
	gcc -c pa4.c

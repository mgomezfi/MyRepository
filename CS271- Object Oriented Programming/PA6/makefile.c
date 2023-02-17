all: pa6

pa6: textfunctions.o pa6.o
	gcc textfunctions.o pa6.o -lm -o pa6

textfunctions.o: textfunctions.c textfunctions.h
	gcc -c textfunctions.c

pa6.o: pa6.c textfunctions.h
	gcc -c pa6.c
clean:
	rm -rf *.o

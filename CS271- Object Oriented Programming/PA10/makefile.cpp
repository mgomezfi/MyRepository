all: TermTest

TermTest: Term.o TermTest.o
	g++ -std=c++11 Term.o TermTest.o -o TermTest

Term.o: Term.cpp Term.h
	g++ -std=c++11 -c Term.cpp

TermTest.o: TermTest.cpp Term.h
	g++ -std=c++11 -c TermTest.cpp
clean:
	rm -rf *.o

all: pa7

pa7: bst.o pa7.o
	g++ -std=c++11 bst.o pa7.o -lm -o pa7

bst.o: bst.cpp bst.h
	g++ -std=c++11 -c bst.cpp

pa7.o: pa7.cpp bst.h
	g++ -std=c++11 -c pa7.cpp
clean:
	rm -rf *.o

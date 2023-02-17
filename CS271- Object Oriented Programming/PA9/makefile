all: PA9Test

PA9Test: WindTurbine.o PA9Test.o
	g++ -std=c++11 WindTurbine.o PA9Test.o -o PA9Test

WindTurbine.o: WindTurbine.cpp WindTurbine.h
	g++ -std=c++11 -c WindTurbine.cpp

PA9Test.o: PA9Test.cpp WindTurbine.h
	g++ -std=c++11 -c PA9Test.cpp
clean:
	rm -rf *.o

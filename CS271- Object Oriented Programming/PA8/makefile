all: EmployeeTest

EmployeeTest: Employee.o EmployeeTest.o
	g++ -std=c++11 Employee.o EmployeeTest.o -o EmployeeTest

Employee.o: Employee.cpp Employee.h
	g++ -std=c++11 -c Employee.cpp

EmployeeTest.o: EmployeeTest.cpp Employee.h
	g++ -std=c++11 -c EmployeeTest.cpp
clean:
	rm -rf *.o

CXX=g++
path_openmpi=/opt/openmpi-1.8.1/bin
CXXFLAGS=-Wall -std=gnu++0x -fopenmp 
CXXFLAGSO1=-Wall -std=gnu++0x -fopenmp -O1
# CXXFLAGSO3=-Wall -std=gnu++0x -fopenmp -O3
CXXFLAGSO3=-Wall -fopenmp -O3
CXXDEBUGFLAGS=-Wall -std=gnu++0x -fopenmp -g

all:
	${CXX} ${CXXFLAGS} fascia.cpp -o fascia

O1:
	${CXX} ${CXXFLAGSO1} fascia.cpp -o fascia-O1

O3:
	${CXX} ${CXXFLAGSO3} fascia.cpp -o fascia-O3

MPI: 
	${path_openmpi}/mpicxx ${CXXFLAGSO3} fascia.cpp -o fascia-MPI

debug:
	${CXX} ${CXXDEBUGFLAGS} fascia.cpp -o fascia

clean:
	rm -f fascia fascia-O1 fascia-O3 fascia-MPI

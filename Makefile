# Makefile for compiling Cython code

# Cython source file
CYTHON_SRC = main.pyx

# Extension module name (output)
EXTENSION_MODULE = main

# Python version (modify if needed)
PYTHON_VERSION = 3.10

# Compiler flags
CFLAGS = -Wall -g

# Directory for the built extension module
BUILD_LIB = .

all: cythonize build gcc

cythonize:
	cython $(CYTHON_SRC)

build:
	python$(PYTHON_VERSION) setup.py build_ext --build-lib=$(BUILD_LIB)

gcc:
	gcc -o app.o builder.c -I/usr/include/python$(PYTHON_VERSION) -lpython$(PYTHON_VERSION) $(CFLAGS)

run:
	PYTHONPATH=`pwd` ./app.o

clean:
	rm -f $(EXTENSION_MODULE).c $(EXTENSION_MODULE).so
	rm -f new.o
	rm -rf build

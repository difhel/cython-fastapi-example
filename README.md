# Cython fastapi example

A sample fastapi project and helper modules to compile it into a single .o file for execution using cython.

You can check my article about cythonized fastapi with benchmarks (on Russian) - https://difhel.dev/blog/cython-fastapi-benchmark

This article also contains some comprehensive instructions how to build and run this code.

## List of files
- main.pyx - main fastapi file, the entry point of the project.
- routes - routes of the project (in this example only one router - `ftl` with method `/method/ftl.test`)
- builder.c - C code to compile the generated cython file `main.c`.
- Makefile - makefile for the project. Options:
   - cythonize - run `cython main.pyx`.
   - build - translate the project to `main.c` and compile it to `main.<arch>.so` file
   - gcc - compile the file `main.c` to `app.o`
   - run - start the project with environment variable `PYTHONPATH=pwd`
   - clean - delete build artifacts

## Dependencies
- You run this in a bash shell
- You have installed fastapi (`pip3 install fastapi`)
- You have installed cythonized uvicorn (`pip3 install "uvicorn[standart]"`)
- You have installed cython (`pip3 install cython`)
- You have installed gcc compiler (`sudo apt-get install gcc`)

## Run
```bash
make && make run
```

## Test

```bash
$ curl -i http://localhost:5000/method/ftl.test
HTTP/1.1 200 OK
date: Sat, 16 Sep 2023 08:58:08 GMT
server: uvicorn
content-length: 16
content-type: application/json

{"ping":"pong2"}
```
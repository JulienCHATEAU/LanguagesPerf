ALGOCAPS=$(shell echo ${ALGO} | sed -e "s/\b\(.\)/\u\1/g")
UUID=$(shell uuidgen)
RESULTS:=$(ALGO)/Results-$(UUID).csv
CPU:=$(shell cat /proc/cpuinfo | grep "model name" | head -n 1 | awk -F ":" '{print $$2}' | xargs)

GCC:= $(shell gcc -v  2>&1 | tail -1 | xargs)
GO:=$(shell go version | xargs)
JAVAC:=$(shell javac --version | xargs)
JAVA:=$(shell java --version | head -n 1 | xargs)
OCAML:=$(shell ocamlc -v | head -n 1 | xargs)
NODE:=$(shell node -v | xargs)
PYTHON:=$(shell python3 --version | xargs)
RUST:=$(shell rustc --version | xargs)

all:

run:
	@test ${ALGO}

	@echo "Language|Tool|Time(msec)|PeakMemory(KB)|Instructions" > ${RESULTS}

	@gcc -o ${ALGO}/C/exec ${ALGO}/C/${ALGO}.c
	@sudo ./run_exec ${ALGO}/C/exec ${RESULTS} "C|${GCC}"

	@cd ${ALGO}/Go; go build -o exec
	@sudo ./run_exec ${ALGO}/Go/exec ${RESULTS} "Go|${GO}"

	@javac ${ALGO}/Java/${ALGO}.java
	@sudo ./run_exec "java ${ALGO}/Java/${ALGO}" ${RESULTS} "Java|${JAVAC} ${JAVA}"

	@sudo ./run_exec "node ${ALGO}/Javascript/${ALGO}" ${RESULTS} "Javascript|${NODE}"

	@ocamlc -o ${ALGO}/Ocaml/exec ${ALGO}/Ocaml/${ALGO}.ml
	@sudo ./run_exec ${ALGO}/Ocaml/exec ${RESULTS} "Ocaml|${OCAML}"

	@sudo ./run_exec "python3 ${ALGO}/Python/${ALGO}.py" ${RESULTS} "Python|${PYTHON}"

	@rustc -o ${ALGO}/Rust/exec ${ALGO}/Rust/${ALGO}.rs
	@sudo ./run_exec ${ALGO}/Rust/exec ${RESULTS} "Rust|${RUST}"

	@echo "" >> ${RESULTS}
	@echo "CPU: ${CPU}" >> ${RESULTS}

new:
	@test ${ALGO}

	mkdir ${ALGOCAPS}

	mkdir ${ALGOCAPS}/C
	touch ${ALGOCAPS}/C/${ALGO}.c

	mkdir ${ALGOCAPS}/Go
	touch ${ALGOCAPS}/Go/${ALGO}.go

	mkdir ${ALGOCAPS}/Java
	touch ${ALGOCAPS}/Java/${ALGOCAPS}.java

	mkdir ${ALGOCAPS}/Javascript
	touch ${ALGOCAPS}/Javascript/${ALGO}.js

	mkdir ${ALGOCAPS}/Ocaml
	touch ${ALGOCAPS}/Ocaml/${ALGO}.ml

	mkdir ${ALGOCAPS}/Python
	touch ${ALGOCAPS}/Python/${ALGO}.py

	mkdir ${ALGOCAPS}/Rust
	touch ${ALGOCAPS}/Rust/${ALGO}.rs

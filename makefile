ALGOCAPS=$(shell echo ${ALGO} | sed -e "s/\b\(.\)/\u\1/g")
UUID=$(shell uuidgen)
RESULTS:=$(ALGO)/Results-$(UUID).csv

all:

run:
	@test ${ALGO}

	@echo "Language|Tool|Time(msec)|PeakMemory(KB)|Instructions" > ${RESULTS}

	@gcc -o ${ALGO}/C/exec ${ALGO}/C/${ALGO}.c
	@sudo ./run_exec ${ALGO}/C/exec ${RESULTS} "C|"

	@cd ${ALGO}/Go; go build -o exec
	@sudo ./run_exec ${ALGO}/Go/exec ${RESULTS} "Go|"

	@javac ${ALGO}/Java/${ALGO}.java
	@sudo ./run_exec "java ${ALGO}/Java/${ALGO}" ${RESULTS} "Java|"

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

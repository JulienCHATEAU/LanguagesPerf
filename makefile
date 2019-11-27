ALGOCAPS=$(shell echo ${ALGO} | sed -e "s/\b\(.\)/\u\1/g")

all:

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

	mkdir ${ALGOCAPS}/PHP
	touch ${ALGOCAPS}/PHP/${ALGO}.php

	mkdir ${ALGOCAPS}/Python
	touch ${ALGOCAPS}/Python/${ALGO}.py

	mkdir ${ALGOCAPS}/Rust
	touch ${ALGOCAPS}/Rust/${ALGO}.rs

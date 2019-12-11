This tool is used to measure performances of some algorithms quickly.

# Easy use

## New algo
`make new ALGO=<algo_name>`

## Run algo
`make run ALGO=<algo_name>`

<!-- # Language installation / version

| Language | Installation | Dep Version
|---|---|---|
C | | 5.5.0
Go | | go1.13.4
Java | | 11.0.3
Javascript | | v13.1.0
Ocaml | | 4.02.3
Python | | 3.5.2
Rust | | -->

# Harder use

## Compile line

| Language | Compile line
|---|---|
C | gcc -o <algo_name> <algo_name>.c
Go | go build -o <algo_name>
Java | javac <algo_name>.java
Javascript |
Ocaml | ocamlc -o <algo_name> <algo_name>.ml
Python |
Rust | rustc -o <algo_name> <algo_name>.rs

## Execution line

| Language | Execution line
|---|---|
C | ./<algo_name>
Go | ./<algo_name>
Java | java <algo_name>
Javascript | node <algo_name>.js
Ocaml | ./<algo_name>
Python | python3 <algo_name>.py
Rust | ./<algo_name>

## Measure peak memory
`/usr/bin/time -v ./exec 2>&1 | grep "Maximum resident" | awk -F " " '{print $6}'`
Gives peak KB

## Measure instructions
`perf stat -r 10 -x , ./exec 2>&1 | grep instructions | awk -F "," '{print $1}'`

## Measure time
`perf stat -r 10 -x \| ./exec 2>&1 | grep msec | awk -F "|" '{print $1}'`
Gives msec

## Get CPU model
`cat /proc/cpuinfo | grep "model name" | head -n 1 | awk -F ":" '{print $2}' | xargs`

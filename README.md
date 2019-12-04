# Bible
http://www.brendangregg.com/Perf/linux_observability_tools.png

# New algo
make new ALGO=<algo_name>

# Language installation / version

| Language | Installation | Dep Version
|---|---|---|
C | | 5.5.0
Go | | go1.13.4
Java | | 11.0.3
Javascript | | v13.1.0
Ocaml | | 4.02.3
Python | | 3.5.2
Rust | |

# Compile line

| Language | Compile line
|---|---|
C | gcc -o <algo_name> <algo_name>.c
Go | go build -o dijsktra
Java | javac <algo_name>.java
Javascript |
Ocaml | ocamlc -o <algo_name> <algo_name>.ml
Python |
Rust | rustc -o <algo_name> <algo_name>.rs

# Execution line

| Language | Execution line
|---|---|
C | ./dijsktra
Go | ./dijsktra
Java | java <algo_name>
Javascript | js <algo_name>.js
Ocaml | ./dijsktra
Python | python3 <algo_name>.py
Rust | ./<algo_name>

# Measure memory
`/usr/bin/time -v ./exec 2>&1 | grep "Maximum resident"`

# Measure instructions

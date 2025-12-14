.PHONY: all mkdir

all: mkdir out/fib_rs out/fib_c out/fib_nim

mkdir:
	@mkdir -p out/

out/fib_rs: fib.rs | mkdir
	rustc -C opt-level=3 -C lto="fat" -C codegen-units=1 fib.rs -o out/fib_rs
out/fib_nim: fib.nim | mkdir
	nim c --debuginfo -o:out/fib_nim --mm:refc  -d:danger --checks=off --opt=speed --passC:"-funroll-loops -ffast-math -O3 -flto -mtune=native -march=native" --passL:"-flto" fib.nim
out/fib_c: fib.c | mkdir
	cc -o out/fib_c fib.c -O3 -flto -ffast-math -march=native

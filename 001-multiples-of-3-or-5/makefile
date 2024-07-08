./bin/multiples-of-3-or-5.exe: ./obj/multiples-of-3-or-5.obj
	mkdir -p bin
	gcc ./obj/multiples-of-3-or-5.obj -o ./bin/multiples-of-3-or-5.exe -no-pie

./obj/multiples-of-3-or-5.obj: ./src/multiples-of-3-or-5.asm
	mkdir -p obj
	nasm ./src/multiples-of-3-or-5.asm -o ./obj/multiples-of-3-or-5.obj -f elf64
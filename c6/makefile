#make file for c1.asm
main: main.o
	gcc -o main main.o -no-pie
main.o: main.asm
	nasm -f elf64 -g -F dwarf main.asm -l main.lst
clean:
	rm -f main.o
	rm -f main.lst
	rm -f main

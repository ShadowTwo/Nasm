#make file for c1.asm
c1: c1.o
	gcc -o c1 c1.o -no-pie
c1.o: c1.asm
	nasm -f elf64 -g -F dwarf c1.asm -l c1.lst
clean:
	rm -f c1.o
	rm -f c1.lst
	rm -f c1

#make file for c1.asm
c2: c2.o
	gcc -o c2 c2.o -no-pie
c2.o: c2.asm
	nasm -f elf64 -g -F dwarf c2.asm -l c2.lst
clean:
	rm -f c2.o
	rm -f c2.lst
	rm -f c2

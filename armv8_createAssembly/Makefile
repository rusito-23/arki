ARMGNU ?= aarch64-none-elf

AOPS = --warn --fatal-warnings

asm : main.list

all : asm

clean :
	rm -f *.o
	rm -f *.img
	rm -f *.hex
	rm -f *.list
	rm -f memory_map.txt

main.o : main.s
	$(ARMGNU)-as $(AOPS) main.s -o main.o


main.list: memmap main.o 
	$(ARMGNU)-ld main.o -T memmap -o main.elf -M > memory_map.txt
	$(ARMGNU)-objdump -D main.elf > main.list
	
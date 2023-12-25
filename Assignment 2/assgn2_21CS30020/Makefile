a.out: main.o libass2_21CS30020.a
	gcc main.o -L. -lass2_21CS30020

main.o: main.c myl.h
	gcc -c main.c

libass2_21CS30020.a: ass2_21CS30020.o
	ar -rcs libass2_21CS30020.a ass2_21CS30020.o

ass2_21CS30020.o: ass2_21CS30020.c myl.h
	gcc -c ass2_21CS30020.c

clean:
	rm a.out main.o libass2_21CS30020.a ass2_21CS30020.o
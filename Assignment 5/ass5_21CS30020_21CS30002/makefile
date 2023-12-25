#####################################-----Compiler Assignment 5------#########################################
##
##	Name : Gautam Kumar (21CS30020)
##		 : Ajay Kumar Dhakar (21CS30002)
##
##	make : To compile the files and generate Output files
##	make clean : Clean all the compiler generated file
##	make clean_all : Clean all compiler generated file alongwith the generated output.
##


all: a.out
	
	./a.out < testFiles/ass5_21CS30020_21CS30002_test1.c > outputFiles/ass5_21CS30020_21CS30002_quads1.out
	@echo "Test File 1 Successfully Translated !\n"
	./a.out < testFiles/ass5_21CS30020_21CS30002_test2.c > outputFiles/ass5_21CS30020_21CS30002_quads2.out
	@echo "Test File 2 Successfully Translated !\n"
	./a.out < testFiles/ass5_21CS30020_21CS30002_test3.c > outputFiles/ass5_21CS30020_21CS30002_quads3.out
	@echo "Test File 3 Successfully Translated !\n"
	./a.out < testFiles/ass5_21CS30020_21CS30002_test4.c > outputFiles/ass5_21CS30020_21CS30002_quads4.out
	@echo "Test File 4 Successfully Translated !\n"
	./a.out < testFiles/ass5_21CS30020_21CS30002_test5.c > outputFiles/ass5_21CS30020_21CS30002_quads5.out
	@echo "Test File 5 Successfully Translated !\n"

	@echo "\nALL TEST FILES SUCCESSFULLY TRANSLATED !!\n"

a.out: lex.yy.o y.tab.o ass5_21CS30020_21CS30002_translator.o
	g++ -std=c++11 lex.yy.o y.tab.o ass5_21CS30020_21CS30002_translator.o -lfl 2>> Warnings.txt

ass5_21CS30020_21CS30002_translator.o: ass5_21CS30020_21CS30002_translator.cxx ass5_21CS30020_21CS30002_translator.h
	g++ -std=c++11 -c ass5_21CS30020_21CS30002_translator.h 2>> Warnings.txt
	g++ -std=c++11 -c ass5_21CS30020_21CS30002_translator.cxx 2>> Warnings.txt

lex.yy.o: lex.yy.c
	g++ -std=c++11 -c lex.yy.c

y.tab.o: y.tab.c
	g++ -std=c++11 -c y.tab.c

lex.yy.c: ass5_21CS30020_21CS30002.l y.tab.h ass5_21CS30020_21CS30002_translator.h
	flex ass5_21CS30020_21CS30002.l

y.tab.c: ass5_21CS30020_21CS30002.y
	yacc -dtv ass5_21CS30020_21CS30002.y 2>> Warnings.txt

y.tab.h: ass5_21CS30020_21CS30002.y
	yacc -dtv ass5_21CS30020_21CS30002.y 2>> Warnings.txt

clean_all:
	rm lex.yy.c y.tab.c y.tab.h lex.yy.o y.tab.o ass5_21CS30020_21CS30002_translator.o y.output a.out ass5_21CS30020_21CS30002_translator.h.gch ./outputFiles/* Warnings.txt

clean:
	rm lex.yy.c y.tab.c y.tab.h lex.yy.o y.tab.o ass5_21CS30020_21CS30002_translator.o y.output a.out ass5_21CS30020_21CS30002_translator.h.gch Warnings.txt

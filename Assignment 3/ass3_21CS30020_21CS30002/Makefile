output: a.out ass3_21CS30020_21CS30002_test.c
	./a.out ass3_21CS30020_21CS30002_test.c > output.txt
a.out : flex.yy.c ass3_21CS30020_21CS30002.c
	cc flex.yy.c -lfl
flex.yy.c:	ass3_21CS30020_21CS30002.l
	flex -o flex.yy.c ass3_21CS30020_21CS30002.l ass3_21CS30020_21CS30002.c
clean:
	rm -f a.out flex.yy.c output.txt

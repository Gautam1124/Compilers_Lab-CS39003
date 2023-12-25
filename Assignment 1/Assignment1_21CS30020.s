	#																				ct2	ct1	ct3
	#	|	|	|	|	|	|	|	|	|	|	|	|	|40->fr1[]|	|	|28->n	|24->a[]|	|	|12->0	|8->1	|4->1	|(%rbp)
	#	alias(%eax) = t_
	#	here ct2 is the alais of i in c code and ct1 is the alias of j in c code and ct3 is the alias of ctr.
	
	
	.file	"code.c"			#Source file_name from which this assembly language is derived.
	.text					#.text is a section in which all the instruction or the main body of the program is present. 
	.globl	calculateFrequency		#(.globl) is a directive used in assembly language to declare a function or symbol as globally visible, it become available for external use.
	.type	calculateFrequency, @function	# (.type) is used to specify the type of symbol or label, here calculateFrequency is funtion that's why it is written as (@function)
calculateFrequency:				# Label reperesenting the beginning of the function.
.LFB0:						# LFB stands for (Local Function Block) here .LFB0 is the label representing the first local block of function.
	.cfi_startproc
	endbr64
	pushq	%rbp				# pushing(saving) the base pointer 
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp			# moving(copying) the stack pointer into the base pointer.
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)			# (%rdi) is the first argument of the function which is a[] , movq stands for move + quadword(64 bit) the adress of the array a[] will be stored in memory at (%rbp - 24)
	movl	%esi, -28(%rbp)			# (%esi) is the second argument of long type i.e (int n) the value of n is copied in the memory at adress (%rbp - 28)
	movq	%rdx, -40(%rbp)			# (%rbp) is the quadword type of third argument which is again a array the address of the array (ie fr1[] will be stored in memory at (%rbp - 40)
	movl	$0, -12(%rbp)			# here movel means moving a long(32 bit) value which is zero into a memory location relative to %rbp .
	jmp	.L2				# this instruction says a unconditional jump to a target lable L2
.L7:
	movl	$1, -4(%rbp)			# copying the value of 1 at the memory location of (%rbp - 4)====initializing ct3=1 (i.e in code ctr = 1)
	movl	-12(%rbp), %eax			# copying the value of 0 in %eax				======t_ = ct2 
	addl	$1, %eax			# adding the value of 1 into %eax which makes it 1		======t_ += 1
	movl	%eax, -8(%rbp)			# move the long value(32 bit) of %eax(1) into memory adress at (%rbp - 8)	=====ct1 = t_1
	jmp	.L3				# making an unconditional jump to L3
.L5:
	movl	-12(%rbp), %eax			# coping the value of ct2 into t_ 
	cltq							
	leaq	0(,%rax,4), %rdx		# %rax is the quadword version of %eax, here %rax is multiplied with 4 and stored in %rdx 
	movq	-24(%rbp), %rax			# the adress of the array a[] is passed into %rax(t_)
	addq	%rdx, %rax			# the address of tha array a[] is added with the value of %rdx { this operation is (a + 4*x) which is simply adress(a[x])
	movl	(%rax), %edx			# move the value of a[x] into %edx
	movl	-8(%rbp), %eax			# move the value of ct1(j) into the %eax(t_)
	cltq
	leaq	0(,%rax,4), %rcx		# here the ct1 is multiplied by 4
	movq	-24(%rbp), %rax			# the adress of a[] is moved into the register %rax
	addq	%rcx, %rax			# the address of tha array a[] is added with the value of %rdx { this operation is (a + 4*x) which is simply adress(a[x])
	movl	(%rax), %eax			# the value of a[j] is copied to %eax
	cmpl	%eax, %edx			# compare both a[i] and a[j] 
	jne	.L4				# if a[i] is not equal to a[j] jump to label L4
	addl	$1, -4(%rbp)			# increament the ct3 if the a[i] == a[j]
	movl	-8(%rbp), %eax			# copying the value of ct1(j) in %eax
	cltq
	leaq	0(,%rax,4), %rdx		# moving the adress associated with 4*j into %rdx
	movq	-40(%rbp), %rax			# moving the adress of fr1[] into %rax { %rax = fr1}
	addq	%rdx, %rax			# the address of fr1 is added with %rdx { the operation is (fr1 + 4*j) which is fr1[j]
	movl	$0, (%rax)			# copying the value of 0 in the location of fr1 + 4*j i.e fr1[j] = 0;
.L4:
	addl	$1, -8(%rbp)			# add +1 to the ct1(j) means increament if a[i] != a[j]
.L3:
	movl	-8(%rbp), %eax			# copying the value of ct1 into temporary t_ === t_ = ct1
	cmpl	-28(%rbp), %eax			#  %eax is set the flag is used to compare two operands and set the condition flags in the CPU's status register based on the result of the comparison.
	jl	.L5				# it stands of jump less than it means if the n is smaller than t_/ct1 jump to L5 else skip this line and move next.
	movl	-12(%rbp), %eax			# copying the value of ct2 into a t_
	cltq
	leaq	0(,%rax,4), %rdx		# Calculate the index offset for 'fr1[]' using 'ct1(i)'. %rdx = %rax * 4
	movq	-40(%rbp), %rax			# copying the adress of array fr1 into %rax
	addq	%rdx, %rax			# the address of tha array fr1[] is added with the value of %rdx { this operation is (fr1 + 4*i) which is simply adress(fr1[i])
	movl	(%rax), %eax			# copying the value of fr1[i] into %eax  
	testl	%eax, %eax			# testl check for the value of (%eax to be eqal to zero i.e  fr1[i] == 0 ?
	je	.L6				# if fr1[i] == 0 jump to label L6
	movl	-12(%rbp), %eax			# copy the value of i into %eax(t_)
	cltq
	leaq	0(,%rax,4), %rdx		# calculate the index offset by %rdx = 4*%rax(i)
	movq	-40(%rbp), %rax			# movint the address fr1 into %rax
	addq	%rax, %rdx			# the address fr1 is being added with offset to the the adress of the fr1[i]
	movl	-4(%rbp), %eax			# copy the value of ct3(ctr) into %eax
	movl	%eax, (%rdx)			# copying the value of ct3(ctr) into fr1[i]
.L6:
	addl	$1, -12(%rbp)			# add 1 to the value of ct1(i) 
.L2:						# L2 represents a specific label in the code.
	movl	-12(%rbp), %eax			# the instruction moves a 32-bit value from the memory location at -12(%rbp) to %eax, %eax is used to store a temporary value
	cmpl	-28(%rbp), %eax			#?????
	jl	.L7				# making unconditional jump to L7 if the ct2 < n
	nop
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
	
	
	#																				ct2	ct1	ct3
	#	|	|	|	|	|	|	|	|	|	|	|	|	|	|36->n |32->fr1[]|	|24->a[]|	|	|12->0	|8->1	|4->0	|(%rbp)	
	# %eax === t_ ; 
	
.LFE0:
	.size	calculateFrequency, .-calculateFrequency
	.section	.rodata
.LC0:						#label for string
	.string	"Element\tFrequency"		
.LC1:
	.string	"%d\t%d\n"
	.text
	.globl	printArrayWithFrequency		#printArrayWithFrequency is the global name
	.type	printArrayWithFrequency, @function	
printArrayWithFrequency:			# code of printArrayWithFrequency function starts
.LFB1:				
	.cfi_startproc
	endbr64
	pushq	%rbp				# pushing(saving) the previous base pointer
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp			# moving(copying) the stack pointer into base pointer
	.cfi_def_cfa_register 6
	subq	$48, %rsp			# Allocate 48 bits of space onto the stack	
	movq	%rdi, -24(%rbp)			# moving the first argument adress(a[]) into the location of %rbp -24 
	movq	%rsi, -32(%rbp)			# moving the quadword second argument address(fr1[]) into the location of %rbp - 32
	movl	%edx, -36(%rbp)			# copying the value of third argument(n) into the locatoin of %rbp - 36
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT			# call the puts function {puts???}
	movl	$0, -4(%rbp)			# copying the zero value to M[%rbp - 4]
	jmp	.L9				# uncoditional jump to L9
.L11:
	movl	-4(%rbp), %eax			# copy the value of ct3(m[%rbp - 4] ) into %eax(t_)
	cltq	
	leaq	0(,%rax,4), %rdx		# calculate the index offset by %rdx = 4*%rax(ct3)
	movq	-32(%rbp), %rax			# copy the adress fr1 into %rax
	addq	%rdx, %rax			# the address of tha array fr1[] is added with the value of %rdx { this operation is (fr1 + 4*i) which is simply adress(fr1[i])
	movl	(%rax), %eax			# copy the value of %rax(fr1[i]) into %eax(t_)
	testl	%eax, %eax			# test whether the value of %eax is equal to zero
	je	.L10				# if it fr1[i] is equal to zero jump to L10
	movl	-4(%rbp), %eax			# copy the value of i into %eax(t_)
	cltq
	leaq	0(,%rax,4), %rdx		
	movq	-32(%rbp), %rax			# copy the adress fr1 into %rax
	addq	%rdx, %rax			#the address of tha array fr1[] is added with the value of %rdx { this operation is (fr1 + 4*i) which is simply adress(fr1[i])
	movl	(%rax), %edx			# copy the value of fr1[i] into %edx
	movl	-4(%rbp), %eax			# copy the value of i into %eax
	cltq
	leaq	0(,%rax,4), %rcx
	movq	-24(%rbp), %rax			# copy the address a into %rax
	addq	%rcx, %rax			# get the address of a[i] into %rax
	movl	(%rax), %eax			# derefer the address and copy it to %eax
	movl	%eax, %esi			# copy %eax into %esi
	leaq	.LC1(%rip), %rax		# %edx = fr1[i] ,, %esi == a[i]
	movq	%rax, %rdi			# %rdi == "%d\t%d\n" so %rdi is the first argument, %esi is the second argument and %edx is the third argument.
	movl	$0, %eax			# set %eax to 0
	call	printf@PLT			# call print function.
.L10:
	addl	$1, -4(%rbp)			# increament the value of %rbp(ct3/i) by 1
.L9:
	movl	-4(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jl	.L11
	nop
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:										# last label of printArrayWithFrequency function
	.size	printArrayWithFrequency, .-printArrayWithFrequency 	# size of printArrayWithFrequency function
	.section	.rodata						# start of read only data section
	.align 8								# align to 8 bytes
.LC2:
	.string	"\n\nCount frequency of each integer element of an array:" # string stored in LC2
	.align 8								# align to 8 bytes
.LC3:
	.string	"------------------------------------------------"	# string stored in LC3
	.align 8								# align to 8 bytes
.LC4:
	.string	"Input the number of elements to be stored in the array :" # string stored in LC4
.LC5:										# label LC5
	.string	"%d"							# string stored in LC5
	.align 8								# align to 8 bytes
.LC6:										# label LC6
	.string	"Enter each elements separated by space: "	# string stored in LC6
	.text									# start of text section
	.globl	main							# start of global main function
	.type	main, @function					# type of main function
	
	
	
	
	
main:						# main function is started.
.LFB2:
	.cfi_startproc
	endbr64
	pushq	%rbp				# pushing(saving) the base pointer
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp			# copying the stack pointer into base pointer.
	.cfi_def_cfa_register 6
	subq	$832, %rsp			# Allocating 832 bits of memory		832 = 4*(100 + 100 + 8)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)			
	xorl	%eax, %eax			# making the value of %eax equals to zero
	leaq	.LC2(%rip), %rax		# loading the effective address of the label .LC2 into %rax
	movq	%rax, %rdi			# copyint the address stored in %rax into the %rdi(first arguement)
	call	puts@PLT			# calling the puts functio
	leaq	.LC3(%rip), %rax		# copying the address of .LC3 label into %rax
	movq	%rax, %rdi			# copyint the address stored in %rax into the %rdi(first arguement)
	call	puts@PLT			# calling the puts function
	leaq	.LC4(%rip), %rax		# loading the effective address of the label .LC4 into %rax
	movq	%rax, %rdi			# copyint the address stored in %rax into the %rdi(first arguement)
	movl	$0, %eax			 # Set %eax to 0 (return value for scanf).
	call	printf@PLT			# calling print function
	leaq	-828(%rbp), %rax		# Calculate the address of a local variable by adding an offset of -828 to %rbp. Store the address in %rax.
	movq	%rax, %rsi			# Move the address in %rax into the second argument
	leaq	.LC5(%rip), %rax		# Load the effective address (address of) the string constant .LC5 into %rax.
	movq	%rax, %rdi			# Move the address in %rax (address of .LC5) into %rdi.
	movl	$0, %eax			 # Set %eax to 0 (return value for scanf).
	call	__isoc99_scanf@PLT		#calling the scanf function
	leaq	.LC6(%rip), %rax		# Load the effective address (address of) the string constant .LC6 into %rax.
	movq	%rax, %rdi			# copying the address inot the first argument of the function
	movl	$0, %eax			# setting the return value for scanf
	call	printf@PLT
	movl	$0, -824(%rbp)			# Store the value 0 in the stack frame at offset -824(%rbp). which is i;
	jmp	.L13				#jump to .L13
.L14:
	leaq	-816(%rbp), %rdx		# passing the address of the array arr1 into %rdx
	movl	-824(%rbp), %eax		# copying the value of (i) into %eax
	cltq
	salq	$2, %rax			# left shift the value of i by 2 and copy it to %rax = i<<2
	addq	%rdx, %rax			# offset the address of arr1 with the value of %rax,, address(arr1[i])
	movq	%rax, %rsi			# moving the address of the element arr1[i] to the the second argumen ot the scanf function
	leaq	.LC5(%rip), %rax		# passin the address of the LC5 to the %rax
	movq	%rax, %rdi			# passing it to the first argument of the funciton
	movl	$0, %eax			# setting the return value of the scanf to be zero
	call	__isoc99_scanf@PLT		# calling scanf function
	addl	$1, -824(%rbp)			# increament the value of i with + 1
.L13:
	movl	-828(%rbp), %eax		# passing the value at -828(%rbp) which is (n)
	cmpl	%eax, -824(%rbp)		# Compare the value in %eax with the value at offset -824(%rbp). checking if i<n;
	jl	.L14				# Jump to label .L14 if the comparison result indicates that %eax is less than the value at -824(%rbp).
	movl	$0, -820(%rbp)			# Store the value 0 at offset -820(%rbp)
	jmp	.L15				# jump to .L15
.L16:
	movl	-820(%rbp), %eax				# eax<--fr1
	cltq									# convert long to quad || rax<--eax
	movl	$-1, -416(%rbp,%rax,4)			# fr1[i]<--(-1)
	addl	$1, -820(%rbp)					# i<--i+1
.L15:
	movl	-828(%rbp), %eax				# eax<--n
	cmpl	%eax, -820(%rbp)				# compare i and n || i<n
	jl	.L16								# jump to label L16
	movl	-828(%rbp), %ecx				# ecx<--n
	leaq	-416(%rbp), %rdx				# load effective address || rdx<--address of fr1 || third argument		
	leaq	-816(%rbp), %rax				# load effective address || rax<--address of arr1
	movl	%ecx, %esi						# second argument stored in esi || esi<--n
	movq	%rax, %rdi						# first argument stored in rdi || rdi<--address of arr1
	call	calculateFrequency				# call calculateFrequency function || calculate frequency of each element in arr1 and store in fr1
	movl	-828(%rbp), %edx				# edx<--n || third argument
	leaq	-416(%rbp), %rcx				# load effective address || rcx<--address of fr1 
	leaq	-816(%rbp), %rax				# load effective address || rax<--address of arr1
	movq	%rcx, %rsi						# second argument stored in rsi || rsi<--address of fr1
	movq	%rax, %rdi						# first argument stored in rdi || rdi<--address of arr1
	call	printArrayWithFrequency			# call printArrayWithFrequency function || print arr1 and fr1
	movl	$0, %eax						# eax<--0
	movq	-8(%rbp), %rdx					# restore rdx
	subq	%fs:40, %rdx					# restore rdx
	je	.L18								# jump to label L18	
	call	__stack_chk_fail@PLT			
.L18:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:

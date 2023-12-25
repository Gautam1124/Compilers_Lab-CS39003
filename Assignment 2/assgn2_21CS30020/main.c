#include "myl.h"
int main(){
    char new[] = "\n";
    char str0[] = "Invalid input entered\n";
    char str[] = "Program to read and write int and float\n";
    printStr(str);
    char str1[] = "Enter the integer\n";
    printStr(str1);
    int num1=-1;
    if(readInt(&num1)==ERR){
        printStr(str0);
    }
    char str2[] = "Enter the Float\n";
    printStr(str2);
    float num2=-1;
    if(readFlt(&num2) == ERR){
        printStr(str0);
    }
    char str3[] = "The integer and Float entered are:: ";
    printStr(str3);
    printInt(num1);
    char str4[] = ", ";
    printStr(str4);
    printFlt(num2);
    printStr(new);
    char str5[] = "Hello, World";
    char str6[] = "The number of character in Hello,World is :: ";
    int char_num = printStr(str5);
    printStr(new);
    printStr(str6);
    printInt(char_num);

}

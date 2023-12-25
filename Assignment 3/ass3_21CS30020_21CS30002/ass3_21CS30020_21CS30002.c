#include<stdio.h>
#define KEYWORD 258
#define IDENTIFIER 259
#define INTEGER_CONSTANT 260
#define FLOATING_CONSTANT 261
#define ENUMERATION_CONSTANT 262
#define CHARACTER_CONSTANT 263
#define STRING_LITERAL  264
#define PUNCTUATORS 265
#define SINGLE_LINE_COMMENT 266
#define MULTI_LINE_COMMENT 267


extern FILE *yyin;
extern char* yytext;

extern int yylex();
int main(int argc, char** argv){
    if(argc < 2){
        printf("No input file entered Run Again \n");
        return 1;
    }

    if(!(yyin = fopen(argv[1],"r"))){
        perror(argv[1]);
        printf("Error in opening file \n");
        return 1;
    }
    int token;
    while(token = yylex()){
        switch(token){
            case KEYWORD:
                printf("<KEYWORD, %d, '%s'>\n",token,yytext);
                break;
            case IDENTIFIER:
                printf("<IDENTIFIER, %d, '%s'>\n",token,yytext);
                break;
            case INTEGER_CONSTANT:
                printf("<INTEGER_CONSTANT, %d, '%s'>\n",token,yytext);
                break;
            case FLOATING_CONSTANT:
                printf("<FLOATING_CONSTANT, %d, '%s'>\n",token,yytext);
                break;
            case ENUMERATION_CONSTANT:
                printf("<ENUMERATION_CONSTANT, %d, '%s'>\n",token,yytext);
                break;
            case CHARACTER_CONSTANT:
                printf("<CHARACTER_CONSTANT, %d, '%s'>\n",token,yytext);
                break;
            case STRING_LITERAL:
                printf("<STRING_LITERAL, %d, '%s'>\n",token,yytext);
                break;
            case PUNCTUATORS:
                printf("<PUNCTUATORS, %d, '%s'>\n",token,yytext);
                break;
            case SINGLE_LINE_COMMENT:
                printf("<SINGLE_LINE_COMMENT, %d>\n",token);
                break;
            case MULTI_LINE_COMMENT:
                printf("<MULTI_LINE_COMMENT, %d>\n",token);
                break;
            default:
                printf("<Error in token,' %s'>\n",yytext);
                break;
        }

    }
    



}
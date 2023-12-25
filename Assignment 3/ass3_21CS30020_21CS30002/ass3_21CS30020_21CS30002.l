%{
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
%}

KEYWORD     "auto"|"enum"|"restrict"|"unsigned"|"break"|"extern"|"return"|"void"|"case"|"float"|"short"|"volatile"|"char"|"for"|"signed"|"while"|"const"|"goto"|"sizeof"|"_Bool"|"continue"|"if"|"static"|"_Complex"|"default"|"inline"|"struct"|"_Imaginary"|"do"|"int"|"switch"|"double"|"long"|"typedef"|"else"|"register"|"union"
IDENTIFIER  [a-zA-Z_][a-zA-Z0-9_]*

DIGIT_SEQ   [0-9]*
SIGN        [+-]

FRACTIONAL_CONSTANT     ({DIGIT_SEQ}?\.{DIGIT_SEQ})|{DIGIT_SEQ}\.
EXPONENT_PART     [eE]{SIGN}?{DIGIT_SEQ}

ESCAPE-SEQUENCE         \\['"?\abfnrtvs]
C-CHAR                  [^'\\\n]|{ESCAPE-SEQUENCE}
C-CHAR-SEQUENCE         {C-CHAR}+

INTEGER_CONSTANT        [1-9][0-9]*
FLOATING_CONSTANT       ({FRACTIONAL_CONSTANT}{EXPONENT_PART}?)|({DIGIT_SEQ}{EXPONENT_PART})
ENUMERATION_CONSTANT    {IDENTIFIER}
CHARACTER_CONSTANT      '{C-CHAR-SEQUENCE}'

S-CHAR                  [^\"\\\n]|{ESCAPE-SEQUENCE}
S-CHAR-SEQUENCE         {S-CHAR}+
STRING_LITERAL          \"({S-CHAR-SEQUENCE})\"

PUNCTUATORS             "["|"]"|"("|")"|"{"|"}"|"."|"->"|"++"|"--"|"&"|"*"|"+"|"-"|"~"|"!"|"/"|"%"|"<<"|">>"|"<"|">"|"<="|">="|"=="|"!="|"^"|"|"|"||"|"?"|":"|";"|"..."|"="|"*="|"/="|"%="|"+="|"-="|"<<="|">>="|"&="|"^="|"|="|","|"#"

STRING                  ([^*]|"*"+[^/])*
SINGLE_LINE_COMMENT     "//"(.*) 
MULTI_LINE_COMMENT      "/*"{STRING}"*/"

WS                      [ \t\n]*

%% 
{KEYWORD}               {return KEYWORD;}
{IDENTIFIER}            {return IDENTIFIER;}
{INTEGER_CONSTANT}      {return INTEGER_CONSTANT;}
{FLOATING_CONSTANT}     {return FLOATING_CONSTANT;}
{STRING_LITERAL}        {return STRING_LITERAL;}
{PUNCTUATORS}           {return PUNCTUATORS;}
{WS}                    /*white space rule*/;
{SINGLE_LINE_COMMENT}   {return SINGLE_LINE_COMMENT;}
{MULTI_LINE_COMMENT}    {return MULTI_LINE_COMMENT;}

%%
%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void decimalToHex(char *decimalStr);
%}

DIGIT   [0-9]
NUMBER  {DIGIT}+

%%

{NUMBER}    {
            decimalToHex(yytext);
            }

.|\n        { printf("%s", yytext); }

%%

void decimalToHex(char *decimalStr) {
    int decimal = atoi(decimalStr);
    printf("%X", decimal);  // %X converts to uppercase hexadecimal
}

int yywrap() {
    return 1;
}

int main(int argc, char *argv[]) {
    if (argc != 2) {
        printf("Usage: %s filename\n", argv[0]);
        printf("Converts all decimal numbers in file to hexadecimal\n");
        return 1;
    }
    
    yyin = fopen(argv[1], "r");
    if (yyin == NULL) {
        printf("Error: Cannot open file '%s'\n", argv[1]);
        return 1;
    }
    
    printf("Decimal to Hexadecimal Conversion:\n");
    printf("==================================\n");
    yylex();
    printf("\n==================================\n");
    printf("Conversion complete!\n");
    
    fclose(yyin);
    return 0;
}

%{
#include <stdio.h>
#include <ctype.h>
int count = 0;
%}

%%

[aA][a-zA-Z]*[aA]    { 
        printf("Found: %s\n", yytext); 
        count++; 
    }

[a-zA-Z]+            ; /* Ignore other words */

[ \t\n]+             ; /* Skip whitespace */

.                    ; /* Ignore everything else */

%%

int yywrap() {
    return 1;
}

int main() {
    printf("Enter text (press Ctrl+D to end):\n");
    yylex();
    printf("\nTotal words beginning and ending with 'a': %d\n", count);
    return 0;
}

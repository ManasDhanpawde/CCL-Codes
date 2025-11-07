%{
#include <stdio.h>
int count = 0;
%}

%%

.*com[ \t]*$    {
        count++;
    }

.|\n            ; /* Process all characters */

%%

int yywrap() {
    return 1;
}

int main() {
    printf("Enter text (press Ctrl+D to end):\n");
    yylex();
    printf("Total lines ending with 'com': %d\n", count);
    return 0;
}

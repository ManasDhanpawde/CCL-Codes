%{
#include <stdio.h>
int count = 0;
%}

%%

https?://[a-zA-Z0-9.-]+\.org    {
        count++;
    }

[a-zA-Z0-9.-]+    ; /* Ignore other words */
[ \t\n]+          ; /* Skip whitespace */
.                 ; /* Ignore everything else */

%%

int yywrap() {
    return 1;
}

int main() {
    printf("Enter text or URLs (press Ctrl+D to end):\n");
    yylex();
    printf("Total URLs ending with 'org': %d\n", count);
    return 0;
}

%{
#include <stdio.h>
#include <ctype.h>
#include <stdlib.h>
%}

%%
[[:lower:]]    { printf("%c", toupper(yytext[0])); }
.|\n           { printf("%s", yytext); }
%%

int yywrap() {
    return 1;
}

int main(int argc, char *argv[]) {
    if (argc != 2) {
        printf("Usage: %s filename\n", argv[0]);
        return 1;
    }
    
    yyin = fopen(argv[1], "r");
    if (yyin == NULL) {
        printf("Error: Cannot open file '%s'\n", argv[1]);
        return 1;
    }
    
    printf("Converted text:\n");
    printf("===============\n");
    yylex();
    printf("\n===============\n");
    printf("Conversion complete!\n");
    
    fclose(yyin);
    return 0;
}

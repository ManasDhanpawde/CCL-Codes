%{
#include <stdio.h>
int yylex();
void yyerror(char *s);
%}

%token FUNC ID NUMBER EQUALS

%%
input:
    function { printf("✓ Valid FUNCTION definition syntax!\n");YYACCEPT; }
    ;

function:
    FUNC ID '(' ')' '{' statements '}'
    ;

statements:
    assignment ';'
    | statements assignment ';'
    | /* empty */
    ;

assignment:
    ID EQUALS NUMBER
    | ID EQUALS ID
    ;
%%

void yyerror(char *s) {
    printf("✗ Syntax error: %s\n", s);
}

int main() {
    printf("Enter FUNCTION definition (e.g., func myfunc(){x=5;} ): ");
    yyparse();
    return 0;
}

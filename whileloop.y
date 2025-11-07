%{
#include <stdio.h>
int yylex();
void yyerror(char *s);
%}

%token WHILE ID NUMBER EQUALS

%%
input:
    while_loop { printf("✓ Valid WHILE loop syntax!\n");YYACCEPT; }
    ;

while_loop:
    WHILE '(' condition ')' statement
    ;

condition:
    ID '<' NUMBER
    | ID '>' NUMBER
    ;

statement:
    assignment ';'
    | block
    ;

assignment:
    ID EQUALS NUMBER
    | ID EQUALS ID
    ;

block:
    '{' assignments '}'
    ;

assignments:
    assignment ';'
    | assignments assignment ';'
    ;
%%

void yyerror(char *s) {
    printf("✗ Syntax error: %s\n", s);
}

int main() {
    printf("Enter WHILE loop: ");
    if (yyparse() == 0) {
        // Success message is already printed in the grammar rule
    }
    return 0;
}

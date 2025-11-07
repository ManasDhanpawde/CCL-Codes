%{
#include <stdio.h>
int yylex();
void yyerror(char *s);
%}

%token IF ELSE ID NUMBER EQUALS

%%
input:
    if_else { printf("✓ Valid IF-ELSE syntax!\n");YYACCEPT; }
    ;

if_else:
    IF '(' condition ')' statement ELSE statement
    ;

condition:
    ID '>' NUMBER
    | ID '<' NUMBER
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
    printf("Enter IF-ELSE: ");
    yyparse();
    return 0;
}

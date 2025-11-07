%{
#include <stdio.h>
int yylex();
void yyerror(char *s);
%}

%token IF ID NUMBER EQUALS

%%
input:
    if_then { printf("✓ Valid IF-THEN syntax!\n");YYACCEPT; }
    ;

if_then:
    IF '(' condition ')' statement
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
    printf("Enter IF-THEN: ");
    yyparse();
    return 0;
}

%{
#include <stdio.h>
int yylex();
void yyerror(char *s);
%}

%token SWITCH CASE DEFAULT BREAK ID NUMBER EQUALS

%%
input:
    switch_case { printf("✓ Valid SWITCH CASE syntax!\n");YYACCEPT; }
    ;

switch_case:
    SWITCH '(' ID ')' '{' cases '}'
    ;

cases:
    case
    | cases case
    | cases default_case
    ;

case:
    CASE NUMBER ':' assignments BREAK ';'
    ;

default_case:
    DEFAULT ':' assignments BREAK ';'
    ;

assignments:
    assignment ';'
    | assignments assignment ';'
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
    printf("Enter SWITCH CASE: ");
    yyparse();
    return 0;
}

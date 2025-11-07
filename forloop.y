%{
#include <stdio.h>
#include <stdlib.h>
int yylex();
void yyerror(const char *s);
%}

%token FOR ID NUM RELOP

%%
stmt : FOR '(' assign ';' condition ';' assign ')' '{' stmt_list '}' 
     { printf("Valid FOR loop syntax\n");YYACCEPT; }
     ;

assign : ID '=' expr ;
condition : ID RELOP expr ;
expr : ID
     | NUM
     | expr '+' expr
     ;
stmt_list : /* empty */
           | stmt_list stmt
           | assign ';'
           ;
%%

int main() {
    printf("Enter a FOR loop statement:\n");
    yyparse();
    return 0;
}

void yyerror(const char *s) {
    printf("Invalid syntax for FOR loop\n");
    
}


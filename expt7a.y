%{
#include<stdio.h>
#include<stdlib.h>
int yylex();
void yyerror(const char *s);
%}

%union{
float fval;
}
%type <fval> expr;
%token <fval> NUM;
%%
input:
line
|input line;
line:
expr '\n' {printf("Result=%f\n",$1);};
expr:
NUM {$$=$1;}
|expr expr '+' {$$=$1+$2;}
|expr expr '-' {$$=$1-$2;}
|expr expr '*' {$$=$1*$2;}
|expr expr '/' {$$=$1/$2;};
%%
int main(){
printf("Enter the postfix expression:\n");
yyparse();
return 0;
}
void yyerror(const char *s){
fprintf(stderr,"Error:%s\n",s);
}

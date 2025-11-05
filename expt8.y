%{
#include<stdio.h>
#include<stdlib.h>
int yylex();
void yyerror(const char *s);
%}
%union{
float fval;
}
%token <fval> NUM
%type <fval> expr
%left '+' '-'
%left '*' '/'
%right UMINUS
%%
input:
line
|input line
|error '\n'   { yyerrok; };   /* recovery rule */
line:
expr '\n' {printf("Result=%f\n",$1);};
expr:
NUM {$$=$1;}
|expr '+' expr {$$=$1+$3;}
|expr '-' expr {$$=$1-$3;}
|expr '*' expr {$$=$1*$3;}
|expr '/' expr {if($3==0){
		 yyerror("Division by zero!");
		 YYERROR;
		}else{
		 $$=$1/$3;}
		}
|'(' expr ')' {$$=$2;}
|'-' expr %prec UMINUS {$$=-$2;};
%%
void yyerror(const char *s){
fprintf(stderr,"Error:%s\n",s);
}
int main(){
printf("Simple Calculator\n");
yyparse();
return 0;
}

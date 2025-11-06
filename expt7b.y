%{
#include<stdio.h>
#include<string.h>
int yylex();
void yyerror(const char *s);
%}
%left '+' '-'
%left '*' '/'
%union{
char str[100];
}
%token <str> ID;
%type <str> expr;
%%
input:
expr '\n' {printf("Postfix:%s\n",$1);YYACCEPT;};
expr:
ID {strcpy($$,$1);}
| expr '+' expr {sprintf($$,"%s%s+",$1,$3);}
| expr '-' expr {sprintf($$,"%s%s-",$1,$3);}
| expr '*' expr {sprintf($$,"%s%s*",$1,$3);}
| expr '/' expr {sprintf($$,"%s%s/",$1,$3);}
| '(' expr ')' {strcpy($$,$2);};
%%
int main(){
printf("Enter an infix expression:\n");
yyparse();
return 0;
}
void yyerror(const char *s){
fprintf(stderr,"Error:%s\n",s);
}

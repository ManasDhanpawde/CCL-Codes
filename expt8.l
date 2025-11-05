%{
#include "y.tab.h"
#include<stdlib.h>
%}
%%
[0-9]+(\.[0-9]+)? {yylval.fval=atof(yytext); return NUM;}
[ \t] {}
\n return '\n';
. return yytext[0];
%%
int yywrap(){
return 1;
}


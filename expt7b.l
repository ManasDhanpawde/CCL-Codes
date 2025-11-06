%{
#include "y.tab.h"
#include<string.h>
%}
%%
[a-zA-Z0-9]+ {strcpy(yylval.str,yytext);return ID;}
[ \t]+ ;
\n return '\n';
. return yytext[0];
%%
int yywrap(){
return 1;
}

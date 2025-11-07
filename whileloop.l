%{
#include "y.tab.h"
%}

%%

"while"     return WHILE;
[a-zA-Z][a-zA-Z0-9]*    return ID;
[0-9]+                  return NUMBER;
"="                     return EQUALS;

[ \t\n]     ;
.           return yytext[0];

%%

int yywrap() {
    return 1;
}

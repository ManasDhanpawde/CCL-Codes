%{
#include "y.tab.h"
%}

%%

"if"        return IF;
"else"      return ELSE;
[a-zA-Z][a-zA-Z0-9]*    return ID;
[0-9]+                  return NUMBER;
"="                     return EQUALS;

[ \t\n]     ;
.           return yytext[0];

%%

int yywrap() {
    return 1;
}

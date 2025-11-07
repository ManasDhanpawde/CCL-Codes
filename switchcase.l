%{
#include "y.tab.h"
%}

%%

"switch"    return SWITCH;
"case"      return CASE;
"default"   return DEFAULT;
"break"     return BREAK;
[a-zA-Z][a-zA-Z0-9]*    return ID;
[0-9]+                  return NUMBER;
"="                     return EQUALS;

[ \t\n]     ;
.           return yytext[0];

%%

int yywrap() {
    return 1;
}

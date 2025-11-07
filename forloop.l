%{
#include "y.tab.h"
%}

%%
"for"        { return FOR; }
[a-zA-Z_][a-zA-Z0-9_]*   { return ID; }
[0-9]+                   { return NUM; }
"("                      { return '('; }
")"                      { return ')'; }
"{"                      { return '{'; }
"}"                      { return '}'; }
";"                      { return ';'; }
"="                      { return '='; }
"<"|">"|"=="|"!="        { return RELOP; }
"+"                      { return '+'; }
[ \t\n]+                 ;
.                        ;
%%

int yywrap() { return 1; }


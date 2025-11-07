%{
#include<stdio.h>
#include<string.h>
int keyword=0,identifiers=0,comments=0,words=0,lines=0,spaces=0;
char *keywords[]={"for","while","if","int","float"};

int isKeyword(const char *word){
for(int i=0;i<5;i++){
if(strcmp(word,keywords[i])==0)
 return 1;
}

return 0;
}
%}
%%
"//".* {comments++;}
[A-Za-z][A-Za-z0-9]* {if(isKeyword(yytext))
			keyword++;
		      else 
		        identifiers++;
		      words++;}
" " {spaces++;}
\n {lines++;}
%%
int main(int argc,char *argv[]){

yyin = fopen(argv[1], "r");

yylex();
printf("Keywords:%d\n",keyword);
printf("Identifers:%d\n",identifiers);
printf("Comments:%d\n",comments);
printf("Words:%d\n",words);
printf("Lines:%d\n",lines);
printf("Spaces:%d\n",spaces);
return 0;
}
int yywrap(){
return 1;
}

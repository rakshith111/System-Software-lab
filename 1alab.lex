%{
#include<stdio.h>
int v=0,op=0,id=0;
%}

%%
[a-zA-Z]+[0-9A-Za-z]*  {id++;printf("\n Identifier:");ECHO;}
[\+\*]     {op++;printf("\n Operartor:");ECHO;}
"("  {v++;} 
")"  {v--;}

.|\n  {;}
%%

int yywrap() {return 1;}

int main()
{
printf("Enter the expression "); 
yylex();
if((op+1) ==id && v==0) {
    printf("\n Expression is Valid \n"); 
    printf("Identifier count=%d,Operartor count=%d",id,op); 
}
else printf("\n Expression is Invalid \n"); 

return 0;
}
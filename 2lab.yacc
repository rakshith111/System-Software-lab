%{
#include<stdio.h>
#include<stdlib.h>
int yyerror();
int yyparse();
int yylex();
%}

%token A B

%%
input:s'\n' {printf("Successful Grammar\n");exit(0);}
s: A s1 B|B
s1: ; | A s1
%%

int main() {
printf("Enter A String\n");
yyparse();
return 0;
}

int yyerror()
{
printf("Error \n");
exit(0);
}
int yywrap(){
    return 1;
}
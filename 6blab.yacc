%{
#include <stdio.h>
#include <stdlib.h>
int id=0,  key=0, op=0;
int yylex();
int yyerror();
%}

%token  ID KEY OP
%%
input: 
ID input { id++; }
| KEY input { key++; }
| OP input {op++;}

| ID { id++; }
| KEY { key++; }
| OP { op++;}
;
%%

extern FILE *yyin;
int main( int argc, char *argv[])
{
yyin=fopen(argv[1],"r");
yyparse();
printf("Keywords = %d\nIdentifiers = %d\noperators = %d\n",  key,id, op);
}

int yyerror() {
printf(" parse error! ");
return -1;

}
 int yywrap(){
    return 1;
 }


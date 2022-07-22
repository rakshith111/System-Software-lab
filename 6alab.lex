%{
#include<stdio.h>
int c=0; 
%}

%%
"/*"[^*/]*"*/" {c++;} 
"//".* {c++;}
./\n {fprintf(yyout,"%s",yytext);}
%%

int main( int argc, char *argv[])
{
FILE *f1,*f2;
if(argc ==3) {
yyin=fopen(argv[1],"r");
yyout=fopen(argv[2],"w");
yylex();
printf("Number of Comment Lines: %d\n",c);
}
else{
    printf("ERR");
}
return 0; }
int yywrap(){
    return 1;
}
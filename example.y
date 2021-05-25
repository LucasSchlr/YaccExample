%{
  #include<stdio.h>
  #include<stdlib.h>
  
  extern int yylex();
  void yyerror(char *msg);
%}

%union{
  int i;
}

%token <sval> TOK_EMPTY_LINE 
%token <i> NUM
%type <i> E 

%%

S : E         {printf(" %d\n", $1);}
  ;

E : NUM '&' NUM   {
                if ($1 == $3) {
                  $$ = 1;
                } else{
                  $$ = 0;
                }
              }
  | NUM '|' NUM  {
                if (($1 == 1) || ($3 == 1)){
                  $$ = 1;
                } else{
                  $$ = 0;
                }
              }
  | '!' NUM {if ($2 == 0) {
                  $$ = 1;
                } else{
                  $$ = 0;
                }}
  ;

%%

void yyerror(char *msg){
  fprintf(stderr, "%s\n", msg);
  exit(1);
}

int main(){
  yyparse();
  return 0;
}

#include "lex.yy.c"
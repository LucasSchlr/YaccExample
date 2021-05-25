%{
  #include<stdio.h>
  #include<stdlib.h>
  #include<example.tab.h>    
%}

%option noyywrap
 
%%
[01]         {yylval.i = atoi(yytext); return NUM;}
[&!|]        {return yytext[0]; }
[\t\f\v\n]   {;}
%%

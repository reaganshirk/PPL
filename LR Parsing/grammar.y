%language "c"
%skeleton "glr.c" 
%require "3.0.2"
%verbose
%defines 
%locations

%code
{
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

extern void yyerror (char const *);
extern int yylex ();
extern char * yytext;
}

%token T_ID
%token T_NUM
%token T_ADD
%token T_SUB
%token T_MUL
%token T_DIV



%%

expr : expr T_ADD term
  | term
  ;

term : term T_MUL fact
  | fact
  ;

fact : T_NUM
  | T_ID
  | '(' expr ')'
  | T_SUB fact
  ;



%%


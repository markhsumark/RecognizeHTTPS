%{
#include <stdio.h>
#include <string.h>
#define YYSTYPE char *
%}

%token CHAR CHAR_CAP
%token HTTPS FILETYPE TLD TLD_cc EOL DOT
%%
httpslines:HTTPS DOMAIN EOL           {printf("catch: %s%s\n", $1, $2);}
  |HTTPS DOMAIN PATH EOL               {printf("catch: %s%s%s\n", $1, $2, $3);}
  |HTTPS DOMAIN PATH FILETYPE EOL     {printf("catch: %s%s%s%s\n", $1, $2, $3, $4);}
  |DOMAIN EOL                          {printf("catch: %s\n", $1);};
  
PATH:"/" PATH_NAME                {strcpy($$, strcat("/", $2));}
  |"/" PATH_NAME "/"              {strcpy($$, strcat("/", strcat("/", $2)));}
  ;

PATH_NAME:/*nothing*/
  |CHAR_CAP PATH_NAME             {strcpy($$, strcat($1, $2));}
  ; 
  
D_NAME:/*nothing*/
  |CHAR D_NAME                	  {strcpy($$, strcat($1, $2));printf("test: %s\n",$$);}
  ;    

DD_NAME:D_NAME DOT DD_NAME        {strcpy($$, strcat(strcat($1, "."),$3);}
  |D_NAME                         {strcpy($$, $1);}
  ;
    
TTLD:TLD                          {strcpy($$, $1);}
  |TLD TLD_cc                     {strcpy($$, strcat($1, $2));}
  |TLD_cc                         {strcpy($$, $1);}
    
DOMAIN:DD_NAME TTLD               {strcpy($$, strcat($1, $2));}

    
%%

int main(int argc,char **argv){
	yyparse();
}

yyerror(char *s)
{
 fprintf(stderr,"error:%s\n",s);
} 
%{
#include <string.h>
%}

%% 

[a-z0-9_]           {yylval=strdup(yytext);return CHAR;}
[A-Za-z0-9_-]       {yylval=strdup(yytext);return CHAR_CAP;}
"https://"                      {yylval=strdup(yytext);return HTTPS;}		
(".html"|".php"|".pdf"|".io")   {yylval=strdup(yytext);return FILETYPE;}
(".com"|".net"|".edu"|".org")   {yylval=strdup(yytext);return TLD;}
(".tw")                         {yylval=strdup(yytext);return TLD_cc;}
[\n]  	                        {return EOL;}
[\t]                            {/*空白忽略*/}
"."                             {yylval=strdup(yytext);return DOT;}		
.                               {printf("非法字符 %c\n",*yytext);}

%%
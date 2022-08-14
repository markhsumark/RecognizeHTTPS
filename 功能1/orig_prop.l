%{
#define T_WORD 1
%}

CHAR_CAP    [A-Za-z0-9_-]
CHAR        [a-z0-9_]
HTTPS		"https://"
FILETYPE    (".html"|".php"|".pdf"|".io")
TLD	        (".com"|".net"|".edu"|".org")
TLD_cc      ".tw"
D_NAME      {CHAR}+
DOMAIN      {D_NAME}("."{D_NAME})*({TLD}({TLD_cc}|"")|{TLD_cc})
PATH        ("/"{CHAR_CAP}+)+("/"|"")
httpslines	{HTTPS}{DOMAIN}({PATH}({FILETYPE}|"")|"")
%%

{httpslines}    {return 1;}
{CHAR}		{}
<<EOF>>				{return 0;}
%%

int main() {
	int token_type = 1;
	while(token_type == yylex()){
		printf("catch: %s\n", yytext);
	}
	printf("\nend\n");
	return 0;
}

int yywrap() {
	return 1;
}

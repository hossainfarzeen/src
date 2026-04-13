%{
#include "y.tab.h"
%}

%%
"int"           { return INT; }
"float"         { return FLOAT; }
[0-9]+          { yylval.num = atoi(yytext); return NUMBER; }
[a-zA-Z_][a-zA-Z0-9_]* { return ID; }
"="             { return ASSIGN; }
"+"             { return PLUS; }
"-"             { return MINUS; }
"*"             { return MUL; }
"/"             { return DIV; }
";"             { return SEMICOLON; }

[ \t\n]         ;
.               { printf("Unknown character\n"); }
%%

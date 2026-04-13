%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(const char *s);
int yylex();
%}

%union {
    int num;
    char* str;
}

%token INT FLOAT ID NUMBER
%token ASSIGN PLUS MINUS MUL DIV SEMICOLON

%%

program:
    program statement
    | statement
    ;

statement:
    declaration SEMICOLON
    | assignment SEMICOLON
    ;

declaration:
    INT ID ASSIGN NUMBER
    {
        printf("%s = %d\n", yytext, $4);
    }
    ;

assignment:
    ID ASSIGN NUMBER
    {
        printf("%s = %d\n", yytext, $3);
    }
    ;

%%

void yyerror(const char *s) {
    printf("Error: %s\n", s);
}

int main() {
    yyparse();
    return 0;
}

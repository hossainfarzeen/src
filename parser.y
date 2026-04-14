%{
#include <stdio.h>
#include <stdlib.h>
%}

%token PRINT NUMBER ID SEMICOLON

%%

program:
    program statement
    | statement
    ;

statement:
    PRINT NUMBER SEMICOLON
        { printf("print(%d)\n", $2); }

    | PRINT ID SEMICOLON
        { printf("print(%s)\n", "var"); }
    ;

%%

int main() {
    printf("=== Mini Compiler Start ===\n");
    yyparse();
    printf("=== Compilation Finished ===\n");
    return 0;
}

int yyerror(char *s) {
    printf("Error: %s\n", s);
}

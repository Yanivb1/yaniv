%{
/*Declarations*/
#include <stadio.h>
/* Need to Include output && parser*/
%}

%option yylineno

VOID        [void]
INT         [int]     
BYTE        [byte]
B           [b]
BOOL        [bool]
STRUCT      [struct]
AND         [and]
OR          [or] 
NOT         [not]
TRUE        [true]
FALSE       [false]
RETURN      [return] 
IF          [if]
ELSE        [else]
WHILE       [while]
BREAK       [break]
CONTINUE    [continue]
SC          [\;] 
COMMA       [\,]
PERIOD      [\.] 
LPAREN      [\(]
RPAREN      [\)] 
LBRACE      [\{] 
RBRACE      [\}]
ASSIGN      [\=]
RELOP       [==|!=|<|>|<=|>=]
BINOP       [+|-|*|/] 
ID          [a-zA-Z][a-zA-Z0-9]*
NUM         [0|[1-9][0-9]*]
STRING      ["([^\n\r\"\\]|\\[rnt"\\])+"]
WHITESPACE  []
COMMENT     [\/\/[^\r\n]*[\r|\n|\r\n]?]

%%

{VOID}          return HandleByType("NODE",VOID);
{INT}           return HandleByType("NODE",INT);
{BYTE}          return HandleByType("NODE",BYTE);
{B}             return HandleByType("NODE",B);
{BOOL}          return HandleByType("NODE",BOOL);
{STRUCT}        return HandleByType("NODE",STRUCT);
{AND}           return HandleByType("NODE",AND);
{OR}            return HandleByType("NODE",OR);
{NOT}           return HandleByType("NODE",NOT);
{TRUE}          return HandleByType("BOOL",TRUE);
{FALSE}         return HandleByType("BOOL",FALSE);
{RETURN}        return HandleByType("NODE",RETURN);
{IF}            return HandleByType("NODE",IF);
{ELSE}          return HandleByType("NODE",ELSE);
{WHILE}         return HandleByType("NODE",WHILE);
{BREAK}         return HandleByType("NODE",BREAK);
{CONTINUE}      return HandleByType("NODE",CONTINUE);
{SC}            return HandleByType("NODE",SC);
{COMMA}         return HandleByType("NODE",COMMA);
{PERIOD}        return HandleByType("NODE",PERIOD);
{LPAREN}        return HandleByType("NODE",LPAREN);
{RPAREN}        return HandleByType("NODE",RPAREN);
{LBRACE}        return HandleByType("NODE",LBRACE);
{RBRACE}        return HandleByType("NODE",RBRACE);
{ASSIGN}        return HandleByType("NODE",ASSIGN);
{RELOP}         return HandleByType("NODE",RELOP);
{BINOP}         return HandleByType("NODE",BINOP);
{ID}            return HandleByType("NODE",ID);
{NUM}           return HandleByType("NUMBER",NUM);
{STRING}        return HandleByType("NODE",STRING);

%%

int HandleByType(char* type,int token){   
    if(!strcmp(type,"NODE")){
        yylval = new Node(yylineno,token);
    }else if(!strcmp(type,"BOOL")){
        yylval = new BoolVar(yylineno,token,yytext);
    }else if(!strcmp(type,"NUMBER")){
        yylval = new Num(yylineno,token,yytext);
    }
    return token;
}
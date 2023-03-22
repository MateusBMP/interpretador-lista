% member(A,S) :- A pertence a S 
member(A,[A|S]) :- style_check(-singleton).
member(A,[B|S]) :- style_check(-singleton), member(A,S).

% next(A,S,TE) :- A é o próximo elemento de S, TE é o resto de S
next(A,[A|S],S).

% empty(S) :- S é vazio
empty([]).

% Palavras reservadas
zero([H|T],TE) :- next('0',[H|T],TE).
plus([H|T],TE) :- next('+',[H|T],TE).
minus([H|T],TE) :- next('-',[H|T],TE).
comma([H|T],TE) :- next(',',[H|T],TE).
multiplication([H|T],TE) :- next('*',[H|T],TE).
semicolon([H|T],TE) :- next(';',[H|T],TE).
colon([H|T],TE) :- next(':',[H|T],TE).
division([H|T],TE) :- next('/',[H|T],TE).
dot([H|T],TE) :- next('.',[H|T],TE).
double_division([H|T],TE) :- next('/',[H|T],T0), next('/',T0,TE).
lengthh([H|T],TE) :- next('l',[H|T],T0), next('e',T0,T1), next('n',T1,T2), next('g',T2,T3), next('t',T3,T4), next('h',T4,TE).
head([H|T],TE) :- next('h',[H|T],T0), next('e',T0,T1), next('a',T1,T2), next('d',T2,TE).
tail([H|T],TE) :- next('t',[H|T],T0), next('a',T0,T1), next('i',T1,T2), next('l',T2,TE).
concatena([H|T],TE) :- next('c',[H|T],T0), next('o',T0,T1), next('n',T1,T2), next('c',T2,T3), next('a',T3,T4), next('t',T4,T5), next('e',T5,T6), next('n',T6,T7), next('a',T7,TE).
if([H|T],TE) :- next('i',[H|T],T0), next('f',T0,TE).
then([H|T],TE) :- next('t',[H|T],T0), next('h',T0,T1), next('e',T1,T2), next('n',T2,TE).
else([H|T],TE) :- next('e',[H|T],T0), next('l',T0,T1), next('s',T1,T2), next('e',T2,TE).
while([H|T],TE) :- next('w',[H|T],T0), next('h',T0,T1), next('i',T1,T2), next('l',T2,T3), next('e',T3,TE).
forr([H|T],TE) :- next('f',[H|T],T0), next('o',T0,T1), next('r',T1,TE).
readd([H|T],TE) :- next('r',[H|T],T0), next('e',T0,T1), next('a',T1,T2), next('d',T2,TE).
writed([H|T],TE) :- next('w',[H|T],T0), next('r',T0,T1), next('i',T1,T2), next('t',T2,T3), next('e',T3,TE).
to([H|T],TE) :- next('t',[H|T],T0), next('o',T0,TE).
doo([H|T],TE) :- next('d',[H|T],T0), next('o',T0,TE).
begin([H|T],TE) :- next('b',[H|T],T0), next('e',T0,T1), next('g',T1,T2), next('i',T2,T3), next('n',T3,TE).
end([H|T],TE) :- next('e',[H|T],T0), next('n',T0,T1), next('d',T1,TE).
until([H|T],TE) :- next('u',[H|T],T0), next('n',T0,T1), next('t',T1,T2), next('i',T2,T3), next('l',T3,TE).
repeat([H|T],TE) :- next('r',[H|T],T0), next('e',T0,T1), next('p',T1,T2), next('e',T2,T3), next('a',T3,T4), next('t',T4,TE).
integerr([H|T],TE) :- next('i',[H|T],T0), next('n',T0,T1), next('t',T1,T2), next('e',T2,T3), next('g',T3,T4), next('e',T4,T5), next('r',T5,TE).
real([H|T],TE) :- next('r',[H|T],T0), next('e',T0,T1), next('a',T1,T2), next('l',T2,TE).
function([H|T],TE) :- next('f',[H|T],T0), next('u',T0,T1), next('n',T1,T2), next('c',T2,T3), next('t',T3,T4), next('i',T4,T5), next('o',T5,T6), next('n',T6,TE).
procedure([H|T],TE) :- next('p',[H|T],T0), next('r',T0,T1), next('o',T1,T2), next('c',T2,T3), next('e',T3,T4), next('d',T4,T5), next('u',T5,T6), next('r',T6,T7), next('e',T7,TE).
var([H|T],TE) :- next('v',[H|T],T0), next('a',T0,T1), next('r',T1,TE).
program([H|T],TE) :- next('p',[H|T],T0), next('r',T0,T1), next('o',T1,T2), next('g',T2,T3), next('r',T3,T4), next('a',T4,T5), next('m',T5,TE).

% Identificadores e delimitadores
letra([H|T],T) :- member(H,['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z']).
digito([H|T],T) :- member(H,['0','1','2','3','4','5','6','7','8','9']).
digit([H|T],T) :- member(H,['1','2','3','4','5','6','7','8','9']).
espaco([H|T],T) :- member(H,[' ']).
openBracket([H|T],T) :- member(H,['[']).
closeBracket([H|T],T) :- member(H,[']']).
openParentheses([H|T],T) :- member(H,['(']).
closeParentheses([H|T],T) :- member(H,[')']).
colonEqual([H|T],TE) :- next(':',[H|T],T0), next('=',T0,TE).
equal([H|T],T) :- member(H,['=']).
notEqual([H|T],TE) :- next('<',[H|T],T0), next('>',T0,TE).
lessEqual([H|T],TE) :- next('<',[H|T],T0), next('=',T0,TE).
greaterEqual([H|T],TE) :- next('>',[H|T],T0), next('=',T0,TE).
less([H|T],T) :- member(H,['<']).
greater([H|T],T) :- member(H,['>']).

delimitadorC('<='). delimitadorC('<>'). delimitadorC('>=').
delimitadorC(':=').
delimitadorS('<'). delimitadorS('>'). delimitadorS('=').
delimitadorS('+'). delimitadorS('-'). delimitadorS('*').
delimitadorS('/'). delimitadorS('('). delimitadorS(')').
delimitadorS(':'). delimitadorS(','). delimitadorS(';').
delimitadorS('.').

% Operadores e relações
operadorL([H|T],TE) :- lengthh([H|T],TE).
operadorL([H|T],TE) :- head([H|T],TE).
operadorL([H|T],TE) :- tail([H|T],TE).

operador([H|T],TE) :- plus([H|T],TE).
operador([H|T],TE) :- minus([H|T],TE).
operador([H|T],TE) :- multiplication([H|T],TE).
operador([H|T],TE) :- division([H|T],TE).
operador([H|T],TE) :- double_division([H|T],TE).

relacao([H|T],TE) :- equal([H|T],TE).
relacao([H|T],TE) :- notEqual([H|T],TE).
relacao([H|T],TE) :- lessEqual([H|T],TE).
relacao([H|T],TE) :- greaterEqual([H|T],TE).
relacao([H|T],TE) :- less([H|T],TE).
relacao([H|T],TE) :- greater([H|T],TE).

% Gramática de número inteiros e reais
num_cont([H|T],TE) :- digito([H|T],T0), num_cont(T0,TE).
num_cont([H|T],[H|T]) :- espaco([H|T],_).
num_cont([H|T],[H|T]) :- delimitadorS(H).
num_cont([],[]).
num([H|T],TE) :- digit([H|T],T0), num_cont(T0,TE).
integer_num([H|T],TE) :- plus([H|T],T0), num(T0,TE).
integer_num([H|T],TE) :- minus([H|T],T0), num(T0,TE).
integer_num([H|T],TE) :- num([H|T],TE).
integer_num([H|T],TE) :- zero([H|T],TE).
real_num([H|T],TE) :- plus([H|T],T0), num(T0,T1), comma(T1,T2), num(T2,TE).
real_num([H|T],TE) :- minus([H|T],T0), num(T0,T1), comma(T1,T2), num(T2,TE).
real_num([H|T],TE) :- plus([H|T],T0), zero(T0,T1), num(T1,T2), comma(T2,T3), num(T3,TE).
real_num([H|T],TE) :- minus([H|T],T0), zero(T0,T1), num(T1,T2), comma(T2,T3), num(T3,TE).
real_num([H|T],TE) :- num([H|T],T0), comma(T0,T1), num(T1,TE).
real_num([H|T],TE) :- zero([H|T],T0), comma(T0,T1), num(T1,TE).

integer_num_cont([H|T],TE) :- comma([H|T],T0), integer_num_cont(T0,TE).
integer_num_cont([H|T],TE) :- espaco([H|T],TE).
real_num_cont([H|T],TE) :- comma([H|T],T0), real_num_cont(T0,TE).
real_num_cont([H|T],TE) :- espaco([H|T],TE).

% Gramática de identificadores, variáveis e parâmetros
id_cont([H|T],TE) :- letra([H|T],T0), id_cont(T0,TE).
id_cont([H|T],TE) :- digito([H|T],T0), id_cont(T0,TE).
id_cont([H|T],[H|T]) :- espaco([H|T],_).
id_cont([H|T],[H|T]) :- delimitadorS(H).
id_cont([],[]).
id([H|T],TE) :- letra([H|T],T0), id_cont(T0,TE).

tipo_var([H|T],TE) :- integerr([H|T],TE).
tipo_var([H|T],TE) :- real([H|T],TE).
tipo_var([H|T],TE) :- openBracket([H|T],T0), integerr(T0,T1), closeBracket(T1,TE).
tipo_var([H|T],TE) :- openBracket([H|T],T0), real(T0,T1), closeBracket(T1,TE).

mais_var_read([H|T],TE) :- comma([H|T],T0), var_read(T0,TE).
mais_var_read([],[]).
var_read([H|T],TE) :- id([H|T],T0), mais_var_read(T0,TE).

mais_var_write([H|T],TE) :- comma([H|T],T0), var_write(T0,TE).
mais_var_write([],[]).
var_write([H|T],TE) :- id([H|T],T0), mais_var_write(T0,TE).

variaveis([H|T],TE) :- id([H|T],T0), mais_var(T0,TE).
mais_var([H|T],TE) :- comma([H|T],T0), variaveis(T0,TE).
mais_var([],[]).

mais_dc([H|T],TE) :- semicolon([H|T],T0), cont_dc(T0,TE).
cont_dc([H|T],TE) :- dvar([H|T],T0), mais_dc(T0,TE).
cont_dc([],[]).
dvar([H|T],TE) :- variaveis([H|T],T0), colon(T0,T1), tipo_var(T1,TE).

declara([H|T],TE) :- var([H|T],T0), dvar(T0,T1), mais_dc(T1,TE).
declara([],[]).

cont_lista_id([H|T],TE) :- comma([H|T],T0), lista_id(T0,TE).
lista_id([H|T],TE) :- id([H|T],T0), cont_lista_id(T0,TE).

cont_lista_par([H|T],TE) :- semicolon([H|T],T0), lista_parametros(T0,TE).
lista_parametros([H|T],TE) :- lista_id([H|T],T0), colon(T0,T1), tipo_var(T1,T2), cont_lista_par(T2,TE).

parametros([H|T],TE) :- openParentheses([H|T],T0), lista_parametros(T0,T1), closeParentheses(T1,TE).
parametros([],[]).

% Gramática de argumentos
cont_lista_arg([H|T],TE) :- lista_arg([H|T],TE).
cont_lista_arg([],[]).
lista_arg([H|T],TE) :- expressao([H|T],T0), cont_lista_arg(T0,TE).
argumentos([H|T],TE) :- openParentheses([H|T],T0), lista_arg(T0,T1), closeParentheses(T1,TE).
argumentos([],[]).

% Gramática de termos e expressões
operando([H|T],TE) :- id([H|T],TE).
operando([H|T],TE) :- integer_num([H|T],TE).
operando([H|T],TE) :- real_num([H|T],TE).
operando([H|T],TE) :- operador([H|T],T0), openParentheses(T0,T1), operando(T1,T2), comma(T2,T3), operando(T3,T4), closeParentheses(T4,TE).

termo([H|T],TE) :- id([H|T],TE).
termo([H|T],TE) :- integer_num([H|T],TE).
termo([H|T],TE) :- real_num([H|T],TE).
termo([H|T],TE) :- operador([H|T],T0), openParentheses(T0,T1), operando(T1,T2), comma(T2,T3), operando(T3,T4), closeParentheses(T4,TE).

conteudo([H|T],TE) :- openBracket([H|T],T0), closeBracket(T0,TE).
conteudo([H|T],TE) :- openBracket([H|T],T0), integer_num(T0,T1), integer_num_cont(T1,T2), closeBracket(T2,TE).
conteudo([H|T],TE) :- openBracket([H|T],T0), real_num(T0,T1), real_num_cont(T1,T2), closeBracket(T2,TE).

expressao_lista([H|T],TE) :- operadorL([H|T],T0), openParentheses(T0,T1), conteudo(T1,T2), closeParentheses(T2,TE).
expressao_lista([H|T],TE) :- concatena([H|T],T0), openParentheses(T0,T1), conteudo(T1,T2), closeParentheses(T2,TE).
expressao_num([H|T],TE) :- termo([H|T],TE).
expressao_num([H|T],TE) :- id([H|T],T0), argumentos(T0,TE).
expressao([H|T],TE) :- expressao_lista([H|T],TE).
expressao([H|T],TE) :- expressao_num([H|T],TE).

% Gramática de funções e sentenças
cont_sentencas([H|T],TE) :- sentencas([H|T],TE).
cont_sentencas([],[]).
mais_sentencas([H|T],TE) :- semicolon([H|T],T0), cont_sentencas(T0,TE).
sentencas([H|T],TE) :- comando([H|T],T0), mais_sentencas(T0,TE).

tipo_funcao([H|T],TE) :- integerr([H|T],TE).
tipo_funcao([H|T],TE) :- real([H|T],TE).
tipo_funcao([H|T],TE) :- openBracket([H|T],T0), integerr(T0,T1), closeBracket(T1,TE).
tipo_funcao([H|T],TE) :- openBracket([H|T],T0), real(T0,T1), closeBracket(T1,TE).

funcao([H|T],TE) :- function([H|T],T0), id(T0,T1), parametros(T1,T2), colon(T2,T3), tipo_funcao(T3,T4), semicolon(T4,T5), corpo(T5,T6), semicolon(T6,T7), rotina(T7,TE).
procedimento([H|T],TE) :- procedure([H|T],T0), id(T0,T1), parametros(T1,T2), semicolon(T2,T3), corpo(T3,T4), semicolon(T4,T5), rotina(T5,TE).

rotina([H|T],TE) :- funcao([H|T],TE).
rotina([H|T],TE) :- procedimento([H|T],TE).
rotina([],[]).

% Gramática de condições e comandos
condicao([H|T],TE) :- relacao([H|T],T0), openParentheses(T0,T1), expressao_num(T1,T2), comma(T2,T3), expressao_num(T3,T4), closeParentheses(T4,TE).
condicao([H|T],TE) :- relacao([H|T],T0), openParentheses(T0,T1), expressao_lista(T1,T2), comma(T2,T3), expressao_lista(T3,T4), closeParentheses(T4,TE).

pfalsa([H|T],TE) :- else([H|T],T0), begin(T0,T1), sentencas(T1,T2), end(T2,TE).
pfalsa([],[]).

chamadaProcedimento([H|T],TE) :- id([H|T],T0), argumentos(T0,TE).
comando([H|T],TE) :- readd([H|T],T0), openParentheses(T0,T1), var_read(T1,T2), closeParentheses(T2,TE).
comando([H|T],TE) :- writed([H|T],T0), openParentheses(T0,T1), var_write(T1,T2), closeParentheses(T2,TE).
comando([H|T],TE) :- forr([H|T],T0), id(T0,T1), colonEqual(T1,T2), expressao(T2,T3), to(T3,T4), expressao(T4,T5), doo(T5,T6), begin(T6,T7), sentencas(T7,T8), end(T8,TE).
comando([H|T],TE) :- repeat([H|T],T0), sentencas(T0,T1), until(T1,T2), openParentheses(T2,T3), condicao(T3,T4), closeParentheses(T4,TE).
comando([H|T],TE) :- while([H|T],T0), openParentheses(T0,T1), condicao(T1,T2), closeParentheses(T2,T3), doo(T3,T4), begin(T4,T5), sentencas(T5,T6), end(T6,TE).
comando([H|T],TE) :- if([H|T],T0), openParentheses(T0,T1), condicao(T1,T2), closeParentheses(T2,T3), then(T3,T4), begin(T4,T5), sentencas(T5,T6), end(T6,T7), pfalsa(T7,TE).
comando([H|T],TE) :- id([H|T],T0), colonEqual(T0,T1), expressao(T1,TE).
comando([H|T],TE) :- chamadaProcedimento([H|T],TE).

corpo([H|T],TE) :- declara([H|T],T0), rotina(T0,T1), begin(T1,T2), sentencas(T2,T3), end(T3,TE).
corpo([H|T],[H|T]).

programa([H|T],TE) :- program([H|T],T0), espaco(T0,T1), id(T1,T2), semicolon(T2,T3), corpo(T3,T4), dot(T4,TE).

% VERIFICA SE A GRAMÁTICA ESTÁ CORRETA
grammar(L) :- programa(L,TE), empty(TE).

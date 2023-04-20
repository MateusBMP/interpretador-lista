% member(A,S) :- A pertence a S 
member(A,[A|S]) :- style_check(-singleton).
member(A,[B|S]) :- style_check(-singleton), member(A,S).

% next(A,S,TE) :- A é o próximo elemento de S, TE é o resto de S
next(A,[A|S],S).

% empty(S) :- S é vazio
empty([]).

% append(L1,L2,L3) :- L3 é a concatenação de L1 e L2
append([], LIST, LIST).
append([HEAD|TAIL], LIST, [HEAD|REST]) :- append(TAIL, LIST, REST).

% Palavras reservadas
lengthh(Palavra,Cauda) :- next('l',Palavra,Cauda0), next('e',Cauda0,Cauda1), next('n',Cauda1,Cauda2), next('g',Cauda2,Cauda3), next('t',Cauda3,Cauda4), next('h',Cauda4,Cauda).
head(Palavra,Cauda) :- next('h',Palavra,Cauda0), next('e',Cauda0,Cauda1), next('a',Cauda1,Cauda2), next('d',Cauda2,Cauda).
tail(Palavra,Cauda) :- next('t',Palavra,Cauda0), next('a',Cauda0,Cauda1), next('i',Cauda1,Cauda2), next('l',Cauda2,Cauda).
concatena(Palavra,Cauda) :- next('c',Palavra,Cauda0), next('o',Cauda0,Cauda1), next('n',Cauda1,Cauda2), next('c',Cauda2,Cauda3), next('a',Cauda3,Cauda4), next('t',Cauda4,Cauda5), next('e',Cauda5,Cauda6), next('n',Cauda6,Cauda7), next('a',Cauda7,Cauda).
if(Palavra,Cauda) :- next('i',Palavra,Cauda0), next('f',Cauda0,Cauda).
then(Palavra,Cauda) :- next('t',Palavra,Cauda0), next('h',Cauda0,Cauda1), next('e',Cauda1,Cauda2), next('n',Cauda2,Cauda).
else(Palavra,Cauda) :- next('e',Palavra,Cauda0), next('l',Cauda0,Cauda1), next('s',Cauda1,Cauda2), next('e',Cauda2,Cauda).
while(Palavra,Cauda) :- next('w',Palavra,Cauda0), next('h',Cauda0,Cauda1), next('i',Cauda1,Cauda2), next('l',Cauda2,Cauda3), next('e',Cauda3,Cauda).
forr(Palavra,Cauda) :- next('f',Palavra,Cauda0), next('o',Cauda0,Cauda1), next('r',Cauda1,Cauda).
readd(Palavra,Cauda) :- next('r',Palavra,Cauda0), next('e',Cauda0,Cauda1), next('a',Cauda1,Cauda2), next('d',Cauda2,Cauda).
writee(Palavra,Cauda) :- next('w',Palavra,Cauda0), next('r',Cauda0,Cauda1), next('i',Cauda1,Cauda2), next('t',Cauda2,Cauda3), next('e',Cauda3,Cauda).
to(Palavra,Cauda) :- next('t',Palavra,Cauda0), next('o',Cauda0,Cauda).
doo(Palavra,Cauda) :- next('d',Palavra,Cauda0), next('o',Cauda0,Cauda).
begin(Palavra,Cauda) :- next('b',Palavra,Cauda0), next('e',Cauda0,Cauda1), next('g',Cauda1,Cauda2), next('i',Cauda2,Cauda3), next('n',Cauda3,Cauda).
end(Palavra,Cauda) :- next('e',Palavra,Cauda0), next('n',Cauda0,Cauda1), next('d',Cauda1,Cauda).
until(Palavra,Cauda) :- next('u',Palavra,Cauda0), next('n',Cauda0,Cauda1), next('t',Cauda1,Cauda2), next('i',Cauda2,Cauda3), next('l',Cauda3,Cauda).
repeat(Palavra,Cauda) :- next('r',Palavra,Cauda0), next('e',Cauda0,Cauda1), next('p',Cauda1,Cauda2), next('e',Cauda2,Cauda3), next('a',Cauda3,Cauda4), next('t',Cauda4,Cauda).
integerr(Palavra,Cauda) :- next('i',Palavra,Cauda0), next('n',Cauda0,Cauda1), next('t',Cauda1,Cauda2), next('e',Cauda2,Cauda3), next('g',Cauda3,Cauda4), next('e',Cauda4,Cauda5), next('r',Cauda5,Cauda).
real(Palavra,Cauda) :- next('r',Palavra,Cauda0), next('e',Cauda0,Cauda1), next('a',Cauda1,Cauda2), next('l',Cauda2,Cauda).
function(Palavra,Cauda) :- next('f',Palavra,Cauda0), next('u',Cauda0,Cauda1), next('n',Cauda1,Cauda2), next('c',Cauda2,Cauda3), next('t',Cauda3,Cauda4), next('i',Cauda4,Cauda5), next('o',Cauda5,Cauda6), next('n',Cauda6,Cauda).
procedure(Palavra,Cauda) :- next('p',Palavra,Cauda0), next('r',Cauda0,Cauda1), next('o',Cauda1,Cauda2), next('c',Cauda2,Cauda3), next('e',Cauda3,Cauda4), next('d',Cauda4,Cauda5), next('u',Cauda5,Cauda6), next('r',Cauda6,Cauda7), next('e',Cauda7,Cauda).
var(Palavra,Cauda) :- next('v',Palavra,Cauda0), next('a',Cauda0,Cauda1), next('r',Cauda1,Cauda).
program(Palavra,Cauda) :- next('p',Palavra,Cauda0), next('r',Cauda0,Cauda1), next('o',Cauda1,Cauda2), next('g',Cauda2,Cauda3), next('r',Cauda3,Cauda4), next('a',Cauda4,Cauda5), next('m',Cauda5,Cauda).

% Identificadores e delimitadores
letra([H|T],T) :- member(H,['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z']).
digito([H|T],T) :- member(H,['0','1','2','3','4','5','6','7','8','9']).
digit([H|T],T) :- member(H,['1','2','3','4','5','6','7','8','9']).
delimitador([H|T],T) :- member(H,['+','-','*','/','(',')']).
zero(Palavra,Cauda) :- next('0',Palavra,Cauda).
mais(Palavra,Cauda) :- next('+',Palavra,Cauda).
menos(Palavra,Cauda) :- next('-',Palavra,Cauda).
virgula(Palavra,Cauda) :- next(',',Palavra,Cauda).
pontoEVirgula(Palavra,Cauda) :- next(';',Palavra,Cauda).
doisPontos(Palavra,Cauda) :- next(':',Palavra,Cauda).
multiplicacao(Palavra,Cauda) :- next('*',Palavra,Cauda).
divisao(Palavra,Cauda) :- next('/',Palavra,Cauda).
duplaDivisao(Palavra,Cauda) :- next('/',Palavra,Cauda0), next('/',Cauda0,Cauda).
ponto(Palavra,Cauda) :- next('.',Palavra,Cauda).
% espaco(Palavra,Cauda) :- next(' ',Palavra,Cauda).
abreColchete(Palavra,Cauda) :- next('[',Palavra,Cauda).
fechaColchete(Palavra,Cauda) :- next(']',Palavra,Cauda).
abreParentese(Palavra,Cauda) :- next('(',Palavra,Cauda).
fechaParentese(Palavra,Cauda) :- next(')',Palavra,Cauda).
doisPontosIgual(Palavra,Cauda) :- next(':',Palavra,Cauda0), next('=',Cauda0,Cauda).
igual(Palavra,Cauda) :- next('=',Palavra,Cauda).
diferente(Palavra,Cauda) :- next('<',Palavra,Cauda0), next('>',Cauda0,Cauda).
menorOuIgual(Palavra,Cauda) :- next('<',Palavra,Cauda0), next('=',Cauda0,Cauda).
maiorOuIgual(Palavra,Cauda) :- next('>',Palavra,Cauda0), next('=',Cauda0,Cauda).
menorQue(Palavra,Cauda) :- next('<',Palavra,Cauda).
maiorQue(Palavra,Cauda) :- next('>',Palavra,Cauda).

% Operadores e relações
operadorL(Palavra,Cauda) :- lengthh(Palavra,Cauda).
operadorL(Palavra,Cauda) :- head(Palavra,Cauda).
operadorL(Palavra,Cauda) :- tail(Palavra,Cauda).

operador(Palavra,Cauda) :- mais(Palavra,Cauda).
operador(Palavra,Cauda) :- menos(Palavra,Cauda).
operador(Palavra,Cauda) :- multiplicacao(Palavra,Cauda).
operador(Palavra,Cauda) :- divisao(Palavra,Cauda).
operador(Palavra,Cauda) :- duplaDivisao(Palavra,Cauda).

relacao(Palavra,Cauda) :- igual(Palavra,Cauda).
relacao(Palavra,Cauda) :- diferente(Palavra,Cauda).
relacao(Palavra,Cauda) :- menorOuIgual(Palavra,Cauda).
relacao(Palavra,Cauda) :- maiorOuIgual(Palavra,Cauda).
relacao(Palavra,Cauda) :- menorQue(Palavra,Cauda).
relacao(Palavra,Cauda) :- maiorQue(Palavra,Cauda).

% Gramática de número inteiros e reais
num_cont(Palavra,Cauda) :- digito(Palavra,Cauda0), num_cont(Cauda0,Cauda).
% num_cont(Palavra,Palavra) :- espaco(Palavra,_).
num_cont(Palavra,Cauda) :- delimitador(Palavra,Cauda).
num_cont(Palavra,Palavra).
num(Palavra,Cauda) :- digit(Palavra,Cauda0), num_cont(Cauda0,Cauda).
integer_num(Palavra,Cauda) :- mais(Palavra,Cauda0), num(Cauda0,Cauda).
integer_num(Palavra,Cauda) :- menos(Palavra,Cauda0), num(Cauda0,Cauda).
integer_num(Palavra,Cauda) :- num(Palavra,Cauda).
integer_num(Palavra,Cauda) :- zero(Palavra,Cauda).
real_num(Palavra,Cauda) :- mais(Palavra,Cauda0), num(Cauda0,Cauda1), virgula(Cauda1,Cauda2), num(Cauda2,Cauda).
real_num(Palavra,Cauda) :- menos(Palavra,Cauda0), num(Cauda0,Cauda1), virgula(Cauda1,Cauda2), num(Cauda2,Cauda).
real_num(Palavra,Cauda) :- mais(Palavra,Cauda0), zero(Cauda0,Cauda1), num(Cauda1,Cauda2), virgula(Cauda2,Cauda3), num(Cauda3,Cauda).
real_num(Palavra,Cauda) :- menos(Palavra,Cauda0), zero(Cauda0,Cauda1), num(Cauda1,Cauda2), virgula(Cauda2,Cauda3), num(Cauda3,Cauda).
real_num(Palavra,Cauda) :- num(Palavra,Cauda0), virgula(Cauda0,Cauda1), num(Cauda1,Cauda).
real_num(Palavra,Cauda) :- zero(Palavra,Cauda0), virgula(Cauda0,Cauda1), num(Cauda1,Cauda).

integer_num_cont(Palavra,Cauda) :- virgula(Palavra,Cauda0), integer_num_cont(Cauda0,Cauda).
integer_num_cont(Palavra,Palavra).
real_num_cont(Palavra,Cauda) :- virgula(Palavra,Cauda0), real_num_cont(Cauda0,Cauda).
real_num_cont(Palavra,Palavra).

% Gramática de identificadores, variáveis e parâmetros
id_cont(Palavra,Cauda) :- letra(Palavra,Cauda0), id_cont(Cauda0,Cauda).
id_cont(Palavra,Cauda) :- digito(Palavra,Cauda0), id_cont(Cauda0,Cauda).
id_cont(Palavra,Palavra).
id(Palavra,Cauda) :- letra(Palavra,Cauda0), id_cont(Cauda0,Cauda).

tipo_var(Palavra,Cauda) :- integerr(Palavra,Cauda).
tipo_var(Palavra,Cauda) :- real(Palavra,Cauda).
tipo_var(Palavra,Cauda) :- abreColchete(Palavra,Cauda0), integerr(Cauda0,Cauda1), fechaColchete(Cauda1,Cauda).
tipo_var(Palavra,Cauda) :- abreColchete(Palavra,Cauda0), real(Cauda0,Cauda1), fechaColchete(Cauda1,Cauda).

mais_var_read(Palavra,Cauda) :- virgula(Palavra,Cauda0), var_read(Cauda0,Cauda).
mais_var_read(Palavra,Palavra,Erro,Erro).
var_read(Palavra,Cauda) :- id(Palavra,Cauda0), mais_var_read(Cauda0,Cauda).

mais_var_write(Palavra,Cauda) :- virgula(Palavra,Cauda0), var_write(Cauda0,Cauda).
mais_var_write(Palavra,Palavra,Erro,Erro).
var_write(Palavra,Cauda) :- id(Palavra,Cauda0), mais_var_write(Cauda0,Cauda).

mais_var(Palavra,Cauda) :- virgula(Palavra,Cauda0), variaveis(Cauda0,Cauda).
mais_var(Palavra,Palavra).
variaveis(Palavra,Cauda) :- id(Palavra,Cauda0), mais_var(Cauda0,Cauda).

cont_dc(Palavra,Cauda,Erro,FinalErro) :- dvar(Palavra,Cauda0,Erro,FinalErro0), mais_dc(Cauda0,Cauda,FinalErro0,FinalErro), !.
cont_dc(Palavra,Palavra,Erro,Erro).
mais_dc(Palavra,Cauda,Erro,FinalErro) :- pontoEVirgula(Palavra,Cauda0), cont_dc(Cauda0,Cauda,Erro,FinalErro).

dvar(Palavra,Cauda,Erro,Erro) :- variaveis(Palavra,Cauda0), doisPontos(Cauda0,Cauda1), tipo_var(Cauda1,Cauda), !.
dvar(Palavra,Cauda,Erro,FinalErro) :- variaveis(Palavra,Cauda0), doisPontos(Cauda0,Cauda), append(['<tipo_var> esperado após <dois_pontos> em <dvar>'],Erro,FinalErro), !.
dvar(Palavra,Cauda,Erro,FinalErro) :- variaveis(Palavra,Cauda), append(['<dois_pontos> esperado após <variaveis> em <dvar>'],Erro,FinalErro), !.

cont_lista_id(Palavra,Cauda) :- virgula(Palavra,Cauda0), lista_id(Cauda0,Cauda).
lista_id(Palavra,Cauda) :- id(Palavra,Cauda0), cont_lista_id(Cauda0,Cauda).

cont_lista_par(Palavra,Cauda,Erro,FinalErro) :- pontoEVirgula(Palavra,Cauda0), lista_parametros(Cauda0,Cauda,Erro,FinalErro).
lista_parametros(Palavra,Cauda,Erro,FinalErro) :-
    lista_id(Palavra,Cauda0),
    doisPontos(Cauda0,Cauda1),
    tipo_var(Cauda1,Cauda2),
    cont_lista_par(Cauda2,Cauda,Erro,FinalErro).

parametros(Palavra,Cauda,Erro,FinalErro) :-
    abreParentese(Palavra,Cauda0),
    lista_parametros(Cauda0,Cauda1,Erro,FinalErro),
    fechaParentese(Cauda1,Cauda).
parametros(Palavra,Palavra,Erro,Erro).

declara(Palavra,Cauda,Erro,FinalErro) :- var(Palavra,Cauda0), dvar(Cauda0,Cauda1,Erro,FinalErro0), mais_dc(Cauda1,Cauda,FinalErro0,FinalErro), !.
declara(Palavra,Cauda,Erro,FinalErro) :- var(Palavra,Cauda0), dvar(Cauda0,Cauda,Erro,FinalErro0), append(['<mais_dc> esperado após <dvar> em <declara>.'],FinalErro0,FinalErro), !.
declara(Palavra,Cauda,Erro,FinalErro) :- var(Palavra,Cauda), append(['<dvar> esperado após <var> em <declara>.'],Erro,FinalErro), !.
declara(Palavra,Palavra,Erro,Erro).

% Gramática de argumentos
cont_lista_arg(Palavra,Cauda,Erro,FinalErro) :- lista_arg(Palavra,Cauda,Erro,FinalErro).
cont_lista_arg(Palavra,Palavra,Erro,Erro).
lista_arg(Palavra,Cauda,Erro,FinalErro) :- expressao(Palavra,Cauda0,Erro,FinalErro0), cont_lista_arg(Cauda0,Cauda,FinalErro0,FinalErro).
argumentos(Palavra,Palavra,Erro,Erro).
argumentos(Palavra,Cauda,Erro,FinalErro) :- abreParentese(Palavra,Cauda0), lista_arg(Cauda0,Cauda1,Erro,FinalErro), fechaParentese(Cauda1,Cauda), !.
argumentos(Palavra,Cauda,Erro,FinalErro) :- abreParentese(Palavra,Cauda0), lista_arg(Cauda0,Cauda,Erro,FinalErro0), append(['<fecha-parentese> esperado após <lista-arg> em <argumentos>.'],FinalErro0,FinalErro), !.
argumentos(Palavra,Cauda,Erro,FinalErro) :- abreParentese(Palavra,Cauda), append(['<lista-arg> esperado após <abre-parentese> em <argumentos>.'],Erro,FinalErro), !.

% Gramática de termos e expressões
operando(Palavra,Cauda,Erro,Erro) :- id(Palavra,Cauda).
operando(Palavra,Cauda,Erro,Erro) :- integer_num(Palavra,Cauda).
operando(Palavra,Cauda,Erro,Erro) :- real_num(Palavra,Cauda).
operando(Palavra,Cauda,Erro,FinalErro) :- operador(Palavra,Cauda0), abreParentese(Cauda0,Cauda1), operando(Cauda1,Cauda2,Erro,FinalErro0), virgula(Cauda2,Cauda3), operando(Cauda3,Cauda4,FinalErro0,FinalErro), fechaParentese(Cauda4,Cauda).

termo(Palavra,Cauda,Erro,Erro) :- id(Palavra,Cauda).
termo(Palavra,Cauda,Erro,Erro) :- integer_num(Palavra,Cauda).
termo(Palavra,Cauda,Erro,Erro) :- real_num(Palavra,Cauda).
termo(Palavra,Cauda,Erro,FinalErro) :- operador(Palavra,Cauda0), abreParentese(Cauda0,Cauda1), operando(Cauda1,Cauda2,Erro,FinalErro0), virgula(Cauda2,Cauda3), operando(Cauda3,Cauda4,FinalErro0,FinalErro), fechaParentese(Cauda4,Cauda), !.
termo(Palavra,Cauda,Erro,FinalErro) :- operador(Palavra,Cauda0), abreParentese(Cauda0,Cauda1), operando(Cauda1,Cauda2,Erro,FinalErro0), virgula(Cauda2,Cauda3), operando(Cauda3,Cauda,FinalErro0,FinalErro1), append(['<fecha-parentese> esperado após <operando> em <termo>.'],FinalErro1,FinalErro), !.
termo(Palavra,Cauda,Erro,FinalErro) :- operador(Palavra,Cauda0), abreParentese(Cauda0,Cauda1), operando(Cauda1,Cauda2,Erro,FinalErro0), virgula(Cauda2,Cauda), append(['<operando> esperado após <virgula> em <termo>.'],FinalErro0,FinalErro), !.
termo(Palavra,Cauda,Erro,FinalErro) :- operador(Palavra,Cauda0), abreParentese(Cauda0,Cauda1), operando(Cauda1,Cauda,Erro,FinalErro0), append(['<virgula> esperado após <operando> em <termo>.'],FinalErro0,FinalErro), !.
termo(Palavra,Cauda,Erro,FinalErro) :- operador(Palavra,Cauda0), abreParentese(Cauda0,Cauda), append(['<operando> esperado após <abre-parentese> em <termo>.'],Erro,FinalErro), !.
termo(Palavra,Cauda,Erro,FinalErro) :- operador(Palavra,Cauda), append(['<abre-parentese> esperado após <operador> em <termo>.'],Erro,FinalErro), !.

conteudo(Palavra,Cauda) :- abreColchete(Palavra,Cauda0), fechaColchete(Cauda0,Cauda).
conteudo(Palavra,Cauda) :- abreColchete(Palavra,Cauda0), integer_num(Cauda0,Cauda1), integer_num_cont(Cauda1,Cauda2), fechaColchete(Cauda2,Cauda).
conteudo(Palavra,Cauda) :- abreColchete(Palavra,Cauda0), real_num(Cauda0,Cauda1), real_num_cont(Cauda1,Cauda2), fechaColchete(Cauda2,Cauda).

expressao_lista(Palavra,Cauda,Erro,Erro) :- operadorL(Palavra,Cauda0), abreParentese(Cauda0,Cauda1), conteudo(Cauda1,Cauda2), fechaParentese(Cauda2,Cauda), !.
expressao_lista(Palavra,Cauda,Erro,FinalErro) :- operadorL(Palavra,Cauda0), abreParentese(Cauda0,Cauda1), conteudo(Cauda1,Cauda), append(['<fecha-parentese> esperado após <conteudo> em <expressao-lista>.'],Erro,FinalErro), !.
expressao_lista(Palavra,Cauda,Erro,FinalErro) :- operadorL(Palavra,Cauda0), abreParentese(Cauda0,Cauda), append(['<conteudo> esperado após <abre-parentese> em <expressao-lista>.'],Erro,FinalErro), !.
expressao_lista(Palavra,Cauda,Erro,FinalErro) :- operadorL(Palavra,Cauda), append(['<abre-parentese> esperado após <operador-l> em <expressao-lista>.'],Erro,FinalErro).
expressao_lista(Palavra,Cauda,Erro,Erro) :- concatena(Palavra,Cauda0), abreParentese(Cauda0,Cauda1), conteudo(Cauda1,Cauda2), fechaParentese(Cauda2,Cauda), !.
expressao_lista(Palavra,Cauda,Erro,FinalErro) :- concatena(Palavra,Cauda0), abreParentese(Cauda0,Cauda1), conteudo(Cauda1,Cauda), append(['<fecha-parentese> esperado após <conteudo> em <expressao-lista>.'],Erro,FinalErro), !.
expressao_lista(Palavra,Cauda,Erro,FinalErro) :- concatena(Palavra,Cauda0), abreParentese(Cauda0,Cauda), append(['<conteudo> esperado após <abre-parentese> em <expressao-lista>.'],Erro,FinalErro), !.
expressao_lista(Palavra,Cauda,Erro,FinalErro) :- concatena(Palavra,Cauda), append(['<abre-parentese> esperado após <concatena> em <expressao-lista>.'],Erro,FinalErro).
expressao_num(Palavra,Cauda,Erro,FinalErro) :- termo(Palavra,Cauda,Erro,FinalErro).
expressao_num(Palavra,Cauda,Erro,FinalErro) :- id(Palavra,Cauda0), argumentos(Cauda0,Cauda,Erro,FinalErro), !.
expressao_num(Palavra,Cauda,Erro,FinalErro) :- id(Palavra,Cauda), append(['<argumentos> esperado após <id> em <expressao-num>,'],Erro,FinalErro).
expressao(Palavra,Cauda,Erro,FinalErro) :- expressao_lista(Palavra,Cauda,Erro,FinalErro).
expressao(Palavra,Cauda,Erro,FinalErro) :- expressao_num(Palavra,Cauda,Erro,FinalErro).

% Gramática de funções e sentenças
cont_sentencas(Palavra,Cauda,Erro,FinalErro) :- sentencas(Palavra,Cauda,Erro,FinalErro).
cont_sentencas(Palavra,Palavra,Erro,Erro).
mais_sentencas(Palavra,Cauda,Erro,FinalErro) :- pontoEVirgula(Palavra,Cauda0), cont_sentencas(Cauda0,Cauda,Erro,FinalErro).
sentencas(Palavra,Cauda,Erro,FinalErro) :- comando(Palavra,Cauda0,Erro,FinalErro0), mais_sentencas(Cauda0,Cauda,FinalErro0,FinalErro).

tipo_funcao(Palavra,Cauda) :- integerr(Palavra,Cauda).
tipo_funcao(Palavra,Cauda) :- real(Palavra,Cauda).
tipo_funcao(Palavra,Cauda) :- abreColchete(Palavra,Cauda0), integerr(Cauda0,Cauda1), fechaColchete(Cauda1,Cauda).
tipo_funcao(Palavra,Cauda) :- abreColchete(Palavra,Cauda0), real(Cauda0,Cauda1), fechaColchete(Cauda1,Cauda).

funcao(Palavra,Cauda,Erro,FinalErro) :- function(Palavra,Cauda0), id(Cauda0,Cauda1), parametros(Cauda1,Cauda2,Erro,FinalErro0), doisPontos(Cauda2,Cauda3), tipo_funcao(Cauda3,Cauda4), pontoEVirgula(Cauda4,Cauda5), corpo(Cauda5,Cauda6,FinalErro0,FinalErro1), pontoEVirgula(Cauda6,Cauda7), rotina(Cauda7,Cauda,FinalErro1,FinalErro), !.
funcao(Palavra,Cauda,Erro,FinalErro) :- function(Palavra,Cauda0), id(Cauda0,Cauda1), parametros(Cauda1,Cauda2,Erro,FinalErro0), doisPontos(Cauda2,Cauda3), tipo_funcao(Cauda3,Cauda4), pontoEVirgula(Cauda4,Cauda5), corpo(Cauda5,Cauda6,FinalErro0,FinalErro1), pontoEVirgula(Cauda6,Cauda), append(['<rotina> esperado após <ponto-e-virgula> em <funcao>.'],FinalErro1,FinalErro), !.
funcao(Palavra,Cauda,Erro,FinalErro) :- function(Palavra,Cauda0), id(Cauda0,Cauda1), parametros(Cauda1,Cauda2,Erro,FinalErro0), doisPontos(Cauda2,Cauda3), tipo_funcao(Cauda3,Cauda4), pontoEVirgula(Cauda4,Cauda5), corpo(Cauda5,Cauda,FinalErro0,FinalErro1), append(['<ponto-e-virgula> esperado após <corpo> em <funcao>.'],FinalErro1,FinalErro), !.
funcao(Palavra,Cauda,Erro,FinalErro) :- function(Palavra,Cauda0), id(Cauda0,Cauda1), parametros(Cauda1,Cauda2,Erro,FinalErro0), doisPontos(Cauda2,Cauda3), tipo_funcao(Cauda3,Cauda4), pontoEVirgula(Cauda4,Cauda), append(['<corpo> esperado após <ponto-e-virgula> em <funcao>.'],FinalErro0,FinalErro), !.
funcao(Palavra,Cauda,Erro,FinalErro) :- function(Palavra,Cauda0), id(Cauda0,Cauda1), parametros(Cauda1,Cauda2,Erro,FinalErro0), doisPontos(Cauda2,Cauda3), tipo_funcao(Cauda3,Cauda), append(['<ponto-e-virgula> esperado após <tipo-funcao> em <funcao>.'],FinalErro0,FinalErro), !.
funcao(Palavra,Cauda,Erro,FinalErro) :- function(Palavra,Cauda0), id(Cauda0,Cauda1), parametros(Cauda1,Cauda2,Erro,FinalErro0), doisPontos(Cauda2,Cauda), append(['<tipo-funcao> esperado após <dois-pontos> em <funcao>.'],FinalErro0,FinalErro), !.
funcao(Palavra,Cauda,Erro,FinalErro) :- function(Palavra,Cauda0), id(Cauda0,Cauda1), parametros(Cauda1,Cauda,Erro,FinalErro0), append(['<dois-pontos> esperado após <parametros> em <funcao>.'],FinalErro0,FinalErro), !.
funcao(Palavra,Cauda,Erro,FinalErro) :- function(Palavra,Cauda0), id(Cauda0,Cauda), append(['<parametros> esperado após <id> em <funcao>.'],Erro,FinalErro), !.
funcao(Palavra,Cauda,Erro,FinalErro) :- function(Palavra,Cauda), append(['<id> esperado após <function> em <funcao>.'],Erro,FinalErro).

procedimento(Palavra,Cauda,Erro,FinalErro) :- procedure(Palavra,Cauda0), id(Cauda0,Cauda1), parametros(Cauda1,Cauda2,Erro,FinalErro0), pontoEVirgula(Cauda2,Cauda3), corpo(Cauda3,Cauda4,FinalErro0,FinalErro1), pontoEVirgula(Cauda4,Cauda5), rotina(Cauda5,Cauda,FinalErro1,FinalErro), !.
procedimento(Palavra,Cauda,Erro,FinalErro) :- procedure(Palavra,Cauda0), id(Cauda0,Cauda1), parametros(Cauda1,Cauda2,Erro,FinalErro0), pontoEVirgula(Cauda2,Cauda3), corpo(Cauda3,Cauda4,FinalErro0,FinalErro1), pontoEVirgula(Cauda4,Cauda), append(['<rotina> esperado após <ponto-e-virgula> em <procedimento>.'],FinalErro1,FinalErro), !.
procedimento(Palavra,Cauda,Erro,FinalErro) :- procedure(Palavra,Cauda0), id(Cauda0,Cauda1), parametros(Cauda1,Cauda2,Erro,FinalErro0), pontoEVirgula(Cauda2,Cauda3), corpo(Cauda3,Cauda,FinalErro0,FinalErro1), append(['<ponto-e-virgula> esperado após <corpo> em <procedimento>.'],FinalErro1,FinalErro), !.
procedimento(Palavra,Cauda,Erro,FinalErro) :- procedure(Palavra,Cauda0), id(Cauda0,Cauda1), parametros(Cauda1,Cauda2,Erro,FinalErro0), pontoEVirgula(Cauda2,Cauda), append(['<corpo> esperado após <ponto-e-virgula> em <procedimento>.'],FinalErro0,FinalErro), !.
procedimento(Palavra,Cauda,Erro,FinalErro) :- procedure(Palavra,Cauda0), id(Cauda0,Cauda1), parametros(Cauda1,Cauda,Erro,FinalErro0), append(['<ponto-e-virgula> esperado após <parametros> em <procedimento>.'],FinalErro0,FinalErro), !.
procedimento(Palavra,Cauda,Erro,FinalErro) :- procedure(Palavra,Cauda0), id(Cauda0,Cauda), append(['<parametros> esperado após <id> em <procedimento>.'],Erro,FinalErro), !.
procedimento(Palavra,Cauda,Erro,FinalErro) :- procedure(Palavra,Cauda), append(['<id> esperado após <procedure> em <procedimento>.'],Erro,FinalErro).

rotina(Palavra,Cauda,Erro,FinalErro) :- funcao(Palavra,Cauda,Erro,FinalErro).
rotina(Palavra,Cauda,Erro,FinalErro) :- procedimento(Palavra,Cauda,Erro,FinalErro).
rotina(Palavra,Palavra,Erro,Erro).

% Gramática de condições e comandos
condicao(Palavra,Cauda,Erro,FinalErro) :- relacao(Palavra,Cauda0), abreParentese(Cauda0,Cauda1), expressao_num(Cauda1,Cauda2,Erro,FinalErro0), virgula(Cauda2,Cauda3), expressao_num(Cauda3,Cauda4,FinalErro0,FinalErro), fechaParentese(Cauda4,Cauda), !.
condicao(Palavra,Cauda,Erro,FinalErro) :- relacao(Palavra,Cauda0), abreParentese(Cauda0,Cauda1), expressao_lista(Cauda1,Cauda2,Erro,FinalErro0), virgula(Cauda2,Cauda3), expressao_lista(Cauda3,Cauda4,FinalErro0,FinalErro), fechaParentese(Cauda4,Cauda), !.
condicao(Palavra,Cauda,Erro,FinalErro) :- relacao(Palavra,Cauda0), abreParentese(Cauda0,Cauda1), expressao_num(Cauda1,Cauda2,Erro,FinalErro0), virgula(Cauda2,Cauda3), expressao_num(Cauda3,Cauda,FinalErro0,FinalErro1), append(['<fecha-parentese> esperado após <expressao-num> em <condicao>.'],FinalErro1,FinalErro), !.
condicao(Palavra,Cauda,Erro,FinalErro) :- relacao(Palavra,Cauda0), abreParentese(Cauda0,Cauda1), expressao_lista(Cauda1,Cauda2,Erro,FinalErro0), virgula(Cauda2,Cauda3), expressao_lista(Cauda3,Cauda,FinalErro0,FinalErro1), append(['<fecha-parentese> esperado após <expressao-lista> em <condicao>.'],FinalErro1,FinalErro), !.
condicao(Palavra,Cauda,Erro,FinalErro) :- relacao(Palavra,Cauda0), abreParentese(Cauda0,Cauda1), expressao_num(Cauda1,Cauda2,Erro,FinalErro0), virgula(Cauda2,Cauda), append(['<expressao-num> esperado após <virgula> em <condicao>.'],FinalErro0,FinalErro), !.
condicao(Palavra,Cauda,Erro,FinalErro) :- relacao(Palavra,Cauda0), abreParentese(Cauda0,Cauda1), expressao_lista(Cauda1,Cauda2,Erro,FinalErro0), virgula(Cauda2,Cauda), append(['<expressao-lista> esperado após <virgula> em <condicao>.'],FinalErro0,FinalErro), !.
condicao(Palavra,Cauda,Erro,FinalErro) :- relacao(Palavra,Cauda0), abreParentese(Cauda0,Cauda1), expressao_num(Cauda1,Cauda,Erro,FinalErro0), append(['<virgula> esperado após <expressao-num> em <condicao>.'],FinalErro0,FinalErro), !.
condicao(Palavra,Cauda,Erro,FinalErro) :- relacao(Palavra,Cauda0), abreParentese(Cauda0,Cauda1), expressao_lista(Cauda1,Cauda,Erro,FinalErro0), append(['<virgula> esperado após <expressao-lista> em <condicao>.'],FinalErro0,FinalErro), !.
condicao(Palavra,Cauda,Erro,FinalErro) :- relacao(Palavra,Cauda0), abreParentese(Cauda0,Cauda), append(['<expressao-num> ou <expressao-lista> esperado após <abre-parentese> em <condicao>.'],Erro,FinalErro), !.
condicao(Palavra,Cauda,Erro,FinalErro) :- relacao(Palavra,Cauda), append(['<abre-parentese> esperado após <relacao> em <condicao>.'],Erro,FinalErro).

pfalsa(Palavra,Cauda,Erro,FinalErro) :- else(Palavra,Cauda0), begin(Cauda0,Cauda1), sentencas(Cauda1,Cauda2,Erro,FinalErro), end(Cauda2,Cauda), !.
pfalsa(Palavra,Cauda,Erro,FinalErro) :- else(Palavra,Cauda0), begin(Cauda0,Cauda1), sentencas(Cauda1,Cauda,Erro,FinalErro0), append(['<end> esperado após <sentencas> em <pfalsa>.'],FinalErro0,FinalErro), !.
pfalsa(Palavra,Cauda,Erro,FinalErro) :- else(Palavra,Cauda0), begin(Cauda0,Cauda), append(['<sentencas> esperado após <begin> em <pfalsa>.'],Erro,FinalErro), !.
pfalsa(Palavra,Cauda,Erro,FinalErro) :- else(Palavra,Cauda), append(['<begin> esperado após <else> em <pfalsa>.'],Erro,FinalErro), !.
pfalsa(Palavra,Palavra,Erro,Erro).

chamadaProcedimento(Palavra,Cauda,Erro,FinalErro) :- id(Palavra,Cauda0), argumentos(Cauda0,Cauda,Erro,FinalErro), !.
chamadaProcedimento(Palavra,Cauda,Erro,FinalErro) :- id(Palavra,Cauda), append(['<argumentos> esperado após <id> em <chamada-procedimento>.'],Erro,FinalErro), !.
comando(Palavra,Cauda,Erro,Erro) :- readd(Palavra,Cauda0), abreParentese(Cauda0,Cauda1), var_read(Cauda1,Cauda2), fechaParentese(Cauda2,Cauda), !.
comando(Palavra,Cauda,Erro,FinalErro) :- readd(Palavra,Cauda0), abreParentese(Cauda0,Cauda1), var_read(Cauda1,Cauda), append(['<fecha-parentese> esperado após <var-read> em <comando>.'],Erro,FinalErro), !.
comando(Palavra,Cauda,Erro,FinalErro) :- readd(Palavra,Cauda0), abreParentese(Cauda0,Cauda), append(['<var-read> esperado após <abre-parentese> em <comando>.'],Erro,FinalErro), !.
comando(Palavra,Cauda,Erro,FinalErro) :- readd(Palavra,Cauda), append(['<abre-parentese> esperado após <readd> em <comando>.'],Erro,FinalErro), !.
comando(Palavra,Cauda,Erro,Erro) :- writee(Palavra,Cauda0), abreParentese(Cauda0,Cauda1), var_write(Cauda1,Cauda2), fechaParentese(Cauda2,Cauda), !.
comando(Palavra,Cauda,Erro,FinalErro) :- writee(Palavra,Cauda0), abreParentese(Cauda0,Cauda1), var_write(Cauda1,Cauda), append(['<fecha-parentese> esperado após <var-write> em <comando>.'],Erro,FinalErro), !.
comando(Palavra,Cauda,Erro,FinalErro) :- writee(Palavra,Cauda0), abreParentese(Cauda0,Cauda), append(['<var-write> esperado após <abre-parentese> em <comando>.'],Erro,FinalErro), !.
comando(Palavra,Cauda,Erro,FinalErro) :- writee(Palavra,Cauda), append(['<abre-parentese> esperado após <writee> em <comando>.'],Erro,FinalErro), !.
comando(Palavra,Cauda,Erro,FinalErro) :- forr(Palavra,Cauda0), id(Cauda0,Cauda1), doisPontosIgual(Cauda1,Cauda2), expressao(Cauda2,Cauda3,Erro,FinalErro0), to(Cauda3,Cauda4), expressao(Cauda4,Cauda5,FinalErro0,FinalErro1), doo(Cauda5,Cauda6), begin(Cauda6,Cauda7), sentencas(Cauda7,Cauda8,FinalErro1,FinalErro), end(Cauda8,Cauda), !.
comando(Palavra,Cauda,Erro,FinalErro) :- forr(Palavra,Cauda0), id(Cauda0,Cauda1), doisPontosIgual(Cauda1,Cauda2), expressao(Cauda2,Cauda3,Erro,FinalErro0), to(Cauda3,Cauda4), expressao(Cauda4,Cauda5,FinalErro0,FinalErro1), doo(Cauda5,Cauda6), begin(Cauda6,Cauda7), sentencas(Cauda7,Cauda,FinalErro1,FinalErro2), append(['<end> esperado após <sentencas> em <comando>.'],FinalErro2,FinalErro), !.
comando(Palavra,Cauda,Erro,FinalErro) :- forr(Palavra,Cauda0), id(Cauda0,Cauda1), doisPontosIgual(Cauda1,Cauda2), expressao(Cauda2,Cauda3,Erro,FinalErro0), to(Cauda3,Cauda4), expressao(Cauda4,Cauda5,FinalErro0,FinalErro1), doo(Cauda5,Cauda6), begin(Cauda6,Cauda), append(['<sentencas> esperado após <begin> em <comando>.'],FinalErro1,FinalErro), !.
comando(Palavra,Cauda,Erro,FinalErro) :- forr(Palavra,Cauda0), id(Cauda0,Cauda1), doisPontosIgual(Cauda1,Cauda2), expressao(Cauda2,Cauda3,Erro,FinalErro0), to(Cauda3,Cauda4), expressao(Cauda4,Cauda5,FinalErro0,FinalErro1), doo(Cauda5,Cauda), append(['<begin> esperado após <doo> em <comando>.'],FinalErro1,FinalErro), !.
comando(Palavra,Cauda,Erro,FinalErro) :- forr(Palavra,Cauda0), id(Cauda0,Cauda1), doisPontosIgual(Cauda1,Cauda2), expressao(Cauda2,Cauda3,Erro,FinalErro0), to(Cauda3,Cauda4), expressao(Cauda4,Cauda,FinalErro0,FinalErro1), append(['<doo> esperado após <expressao> em <comando>.'],FinalErro1,FinalErro), !.
comando(Palavra,Cauda,Erro,FinalErro) :- forr(Palavra,Cauda0), id(Cauda0,Cauda1), doisPontosIgual(Cauda1,Cauda2), expressao(Cauda2,Cauda3,Erro,FinalErro0), to(Cauda3,Cauda), append(['<expressao> esperado após <to> em <comando>.'],FinalErro0,FinalErro), !.
comando(Palavra,Cauda,Erro,FinalErro) :- forr(Palavra,Cauda0), id(Cauda0,Cauda1), doisPontosIgual(Cauda1,Cauda2), expressao(Cauda2,Cauda,Erro,FinalErro0), append(['<to> esperado após <expressao> em <comando>.'],FinalErro0,FinalErro), !.
comando(Palavra,Cauda,Erro,FinalErro) :- forr(Palavra,Cauda0), id(Cauda0,Cauda1), doisPontosIgual(Cauda1,Cauda), append(['<expressao> esperado após <dois-pontos-igual> em <comando>.'],Erro,FinalErro), !.
comando(Palavra,Cauda,Erro,FinalErro) :- forr(Palavra,Cauda0), id(Cauda0,Cauda), append(['<dois-pontos-igual> esperado após <id> em <comando>.'],Erro,FinalErro), !.
comando(Palavra,Cauda,Erro,FinalErro) :- forr(Palavra,Cauda), append(['<id> esperado após <forr> em <comando>.'],Erro,FinalErro), !.
comando(Palavra,Cauda,Erro,FinalErro) :- repeat(Palavra,Cauda0), sentencas(Cauda0,Cauda1,Erro,FinalErro0), until(Cauda1,Cauda2), abreParentese(Cauda2,Cauda3), condicao(Cauda3,Cauda4,FinalErro0,FinalErro), fechaParentese(Cauda4,Cauda), !.
comando(Palavra,Cauda,Erro,FinalErro) :- repeat(Palavra,Cauda0), sentencas(Cauda0,Cauda1,Erro,FinalErro0), until(Cauda1,Cauda2), abreParentese(Cauda2,Cauda3), condicao(Cauda3,Cauda,FinalErro0,FinalErro1), append(['<fecha-parentese> esperado após <condicao> em <comando>.'],FinalErro1,FinalErro), !.
comando(Palavra,Cauda,Erro,FinalErro) :- repeat(Palavra,Cauda0), sentencas(Cauda0,Cauda1,Erro,FinalErro0), until(Cauda1,Cauda2), abreParentese(Cauda2,Cauda), append(['<condicao> esperado após <abre-parentese> em <comando>.'],FinalErro0,FinalErro), !.
comando(Palavra,Cauda,Erro,FinalErro) :- repeat(Palavra,Cauda0), sentencas(Cauda0,Cauda1,Erro,FinalErro0), until(Cauda1,Cauda), append(['<abre-parentese> esperado após <until> em <comando>.'],FinalErro0,FinalErro), !.
comando(Palavra,Cauda,Erro,FinalErro) :- repeat(Palavra,Cauda0), sentencas(Cauda0,Cauda,Erro,FinalErro0), append(['<until> esperado após <sentencas> em <comando>.'],FinalErro0,FinalErro), !.
comando(Palavra,Cauda,Erro,FinalErro) :- repeat(Palavra,Cauda), append(['<sentencas> esperado após <repeat> em <comando>.'],Erro,FinalErro), !.
comando(Palavra,Cauda,Erro,FinalErro) :- while(Palavra,Cauda0), abreParentese(Cauda0,Cauda1), condicao(Cauda1,Cauda2,Erro,FinalErro0), fechaParentese(Cauda2,Cauda3), doo(Cauda3,Cauda4), begin(Cauda4,Cauda5), sentencas(Cauda5,Cauda6,FinalErro0,FinalErro), end(Cauda6,Cauda), !.
comando(Palavra,Cauda,Erro,FinalErro) :- while(Palavra,Cauda0), abreParentese(Cauda0,Cauda1), condicao(Cauda1,Cauda2,Erro,FinalErro0), fechaParentese(Cauda2,Cauda3), doo(Cauda3,Cauda4), begin(Cauda4,Cauda5), sentencas(Cauda5,Cauda,FinalErro0,FinalErro1), append(['<end> esperado após <sentencas> em <comando>.'],FinalErro1,FinalErro), !.
comando(Palavra,Cauda,Erro,FinalErro) :- while(Palavra,Cauda0), abreParentese(Cauda0,Cauda1), condicao(Cauda1,Cauda2,Erro,FinalErro0), fechaParentese(Cauda2,Cauda3), doo(Cauda3,Cauda4), begin(Cauda4,Cauda), append(['<sentencas> esperado após <begin> em <comando>.'],FinalErro0,FinalErro), !.
comando(Palavra,Cauda,Erro,FinalErro) :- while(Palavra,Cauda0), abreParentese(Cauda0,Cauda1), condicao(Cauda1,Cauda2,Erro,FinalErro0), fechaParentese(Cauda2,Cauda3), doo(Cauda3,Cauda), append(['<begin> esperado após <doo> em <comando>.'],FinalErro0,FinalErro), !.
comando(Palavra,Cauda,Erro,FinalErro) :- while(Palavra,Cauda0), abreParentese(Cauda0,Cauda1), condicao(Cauda1,Cauda2,Erro,FinalErro0), fechaParentese(Cauda2,Cauda), append(['<doo> esperado após <fecha-parentese> em <comando>.'],FinalErro0,FinalErro), !.
comando(Palavra,Cauda,Erro,FinalErro) :- while(Palavra,Cauda0), abreParentese(Cauda0,Cauda1), condicao(Cauda1,Cauda,Erro,FinalErro0), append(['<fecha-parentese> esperado após <condicao> em <comando>.'],FinalErro0,FinalErro), !.
comando(Palavra,Cauda,Erro,FinalErro) :- while(Palavra,Cauda0), abreParentese(Cauda0,Cauda), append(['<condicao> esperado após <abre-parentese> em <comando>.'],Erro,FinalErro), !.
comando(Palavra,Cauda,Erro,FinalErro) :- while(Palavra,Cauda), append(['<abre-parentese> esperado após <while> em <comando>.'],Erro,FinalErro), !.
comando(Palavra,Cauda,Erro,FinalErro) :- if(Palavra,Cauda0), abreParentese(Cauda0,Cauda1), condicao(Cauda1,Cauda2,Erro,FinalErro0), fechaParentese(Cauda2,Cauda3), then(Cauda3,Cauda4), begin(Cauda4,Cauda5), sentencas(Cauda5,Cauda6,FinalErro0,FinalErro1), end(Cauda6,Cauda7), pfalsa(Cauda7,Cauda,FinalErro1,FinalErro), !.
comando(Palavra,Cauda,Erro,FinalErro) :- if(Palavra,Cauda0), abreParentese(Cauda0,Cauda1), condicao(Cauda1,Cauda2,Erro,FinalErro0), fechaParentese(Cauda2,Cauda3), then(Cauda3,Cauda4), begin(Cauda4,Cauda5), sentencas(Cauda5,Cauda6,FinalErro0,FinalErro1), end(Cauda6,Cauda), append(['<pfalsa> esperado após <end> em <comando>.'],FinalErro1,FinalErro), !.
comando(Palavra,Cauda,Erro,FinalErro) :- if(Palavra,Cauda0), abreParentese(Cauda0,Cauda1), condicao(Cauda1,Cauda2,Erro,FinalErro0), fechaParentese(Cauda2,Cauda3), then(Cauda3,Cauda4), begin(Cauda4,Cauda5), sentencas(Cauda5,Cauda,FinalErro0,FinalErro1), append(['<end> esperado após <sentencas> em <comando>.'],FinalErro1,FinalErro), !.
comando(Palavra,Cauda,Erro,FinalErro) :- if(Palavra,Cauda0), abreParentese(Cauda0,Cauda1), condicao(Cauda1,Cauda2,Erro,FinalErro0), fechaParentese(Cauda2,Cauda3), then(Cauda3,Cauda4), begin(Cauda4,Cauda), append(['<sentencas> esperado após <begin> em <comando>.'],FinalErro0,FinalErro), !.
comando(Palavra,Cauda,Erro,FinalErro) :- if(Palavra,Cauda0), abreParentese(Cauda0,Cauda1), condicao(Cauda1,Cauda2,Erro,FinalErro0), fechaParentese(Cauda2,Cauda3), then(Cauda3,Cauda), append(['<begin> esperado após <then> em <comando>.'],FinalErro0,FinalErro), !.
comando(Palavra,Cauda,Erro,FinalErro) :- if(Palavra,Cauda0), abreParentese(Cauda0,Cauda1), condicao(Cauda1,Cauda2,Erro,FinalErro0), fechaParentese(Cauda2,Cauda), append(['<then> esperado após <fecha-parentese> em <comando>.'],FinalErro0,FinalErro), !.
comando(Palavra,Cauda,Erro,FinalErro) :- if(Palavra,Cauda0), abreParentese(Cauda0,Cauda1), condicao(Cauda1,Cauda,Erro,FinalErro0), append(['<fecha-parentese> esperado após <condicao> em <comando>.'],FinalErro0,FinalErro), !.
comando(Palavra,Cauda,Erro,FinalErro) :- if(Palavra,Cauda0), abreParentese(Cauda0,Cauda), append(['<condicao> esperado após <abre-parentese> em <comando>.'],Erro,FinalErro), !.
comando(Palavra,Cauda,Erro,FinalErro) :- if(Palavra,Cauda), append(['<abre-parentese> esperado após <if> em <comando>.'],Erro,FinalErro), !.
comando(Palavra,Cauda,Erro,FinalErro) :- id(Palavra,Cauda0), doisPontosIgual(Cauda0,Cauda1), expressao(Cauda1,Cauda,Erro,FinalErro), !.
comando(Palavra,Cauda,Erro,FinalErro) :- id(Palavra,Cauda0), doisPontosIgual(Cauda0,Cauda), append(['<expressao> esperado após <dois-pontos-igual> em <comando>.'],Erro,FinalErro), !.
comando(Palavra,Cauda,Erro,FinalErro) :- id(Palavra,Cauda), append(['<dois-pontos-igual> esperado após <id> em <comando>.'],Erro,FinalErro), !.
comando(Palavra,Cauda,Erro,FinalErro) :- chamadaProcedimento(Palavra,Cauda,Erro,FinalErro).

corpo(Palavra,Cauda,Erro,FinalErro) :- declara(Palavra,Cauda0,Erro,FinalErro0), rotina(Cauda0,Cauda1,FinalErro0,FinalErro1), begin(Cauda1,Cauda2), sentencas(Cauda2,Cauda3,FinalErro1,FinalErro), end(Cauda3,Cauda), !.
corpo(Palavra,Cauda,Erro,FinalErro) :- declara(Palavra,Cauda0,Erro,FinalErro0), rotina(Cauda0,Cauda1,FinalErro0,FinalErro1), begin(Cauda1,Cauda2), sentencas(Cauda2,Cauda,FinalErro1,FinalErro2), append(['<end> esperado após <sentencas> em <corpo>.'],FinalErro2,FinalErro), !.
corpo(Palavra,Cauda,Erro,FinalErro) :- declara(Palavra,Cauda0,Erro,FinalErro0), rotina(Cauda0,Cauda1,FinalErro0,FinalErro1), begin(Cauda1,Cauda), append(['<sentencas> esperado após <begin> em <corpo>.'],FinalErro1,FinalErro), !.
corpo(Palavra,Cauda,Erro,FinalErro) :- declara(Palavra,Cauda0,Erro,FinalErro0), rotina(Cauda0,Cauda,FinalErro0,FinalErro1), append(['<begin> esperado após <rotina> em <corpo>.'],FinalErro1,FinalErro), !.
corpo(Palavra,Cauda,Erro,FinalErro) :- declara(Palavra,Cauda,Erro,FinalErro0), append(['<rotina> esperado após <declara> em <corpo>.'],FinalErro0,FinalErro), !.
corpo(Palavra,Palavra,Erro,Erro).

programa(Palavra,Cauda,Erro,FinalErro) :- program(Palavra,Cauda0), id(Cauda0,Cauda1), pontoEVirgula(Cauda1,Cauda2), corpo(Cauda2,Cauda3,Erro,FinalErro), ponto(Cauda3,Cauda), !.
programa(Palavra,Cauda,Erro,FinalErro) :- program(Palavra,Cauda0), id(Cauda0,Cauda1), pontoEVirgula(Cauda1,Cauda2), corpo(Cauda2,Cauda,Erro,FinalErro0), append(['<ponto> esperado após <corpo> em <programa>.'],FinalErro0,FinalErro), !.
programa(Palavra,Cauda,Erro,FinalErro) :- program(Palavra,Cauda0), id(Cauda0,Cauda1), pontoEVirgula(Cauda1,Cauda), append(['<corpo> esperado após <ponto-e-virgula> em <programa>.'],Erro,FinalErro), !.
programa(Palavra,Cauda,Erro,FinalErro) :- program(Palavra,Cauda0), id(Cauda0,Cauda), append(['<ponto-e-virgula> esperado após <id> em <programa>.'],Erro,FinalErro), !.
programa(Palavra,Cauda,Erro,FinalErro) :- program(Palavra,Cauda), append(['<id> esperado após <program> em <programa>.'],Erro,FinalErro), !.
programa(Palavra,Palavra,Erro,FinalErro) :- append(['Gramática deve começar com <program>.'],Erro,FinalErro).

% VERIFICA SE A GRAMÁTICA ESTÁ CORRETA
grammar(Palavra) :- programa(Palavra,Cauda,[],FinalErro), empty(Cauda), empty(FinalErro).

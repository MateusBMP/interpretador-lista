% Controle de variáveis. É reescrito via assert e retract
:- dynamic variavel/1.

setVariavel(Variavel) :- string_chars(String,Variavel), assertz(variavel(String)).
unsetVariavel(Variavel) :- string_chars(String,Variavel), retract(variavel(String)).
isVariavel(Variavel) :- string_chars(String,Variavel), variavel(String).

% set(A,S) :- A é igual a S
set(A,A).

% see: https://github.com/hopsoft/kvn
appendKVN(Key,Value,Data,NewData) :- string_concat(Data,Key,NewData0), string_concat(NewData0,':',NewData1), string_concat(NewData1,Value,NewData2), string_concat(NewData2,';',NewData).
appendKVN(Key,Value,NewData) :- appendKVN(Key,Value,'',NewData).

% setError(Mensagem,Palavra,Error) :- Error é uma string com a mensagem de erro e a posição do erro no formato KVN
setError(Mensagem,Palavra,Error) :- string_length(Palavra,Length), appendKVN('posicao',Length,D0), appendKVN('erro',Mensagem,D0,Error).

% member(A,S) :- A pertence a S 
member(A,[_|S]) :- member(A,S).
member(A,[A|_]).

% next(A,S,TE) :- A é o próximo elemento de S, TE é o resto de S
next(A,[A|S],S).

% empty(S) :- S é vazio
empty([]).

% append(L1,L2,L3) :- L3 é a concatenação de L1 e L2
append([], LIST, LIST).
append([HEAD|TAIL], LIST, [HEAD|REST]) :- append(TAIL, LIST, REST).

% neg(G) :- G é falso
neg(G) :- call(G), !, fail.
neg(_) :- true.

% selecionado(Palavra,Cauda,PalavraFinal) :- Pega a palavra selecionada a partir do que sobrou da cauda
selecionada([C|Palavra],Cauda,PAtual,PFinal) :- length([C|Palavra],L1), length(Cauda,L2), L1 > L2, append(PAtual,[C],PFinal0), selecionada(Palavra,Cauda,PFinal0,PFinal).
selecionada(_,_,PAtual,PAtual).

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

reservada(Palavra) :- lengthh(Palavra,_).
reservada(Palavra) :- head(Palavra,_).
reservada(Palavra) :- tail(Palavra,_).
reservada(Palavra) :- concatena(Palavra,_).
reservada(Palavra) :- if(Palavra,_).
reservada(Palavra) :- then(Palavra,_).
reservada(Palavra) :- else(Palavra,_).
reservada(Palavra) :- while(Palavra,_).
reservada(Palavra) :- forr(Palavra,_).
reservada(Palavra) :- readd(Palavra,_).
reservada(Palavra) :- writee(Palavra,_).
reservada(Palavra) :- to(Palavra,_).
reservada(Palavra) :- doo(Palavra,_).
reservada(Palavra) :- begin(Palavra,_).
reservada(Palavra) :- end(Palavra,_).
reservada(Palavra) :- until(Palavra,_).
reservada(Palavra) :- repeat(Palavra,_).
reservada(Palavra) :- integerr(Palavra,_).
reservada(Palavra) :- real(Palavra,_).
reservada(Palavra) :- function(Palavra,_).
reservada(Palavra) :- procedure(Palavra,_).
reservada(Palavra) :- var(Palavra,_).
reservada(Palavra) :- program(Palavra,_).

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
id(Palavra,Cauda,Erro,Erro) :- letra(Palavra,Cauda0), id_cont(Cauda0,Cauda), selecionada(Palavra,Cauda,[],Selecionada), !, neg(reservada(Selecionada)).
id(Palavra,Cauda,Erro,FinalErro) :- letra(Palavra,Cauda0), id_cont(Cauda0,Cauda), setError('<id> não pode ser uma palavra reservada',Cauda,NovoErro), append([NovoErro],Erro,FinalErro).

tipo_var(Palavra,Cauda) :- integerr(Palavra,Cauda).
tipo_var(Palavra,Cauda) :- real(Palavra,Cauda).
tipo_var(Palavra,Cauda) :- abreColchete(Palavra,Cauda0), integerr(Cauda0,Cauda1), fechaColchete(Cauda1,Cauda).
tipo_var(Palavra,Cauda) :- abreColchete(Palavra,Cauda0), real(Cauda0,Cauda1), fechaColchete(Cauda1,Cauda).

mais_var_read(Palavra,Cauda,Erro,FinalErro) :- virgula(Palavra,Cauda0), var_read(Cauda0,Cauda,Erro,FinalErro).
mais_var_read(Palavra,Palavra,Erro,Erro).
var_read(Palavra,Cauda,Erro,FinalErro) :- id(Palavra,Cauda0,Erro,FinalErro0), mais_var_read(Cauda0,Cauda,FinalErro0,FinalErro).

mais_var_write(Palavra,Cauda,Erro,FinalErro) :- virgula(Palavra,Cauda0), var_write(Cauda0,Cauda,Erro,FinalErro).
mais_var_write(Palavra,Palavra,Erro,Erro).
var_write(Palavra,Cauda,Erro,FinalErro) :- id(Palavra,Cauda0,Erro,FinalErro0), mais_var_write(Cauda0,Cauda,FinalErro0,FinalErro).

mais_var(Palavra,Cauda,Erro,FinalErro) :- virgula(Palavra,Cauda0), variaveis(Cauda0,Cauda,Erro,FinalErro), !.
mais_var(Palavra,Palavra,Erro,Erro).
variaveis(Palavra,Cauda,Erro,FinalErro) :- id(Palavra,Cauda0,Erro,FinalErro0), selecionada(Palavra,Cauda0,[],Selecionada), setVariavel(Selecionada), mais_var(Cauda0,Cauda,FinalErro0,FinalErro), !.
variaveis(Palavra,Cauda,Erro,FinalErro) :- id(Palavra,Cauda,Erro,FinalErro0), setError('<virgula> esperado após <id> em <variaveis>',Cauda,NovoErro), append([NovoErro],FinalErro0,FinalErro).

cont_dc(Palavra,Cauda,Erro,FinalErro) :- dvar(Palavra,Cauda0,Erro,FinalErro0), mais_dc(Cauda0,Cauda,FinalErro0,FinalErro), !.
cont_dc(Palavra,Palavra,Erro,Erro).
mais_dc(Palavra,Cauda,Erro,FinalErro) :- pontoEVirgula(Palavra,Cauda0), cont_dc(Cauda0,Cauda,Erro,FinalErro).

dvar(Palavra,Cauda,Erro,FinalErro) :- variaveis(Palavra,Cauda0,Erro,FinalErro), doisPontos(Cauda0,Cauda1), tipo_var(Cauda1,Cauda), !.
dvar(Palavra,Cauda,Erro,FinalErro) :- variaveis(Palavra,Cauda0,Erro,FinalErro0), doisPontos(Cauda0,Cauda), setError('<tipo_var> esperado após <dois_pontos> em <dvar>',Cauda,NovoErro), append([NovoErro],FinalErro0,FinalErro), !.
dvar(Palavra,Cauda,Erro,FinalErro) :- variaveis(Palavra,Cauda,Erro,FinalErro0), setError('<dois_pontos> esperado após <variaveis> em <dvar>',Cauda,NovoErro), append([NovoErro],FinalErro0,FinalErro), !.

cont_lista_id(Palavra,Cauda,Erro,FinalErro) :- virgula(Palavra,Cauda0), lista_id(Cauda0,Cauda,Erro,FinalErro), !.
cont_lista_id(Palavra,Palavra,Erro,Erro).
lista_id(Palavra,Cauda,Erro,FinalErro) :- id(Palavra,Cauda0,Erro,FinalErro0), selecionada(Palavra,Cauda0,[],Selecionada), setVariavel(Selecionada), cont_lista_id(Cauda0,Cauda,FinalErro0,FinalErro), !.
lista_id(Palavra,Cauda,Erro,FinalErro) :- id(Palavra,Cauda,Erro,FinalErro0), setError('<virgula> esperado após <id> em <lista_id>',Cauda,NovoErro), append([NovoErro],FinalErro0,FinalErro), !.

cont_lista_par(Palavra,Cauda,Erro,FinalErro) :- virgula(Palavra,Cauda0), lista_parametros(Cauda0,Cauda,Erro,FinalErro).
cont_lista_par(Palavra,Palavra,Erro,Erro).
lista_parametros(Palavra,Cauda,Erro,FinalErro) :- lista_id(Palavra,Cauda0,Erro,FinalErro0), doisPontos(Cauda0,Cauda1), tipo_var(Cauda1,Cauda2), cont_lista_par(Cauda2,Cauda,FinalErro0,FinalErro), !.
lista_parametros(Palavra,Cauda,Erro,FinalErro) :- lista_id(Palavra,Cauda0,Erro,FinalErro0), doisPontos(Cauda0,Cauda1), tipo_var(Cauda1,Cauda), setError('<cont_lista_par> esperado após <tipo_var> em <lista_parametros>',Cauda,NovoErro), append([NovoErro],FinalErro0,FinalErro), !.
lista_parametros(Palavra,Cauda,Erro,FinalErro) :- lista_id(Palavra,Cauda0,Erro,FinalErro0), doisPontos(Cauda0,Cauda), setError('<tipo_var> esperado após <dois_pontos> em <lista_parametros>',Cauda,NovoErro), append([NovoErro],FinalErro0,FinalErro), !.
lista_parametros(Palavra,Cauda,Erro,FinalErro) :- lista_id(Palavra,Cauda,Erro,FinalErro0), setError('<dois_pontos> esperado após <lista_id> em <lista_parametros>',Cauda,NovoErro), append([NovoErro],FinalErro0,FinalErro), !.

parametros(Palavra,Cauda,Erro,FinalErro) :- abreParentese(Palavra,Cauda0), lista_parametros(Cauda0,Cauda1,Erro,FinalErro), fechaParentese(Cauda1,Cauda), !.
parametros(Palavra,Cauda,Erro,FinalErro) :- abreParentese(Palavra,Cauda0), lista_parametros(Cauda0,Cauda,Erro,FinalErro), setError('<fechaParentese> esperado após <lista_parametros> em <parametros>',Cauda,NovoErro), append([NovoErro],FinalErro,FinalErro), !.
parametros(Palavra,Cauda,Erro,FinalErro) :- abreParentese(Palavra,Cauda), setError('<lista_parametros> esperado após <abreParentese> em <parametros>',Cauda,NovoErro), append([NovoErro],Erro,FinalErro), !.
parametros(Palavra,Palavra,Erro,Erro).

declara(Palavra,Cauda,Erro,FinalErro) :- var(Palavra,Cauda0), dvar(Cauda0,Cauda1,Erro,FinalErro0), mais_dc(Cauda1,Cauda,FinalErro0,FinalErro), !.
declara(Palavra,Cauda,Erro,FinalErro) :- var(Palavra,Cauda0), dvar(Cauda0,Cauda,Erro,FinalErro0), setError('<ponto-e-virgula> esperado após <dvar> em <declara>.',Cauda,NovoErro), append([NovoErro],FinalErro0,FinalErro), !.
declara(Palavra,Cauda,Erro,FinalErro) :- var(Palavra,Cauda), setError('<dvar> esperado após <var> em <declara>.',Cauda,NovoErro), append([NovoErro],Erro,FinalErro), !.
declara(Palavra,Palavra,Erro,Erro).

% Gramática de argumentos
cont_lista_arg(Palavra,Cauda,Erro,FinalErro) :- virgula(Palavra,Cauda0), lista_arg(Cauda0,Cauda,Erro,FinalErro).
cont_lista_arg(Palavra,Palavra,Erro,Erro).
lista_arg(Palavra,Cauda,Erro,FinalErro) :- expressao(Palavra,Cauda0,Erro,FinalErro0), cont_lista_arg(Cauda0,Cauda,FinalErro0,FinalErro).
argumentos(Palavra,Cauda,Erro,FinalErro) :- abreParentese(Palavra,Cauda0), lista_arg(Cauda0,Cauda1,Erro,FinalErro), fechaParentese(Cauda1,Cauda), !.
argumentos(Palavra,Cauda,Erro,FinalErro) :- abreParentese(Palavra,Cauda0), lista_arg(Cauda0,Cauda,Erro,FinalErro0), setError('<fecha-parentese> esperado após <lista-arg> em <argumentos>.',Cauda,NovoErro), append([NovoErro],FinalErro0,FinalErro), !.
argumentos(Palavra,Cauda,Erro,FinalErro) :- abreParentese(Palavra,Cauda), setError('<lista-arg> esperado após <abre-parentese> em <argumentos>.',Cauda,NovoErro), append([NovoErro],Erro,FinalErro), !.
argumentos(Palavra,Palavra,Erro,Erro).

% Gramática de termos e expressões
operando(Palavra,Cauda,Erro,Erro) :- integer_num(Palavra,Cauda).
operando(Palavra,Cauda,Erro,Erro) :- real_num(Palavra,Cauda).
operando(Palavra,Cauda,Erro,FinalErro) :- operador(Palavra,Cauda0), abreParentese(Cauda0,Cauda1), operando(Cauda1,Cauda2,Erro,FinalErro0), virgula(Cauda2,Cauda3), operando(Cauda3,Cauda4,FinalErro0,FinalErro), fechaParentese(Cauda4,Cauda).
operando(Palavra,Cauda,Erro,FinalErro) :- id(Palavra,Cauda,Erro,FinalErro), selecionada(Palavra,Cauda,[],Selecionada), isVariavel(Selecionada).
operando(Palavra,Cauda,Erro,FinalErro) :- id(Palavra,Cauda,Erro,FinalErro0), setError('<id> não é uma variável declarada em <operando>',Cauda,NovoErro), append([NovoErro],FinalErro0,FinalErro).

termo(Palavra,Cauda,Erro,FinalErro) :- operador(Palavra,Cauda0), abreParentese(Cauda0,Cauda1), operando(Cauda1,Cauda2,Erro,FinalErro0), virgula(Cauda2,Cauda3), operando(Cauda3,Cauda4,FinalErro0,FinalErro), fechaParentese(Cauda4,Cauda), !.
termo(Palavra,Cauda,Erro,FinalErro) :- operador(Palavra,Cauda0), abreParentese(Cauda0,Cauda1), operando(Cauda1,Cauda2,Erro,FinalErro0), virgula(Cauda2,Cauda3), operando(Cauda3,Cauda,FinalErro0,FinalErro1), setError('<fecha-parentese> esperado após <operando> em <termo>.',Cauda,NovoErro), append([NovoErro],FinalErro1,FinalErro), !.
termo(Palavra,Cauda,Erro,FinalErro) :- operador(Palavra,Cauda0), abreParentese(Cauda0,Cauda1), operando(Cauda1,Cauda2,Erro,FinalErro0), virgula(Cauda2,Cauda), setError('<operando> esperado após <virgula> em <termo>.',Cauda,NovoErro), append([NovoErro],FinalErro0,FinalErro), !.
termo(Palavra,Cauda,Erro,FinalErro) :- operador(Palavra,Cauda0), abreParentese(Cauda0,Cauda1), operando(Cauda1,Cauda,Erro,FinalErro0), setError('<virgula> esperado após <operando> em <termo>.',Cauda,NovoErro), append([NovoErro],FinalErro0,FinalErro), !.
termo(Palavra,Cauda,Erro,FinalErro) :- operador(Palavra,Cauda0), abreParentese(Cauda0,Cauda), setError('<operando> esperado após <abre-parentese> em <termo>.',Cauda,NovoErro), append([NovoErro],Erro,FinalErro), !.
termo(Palavra,Cauda,Erro,FinalErro) :- operador(Palavra,Cauda), setError('<abre-parentese> esperado após <operador> em <termo>.',Cauda,NovoErro), append([NovoErro],Erro,FinalErro), !.
termo(Palavra,Cauda,Erro,FinalErro) :- id(Palavra,Cauda,Erro,FinalErro).
termo(Palavra,Cauda,Erro,Erro) :- integer_num(Palavra,Cauda).
termo(Palavra,Cauda,Erro,Erro) :- real_num(Palavra,Cauda).

conteudo(Palavra,Cauda) :- abreColchete(Palavra,Cauda0), fechaColchete(Cauda0,Cauda).
conteudo(Palavra,Cauda) :- abreColchete(Palavra,Cauda0), integer_num(Cauda0,Cauda1), integer_num_cont(Cauda1,Cauda2), fechaColchete(Cauda2,Cauda).
conteudo(Palavra,Cauda) :- abreColchete(Palavra,Cauda0), real_num(Cauda0,Cauda1), real_num_cont(Cauda1,Cauda2), fechaColchete(Cauda2,Cauda).

expressao_lista(Palavra,Cauda,Erro,Erro) :- operadorL(Palavra,Cauda0), abreParentese(Cauda0,Cauda1), conteudo(Cauda1,Cauda2), fechaParentese(Cauda2,Cauda), !.
expressao_lista(Palavra,Cauda,Erro,FinalErro) :- operadorL(Palavra,Cauda0), abreParentese(Cauda0,Cauda1), conteudo(Cauda1,Cauda), setError('<fecha-parentese> esperado após <conteudo> em <expressao-lista>.',Cauda,NovoErro), append([NovoErro],Erro,FinalErro), !.
expressao_lista(Palavra,Cauda,Erro,FinalErro) :- operadorL(Palavra,Cauda0), abreParentese(Cauda0,Cauda), setError('<conteudo> esperado após <abre-parentese> em <expressao-lista>.',Cauda,NovoErro), append([NovoErro],Erro,FinalErro), !.
expressao_lista(Palavra,Cauda,Erro,FinalErro) :- operadorL(Palavra,Cauda), setError('<abre-parentese> esperado após <operador-l> em <expressao-lista>.',Cauda,NovoErro), append([NovoErro],Erro,FinalErro).
expressao_lista(Palavra,Cauda,Erro,Erro) :- concatena(Palavra,Cauda0), abreParentese(Cauda0,Cauda1), conteudo(Cauda1,Cauda2), fechaParentese(Cauda2,Cauda), !.
expressao_lista(Palavra,Cauda,Erro,FinalErro) :- concatena(Palavra,Cauda0), abreParentese(Cauda0,Cauda1), conteudo(Cauda1,Cauda), setError('<fecha-parentese> esperado após <conteudo> em <expressao-lista>.',Cauda,NovoErro), append([NovoErro],Erro,FinalErro), !.
expressao_lista(Palavra,Cauda,Erro,FinalErro) :- concatena(Palavra,Cauda0), abreParentese(Cauda0,Cauda), setError('<conteudo> esperado após <abre-parentese> em <expressao-lista>.',Cauda,NovoErro), append([NovoErro],Erro,FinalErro), !.
expressao_lista(Palavra,Cauda,Erro,FinalErro) :- concatena(Palavra,Cauda), setError('<abre-parentese> esperado após <concatena> em <expressao-lista>.',Cauda,NovoErro), append([NovoErro],Erro,FinalErro).
expressao_num(Palavra,Cauda,Erro,FinalErro) :- id(Palavra,Cauda0,Erro,FinalErro0), argumentos(Cauda0,Cauda,FinalErro0,FinalErro), !.
expressao_num(Palavra,Cauda,Erro,FinalErro) :- id(Palavra,Cauda,Erro,FinalErro0), setError('<argumentos> esperado após <id> em <expressao-num>.',Cauda,NovoErro), append([NovoErro],FinalErro0,FinalErro), !.
expressao_num(Palavra,Cauda,Erro,FinalErro) :- termo(Palavra,Cauda,Erro,FinalErro).
expressao(Palavra,Cauda,Erro,FinalErro) :- expressao_lista(Palavra,Cauda,Erro,FinalErro).
expressao(Palavra,Cauda,Erro,FinalErro) :- expressao_num(Palavra,Cauda,Erro,FinalErro).

% Gramática de funções e sentenças
cont_sentencas(Palavra,Cauda,Erro,FinalErro) :- sentencas(Palavra,Cauda,Erro,FinalErro).
cont_sentencas(Palavra,Palavra,Erro,Erro).
mais_sentencas(Palavra,Cauda,Erro,FinalErro) :- pontoEVirgula(Palavra,Cauda0), cont_sentencas(Cauda0,Cauda,Erro,FinalErro).
sentencas(Palavra,Cauda,Erro,FinalErro) :- comando(Palavra,Cauda0,Erro,FinalErro0), mais_sentencas(Cauda0,Cauda,FinalErro0,FinalErro).
sentencas(Palavra,Cauda,Erro,FinalErro) :- comando(Palavra,Cauda,Erro,FinalErro0), setError('<ponto-e-virgula> esperado após <comando> em <sentencas>.',Cauda,NovoErro), append([NovoErro],FinalErro0,FinalErro), !.

tipo_funcao(Palavra,Cauda) :- integerr(Palavra,Cauda).
tipo_funcao(Palavra,Cauda) :- real(Palavra,Cauda).
tipo_funcao(Palavra,Cauda) :- abreColchete(Palavra,Cauda0), integerr(Cauda0,Cauda1), fechaColchete(Cauda1,Cauda).
tipo_funcao(Palavra,Cauda) :- abreColchete(Palavra,Cauda0), real(Cauda0,Cauda1), fechaColchete(Cauda1,Cauda).

funcao(Palavra,Cauda,Erro,FinalErro) :- function(Palavra,Cauda0), id(Cauda0,Cauda1,Erro,FinalErro0), parametros(Cauda1,Cauda2,FinalErro0,FinalErro1), doisPontos(Cauda2,Cauda3), tipo_funcao(Cauda3,Cauda4), pontoEVirgula(Cauda4,Cauda5), corpo(Cauda5,Cauda6,FinalErro1,FinalErro2), pontoEVirgula(Cauda6,Cauda7), rotina(Cauda7,Cauda,FinalErro2,FinalErro), !.
funcao(Palavra,Cauda,Erro,FinalErro) :- function(Palavra,Cauda0), id(Cauda0,Cauda1,Erro,FinalErro0), parametros(Cauda1,Cauda2,FinalErro0,FinalErro1), doisPontos(Cauda2,Cauda3), tipo_funcao(Cauda3,Cauda4), pontoEVirgula(Cauda4,Cauda5), corpo(Cauda5,Cauda6,FinalErro1,FinalErro2), pontoEVirgula(Cauda6,Cauda), setError('<rotina> esperado após <ponto-e-virgula> em <funcao>.',Cauda,NovoErro), append([NovoErro],FinalErro2,FinalErro), !.
funcao(Palavra,Cauda,Erro,FinalErro) :- function(Palavra,Cauda0), id(Cauda0,Cauda1,Erro,FinalErro0), parametros(Cauda1,Cauda2,FinalErro0,FinalErro1), doisPontos(Cauda2,Cauda3), tipo_funcao(Cauda3,Cauda4), pontoEVirgula(Cauda4,Cauda5), corpo(Cauda5,Cauda,FinalErro1,FinalErro2), setError('<ponto-e-virgula> esperado após <corpo> em <funcao>.',Cauda,NovoErro), append([NovoErro],FinalErro2,FinalErro), !.
funcao(Palavra,Cauda,Erro,FinalErro) :- function(Palavra,Cauda0), id(Cauda0,Cauda1,Erro,FinalErro0), parametros(Cauda1,Cauda2,FinalErro0,FinalErro1), doisPontos(Cauda2,Cauda3), tipo_funcao(Cauda3,Cauda4), pontoEVirgula(Cauda4,Cauda), setError('<corpo> esperado após <ponto-e-virgula> em <funcao>.',Cauda,NovoErro), append([NovoErro],FinalErro1,FinalErro), !.
funcao(Palavra,Cauda,Erro,FinalErro) :- function(Palavra,Cauda0), id(Cauda0,Cauda1,Erro,FinalErro0), parametros(Cauda1,Cauda2,FinalErro0,FinalErro1), doisPontos(Cauda2,Cauda3), tipo_funcao(Cauda3,Cauda), setError('<ponto-e-virgula> esperado após <tipo-funcao> em <funcao>.',Cauda,NovoErro), append([NovoErro],FinalErro1,FinalErro), !.
funcao(Palavra,Cauda,Erro,FinalErro) :- function(Palavra,Cauda0), id(Cauda0,Cauda1,Erro,FinalErro0), parametros(Cauda1,Cauda2,FinalErro0,FinalErro1), doisPontos(Cauda2,Cauda), setError('<tipo-funcao> esperado após <dois-pontos> em <funcao>.',Cauda,NovoErro), append([NovoErro],FinalErro1,FinalErro), !.
funcao(Palavra,Cauda,Erro,FinalErro) :- function(Palavra,Cauda0), id(Cauda0,Cauda1,Erro,FinalErro0), parametros(Cauda1,Cauda,FinalErro0,FinalErro1), setError('<dois-pontos> esperado após <parametros> em <funcao>.',Cauda,NovoErro), append([NovoErro],FinalErro1,FinalErro), !.
funcao(Palavra,Cauda,Erro,FinalErro) :- function(Palavra,Cauda0), id(Cauda0,Cauda,Erro,FinalErro0), setError('<parametros> esperado após <id> em <funcao>.',Cauda,NovoErro), append([NovoErro],FinalErro0,FinalErro), !.
funcao(Palavra,Cauda,Erro,FinalErro) :- function(Palavra,Cauda), setError('<id> esperado após <function> em <funcao>.',Cauda,NovoErro), append([NovoErro],Erro,FinalErro).

procedimento(Palavra,Cauda,Erro,FinalErro) :- procedure(Palavra,Cauda0), id(Cauda0,Cauda1,Erro,FinalErro0), parametros(Cauda1,Cauda2,FinalErro0,FinalErro1), pontoEVirgula(Cauda2,Cauda3), corpo(Cauda3,Cauda4,FinalErro1,FinalErro2), pontoEVirgula(Cauda4,Cauda5), rotina(Cauda5,Cauda,FinalErro2,FinalErro), !.
procedimento(Palavra,Cauda,Erro,FinalErro) :- procedure(Palavra,Cauda0), id(Cauda0,Cauda1,Erro,FinalErro0), parametros(Cauda1,Cauda2,FinalErro0,FinalErro1), pontoEVirgula(Cauda2,Cauda3), corpo(Cauda3,Cauda4,FinalErro1,FinalErro2), pontoEVirgula(Cauda4,Cauda), setError('<rotina> esperado após <ponto-e-virgula> em <procedimento>.',Cauda,NovoErro), append([NovoErro],FinalErro2,FinalErro), !.
procedimento(Palavra,Cauda,Erro,FinalErro) :- procedure(Palavra,Cauda0), id(Cauda0,Cauda1,Erro,FinalErro0), parametros(Cauda1,Cauda2,FinalErro0,FinalErro1), pontoEVirgula(Cauda2,Cauda3), corpo(Cauda3,Cauda,FinalErro1,FinalErro2), setError('<ponto-e-virgula> esperado após <corpo> em <procedimento>.',Cauda,NovoErro), append([NovoErro],FinalErro2,FinalErro), !.
procedimento(Palavra,Cauda,Erro,FinalErro) :- procedure(Palavra,Cauda0), id(Cauda0,Cauda1,Erro,FinalErro0), parametros(Cauda1,Cauda2,FinalErro0,FinalErro1), pontoEVirgula(Cauda2,Cauda), setError('<corpo> esperado após <ponto-e-virgula> em <procedimento>.',Cauda,NovoErro), append([NovoErro],FinalErro1,FinalErro), !.
procedimento(Palavra,Cauda,Erro,FinalErro) :- procedure(Palavra,Cauda0), id(Cauda0,Cauda1,Erro,FinalErro0), parametros(Cauda1,Cauda,FinalErro0,FinalErro1), setError('<ponto-e-virgula> esperado após <parametros> em <procedimento>.',Cauda,NovoErro), append([NovoErro],FinalErro1,FinalErro), !.
procedimento(Palavra,Cauda,Erro,FinalErro) :- procedure(Palavra,Cauda0), id(Cauda0,Cauda,Erro,FinalErro0), setError('<parametros> esperado após <id> em <procedimento>.',Cauda,NovoErro), append([NovoErro],FinalErro0,FinalErro), !.
procedimento(Palavra,Cauda,Erro,FinalErro) :- procedure(Palavra,Cauda), setError('<id> esperado após <procedure> em <procedimento>.',Cauda,NovoErro), append([NovoErro],Erro,FinalErro).

rotina(Palavra,Cauda,Erro,FinalErro) :- funcao(Palavra,Cauda,Erro,FinalErro).
rotina(Palavra,Cauda,Erro,FinalErro) :- procedimento(Palavra,Cauda,Erro,FinalErro).
rotina(Palavra,Palavra,Erro,Erro).

% Gramática de condições e comandos
condicao(Palavra,Cauda,Erro,FinalErro) :- relacao(Palavra,Cauda0), abreParentese(Cauda0,Cauda1), expressao_num(Cauda1,Cauda2,Erro,FinalErro0), virgula(Cauda2,Cauda3), expressao_num(Cauda3,Cauda4,FinalErro0,FinalErro), fechaParentese(Cauda4,Cauda), !.
condicao(Palavra,Cauda,Erro,FinalErro) :- relacao(Palavra,Cauda0), abreParentese(Cauda0,Cauda1), expressao_lista(Cauda1,Cauda2,Erro,FinalErro0), virgula(Cauda2,Cauda3), expressao_lista(Cauda3,Cauda4,FinalErro0,FinalErro), fechaParentese(Cauda4,Cauda), !.
condicao(Palavra,Cauda,Erro,FinalErro) :- relacao(Palavra,Cauda0), abreParentese(Cauda0,Cauda1), expressao_num(Cauda1,Cauda2,Erro,FinalErro0), virgula(Cauda2,Cauda3), expressao_num(Cauda3,Cauda,FinalErro0,FinalErro1), setError('<fecha-parentese> esperado após <expressao-num> em <condicao>.',Cauda,NovoErro), append([NovoErro],FinalErro1,FinalErro), !.
condicao(Palavra,Cauda,Erro,FinalErro) :- relacao(Palavra,Cauda0), abreParentese(Cauda0,Cauda1), expressao_lista(Cauda1,Cauda2,Erro,FinalErro0), virgula(Cauda2,Cauda3), expressao_lista(Cauda3,Cauda,FinalErro0,FinalErro1), setError('<fecha-parentese> esperado após <expressao-lista> em <condicao>.',Cauda,NovoErro), append([NovoErro],FinalErro1,FinalErro), !.
condicao(Palavra,Cauda,Erro,FinalErro) :- relacao(Palavra,Cauda0), abreParentese(Cauda0,Cauda1), expressao_num(Cauda1,Cauda2,Erro,FinalErro0), virgula(Cauda2,Cauda), setError('<expressao-num> esperado após <virgula> em <condicao>.',Cauda,NovoErro), append([NovoErro],FinalErro0,FinalErro), !.
condicao(Palavra,Cauda,Erro,FinalErro) :- relacao(Palavra,Cauda0), abreParentese(Cauda0,Cauda1), expressao_lista(Cauda1,Cauda2,Erro,FinalErro0), virgula(Cauda2,Cauda), setError('<expressao-lista> esperado após <virgula> em <condicao>.',Cauda,NovoErro), append([NovoErro],FinalErro0,FinalErro), !.
condicao(Palavra,Cauda,Erro,FinalErro) :- relacao(Palavra,Cauda0), abreParentese(Cauda0,Cauda1), expressao_num(Cauda1,Cauda,Erro,FinalErro0), setError('<virgula> esperado após <expressao-num> em <condicao>.',Cauda,NovoErro), append([NovoErro],FinalErro0,FinalErro), !.
condicao(Palavra,Cauda,Erro,FinalErro) :- relacao(Palavra,Cauda0), abreParentese(Cauda0,Cauda1), expressao_lista(Cauda1,Cauda,Erro,FinalErro0), setError('<virgula> esperado após <expressao-lista> em <condicao>.',Cauda,NovoErro), append([NovoErro],FinalErro0,FinalErro), !.
condicao(Palavra,Cauda,Erro,FinalErro) :- relacao(Palavra,Cauda0), abreParentese(Cauda0,Cauda), setError('<expressao-num> ou <expressao-lista> esperado após <abre-parentese> em <condicao>.',Cauda,NovoErro), append([NovoErro],Erro,FinalErro), !.
condicao(Palavra,Cauda,Erro,FinalErro) :- relacao(Palavra,Cauda), setError('<abre-parentese> esperado após <relacao> em <condicao>.',Cauda,NovoErro), append([NovoErro],Erro,FinalErro).

pfalsa(Palavra,Cauda,Erro,FinalErro) :- else(Palavra,Cauda0), begin(Cauda0,Cauda1), sentencas(Cauda1,Cauda2,Erro,FinalErro), end(Cauda2,Cauda), !.
pfalsa(Palavra,Cauda,Erro,FinalErro) :- else(Palavra,Cauda0), begin(Cauda0,Cauda1), sentencas(Cauda1,Cauda,Erro,FinalErro0), setError('<end> esperado após <sentencas> em <pfalsa>.',Cauda,NovoErro), append([NovoErro],FinalErro0,FinalErro), !.
pfalsa(Palavra,Cauda,Erro,FinalErro) :- else(Palavra,Cauda0), begin(Cauda0,Cauda), setError('<sentencas> esperado após <begin> em <pfalsa>.',Cauda,NovoErro), append([NovoErro],Erro,FinalErro), !.
pfalsa(Palavra,Cauda,Erro,FinalErro) :- else(Palavra,Cauda), setError('<begin> esperado após <else> em <pfalsa>.',Cauda,NovoErro), append([NovoErro],Erro,FinalErro), !.
pfalsa(Palavra,Palavra,Erro,Erro).

chamadaProcedimento(Palavra,Cauda,Erro,FinalErro) :- id(Palavra,Cauda0,Erro,FinalErro0), argumentos(Cauda0,Cauda,FinalErro0,FinalErro), !.
chamadaProcedimento(Palavra,Cauda,Erro,FinalErro) :- id(Palavra,Cauda,Erro,FinalErro0), setError('<argumentos> esperado após <id> em <chamada-procedimento>.',Cauda,NovoErro), append([NovoErro],FinalErro0,FinalErro).
comando(Palavra,Cauda,Erro,FinalErro) :- readd(Palavra,Cauda0), abreParentese(Cauda0,Cauda1), var_read(Cauda1,Cauda2,Erro,FinalErro), fechaParentese(Cauda2,Cauda), !.
comando(Palavra,Cauda,Erro,FinalErro) :- readd(Palavra,Cauda0), abreParentese(Cauda0,Cauda1), var_read(Cauda1,Cauda,Erro,FinalErro0), setError('<fecha-parentese> esperado após <var-read> em <comando>.',Cauda,NovoErro), append([NovoErro],FinalErro0,FinalErro), !.
comando(Palavra,Cauda,Erro,FinalErro) :- readd(Palavra,Cauda0), abreParentese(Cauda0,Cauda), setError('<var-read> esperado após <abre-parentese> em <comando>.',Cauda,NovoErro), append([NovoErro],Erro,FinalErro), !.
comando(Palavra,Cauda,Erro,FinalErro) :- readd(Palavra,Cauda), setError('<abre-parentese> esperado após <readd> em <comando>.',Cauda,NovoErro), append([NovoErro],Erro,FinalErro), !.
comando(Palavra,Cauda,Erro,FinalErro) :- writee(Palavra,Cauda0), abreParentese(Cauda0,Cauda1), var_write(Cauda1,Cauda2,Erro,FinalErro), fechaParentese(Cauda2,Cauda), !.
comando(Palavra,Cauda,Erro,FinalErro) :- writee(Palavra,Cauda0), abreParentese(Cauda0,Cauda1), var_write(Cauda1,Cauda,Erro,FinalErro0), setError('<fecha-parentese> esperado após <var-write> em <comando>.',Cauda,NovoErro), append([NovoErro],FinalErro0,FinalErro), !.
comando(Palavra,Cauda,Erro,FinalErro) :- writee(Palavra,Cauda0), abreParentese(Cauda0,Cauda), setError('<var-write> esperado após <abre-parentese> em <comando>.',Cauda,NovoErro), append([NovoErro],Erro,FinalErro), !.
comando(Palavra,Cauda,Erro,FinalErro) :- writee(Palavra,Cauda), setError('<abre-parentese> esperado após <writee> em <comando>.',Cauda,NovoErro), append([NovoErro],Erro,FinalErro), !.
comando(Palavra,Cauda,Erro,FinalErro) :- forr(Palavra,Cauda0), id(Cauda0,Cauda1,Erro,FinalErro0), doisPontosIgual(Cauda1,Cauda2), expressao(Cauda2,Cauda3,FinalErro0,FinalErro1), to(Cauda3,Cauda4), expressao(Cauda4,Cauda5,FinalErro1,FinalErro2), doo(Cauda5,Cauda6), begin(Cauda6,Cauda7), sentencas(Cauda7,Cauda8,FinalErro2,FinalErro), end(Cauda8,Cauda), !.
comando(Palavra,Cauda,Erro,FinalErro) :- forr(Palavra,Cauda0), id(Cauda0,Cauda1,Erro,FinalErro0), doisPontosIgual(Cauda1,Cauda2), expressao(Cauda2,Cauda3,FinalErro0,FinalErro1), to(Cauda3,Cauda4), expressao(Cauda4,Cauda5,FinalErro1,FinalErro2), doo(Cauda5,Cauda6), begin(Cauda6,Cauda7), sentencas(Cauda7,Cauda,FinalErro2,FinalErro3), setError('<end> esperado após <sentencas> em <comando>.',Cauda,NovoErro), append([NovoErro],FinalErro3,FinalErro), !.
comando(Palavra,Cauda,Erro,FinalErro) :- forr(Palavra,Cauda0), id(Cauda0,Cauda1,Erro,FinalErro0), doisPontosIgual(Cauda1,Cauda2), expressao(Cauda2,Cauda3,FinalErro0,FinalErro1), to(Cauda3,Cauda4), expressao(Cauda4,Cauda5,FinalErro1,FinalErro2), doo(Cauda5,Cauda6), begin(Cauda6,Cauda), setError('<sentencas> esperado após <begin> em <comando>.',Cauda,NovoErro), append([NovoErro],FinalErro2,FinalErro), !.
comando(Palavra,Cauda,Erro,FinalErro) :- forr(Palavra,Cauda0), id(Cauda0,Cauda1,Erro,FinalErro0), doisPontosIgual(Cauda1,Cauda2), expressao(Cauda2,Cauda3,FinalErro0,FinalErro1), to(Cauda3,Cauda4), expressao(Cauda4,Cauda5,FinalErro1,FinalErro2), doo(Cauda5,Cauda), setError('<begin> esperado após <doo> em <comando>.',Cauda,NovoErro), append([NovoErro],FinalErro2,FinalErro), !.
comando(Palavra,Cauda,Erro,FinalErro) :- forr(Palavra,Cauda0), id(Cauda0,Cauda1,Erro,FinalErro0), doisPontosIgual(Cauda1,Cauda2), expressao(Cauda2,Cauda3,FinalErro0,FinalErro1), to(Cauda3,Cauda4), expressao(Cauda4,Cauda,FinalErro1,FinalErro2), setError('<doo> esperado após <expressao> em <comando>.',Cauda,NovoErro), append([NovoErro],FinalErro2,FinalErro), !.
comando(Palavra,Cauda,Erro,FinalErro) :- forr(Palavra,Cauda0), id(Cauda0,Cauda1,Erro,FinalErro0), doisPontosIgual(Cauda1,Cauda2), expressao(Cauda2,Cauda3,FinalErro0,FinalErro1), to(Cauda3,Cauda), setError('<expressao> esperado após <to> em <comando>.',Cauda,NovoErro), append([NovoErro],FinalErro1,FinalErro), !.
comando(Palavra,Cauda,Erro,FinalErro) :- forr(Palavra,Cauda0), id(Cauda0,Cauda1,Erro,FinalErro0), doisPontosIgual(Cauda1,Cauda2), expressao(Cauda2,Cauda,FinalErro0,FinalErro1), setError('<to> esperado após <expressao> em <comando>.',Cauda,NovoErro), append([NovoErro],FinalErro1,FinalErro), !.
comando(Palavra,Cauda,Erro,FinalErro) :- forr(Palavra,Cauda0), id(Cauda0,Cauda1,Erro,FinalErro0), doisPontosIgual(Cauda1,Cauda), setError('<expressao> esperado após <dois-pontos-igual> em <comando>.',Cauda,NovoErro), append([NovoErro],FinalErro0,FinalErro), !.
comando(Palavra,Cauda,Erro,FinalErro) :- forr(Palavra,Cauda0), id(Cauda0,Cauda,Erro,FinalErro0), setError('<dois-pontos-igual> esperado após <id> em <comando>.',Cauda,NovoErro), append([NovoErro],FinalErro0,FinalErro), !.
comando(Palavra,Cauda,Erro,FinalErro) :- forr(Palavra,Cauda), setError('<id> esperado após <forr> em <comando>.',Cauda,NovoErro), append([NovoErro],Erro,FinalErro), !.
comando(Palavra,Cauda,Erro,FinalErro) :- repeat(Palavra,Cauda0), sentencas(Cauda0,Cauda1,Erro,FinalErro0), until(Cauda1,Cauda2), abreParentese(Cauda2,Cauda3), condicao(Cauda3,Cauda4,FinalErro0,FinalErro), fechaParentese(Cauda4,Cauda), !.
comando(Palavra,Cauda,Erro,FinalErro) :- repeat(Palavra,Cauda0), sentencas(Cauda0,Cauda1,Erro,FinalErro0), until(Cauda1,Cauda2), abreParentese(Cauda2,Cauda3), condicao(Cauda3,Cauda,FinalErro0,FinalErro1), setError('<fecha-parentese> esperado após <condicao> em <comando>.',Cauda,NovoErro), append([NovoErro],FinalErro1,FinalErro), !.
comando(Palavra,Cauda,Erro,FinalErro) :- repeat(Palavra,Cauda0), sentencas(Cauda0,Cauda1,Erro,FinalErro0), until(Cauda1,Cauda2), abreParentese(Cauda2,Cauda), setError('<condicao> esperado após <abre-parentese> em <comando>.',Cauda,NovoErro), append([NovoErro],FinalErro0,FinalErro), !.
comando(Palavra,Cauda,Erro,FinalErro) :- repeat(Palavra,Cauda0), sentencas(Cauda0,Cauda1,Erro,FinalErro0), until(Cauda1,Cauda), setError('<abre-parentese> esperado após <until> em <comando>.',Cauda,NovoErro), append([NovoErro],FinalErro0,FinalErro), !.
comando(Palavra,Cauda,Erro,FinalErro) :- repeat(Palavra,Cauda0), sentencas(Cauda0,Cauda,Erro,FinalErro0), setError('<until> esperado após <sentencas> em <comando>.',Cauda,NovoErro), append([NovoErro],FinalErro0,FinalErro), !.
comando(Palavra,Cauda,Erro,FinalErro) :- repeat(Palavra,Cauda), setError('<sentencas> esperado após <repeat> em <comando>.',Cauda,NovoErro), append([NovoErro],Erro,FinalErro), !.
comando(Palavra,Cauda,Erro,FinalErro) :- while(Palavra,Cauda0), abreParentese(Cauda0,Cauda1), condicao(Cauda1,Cauda2,Erro,FinalErro0), fechaParentese(Cauda2,Cauda3), doo(Cauda3,Cauda4), begin(Cauda4,Cauda5), sentencas(Cauda5,Cauda6,FinalErro0,FinalErro), end(Cauda6,Cauda), !.
comando(Palavra,Cauda,Erro,FinalErro) :- while(Palavra,Cauda0), abreParentese(Cauda0,Cauda1), condicao(Cauda1,Cauda2,Erro,FinalErro0), fechaParentese(Cauda2,Cauda3), doo(Cauda3,Cauda4), begin(Cauda4,Cauda5), sentencas(Cauda5,Cauda,FinalErro0,FinalErro1), setError('<end> esperado após <sentencas> em <comando>.',Cauda,NovoErro), append([NovoErro],FinalErro1,FinalErro), !.
comando(Palavra,Cauda,Erro,FinalErro) :- while(Palavra,Cauda0), abreParentese(Cauda0,Cauda1), condicao(Cauda1,Cauda2,Erro,FinalErro0), fechaParentese(Cauda2,Cauda3), doo(Cauda3,Cauda4), begin(Cauda4,Cauda), setError('<sentencas> esperado após <begin> em <comando>.',Cauda,NovoErro), append([NovoErro],FinalErro0,FinalErro), !.
comando(Palavra,Cauda,Erro,FinalErro) :- while(Palavra,Cauda0), abreParentese(Cauda0,Cauda1), condicao(Cauda1,Cauda2,Erro,FinalErro0), fechaParentese(Cauda2,Cauda3), doo(Cauda3,Cauda), setError('<begin> esperado após <doo> em <comando>.',Cauda,NovoErro), append([NovoErro],FinalErro0,FinalErro), !.
comando(Palavra,Cauda,Erro,FinalErro) :- while(Palavra,Cauda0), abreParentese(Cauda0,Cauda1), condicao(Cauda1,Cauda2,Erro,FinalErro0), fechaParentese(Cauda2,Cauda), setError('<doo> esperado após <fecha-parentese> em <comando>.',Cauda,NovoErro), append([NovoErro],FinalErro0,FinalErro), !.
comando(Palavra,Cauda,Erro,FinalErro) :- while(Palavra,Cauda0), abreParentese(Cauda0,Cauda1), condicao(Cauda1,Cauda,Erro,FinalErro0), setError('<fecha-parentese> esperado após <condicao> em <comando>.',Cauda,NovoErro), append([NovoErro],FinalErro0,FinalErro), !.
comando(Palavra,Cauda,Erro,FinalErro) :- while(Palavra,Cauda0), abreParentese(Cauda0,Cauda), setError('<condicao> esperado após <abre-parentese> em <comando>.',Cauda,NovoErro), append([NovoErro],Erro,FinalErro), !.
comando(Palavra,Cauda,Erro,FinalErro) :- while(Palavra,Cauda), setError('<abre-parentese> esperado após <while> em <comando>.',Cauda,NovoErro), append([NovoErro],Erro,FinalErro), !.
comando(Palavra,Cauda,Erro,FinalErro) :- if(Palavra,Cauda0), abreParentese(Cauda0,Cauda1), condicao(Cauda1,Cauda2,Erro,FinalErro0), fechaParentese(Cauda2,Cauda3), then(Cauda3,Cauda4), begin(Cauda4,Cauda5), sentencas(Cauda5,Cauda6,FinalErro0,FinalErro1), end(Cauda6,Cauda7), pfalsa(Cauda7,Cauda,FinalErro1,FinalErro), !.
comando(Palavra,Cauda,Erro,FinalErro) :- if(Palavra,Cauda0), abreParentese(Cauda0,Cauda1), condicao(Cauda1,Cauda2,Erro,FinalErro0), fechaParentese(Cauda2,Cauda3), then(Cauda3,Cauda4), begin(Cauda4,Cauda5), sentencas(Cauda5,Cauda6,FinalErro0,FinalErro1), end(Cauda6,Cauda), setError('<pfalsa> esperado após <end> em <comando>.',Cauda,NovoErro), append([NovoErro],FinalErro1,FinalErro), !.
comando(Palavra,Cauda,Erro,FinalErro) :- if(Palavra,Cauda0), abreParentese(Cauda0,Cauda1), condicao(Cauda1,Cauda2,Erro,FinalErro0), fechaParentese(Cauda2,Cauda3), then(Cauda3,Cauda4), begin(Cauda4,Cauda5), sentencas(Cauda5,Cauda,FinalErro0,FinalErro1), setError('<end> esperado após <sentencas> em <comando>.',Cauda,NovoErro), append([NovoErro],FinalErro1,FinalErro), !.
comando(Palavra,Cauda,Erro,FinalErro) :- if(Palavra,Cauda0), abreParentese(Cauda0,Cauda1), condicao(Cauda1,Cauda2,Erro,FinalErro0), fechaParentese(Cauda2,Cauda3), then(Cauda3,Cauda4), begin(Cauda4,Cauda), setError('<sentencas> esperado após <begin> em <comando>.',Cauda,NovoErro), append([NovoErro],FinalErro0,FinalErro), !.
comando(Palavra,Cauda,Erro,FinalErro) :- if(Palavra,Cauda0), abreParentese(Cauda0,Cauda1), condicao(Cauda1,Cauda2,Erro,FinalErro0), fechaParentese(Cauda2,Cauda3), then(Cauda3,Cauda), setError('<begin> esperado após <then> em <comando>.',Cauda,NovoErro), append([NovoErro],FinalErro0,FinalErro), !.
comando(Palavra,Cauda,Erro,FinalErro) :- if(Palavra,Cauda0), abreParentese(Cauda0,Cauda1), condicao(Cauda1,Cauda2,Erro,FinalErro0), fechaParentese(Cauda2,Cauda), setError('<then> esperado após <fecha-parentese> em <comando>.',Cauda,NovoErro), append([NovoErro],FinalErro0,FinalErro), !.
comando(Palavra,Cauda,Erro,FinalErro) :- if(Palavra,Cauda0), abreParentese(Cauda0,Cauda1), condicao(Cauda1,Cauda,Erro,FinalErro0), setError('<fecha-parentese> esperado após <condicao> em <comando>.',Cauda,NovoErro), append([NovoErro],FinalErro0,FinalErro), !.
comando(Palavra,Cauda,Erro,FinalErro) :- if(Palavra,Cauda0), abreParentese(Cauda0,Cauda), setError('<condicao> esperado após <abre-parentese> em <comando>.',Cauda,NovoErro), append([NovoErro],Erro,FinalErro), !.
comando(Palavra,Cauda,Erro,FinalErro) :- if(Palavra,Cauda), setError('<abre-parentese> esperado após <if> em <comando>.',Cauda,NovoErro), append([NovoErro],Erro,FinalErro), !.
comando(Palavra,Cauda,Erro,FinalErro) :- id(Palavra,Cauda0,Erro,FinalErro0), selecionada(Palavra,Cauda0,[],Selecionada), isVariavel(Selecionada), doisPontosIgual(Cauda0,Cauda1), expressao(Cauda1,Cauda,FinalErro0,FinalErro), !.
comando(Palavra,Cauda,Erro,FinalErro) :- id(Palavra,Cauda0,Erro,FinalErro0), selecionada(Palavra,Cauda0,[],Selecionada), isVariavel(Selecionada), doisPontosIgual(Cauda0,Cauda), setError('<expressao> esperado após <dois-pontos-igual> em <comando>.',Cauda,NovoErro), append([NovoErro],FinalErro0,FinalErro), !.
comando(Palavra,Cauda,Erro,FinalErro) :- id(Palavra,Cauda,Erro,FinalErro0), selecionada(Palavra,Cauda,[],Selecionada), isVariavel(Selecionada), setError('<dois-pontos-igual> esperado após <id> em <comando>.',Cauda,NovoErro), append([NovoErro],FinalErro0,FinalErro), !.
comando(Palavra,Cauda,Erro,FinalErro) :- id(Palavra,Cauda,Erro,FinalErro0), setError('<id> não é uma variável declarada em <comando>.',Cauda,NovoErro), append([NovoErro],FinalErro0,FinalErro), !.
comando(Palavra,Cauda,Erro,FinalErro) :- chamadaProcedimento(Palavra,Cauda,Erro,FinalErro).

corpo(Palavra,Cauda,Erro,FinalErro) :- declara(Palavra,Cauda0,Erro,FinalErro0), rotina(Cauda0,Cauda1,FinalErro0,FinalErro1), begin(Cauda1,Cauda2), sentencas(Cauda2,Cauda3,FinalErro1,FinalErro), end(Cauda3,Cauda), !.
corpo(Palavra,Cauda,Erro,FinalErro) :- declara(Palavra,Cauda0,Erro,FinalErro0), rotina(Cauda0,Cauda1,FinalErro0,FinalErro1), begin(Cauda1,Cauda2), sentencas(Cauda2,Cauda,FinalErro1,FinalErro2), setError('<end> esperado após <sentencas> em <corpo>.',Cauda,NovoErro), append([NovoErro],FinalErro2,FinalErro), !.
corpo(Palavra,Cauda,Erro,FinalErro) :- declara(Palavra,Cauda0,Erro,FinalErro0), rotina(Cauda0,Cauda1,FinalErro0,FinalErro1), begin(Cauda1,Cauda), setError('<sentencas> esperado após <begin> em <corpo>.',Cauda,NovoErro), append([NovoErro],FinalErro1,FinalErro), !.
corpo(Palavra,Cauda,Erro,FinalErro) :- declara(Palavra,Cauda0,Erro,FinalErro0), rotina(Cauda0,Cauda,FinalErro0,FinalErro1), setError('<begin> esperado após <rotina> em <corpo>.',Cauda,NovoErro), append([NovoErro],FinalErro1,FinalErro), !.
corpo(Palavra,Cauda,Erro,FinalErro) :- declara(Palavra,Cauda,Erro,FinalErro0), setError('<rotina> esperado após <declara> em <corpo>.',Cauda,NovoErro), append([NovoErro],FinalErro0,FinalErro), !.
corpo(Palavra,Palavra,Erro,Erro).

programa(Palavra,Cauda,Erro,FinalErro) :- program(Palavra,Cauda0), id(Cauda0,Cauda1,Erro,FinalErro0), pontoEVirgula(Cauda1,Cauda2), corpo(Cauda2,Cauda3,FinalErro0,FinalErro), ponto(Cauda3,Cauda), !.
programa(Palavra,Cauda,Erro,FinalErro) :- program(Palavra,Cauda0), id(Cauda0,Cauda1,Erro,FinalErro0), pontoEVirgula(Cauda1,Cauda2), corpo(Cauda2,Cauda,FinalErro0,FinalErro1), setError('<ponto> esperado após <corpo> em <programa>.',Cauda,NovoErro), append([NovoErro],FinalErro1,FinalErro), !.
programa(Palavra,Cauda,Erro,FinalErro) :- program(Palavra,Cauda0), id(Cauda0,Cauda1,Erro,FinalErro0), pontoEVirgula(Cauda1,Cauda), setError('<corpo> esperado após <ponto-e-virgula> em <programa>.',Cauda,NovoErro), append([NovoErro],FinalErro0,FinalErro), !.
programa(Palavra,Cauda,Erro,FinalErro) :- program(Palavra,Cauda0), id(Cauda0,Cauda,Erro,FinalErro0), setError('<ponto-e-virgula> esperado após <id> em <programa>.',Cauda,NovoErro), append([NovoErro],FinalErro0,FinalErro), !.
programa(Palavra,Cauda,Erro,FinalErro) :- program(Palavra,Cauda), setError('<id> esperado após <program> em <programa>.',Cauda,NovoErro), append([NovoErro],Erro,FinalErro), !.
programa(Palavra,Palavra,Erro,FinalErro) :- setError('Gramática deve começar com <program>.',Palavra,NovoErro), append([NovoErro],Erro,FinalErro).

% VERIFICA SE A GRAMÁTICA ESTÁ CORRETA
grammar(Palavra) :- programa(Palavra,Cauda,[],FinalErro), empty(Cauda), empty(FinalErro).

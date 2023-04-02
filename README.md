# Interpretador Lista

Implementação de um interpretador léxico, sintático e semântico de uma BNF específica.

## Dependências

- Python 3.10 or higher.
- SWI-Prolog 8.2 or higher.

## Instalação

```bash
python -m venv venv
source venv/bin/activate
pip install -r requirements.txt
```

O projeto faz uso do swi-prolog e tentará instalá-lo automaticamente. Caso não consiga, instale-o manualmente. Para mais informações, consulte a [documentação](https://www.swi-prolog.org/build/).

## Execução

```bash
python main.py
```

O programa executará o código escrito na constante `PROGRAM` no arquivo `main.py`. Caso queira testar outro código, basta alterar o valor dessa constante.

## BNF

A BNF utilizada para a implementação do interpretador é a seguinte:

```
<programa> ::= program <id> ; <corpo>
<corpo> ::= <declara> <rotina> begin <sentencas> end
<declara> ::= var <dvar> <mais_dc> | ε
<mais_dc> ::= ; <cont_dc> | ε
<cont_dc> ::= <dvar> <mais_dc>
<dvar> ::= <variaveis> : <tipo_var>
<tipo_var> ::= integer | real | [integer] | [real]
<variaveis> ::= <id> <mais_var>
<mais_var> ::= , <variaveis> | ε
<rotina> ::= <procedimento> | <funcao> | ε
<procedimento> ::= procedure <id> <parametros> ; <corpo> ; <rotina>
<funcao> ::= function <id> <parametros> : <tipo_funcao> ; <corpo> ; <rotina>
<parametros> ::= ( <lista_parametros> ) | ε
<lista_parametros> ::= <lista_id> : <tipo_var> <cont_lista_par>
<cont_lista_par> ::= ; <lista_parametros> | ε
<lista_id> ::= <id> <cont_lista_id>
<cont_lista_id> ::= , <lista_id> | ε
<tipo_funcao> ::= integer | real | [integer] | [real]
<sentencas> ::= <comando> <mais_sentencas>
<mais_sentencas> ::= ; <cont_sentencas> | ε
<cont_sentencas> ::= <sentencas> | ε
<var_read> ::= <id> <mais_var_read>
<mais_var_read> ::= , <var_read> | ε
<var_write> ::= <id> <mais_var_write>
<mais_var_write> ::= , <var_write> | ε
<comando> ::= read ( <var_read> ) | write ( <var_write> ) | for <id> := <expressao> to <expressao> do begin <sentencas> end | repeat <sentencas> until ( <condicao> ) | while ( <condicao> ) do begin <sentencas> end | if ( <condicao> ) then begin <sentencas> end <pfalsa> | <id> := <expressao> | <chamada_procedimento>
<chamada_procedimento> ::= <id> <argumentos>
<argumentos> ::= ( <lista_arg> ) | ε
<lista_arg> ::= <expressao> <cont_lista_arg>
<cont_lista_arg> ::= , <lista_arg> | ε
<condicao> ::= <relacao> ( <expressao_num> , <expressao_num> ) | <relacao> ( <expressao_lista> , <expressao_lista> )
<pfalsa> ::= else begin <sentencas> end | ε
<relacao> ::= = | > | < | >= | <= | <>
<expressao> ::= <expressao_num> | <expressao_lista>
<expressao_num> ::= <termo> <op_arit> <expressao_num> | <termo> | <chamada_procedimento>
<termo> ::= <operando> <op_arit2> <termo> | <operando>
<operando> ::= <id> | <integer_num> | <real_num> | ( <expressao_num> )
```

Se preferir, pode visualizar a BNF original no arquivo [bnf_lista.pdf](./docs/bnf_lista.pdf).

Além disso, a gramática descarta os espaços e novas linhas além de aceitar comentários, que devem ser escritos entre dois caracteres `#`. Por exemplo: `# Comentário #`.

## Dicas

Para testar alguma coisa específica na BNF, primeiro crie o programa na variável `PROGRAM` no arquivo `main.py`. Em seguida, execute o código e pegue a query executada pelo swi-prolog. Agora você pode entrar no swi-prolog, importar a gramática, iniciar o debug e executar a query. Por exemplo:

```prolog
?- consult('./app/gramatica.pl').
true.

?- trace.
true.

[trace]  ?- programa(['p','r','o','g','r','a','m','a',';','.'], TE, [], END_ERROR).
   Call: (10) programa([p, r, o, g, r, a, m, a|...], _30062, [], _30066) ? creep
   Call: (11) program([p, r, o, g, r, a, m, a|...], _31558) ? creep
   Call: (12) next(p, [p, r, o, g, r, a, m, a|...], _32370) ? creep
   Exit: (12) next(p, [p, r, o, g, r, a, m, a|...], [r, o, g, r, a, m, a, ;|...]) ? creep
   % ...
```

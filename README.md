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

Também é possível pedir mais detalhes sobre a execução passando o argumento `--debug`:

```bash
python main.py --debug
```

## BNF

A BNF utilizada para a implementação do interpretador pode ser visualizada no arquivo [bnf_lista.pdf](./docs/bnf_lista.pdf).

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

Também é possível testar utilizando uma interface gráfica, quando disponível, a partir do predicado `guitracer`:

```prolog
?- guitracer.
% The graphical front-end will be used for subsequent tracing
true.
```

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

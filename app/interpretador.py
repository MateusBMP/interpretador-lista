import os
from app.config import config
from app.kvn import parser
from app.programa import Programa
from pyswip.prolog import Prolog

PROLOG_FILE = os.path.join(os.path.dirname(__file__), "gramatica.pl")


class Interpretador():
    def __init__(self, programa: Programa):
        self.prolog = Prolog()
        if config('debug', False):
            print("?- consult('%s')." % PROLOG_FILE)
        self.prolog.consult("%s" % PROLOG_FILE)
        self.programa = programa

    def _tratarErro(self, erro: bytes, t_programa: int) -> dict:
        erro_tratado = parser(erro.decode('utf8'))
        # Inverte a posição do erro
        erro_tratado['posicao'] = int(self.programa.posicaoOriginal(t_programa - int(erro_tratado['posicao'])))
        return erro_tratado

    def analisarPrograma(self) -> None:
        program_list: list[str] = [*self.programa.consideravel()]

        # Cria a string de consulta prolog
        prolog_query: str = "programa(["  # start the "programa" query
        for i, char in enumerate(program_list):
            if i == len(program_list) - 1:
                prolog_query += "'%s'" % char
            else:
                prolog_query += "'%s'," % char
        prolog_query += "], TE, [], END_ERROR)."  # finish the "programa" query

        # Executa a consulta prolog
        result: bool = True
        tail = []
        end_error = []
        if config('debug', False):
            print("?- %s" % prolog_query)
        if bool(list(self.prolog.query(prolog_query))):
            for r in list(self.prolog.query(prolog_query)):
                for key in r.keys():
                    if key == 'TE':
                        tail = r[key]
                        if len(tail) > 0:
                            result = False
                    elif key == 'END_ERROR':
                        end_error = r[key]
                        if len(end_error) > 0:
                            result = False
                    if config('debug', False):
                        print("%s = %s ." % (key, r[key]))
        else:
            result = False
            if config('debug', False):
                print("false.")

        errors = []
        for error in end_error:
            errors.append(self._tratarErro(error, len(self.programa.consideravel()) - 1))

        return result, errors

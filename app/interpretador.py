import os
from pyswip.prolog import Prolog

PROLOG_FILE = os.path.join(os.path.dirname(__file__), "gramatica.pl")


class Interpretador():
    def __init__(self):
        self.prolog = Prolog()
        print("?- consult('%s')." % PROLOG_FILE)
        self.prolog.consult("%s" % PROLOG_FILE)

    def _preparaPrograma(self, programa: str) -> list[str]:
        # Converte cada caractere de programa para uma lista de caracteres
        # também remove o caractere de nova linha e os espaços
        program_string: list[str] = [
            *programa.replace('\n', '').replace(' ', '')]

        # Remove o primeiro e o último caractere '#' da lista e todos os caracteres entre eles
        init = False
        i = 0
        while i < len(program_string):
            if program_string[i] == '#' and init:  # se é o último '#'
                del program_string[i]
                i -= 1
                init = False
            if program_string[i] == '#' and not init:  # se é o primeiro '#'
                init = True
            if init:  # se está entre o primeiro e o último '#'
                del program_string[i]
                i -= 1
            i += 1

        return program_string

    def analisarPrograma(self, programa: str) -> None:
        program_string: list[str] = self._preparaPrograma(programa)

        # Cria a string de consulta prolog
        prolog_query: str = "programa(["  # start the "programa" query
        for i, char in enumerate(program_string):
            if i == len(program_string) - 1:
                prolog_query += "'%s'" % char
            else:
                prolog_query += "'%s'," % char
        prolog_query += "], TE, [], END_ERROR)."  # finish the "programa" query

        # Executa a consulta prolog
        print("?- %s" % prolog_query)
        if bool(list(self.prolog.query(prolog_query))):
            for r in list(self.prolog.query(prolog_query)):
                for key in r.keys():
                    print("%s = %s ." % (key, r[key]))
        else:
            print("false.")

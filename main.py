import sys
from app.config import Config
from app.interpretador import Interpretador
from app.programa import Programa

PROGRAM: str = """
# criando o programa prog1 #
program prog1;
var v1,v2: integer;
begin
v1 := +(1,2);
v2 := -(v1,3);
end.
"""


def main():
    programa = Programa(PROGRAM)
    interpretador = Interpretador(programa)
    result, errors = interpretador.analisarPrograma()

    if result:
        print("Programa aceito!")
    else:
        print("Programa rejeitado!")
        for error in errors:
            print(error)

    return 0


if __name__ == '__main__':
    config = Config()

    for arg in sys.argv:
        if arg == '--debug':
            config.set('debug', True)

    main()

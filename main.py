from app.interpretador import Interpretador

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
    interpretador = Interpretador()
    interpretador.analisarPrograma(PROGRAM)

    return 0


if __name__ == '__main__':
    main()

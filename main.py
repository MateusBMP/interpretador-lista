import sys
from app.config import Config
from app.interpretador import Interpretador
from app.programa import Programa
from colorama import just_fix_windows_console, Fore, Style


PROGRAM: str = """
# criando o programa prog1 #
program prog1;
var v1,v2: integer;
# function sum(a,b: integer): integer;
    var result: integer;
    begin
    result := +(a,b);
    end; #
begin
    v1 := +(1,2);
    v2 := -(v1,3);
end.
"""


def main():
    programa = Programa(PROGRAM)
    interpretador = Interpretador(programa)
    result, errors = interpretador.analisarPrograma()

    just_fix_windows_console()

    if result:
        print(Fore.GREEN + "Programa aceito!")
    else:
        print(Fore.RED + "Programa rejeitado!")
        print()
        main_error = errors.pop()
        if Config().get('debug'):
            print(Fore.RESET, end='')
            print(main_error)
        print(Fore.BLUE + Style.BRIGHT + "@@ Programa" + Style.RESET_ALL)
        line = 0
        coloring = False
        colored = False
        start_line = True
        # Corrige a posição do erro caso seja logo após um \n, espaço ou tab
        while PROGRAM[main_error['posicao'] - 1] in ['\n', ' ', '\t']:
            main_error['posicao'] -= 1
        for i, char in enumerate(PROGRAM):
            if start_line:
                print(Style.RESET_ALL + Style.BRIGHT + Fore.BLUE + str(line + 1) + ' ' + Style.RESET_ALL, end='')
                start_line = False
            if i == main_error['posicao']:
                coloring = True
            if char == '\n':
                line += 1
                start_line = True
                if coloring:
                    print(Style.BRIGHT + Fore.RED + " # ERRO: %s #" % main_error['erro'], end='')
                    coloring = False
                    colored = True
            if coloring:
                print(Style.RESET_ALL + Fore.RED + char, end='')
            elif colored:
                print(Fore.RESET + Style.DIM + char, end='')
            else:
                print(Fore.RESET + char, end='')
        print(Style.RESET_ALL)

    return 0


if __name__ == '__main__':
    config = Config()

    for arg in sys.argv:
        if arg == '--debug':
            config.set('debug', True)

    main()

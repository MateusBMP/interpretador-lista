import os
import sys
from app.config import Config
from app.interpretador import Interpretador
from app.programa import Programa
from colorama import just_fix_windows_console, Fore, Style


def main():
    with open(config.get('program'), 'r') as programa_file:
        programa_string = programa_file.read()
        programa_file.close()

    programa = Programa(programa_string)
    interpretador = Interpretador(programa)
    result, errors = interpretador.analisarPrograma()

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


def help_message() -> None:
    print(Style.BRIGHT + "Uso: " + Style.RESET_ALL + "python3 main.py [opções] <arquivo>")
    print("  Executa o interpretador de uma linguagem de programação fictícia.")
    print("  Espera um <arquivo> com o código fonte do programa a ser interpretado.")
    print(Style.BRIGHT + "Opções:" + Style.RESET_ALL)
    print(Style.BRIGHT + "  --debug:" + Style.RESET_ALL + " Mostra o erro completo")
    print(Style.BRIGHT + "  --help:" + Style.RESET_ALL + " Mostra esta mensagem")


if __name__ == '__main__':
    just_fix_windows_console()
    config = Config()

    for arg in sys.argv:
        if arg == os.path.basename(__file__) or arg == sys.argv[0]:
            continue
        if arg == '--help':
            help_message()
            sys.exit(1)
        if arg == '--debug':
            config.set('debug', True)
        else:
            config.set('program', arg)

    if config.get('debug'):
        print(Style.BRIGHT + Fore.WHITE + "# Modo debug ativado" + Fore.RESET + Style.RESET_ALL)

    if config.get('program') is None:
        help_message()
        sys.exit(1)

    if not os.path.isfile(config.get('program')):
        print(Fore.RED + "Arquivo não encontrado!")
        sys.exit(1)

    if config.get('debug'):
        print(Style.BRIGHT + "# " + Style.RESET_ALL + "Arquivo: %s" % config.get('program'))

    sys.exit(main())

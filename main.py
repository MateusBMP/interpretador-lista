from pyswip.prolog import Prolog

PROGRAM: str = """
0
"""

def main():
    # Convert each character from PROGRAM to a list of characters
    prolog_string: list[str] = [*PROGRAM]

    prolog = Prolog()
    prolog.consult("main.pl")
    print(list(prolog.query("main", [prolog_string])))

    return 0


if __name__ == '__main__':
    main()

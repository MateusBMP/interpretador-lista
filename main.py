from pyswip.prolog import Prolog

PROGRAM: str = """
program a;
.
"""

def main():
    # Convert each character from PROGRAM to a list of characters
    # also remove the new line character
    prolog_string: list[str] = [*PROGRAM.replace('\n', '')]

    # Create the prolog query
    prolog_query: str = "programa([" # start the "programa" query
    for i, char in enumerate(prolog_string):
        if i == len(prolog_string) - 1:
            prolog_query += "'%s'" % char
        else:
            prolog_query += "'%s'," % char
    prolog_query += "], TE)." # finish the "programa" query

    # Loading the prolog file
    print("?- consult('main.pl').")
    prolog = Prolog()
    prolog.consult("main.pl")

    # Querying the prolog file
    print("?- %s" % prolog_query)

    if bool(list(prolog.query(prolog_query))):
        print("TE = ", end="")
        empty: bool = True
        for r in list(prolog.query(prolog_query)):
            empty = False
            print("%s" % r["TE"], end="")
        print(' .')

    else :
        print("false.")

    return 0


if __name__ == '__main__':
    main()

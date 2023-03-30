from pyswip.prolog import Prolog

PROGRAM: str = """
program a;
# It is a comment #
.
"""

PROLOG_FILE: str = "./main.pl"

def _create_program_string(program: str) -> str:
    # Convert each character from PROGRAM to a list of characters
    # also remove the new line character
    program_string: list[str] = [*PROGRAM.replace('\n', '')]

    # Remove the first and last '#' characters from the list and all the characters between them
    init = False
    i = 0
    while i < len(program_string):
        if program_string[i] == '#' and init: # if is the last '#'
            del program_string[i]
            i -= 1
            init = False
        if program_string[i] == '#' and not init: # if is the first '#'
            init = True
        if init: # if is between the first and last '#'
            del program_string[i]
            i -= 1
        i += 1

    return program_string

def main():
    program_string: list[str] = _create_program_string(PROGRAM)

    # Create the prolog query
    prolog_query: str = "programa([" # start the "programa" query
    for i, char in enumerate(program_string):
        if i == len(program_string) - 1:
            prolog_query += "'%s'" % char
        else:
            prolog_query += "'%s'," % char
    prolog_query += "], TE)." # finish the "programa" query

    # Loading the prolog file
    print("?- consult('%s')." % PROLOG_FILE)
    prolog = Prolog()
    prolog.consult("%s" % PROLOG_FILE)

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

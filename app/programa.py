class Programa:
    def __init__(self, original: str):
        self.original: str = original

    def original(self) -> str:
        return self.original

    def __str__(self) -> str:
        return self.original()

    def consideravel(self) -> str:
        # Converte cada caractere de programa para uma lista de caracteres
        # também remove o caractere de nova linha e os espaços
        program_list: list[str] = [*self.original.replace('\n', '').replace(' ', '')]

        # Remove o primeiro e o último caractere '#' da lista e todos os caracteres entre eles
        init = False
        i = 0
        while i < len(program_list):
            if program_list[i] == '#' and init:  # se é o último '#'
                del program_list[i]
                i -= 1
                init = False
            if program_list[i] == '#' and not init:  # se é o primeiro '#'
                init = True
            if init:  # se está entre o primeiro e o último '#'
                del program_list[i]
                i -= 1
            i += 1

        return ''.join(program_list)

    def posicaoOriginal(self, posicao: int) -> int:
        mapa = {}
        i = 0
        j = 0
        init = False
        program_list = [*self.original]
        while i < len(program_list):
            if program_list[i] == '\n' or program_list[i] == ' ':
                i += 1
                continue
            if program_list[i] == '#' and init:
                init = False
                i += 1
                continue
            if program_list[i] == '#' and not init:
                init = True
                i += 1
                continue
            if init:
                i += 1
                continue
            mapa[j] = i
            i += 1
            j += 1

        return mapa[posicao]

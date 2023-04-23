# see: https://github.com/hopsoft/kvn

class KVN():
    def parser(text: str) -> dict:
        data = {}
        for pair in text.split(';'):
            if pair == '':
                continue
            key, value = pair.split(':')
            data[key.strip()] = value.strip()

        return data

def parser(text: str) -> dict:
    return KVN.parser(text)
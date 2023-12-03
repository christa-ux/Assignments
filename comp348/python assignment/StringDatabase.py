import random

class StringDatabase:
    def __init__(self):
        self.words_list = self.read_file()

    def read_file(self):
        with open('four_letters.txt', 'r') as file:
            lines = file.readlines()

        return [word.strip().lower() for line in lines for word in line.split()]

    def generateRandomWord(self):
        return random.choice(self.words_list)
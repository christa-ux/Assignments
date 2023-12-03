class Game:
    def __init__(self, game_number, word, status, bad_guesses, score, missed_letters):
        self.game_number = game_number
        self.word = word
        self.status = status
        self.bad_guesses = bad_guesses
        self.score = score
        self.missed_letters = missed_letters
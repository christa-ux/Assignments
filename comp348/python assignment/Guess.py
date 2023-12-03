# menu display
# Guess.py
from Game import Game
from StringDatabase import StringDatabase
import sys
import os

randomIO = StringDatabase()

class Guess:
    def __init__(self):
        self.games = []
        self.word_to_guess = randomIO.generateRandomWord()
        self.current_guess = "----"
        self.letters_guessed = []
        self.game_number = 1
        self.missed_letters_count = 0
        self.unsuccessfulGuess=0
        self.counter=0
        
        self.hasBeenInGuessMode = False
        self.hasBeenInLetterMode = False

    def clear_screen(self):
        os.system('cls' if os.name == 'nt' else 'clear')

    def resetGame(self):
        
        self.current_guess = "----"
        self.letters_guessed = []
        self.game_number += 1
        self.unsuccessfulGuess=0
        self.counter=0
        self.missed_letters_count=0
        self.hasBeenInGuessMode = False
        self.hasBeenInLetterMode = False
        self.word_to_guess = randomIO.generateRandomWord()
        
    

    def guessMode(self):
        self.hasBeenInGuessMode = True
        if not self.hasBeenInLetterMode:
            self.missed_letters_count = 0 
        #if self.hasBeenInLetterMode:
            #sum(1 for letter in self.letters_guessed if letter not in self.word_to_guess)
        while True:
            self.clear_screen()
            print("++")
            print("++ The great guessing game!\n++\n")
            print("current guess: " + self.current_guess)
            print("Letters guessed: " + " ".join(map(str, self.letters_guessed)) + "\n")
            wordGuessed = input("Make a guess: ")
            if wordGuessed.isalpha() and len(wordGuessed) == 4:
                if wordGuessed.lower() == self.word_to_guess:
                    print("You're a genius!")
                    input("Press any key to continue...")
                    self.calculateScore(1)  # 1 indicates a successful guess
                    self.resetGame()
                    self.menuDisplay()
                    self.unsuccessfulGuess=0
                    self.counter = 0
                    break
                else:
                    print("Try again loser!")
                    self.unsuccessfulGuess=1 
                    self.counter+=1 #to count the bad guesses
                    
                    input("Press any key to continue...")
                    
                    
                   
                    
                    break
            else:
                print("Invalid input. Please enter a valid 4-letter string.")
                input("Press any key to continue...")

    def tellMode(self):
        print("You really should have guessed this... " + self.word_to_guess)
        input("Press any key to continue...")
        #self.word_to_guess = randomIO.generateRandomWord()
        if not self.hasBeenInLetterMode:
            self.missed_letters_count = 0 
        self.calculateScore(-1)
        self.counter=0
        self.resetGame()
        self.menuDisplay()

    def letterMode(self):
        self.hasBeenInLetterMode = True
        while True:
            self.clear_screen()
            print("++")
            print("++ The great guessing game!\n++\n")
            print("current guess: " + self.current_guess)
            print("Letters guessed: " + " ".join(map(str, self.letters_guessed)) + "\n")
            letter_guessed = input("enter a letter: ").lower()
            if letter_guessed.isalpha() and len(letter_guessed) == 1:
                if letter_guessed in self.letters_guessed:
                    print(f"You already guessed the letter {letter_guessed}. Try another one.")
                    input("Press any key to continue...")
                    continue
                elif letter_guessed in self.word_to_guess:
                    print(f"You found {self.word_to_guess.count(letter_guessed)} letters")
                    self.letters_guessed.append(letter_guessed)
                    self.current_guess = "".join(
                        letter if letter == letter_guessed or self.current_guess[i] != "-" else "-"
                        for i, letter in enumerate(self.word_to_guess)
                    )
                    if "-" not in self.current_guess:
                        print("Congratulations! You've guessed the word!")
                        input("Press any key to continue...")
                        self.calculateScore(1)  # 1 indicates a successful guess
                        self.counter=0
                        self.resetGame()
                        self.menuDisplay()
                        break 



                    else: 
                        self.unsuccessfulGuess = 2

                        input("Press any key to continue...")
                        break
                else:
                    print(f"Not a single match genius.")
                    self.letters_guessed.append(letter_guessed)
                    self.unsuccessfulGuess=2
                    self.missed_letters_count+=1
                    input("Press any key to continue...")
                    break
            else:
                print("Invalid input. Please enter a single letter.")
                input("Press any key to continue...")

    
    def exitMode(self):
        self.calculateFinalScore()
        sys.exit()

    def calculateScore(self, result):
        
        letter_frequencies = {
            'a': 8.17, 'b': 1.49, 'c': 2.78, 'd': 4.25, 'e': 12.70, 'f': 2.23, 'g': 2.02, 'h': 6.09,
            'i': 6.97, 'j': 0.15, 'k': 0.77, 'l': 4.03, 'm': 2.41, 'n': 6.75, 'o': 7.51, 'p': 1.93,
            'q': 0.10, 'r': 5.99, 's': 6.33, 't': 9.06, 'u': 2.76, 'v': 0.98, 'w': 2.36, 'x': 0.15,
            'y': 1.97, 'z': 0.07
        }

        remaining_word = [letter for letter in self.word_to_guess.lower() if letter not in self.letters_guessed]

        # Calculate the total frequency of remaining letters
        remaining_frequency = sum(letter_frequencies[letter] for letter in remaining_word)

        # Calculate the score for the current guess
        score = remaining_frequency / len(remaining_word) if remaining_word else 0

        bad_guesses = self.counter  # Initialize bad_guesses to 0
        
        
        if result == -1:
            score = -sum(letter_frequencies[letter] for letter in remaining_word)
                  # Set bad_guesses to the count of remaining letters for giving up
        elif result==0:
            score *= 0.9
        else:
            score = sum(letter_frequencies[letter] for letter in self.word_to_guess)

            
        
        #missed_letters = len(remaining_word)

        # Check if a game with the current word already exists
        existing_game = next((game for game in self.games if game.word == self.word_to_guess), None)

        if existing_game:
            # Update the existing game
            existing_game.word=self.word_to_guess
            existing_game.missed_letters=self.missed_letters_count
            existing_game.bad_guesses+=bad_guesses
            existing_game.score += score
            existing_game.status = "Success" if result == 1 else "Gave up"
        else:
            # Create a new game
            game = Game(self.game_number, self.word_to_guess, "Success" if result == 1 else "Gave up", bad_guesses,score, self.missed_letters_count)
            self.games.append(game)



    def calculateFinalScore(self):
        os.system('cls' if os.name == 'nt' else 'clear')  # Clear the screen
        print("++")
        print("++ Game Report \n++\n")
        print("Game   Word     Status      Bad Guesses    Missed Letters    Score")
        print("----   ----     ------      -----------    --------------    ------")
        total_score = 0

        for game in self.games:
            game_number, word, status, bad_guesses, missed_letters, score = (
                game.game_number,
                game.word,
                game.status,
                game.bad_guesses,
                game.missed_letters,
                game.score,
            )

            print(
                f"{game_number:<4}   {word:<6}   {status:<9}   {bad_guesses:<12}   {missed_letters:<15}   {score:.2f}"
            )
            total_score += score

        final_score = total_score / len(self.games) if self.games else 0

        print(f"\nFinal Score: {final_score:.2f}")

   # Add an option for the user to choose between play mode and test mode
    def menuDisplay(self):
        
        while True:
            self.clear_screen()
            print("++")
            print("++ The great guessing game!\n++\n")
            print("current guess: " + self.current_guess)
            print("Letters guessed: " + " ".join(map(str, self.letters_guessed)) + "\n")
            print("1=Play Mode, 2=Test Mode, q=quit\n")

            while True:
                valid_option = {'1', '2', 'q'}
                option = input("Enter option: ").lower()
                if option in valid_option:
                    if option == '1':
                        self.playMode()
                        break
                    elif option == '2':
                        self.testMode()
                        break
                    else:
                        self.exitMode()
                        break
                else:
                    print(f"Invalid option: {option}. Please re-enter")

    # Add a playMode method for the original game without any changes
    def playMode(self):
        while True:
            self.clear_screen()
            print("++")
            print("++ The great guessing game!\n++\n")
            print("current guess: " + self.current_guess)
            print("Letters guessed: " + " ".join(map(str, self.letters_guessed)) + "\n")
            print("g=guess, t=tell me, l=letter, q=quit\n")

            while True:
                valid_option = {'g', 't', 'l', 'q'}
                option = input("Enter option: ").lower()
                if option in valid_option:
                    if option == 'g':
                        self.guessMode()
                        break
                    elif option == 't':
                        self.tellMode()
                        break
                    elif option == 'l':
                        self.letterMode()
                        break
                    else:
                        self.exitMode()
                        break
                else:
                    print(f"Invalid option: {option}. Please re-enter")

    def testMode(self):
        while True:
            self.clear_screen()
            print("++")
            print("++ The great guessing game!\n++\n")
            print("Word to guess: " + self.word_to_guess)  # Display the word in test mode
            print("current guess: " + self.current_guess)
            print("Letters guessed: " + " ".join(map(str, self.letters_guessed)) + "\n")
            print("g=guess, t=tell me, l=letter, q=quit\n")

            while True:
                valid_option = {'g', 't', 'l', 'q'}
                option = input("Enter option: ").lower()
                if option in valid_option:
                    if option == 'g':
                        self.guessMode()
                        break
                    elif option == 't':
                        self.tellMode()
                        break
                    elif option == 'l':
                        self.letterMode()
                        break
                    else:
                        self.exitMode()
                        break
                else:
                    print(f"Invalid option: {option}. Please re-enter")



play = Guess()
play.menuDisplay()
from Guess import Guess
from StringDatabase import StringDatabase

def main():
    string_db = StringDatabase()
    game = Guess(string_db)
    game.menu_display()

if __name__ == "__main__":
    main()
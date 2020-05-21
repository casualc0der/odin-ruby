require_relative 'serializer'
require_relative 'word_selector'
require_relative 'dictionary'

class Hangman
  attr_reader(
   :word_to_guess,
   :guesses,
   :letters_used,
   :user_word
  )

  def initialize
    @serializer = Serializer.new
    @word_grabber  = WordSelector.new(Dictionary.new)
    @word_to_guess = @word_grabber.random.downcase
    @guesses = 0
    @letters_used = []
    @user_word = Array.new(@word_to_guess.length)
  end

  def save_status(filename)
    game = { 
      gameid: filename,
 wordToGuess: word_to_guess,
     guesses: guesses,
 lettersUsed: letters_used,
    userWord: user_word
               }
  end

  def game_test
      @serializer.serialize(self.save_status('EddsGame'))
      file = File.read('game.json')
      data = @serializer.deserialize(file)
  end
end

dopey = Hangman.new
dopey.game_test




require_relative 'serializer'
require_relative 'word_selector'
require_relative 'dictionary'
require 'pry'

class Hangman
  attr_accessor(
  :gameid,
   :word_to_guess,
   :guesses,
   :letters_used,
   :user_word
  )

  def initialize(name)
    
    @gameid = name
    @serializer = Serializer.new
    @word_grabber  = WordSelector.new(Dictionary.new)
    @word_to_guess = @word_grabber.random.downcase
    @guesses = 0
    @letters_used = []
    @user_word = Array.new(@word_to_guess.length)
  end

  def start
    puts "Would you like to load a game? [y/n]"
    confirmation = gets.chomp

    if confirmation == 'y' || confirmation == 'Y'
      file = File.read('game.json')
      data = @serializer.deserialize(file)
      puts "which game would you like to load? select number"
      data.each_with_index {|x,i| p "#{i}-#{x['gameid']}"}
      game_selection = gets.chomp.to_i
      ## catch exception
      loaded_data = data[game_selection]
      load_game(loaded_data)
      puts "Game loaded, lets play!"
      game_loop(true)
    else
      puts "Ok lets play a new game"
      game_loop(false)
    end
  end

  private

  def game_loop(loaded)
    was_game_loaded = loaded
  while @guesses < 6
    display_current_status
    save_prompt if guesses >= 1 && was_game_loaded == false
    display_used_letters
    char_checker_and_update_user_word(guess_char)
    if win_checker?
      p "You win, the word was #{@word_to_guess}!"
      exit
    end
    was_game_loaded = false
  end
  puts "You have used all of your guesses! Game over!"
  puts "The word was #{@word_to_guess}"
  exit
  end

  def win_checker?
    @word_to_guess == @user_word.join
  end

  def display_current_status
    asterisks = @user_word.map {|x| x.nil? ? x = '*' : x }.join('|')
    puts asterisks
  
  end

  def char_checker_and_update_user_word(guess)
    if @word_to_guess.include?(guess)
      puts "correct!"
      locater = @word_to_guess.split('')
                    .each_with_index  {|x, i|
                       @user_word[i] = guess if x == guess }
    else
      puts "bzzz wrong!"
      @guesses +=1
      puts "You have #{6 - @guesses} incorrect guesses remaining" if guesses < 6
    end
  end

  def guess_char
    loop do
      begin
        puts "Please enter your guess for the turn"
        input = gets.chomp
        guess_for_turn = sanitize_char(input)
        @letters_used << guess_for_turn
        return guess_for_turn
        rescue EncodingError => e
        puts e.message
        next
      end
    end
  end

  def sanitize_char(input)
    raise EncodingError, 'Please enter 1 letter' if input.length != 1
    raise EncodingError,'Please enter a letter' unless input.match(/\D/)
    raise EncodingError, 'You have used that letter!' if @letters_used.include?(input)
    input.downcase
  end

  def display_used_letters
    puts "Letters used = " + @letters_used.join('|')
  end

  def save_prompt
    puts "Would you like to save the game? [y/n]"
    confirmation = gets.chomp
    if confirmation == 'y' || confirmation == 'Y'
      @serializer.serialize(self.save_game(gameid))
        puts "Would you like to exit the game? [y/n]"
        confirmation = gets.chomp
        exit if confirmation == 'y' || confirmation == 'Y'
    end
  end

  def load_game(data)
    @gameid = data['gameid']
    @word_to_guess = data['wordToGuess']
    @guesses = data['guesses']
    @letters_used = data['lettersUsed']
    @user_word = data['userWord']
  end

  def save_game(filename)
    game = { 
          gameid: filename,
    wordToGuess: word_to_guess,
        guesses: guesses,
    lettersUsed: letters_used,
        userWord: user_word
                  }
  end
end

game = Hangman.new("Pepe")
game.start




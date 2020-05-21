require_relative 'serializer'
require_relative 'word_selector'
require_relative 'dictionary'

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
    ## implement game loop here

    ## first of all ask the player if they want to load game?

    ## if yes, ask the player to select the file to open
    ## loaded_data = 
    puts "Would you like to load a game? [y/n]"
    confirmation = gets.chomp

    if confirmation == 'y' || confirmation == 'Y'
      file = File.read('game.json')
      data = @serializer.deserialize(file)
      puts "which game would you like to load? select number"
      data.each_with_index {|x,i| p "#{i}-#{x['gameid']}"}
      ##player chooses number 1 
      game_selection = gets.chomp.to_i
      ## catch exception
      loaded_data = data[game_selection]
      ## override all Lvariables with data from the deserialized file
      load_game(loaded_data)
      puts "Game loaded, lets play!"
      game_loop
    else
      #save the current status of the game to be retrieved later
      ## this needs to go in the actual game loop!!!
      puts "Ok lets play a new game"
      game_loop
    end
  end

  private

  def game_loop
  while @guesses < 6
    puts "Would you like to save the game? [y/n]"
    confirmation = gets.chomp
    if confirmation == 'y' || confirmation == 'Y'
      @serializer.serialize(self.save_game(gameid))
        puts "Would you like to exit the game? [y/n]"
        confirmation = gets.chomp
        if confirmation == 'y' || confirmation == 'Y'
          exit
        end
    end
    
    puts "please take a guess"
    guess_for_turn = gets.chomp
    #do not allow input if player has already uses a letter
    @guesses +=1 
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




require_relative '../game/player'
require_relative '../game/board'
require_relative '../game/wincondition'

class TicTacToe
  attr_accessor :max_turns
  def initialize
    @max_turns = 9
  end

  def gameloop
    board = Board.new
    puts "Welcome to tic tac toe"
    puts "Player 1 (x) please enter your name"
    player1 = Player.new(gets.chomp)
    puts "Player 2 (o) please enter your name"
    player2 = Player.new(gets.chomp)
    player1.toggle_turn
    
      until Winconditon.winner
      while player1.turn
        begin 
          puts "player 1 make a move"
          x = gets.chomp
          ##if you convert a char to int it will always equal 0!
          ##also, clean up this mess!!
          board.insert_symbol('X', x)
          player1.toggle_turn
          player2.toggle_turn
        rescue ArgumentError
        end
      end
        puts board.surface
        break if Winconditon.winner(board.squares)
        puts "player 2 make a move"
        o = gets.chomp.to_i
        board.insert_symbol('O', o)
        puts board.surface
        break if Winconditon.winner(board.squares)
      end


   



  end
end